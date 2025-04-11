package com.cms;

import java.io.IOException;
import java.net.URISyntaxException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SmsApplication {
    public static void main(String[] args) throws IOException, URISyntaxException {
        SpringApplication.run(SmsApplication.class, args);
        System.out.println("✅ Server is running on port 8081");
    }
}
 