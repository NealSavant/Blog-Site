package com.skilldistillery.sdelp.data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//not optimized, need javascript in ideal
	@Override
	public List<Log> retrieveCurrentLogs(int userId) {
		String jpql = "SELECT DISTINCT log FROM Log log WHERE log.user.id = :bindId "
				+ "ORDER BY log.timeStamp";	//distinct and order by are unnecessary i think but it aint broke so i aint fixing
		//find all unique topic_id's from users log, in order of most recent
		List<Log> logs = em.createQuery(jpql, Log.class).setParameter("bindId", userId).getResultList();
		em.flush();
		Map<Integer,Log> topicIds = new HashMap<>();
		//grab all unique logs for this user
		for (Log log : logs) {
			topicIds.put(log.getTopic().getId(),log);
		}
		// Date and Time integer is the keyset
		List<Integer> topics = new ArrayList<>();	//return these integers
		for (Integer integer : topicIds.keySet()) {
			topics.add(integer);
		}
		
		//compare time stamps and sort by ascending
		class SortbyTimestamp implements Comparator<Integer> 
		{ 
		    // order by most recently viewed
		    public int compare(Integer a, Integer b) 
		    { 
		    	//compare dates and order by most recent
		        return -(topicIds.get(a).getTimeStamp().toString().compareTo(topicIds.get(b).getTimeStamp().toString())); 
		    } 
		} 
		
		
		//call comparator class
		Collections.sort(topics,new SortbyTimestamp());
		logs = new ArrayList<>();
		for (Integer integer : topics) {
			logs.add(topicIds.get(integer));
		}
		
		
		return logs ;
	}
	
}
