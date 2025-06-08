package com.cms.services;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cms.entity.AppUser;
import com.cms.exception.DuplicateEmailException;
import com.cms.repository.UserRepository;
import com.cms.services.util.EmailService;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private EmailService emailService;

    @Override
    public void save(AppUser user) {
        if (userRepo.findByEmail(user.getEmail()).isPresent()) {
            throw new DuplicateEmailException("Email " + user.getEmail() + " is already in use.");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
    }

    @Override
    public String login(String username, String password) {
        Optional<AppUser> userOptional = userRepo.findByUsername(username);

        if (userOptional.isPresent()) {
            AppUser user = userOptional.get();
            if (passwordEncoder.matches(password, user.getPassword())) {
                return user.getAccess();
            } 
        } 
        return "Invalid credentials"; 
    }

    @Override
    public List<AppUser> getAllUsers() {
        return userRepo.findAll();
    }
    
    @Override
    public void deleteUser(Integer id) {
        userRepo.deleteById(id);
    }

    // New methods for forget password feature

    @Override
    public void initiatePasswordReset(String email) {
        Optional<AppUser> userOptional = userRepo.findByEmail(email);
        if (userOptional.isPresent()) {
            AppUser user = userOptional.get();
            String token = UUID.randomUUID().toString();
            user.setResetToken(token);
            user.setTokenExpiry(LocalDateTime.now().plusHours(1)); // token valid for 1 hour
            userRepo.save(user);

            // Send email with reset link containing the token
            String resetLink = "http://localhost:8081/reset-password?token=" + token;
            String subject = "Password Reset Request";
            String message = "To reset your password, click the link below:\n" + resetLink;
            emailService.sendSimpleMessage(user.getEmail(), subject, message);
        }
        // If user not found, do nothing or log
    }

    @Override
    public boolean validatePasswordResetToken(String token) {
        Optional<AppUser> userOptional = userRepo.findByResetToken(token);
        if (userOptional.isPresent()) {
            AppUser user = userOptional.get();
            if (user.getTokenExpiry() != null && user.getTokenExpiry().isAfter(LocalDateTime.now())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void resetPassword(String token, String newPassword) {
        Optional<AppUser> userOptional = userRepo.findByResetToken(token);
        if (userOptional.isPresent()) {
            AppUser user = userOptional.get();
            user.setPassword(passwordEncoder.encode(newPassword));
            user.setResetToken(null);
            user.setTokenExpiry(null);
            userRepo.save(user);
        }
    }
}
