package com.pk.zpi.cashflow.controllers;

import com.pk.zpi.cashflow.model.UserService;
import com.pk.zpi.cashflow.model.request.ChangePasswordRequest;
import com.pk.zpi.cashflow.security.MyUserDetails;
import com.pk.zpi.cashflow.services.dataModels.NewUser;
import com.pk.zpi.cashflow.services.dataModels.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userDetails = new UserService();


    @GetMapping(value = "/{login}", produces = "application/json")
    public ResponseEntity<Map<String, Integer>> getUserId(@PathVariable String login) {
        int idUser = userDetails.getUserIdByName(login);
        if (idUser == -1) {
            return new ResponseEntity("User not found", HttpStatus.NO_CONTENT);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("id_user", idUser);
        return new ResponseEntity(map, HttpStatus.OK);
    }

    @GetMapping(value = "/userData/{id}", produces = "application/json")
    public ResponseEntity<User> getUserData(@PathVariable int id) {
        User user = userDetails.getUserById(id);
        if (user == null) {
            return new ResponseEntity("User not found", HttpStatus.NO_CONTENT);
        }
        return ResponseEntity.status(HttpStatus.OK).body(user);
    }

    @PutMapping(value = "/register")
    public ResponseEntity<Boolean> getUserData(@RequestBody NewUser user) {
        if (user.getEmail().isEmpty() || user.getPassword().isEmpty() || user.getName().isEmpty()) {
            return new ResponseEntity("Miss some parameters.", HttpStatus.NOT_ACCEPTABLE);
        }

        int result = userDetails.createNewUser(user.getEmail(), user.getPassword(), user.getName());
        if (result == 0) {
            return new ResponseEntity("Error when creating new user.", HttpStatus.EXPECTATION_FAILED);
        } else if (result == -1) {
            return new ResponseEntity("Passed user is exist.", HttpStatus.CONFLICT);
        }
        return new ResponseEntity(HttpStatus.OK);
    }

    @DeleteMapping(value = "/delete")
    public ResponseEntity<Boolean> deleteUser(@RequestBody NewUser user) {
        if (user.getEmail().isEmpty() || user.getPassword().isEmpty()) {
            return new ResponseEntity("Miss some parameters.", HttpStatus.NOT_ACCEPTABLE);
        }

        if (userDetails.deleteUser(user.getEmail(), user.getPassword())) {
            return new ResponseEntity(HttpStatus.OK);
        } else {
            return new ResponseEntity("Error when creating new user.", HttpStatus.EXPECTATION_FAILED);
        }
    }

    @GetMapping(value = "/hello")
    public String getUserId() {
        return "Hello";
    }

    @PostMapping(value = "/changePassword")
    public ResponseEntity<Boolean> deleteUser(@RequestBody ChangePasswordRequest cpr) {
        if (!cpr.isAllData()) {
            return new ResponseEntity("Miss some parameters.", HttpStatus.NOT_ACCEPTABLE);
        }

        User user = userDetails.getUserById(cpr.id_user);

        try {
            MyUserDetails myUserDetails = userDetails.getUserByName(user.getEmail());

            if(!myUserDetails.getPassword().equals(cpr.oldPassword)) {
                return new ResponseEntity("Bad old password.", HttpStatus.CONFLICT);
            }
        } catch (Exception e) {
        }

        if(userDetails.changePassword(cpr.id_user, cpr.oldPassword, cpr.newPassword))
            return new ResponseEntity(HttpStatus.OK);
        return new ResponseEntity("Error when creating new user.", HttpStatus.EXPECTATION_FAILED);
    }

    @GetMapping(value = "/admin/getAllUsers")
    public ResponseEntity<List<User>> adminGetAllUsers() {
        List<User> list = userDetails.adminGetAllUsers();
        if ( list != null) {
            return new ResponseEntity(list, HttpStatus.OK);
        } else {
            return new ResponseEntity("Error when creating new user.", HttpStatus.EXPECTATION_FAILED);
        }
    }

    @DeleteMapping(value = "/admin/delete/{id}")
    public ResponseEntity<List<User>> adminGetAllUsers(@PathVariable int id) {
        if ( userDetails.adminDeleteUser(id)) {
            return new ResponseEntity(HttpStatus.OK);
        } else {
            return new ResponseEntity("Error when creating new user.", HttpStatus.EXPECTATION_FAILED);
        }
    }

}
