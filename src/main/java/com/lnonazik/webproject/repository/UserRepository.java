package com.lnonazik.webproject.repository;

import com.lnonazik.webproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findUserByUsername(String username);
    boolean existsUserByUsernameOrEmail(String username, String email);
}

