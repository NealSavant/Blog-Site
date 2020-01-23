package com.skilldistillery.sdelp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Resource {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@Column(name="resource_url")
	private String resourceUrl;
	
	private Boolean active;
	
	@OneToOne
	@JoinColumn(name="images_id")
	private Image image;
	
	@ManyToOne
	@JoinColumn(name="topic_id")
	private Content content;

}
