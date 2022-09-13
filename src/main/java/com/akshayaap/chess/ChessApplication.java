package com.akshayaap.chess;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ChessApplication {

    public static void main(String[] args) {
        for (int i = 0; i < 1000; i++)
            System.out.println("Hello Chess");
        SpringApplication.run(ChessApplication.class, args);
    }
}
