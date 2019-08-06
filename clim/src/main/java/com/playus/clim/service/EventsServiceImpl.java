package com.playus.clim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.EventsDAO;
import com.playus.clim.vo.Event;

@Service
public class EventsServiceImpl implements EventsService{
	@Autowired
	private EventsDAO eventsDAO;
	
	@Override
	public List<Event> getList(int memberNo) {
		return eventsDAO.eventList(memberNo);
	}
	
	@Override
	public int write(Event event) {
		return eventsDAO.eventInsert(event);
	}
	
	@Override
	public int delete(int no) {
		return eventsDAO.eventDelete(no);
	}
}
