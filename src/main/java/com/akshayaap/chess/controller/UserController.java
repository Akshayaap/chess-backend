package com.akshayaap.chess.controller;

import com.akshayaap.chess.model.User;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {


    @PostMapping("/register")
    @ResponseBody
    public User register(@RequestBody User user) {
        return null;
    }
    @GetMapping("/hello")
    public String hello(){
        return "<h1>Hello Wolrd</h1>";
    }
}
