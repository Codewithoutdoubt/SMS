package com.sms.repository;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sms.entity.AppUser;

public interface UserRepository extends JpaRepository<AppUser, Integer> {

    Optional<AppUser> findByUsername(String username);

    Optional<AppUser> findByEmail(String email);

    Optional<AppUser> findByResetToken(String resetToken);
}
