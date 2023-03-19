package com.psuti.Mironov.service;

<<<<<<< Updated upstream
import com.psuti.Mironov.entity.example.User;
=======
import com.psuti.Mironov.entity.User;
>>>>>>> Stashed changes

import java.util.List;
import java.util.UUID;

public interface UserCrudService {
    User create(User user);
    User update(User user, UUID id);
    void removeById(UUID id);
    void remove(User user);
    void removeByUsername(String username);
    List<User> getAll();
    User getById(UUID id);
    User getByUsername(String username);
    boolean existsById(UUID id);
    boolean existsByUsername(String username);
}

