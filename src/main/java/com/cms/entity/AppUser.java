package com.cms.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "users")
public class AppUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "username", nullable = false)
    private String username;

    @Column(name = "password", nullable = false)
    private String password; // Password should be stored hashed

    @Column(name = "aceess", nullable = false)
    private String access; // Role-based access (e.g., ADMIN, USER)

    public AppUser(int id, String username, String password, String access) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.access = access;
    }
    public AppUser() {
    	
    }
}