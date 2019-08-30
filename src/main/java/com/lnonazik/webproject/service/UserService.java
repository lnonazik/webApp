package com.lnonazik.webproject.service;

import com.lnonazik.webproject.dto.UserDTO;
import com.lnonazik.webproject.model.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

    Optional<User> findOne(Long id);
    Optional<User> findOne(String username);
    List<User> findAll();
    boolean checkIfExists(String username, String email);
    void delete(String username);

    User registerNewUser(UserDTO user);

}
