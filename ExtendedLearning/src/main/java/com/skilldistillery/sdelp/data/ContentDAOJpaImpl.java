package com.skilldistillery.sdelp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Content;

@Transactional
@Service
public class ContentDAOJpaImpl implements ContentDAO {
	
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public Content addContent(Content content) {
		em.persist(content);
		return content;
	}

	@Override
	public Content updateContent(Content content) {
		Content managedContent = em.find(Content.class, content.getId());
		managedContent.setContent(content.getContent());
		managedContent.setActive(content.getActive());
		return managedContent;
	}

}
