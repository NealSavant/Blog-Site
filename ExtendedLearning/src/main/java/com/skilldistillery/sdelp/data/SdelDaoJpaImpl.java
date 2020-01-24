package com.skilldistillery.sdelp.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Content;
import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Log;
import com.skilldistillery.sdelp.entities.Resource;
import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;


@Transactional
@Service
public class SdelDaoJpaImpl implements SdelDao {
	
	@PersistenceContext
	private EntityManager em;


	




	@Override
	public Image addImage(Image image) {
		em.persist(image);
		return image;
	}





}
