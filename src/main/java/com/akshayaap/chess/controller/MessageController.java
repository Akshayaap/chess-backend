package com.akshayaap.chess.controller;

import com.akshayaap.chess.model.ChatMessage;
import com.akshayaap.chess.model.MoveMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class MessageController {
    @Autowired
    SimpMessagingTemplate template;


    @MessageMapping("/play")
    public MoveMessage processMoveMessage(@Payload MoveMessage move) {
        System.out.println("MOve Message Received: " + move);
        template.convertAndSendToUser(move.getReceiver(), "/online", move);
        return move;
    }

    @MessageMapping("/chat")
    public ChatMessage handleChat(@Payload ChatMessage message) {
        System.out.println("ChatMessage Received: " + message);
        template.convertAndSendToUser(message.getReceiver(), "/message", message);
        return message;
    }
}
