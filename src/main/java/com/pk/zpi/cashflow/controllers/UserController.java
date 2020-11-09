package com.pk.zpi.cashflow.controllers;

import com.pk.zpi.cashflow.services.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userDetails = new UserService();

}
