package com.sms.configration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class SecurityConfig {
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) 
            .authorizeHttpRequests(auth -> auth
                .anyRequest().permitAll() 
            )
            .formLogin(form -> form.disable()) 
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/loginpage")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
            )
            .httpBasic(httpBasic -> httpBasic.disable()); // Disable basic authentication

        return http.build();
    }
}
