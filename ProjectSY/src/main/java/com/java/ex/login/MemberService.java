package com.java.ex.login;

import org.springframework.stereotype.Service;

import com.java.ex.login.MemberDTO;

@Service
public interface MemberService {
	 public MemberDTO Login(MemberDTO dto) throws Exception;
}
