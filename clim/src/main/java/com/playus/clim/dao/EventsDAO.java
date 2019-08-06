package com.playus.clim.dao;

import java.util.List;

import com.playus.clim.vo.Event;

public interface EventsDAO {
	public List<Event> eventList(int memberNo);
	public int eventInsert(Event event);
	public int eventDelete(int no);
}
