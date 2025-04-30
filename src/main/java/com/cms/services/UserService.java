package com.cms.services;

import java.util.List;

import com.cms.entity.AppUser;

public interface UserService {
    String login(String username,String password);
    void save(AppUser user);
    List<AppUser> getAllUsers();
    void deleteUser(Integer id);

    // New methods for forget password feature
    void initiatePasswordReset(String email);
    boolean validatePasswordResetToken(String token);
    void resetPassword(String token, String newPassword);
}
