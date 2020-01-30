package com.skilldistillery.sdelp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Resource;

@Transactional
@Service
public class ImageDAOJpaImpl implements ImageDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Image addImage(Image image) {
		em.persist(image);
		em.flush();
		return image;
	}
	
	@Override
	public Image updateImage(Image image) {
		Image managedImage = em.find(Image.class, image.getId());
		managedImage.setImageUrl(image.getImageUrl());
		em.flush();
		return managedImage;
	}

}
