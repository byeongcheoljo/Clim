
package com.playus.clim.controller;


import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.playus.clim.service.ClimingListsService;
import com.playus.clim.service.ClimingLogsService;
import com.playus.clim.service.MoviesService;
import com.playus.clim.service.StreamingDetailService;
import com.playus.clim.service.SubscribesService;
import com.playus.clim.vo.Subscribe;
import com.playus.clim.vo.ClimingList;
import com.playus.clim.vo.ClimingLog;
import com.playus.clim.vo.Member;
import com.playus.clim.vo.Movie;

@Controller
public class StreamingController {
	@Autowired
	private StreamingDetailService streamingDetailService;
	@Autowired
	private ClimingLogsService climingLogsService;
	@Autowired
	private ClimingListsService climingListsService;
		@Autowired
	private SubscribesService subscribesService;
	@Autowired
	private MoviesService moviesService;
	
	@RequestMapping(value="/room/{no}", method=RequestMethod.GET)
	public String getModelPage(Model model, @PathVariable int no, HttpSession session) {
		//System.out.println(no);
		model.addAllAttributes(streamingDetailService.getDetailByRoomNo(no, session));
		
		return "streamingDetail";
		
	}
	
	@RequestMapping(value="/ajax/user/{memberNo}/subscribe",method=RequestMethod.GET)
	@ResponseBody
	public List<Subscribe> getSubscribeList(@PathVariable int memberNo){
		return subscribesService.getList(memberNo);
	};
	
	
	@MessageMapping("/clim/make")
	@SendToUser("/queue/clim/make")
	public int asdsdfaasdfasdf(ClimingList climingList, SimpMessageHeaderAccessor accessor) {
		
		// sessionId : accessor.getSessionId(); 
		// 고유한 값
		String sessionId = accessor.getSessionId();
		
		//System.out.println("/app/clim/make");
		//clim 생성
		climingList.setSessionId(sessionId);
		try {
			climingListsService.make(climingList);
		}catch(Exception e) {
			e.printStackTrace();
		}//try~catch end
		// 방번호를 알 수 있음
		//System.out.println("no : "+climingList.getNo());
		// 방번호를 리턴
		return climingList.getNo();
	}
	
	@MessageMapping("/room/{no}/chat")
	@SendTo("/topic/room/{no}/chat")
	public ClimingLog asapqkfkeo(ClimingLog climingLog , SimpMessageHeaderAccessor accessor) {
		return climingLog;
	}
	
	@MessageMapping("/room/{no}/close")
	@SendTo("/topic/room/{no}/close")
	public int asdfas( @DestinationVariable int no,
			SimpMessageHeaderAccessor accessor) {
		
		//System.out.println(accessor.getSessionId());
		
		//System.out.println("방장이 문을 닫았음");
		
		climingLogsService.climClose(no);
		//climListService.close(accessor.getSessionId());
		
		return 1;
	}
	//방에서 현재 시간을 얻어옴
		@MessageMapping("/room/{no}/get/time")
		@SendTo("/topic/room/{no}/get/time")
		public int afdasdf(@DestinationVariable int no, int memberNo , SimpMessageHeaderAccessor accessor) {
			//System.out.println("/room/{no}/get/time");
			//System.out.println(memberNo);
			
			
			ClimingLog log = new ClimingLog();
			log.setClimingNo(no);
			log.setMemberNo(memberNo);
			log.setSessionId(accessor.getSessionId());
			climingLogsService.joinCliming(log);
			
			//아무값이나 리턴하지 않으면 응답이 가지 않음
			return 1;
		}
		
		//방에서 현재 시간을 세팅함
		@MessageMapping("/room/{no}/set/time")
		@SendTo("/topic/room/{no}/set/time")
		public Movie afdasdf(Movie movie, SimpMessageHeaderAccessor accessor) {
//			System.out.println("/room/{no}/set/time");
			
			movie.setPoster(moviesService.getPoster(movie.getSrc().substring(7)));
			
			return movie;
		}
		
		@MessageMapping("/room/{no}/get/climee")
		@SendTo("/topic/room/{no}/get/climee")
		public Map<String, Object> getClimee(@DestinationVariable int no, SimpMessageHeaderAccessor accessor) {
//			System.out.println("/room/"+no+"/get/climee");
			return climingLogsService.getClimeeList(no);
		}
		
		//방장이 나가라고함
		@MessageMapping("/room/{no}/ban/{memberNo}")
		@SendTo("/topic/room/{no}/ban/{memberNo}")
		public int banClimee(int member_no) {
//			System.out.println("/room/{roomNo}/ban/{memberNo}");
			return 1;
		}
		//나감~~
		@MessageMapping("/room/{no}/baned/member/{memberNo}")
		@SendTo("/topic/room/{no}/member/baned")
		public String banedClimee(@DestinationVariable int no,String nickname, SimpMessageHeaderAccessor accessor) {
//			System.out.println("/topic/room/{no}/member/baned");
			climingLogsService.getOutCliming(no,accessor.getSessionId());
			return nickname;
		}
		@MessageMapping("/room/{no}/{memberNo}/close")
		public void getOutClimee(@DestinationVariable int no, SimpMessageHeaderAccessor accessor) {
//			System.out.println("/room/{no}/{memberNo}/close");
			climingLogsService.getOutCliming(no,accessor.getSessionId());
			
		}
		
		
		@MessageMapping("/room/{no}/put/sessionId")
		public void sfasds(int no,SimpMessageHeaderAccessor accessor) {
//			System.out.println("방장이 처음 들어옴!");
			
//			System.out.println("sessionId:"+accessor.getSessionId());
			
			ClimingList clim = new ClimingList(no,accessor.getSessionId());
			
			climingListsService.updateSessionId(clim);
		}
		
//	@MessageMapping("/clim/list")
//	@SendTo("/topic/clim/list")
//	public List<ClimingList> subscribeList(SimpMessageHeaderAccessor accessor) {
//		
//		climingListsService.getClimingList();
//		
//		return climingListsService.subscribesClimingList();
//	}
	
	
	@MessageMapping("/clim/live")
	@SendTo("/topic/clim/live")
	public ClimingList climLive(ClimingList clim) {
		
		return clim;
	}
	
	@MessageMapping("/clim/live/close")
	@SendTo("/topic/clim/live/close")
	public String climLiveClose(String memberNo) {
		return memberNo;
	}
	
	@MessageMapping("/clim/living")
	@SendTo("/topic/clim/living")
	public int climingListLiveCheck() {
		return 1;
	}
	
	/*근경 시작*/		
	
	//클리밍 리스트 불러오기
	@MessageMapping("/clim/list")
	@SendTo("/topic/clim/list")
	public List<ClimingList> asdfggagsadf(){
		return climingListsService.getClimingList();
	}	
	
	@MessageMapping("/room/{no}/clim/time")
	@SendTo("/topic/room/{no}/get/time")
	public int afdasdf() {
		System.out.println("/room/{no}/clim/time");
		
		//아무값이나 리턴하지 않으면 응답이 가지 않음
		return 1;
	}
	
	//클리밍 리스트 불러오기
	@MessageMapping("/clim/userList")
	@SendTo("/topic/clim/userList")
	public List<ClimingList> userClimList(int memberNo){
		System.out.println(memberNo);
		System.out.println("유저클림");
		return climingListsService.getUserClimingList(memberNo);
	}	
	
	
/*근경 끝*/		
	
	
}

