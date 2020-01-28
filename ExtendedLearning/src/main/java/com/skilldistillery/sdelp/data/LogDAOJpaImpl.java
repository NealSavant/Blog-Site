package com.skilldistillery.sdelp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Log;

@Transactional
@Service
public class LogDAOJpaImpl implements LogDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Log writeLog(Log log) {
		em.persist(log);
		em.flush();
		return log;
	}

}
