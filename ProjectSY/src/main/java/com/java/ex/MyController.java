package com.java.ex;

import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.ex.board.BoardDTO;
import com.java.ex.board.BoardService;
import com.java.ex.board.PagingDTO;
import com.java.ex.board.UploadFile;
import com.java.ex.login.MemberDTO;
import com.java.ex.login.MemberService;

@Controller
public class MyController {
	
	@RequestMapping("/main")
	public String main() {
		return("/main");
	}
	@RequestMapping("/write")
	public String write (Model model, HttpServletRequest request) {
		
		//웹앱구분
		String userAgent = request.getHeader("User-Agent");
		if(userAgent.indexOf("mobile") > -1) {
			model.addAttribute("mobile", "mobile");
		}
		return("/write");
	}
	@RequestMapping("/show")
	public String show() {
		return("/show");
	}
	@RequestMapping("/login")
	public String login() {
		return("/login");
	}
	
	@Inject
	MemberService service;
	
	// 로그인
	@RequestMapping(value = "gologin", method = RequestMethod.POST)
	public void loginPOST(HttpServletRequest request, MemberDTO dto, RedirectAttributes rttr,
			HttpServletResponse response) throws Exception {

		// session 사용하기 위해 session변수 선언하고 request로 초기화
		// lvo 값은 아이디 비번이 존재할 경우 데이터가 담긴 dto 객체가 저장되는 것
		// 아이디 비번이 없으면 lvo에 null 저장

		HttpSession session = request.getSession();
		MemberDTO lvo = service.Login(dto);
		if (lvo == null) {//일치하지 않는 아이디, 비밀번호 경우(로그인 실패)
			
			int result = 0;
			rttr.addFlashAttribute("result", result);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();

		} 
		//일치하는 아이디, 비밀번호 경우 (로그인 성공)
		session.setAttribute("member", lvo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>window.location.href='/ex/index';</script>");
		out.flush();

	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@Inject
	BoardService bservice;
	
	//게시글 조회
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String Detail(Model model, BoardDTO dto) {
		BoardDTO detail = bservice.detail(dto);
		model.addAttribute("detail", detail);
		return "/show";
	}
	
	//게시글 목록
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String BoardList(Model model, HttpServletRequest request) throws Exception {
		
		int totalCount=bservice.BoardCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		PagingDTO paging = new PagingDTO();
  		paging.setPageNo(page);
  		paging.setPageSize(10);
  		paging.setTotalCount(totalCount);
  		
  		page = (page - 1) * 10;
  		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		
		model.addAttribute("List", bservice.List(map));
		model.addAttribute("Paging", paging);
		
		return "/index";
	}
	
	// 게시글 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String BoardListSearch(Model model, HttpServletRequest request, @RequestParam("keyword") String keyword, @RequestParam("date") String date, @RequestParam("date2") String date2) throws Exception {
		
		HashMap<String, Object> map2 = new HashMap<String, Object>(); //검색 키워드와 날짜를 모델에 넣어서 index로 보내준닫ㅇ
		map2.put("keyword",keyword);
		map2.put("date", date);
		map2.put("date2", date2);
		if(date.equals("") || date.equals(null) || date2.equals("") || date2.equals(null)) {
			date="2020-01-01";
			date2="2030-01-01";
			map2.put("date", date);
			map2.put("date2", date2);
		}
		int totalCount=bservice.SearchBoardCount(map2);
		System.out.println(totalCount);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		PagingDTO paging = new PagingDTO();
  		paging.setPageNo(page);
  		paging.setPageSize(10);
  		paging.setTotalCount(totalCount);
  		
  		page = (page - 1) * 10;
  		HashMap<String, Object> map = new HashMap<String, Object>();
  		map.put("keyword", keyword);
  		map.put("date",date);
  		map.put("date2", date2);
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		
		model.addAttribute("List", bservice.SearchList(map));
		model.addAttribute("Paging", paging);
		model.addAttribute("keyword",keyword);
		model.addAttribute("date",date);
		model.addAttribute("date2",date2);
		return "/index";
	}
	
	//게시글 작성
	@RequestMapping(value = "/writeform", method = RequestMethod.POST)
	public String boardWrite(BoardDTO dto, MultipartFile file, MultipartHttpServletRequest mre, HttpServletRequest request, Model model) throws Exception {
		String Path = request.getSession().getServletContext().getRealPath("resources/image/");
		
		String userAgent = request.getHeader("User-Agent");
		String base = request.getParameter("imageData"); //base64
		String base64=base.split("/")[0];
		
		System.out.println(base64);
		
		//앱
		if(userAgent.indexOf("mobile") > -1) {
			model.addAttribute("mobile", "mobile");
			String fileName = null;
			if (!base.equals(null) && !base.equals("")) {
				byte[] binary = Base64.getDecoder().decode(base); //base64 디코딩
				fileName = UploadFile.fileUpload(Path, "mobile.png", binary);
			}
			dto.setFile_name(fileName);
			bservice.WriteMethod(dto);
		}
		//웹
		else {
		String fileName = null;
		file = mre.getFile("filen");
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFile.fileUpload(Path, file.getOriginalFilename(), file.getBytes());
		}
		dto.setFile_name(fileName);
		bservice.WriteMethod(dto);
		}
		return "redirect:/index";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(BoardDTO dto)throws Exception {
		System.out.println("del");
		bservice.Delete(dto);
		return "redirect:/index";
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modify(BoardDTO dto, Model model, HttpServletRequest request)throws Exception {
		//웹앱구분
		String userAgent = request.getHeader("User-Agent");
		if(userAgent.indexOf("mobile") > -1) {
			model.addAttribute("mobile", "mobile");
		}
		BoardDTO detail = bservice.detail(dto);
		model.addAttribute("detail", detail);
		return("/modify");
	}
	
	//게시글 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modifyform(BoardDTO dto,MultipartFile file, MultipartHttpServletRequest mre, HttpServletRequest request)throws Exception {
		
		String Path = request.getSession().getServletContext().getRealPath("resources/image/");
		String userAgent = request.getHeader("User-Agent");
		String imageData = request.getParameter("imageData"); //base64
		System.out.println(imageData + "225255");
		String fileName = null;
		
		//앱
		if(userAgent.indexOf("mobile") > -1) {
			if (!imageData.equals(null) && !imageData.equals("")) {
				byte[] binary = Base64.getDecoder().decode(imageData); //base64 디코딩
				fileName = UploadFile.fileUpload(Path, "mobile.png", binary);
			}else {
				fileName=request.getParameter("origin"); //첨부파일을 수정하지 않고 수정을 완료했을 때
			}
			dto.setFile_name(fileName);
			bservice.Update(dto);
			}
		//웹
		else {
			file = mre.getFile("filen");
			String fileorigin=file.getOriginalFilename();
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				System.out.println(fileorigin);
				fileName = UploadFile.fileUpload(Path, file.getOriginalFilename(), file.getBytes());
			}else {
				fileName=request.getParameter("origin"); //첨부파일을 수정하지 않고 수정을 완료했을 때
			}
			dto.setFile_name(fileName);
			bservice.Update(dto);
		}
		
		int no=dto.getNo();
		return "redirect:/show?no="+no;
	}
	
	
}
