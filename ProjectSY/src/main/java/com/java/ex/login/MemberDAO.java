package com.java.ex.login;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	public MemberDTO Login(MemberDTO dto) throws Exception;
}
