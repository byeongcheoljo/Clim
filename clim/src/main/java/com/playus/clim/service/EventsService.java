package com.playus.clim.service;

import java.util.List;

import com.playus.clim.vo.Event;

public interface EventsService {
	public List<Event> getList(int memberNo);
	public int write(Event event);
	public int delete(int no);
}
