package com.java.ex.login;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	   MemberDAO dao;
	@Override
	public MemberDTO Login(MemberDTO dto) throws Exception {
		return dao.Login(dto);
	}

}
