package com.java.ex.login;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOlmpl implements MemberDAO {

	@Inject
	   private SqlSession sqlSession;
	   private static final String namespace = "com.java.ex.mappers.LoginMapper";
	   
	@Override
	public MemberDTO Login(MemberDTO dto) throws Exception { 
		return sqlSession.selectOne(namespace+".Login", dto);
	}

}
