package com.skilldistillery.sdelp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Image;

@Transactional
@Service
public class ImageDAOJpaImpl implements ImageDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Image addImage(Image image) {
		em.persist(image);
		return image;
	}

}
