package com.playus.clim.listener;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.socket.messaging.SessionConnectEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

public class StompListener {
	
	@Autowired
	private SimpMessagingTemplate template;
		
	
	@EventListener
	private void handleSessionConnected(SessionConnectEvent event) {
		StompHeaderAccessor accessor = StompHeaderAccessor.wrap(event.getMessage());
		
		//String no = accessor.getNativeHeader("no").get(0);
		
		System.out.println("connect!!");

		
	}
	
	@EventListener
	private void handleSessionDisconnect(SessionDisconnectEvent event) {
		StompHeaderAccessor accessor = StompHeaderAccessor.wrap(event.getMessage());

		System.out.println("disconnect!!");
	}

}
