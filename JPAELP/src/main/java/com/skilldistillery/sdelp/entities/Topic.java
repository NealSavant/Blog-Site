package com.skilldistillery.sdelp.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="content_index")
public class Topic {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="content_id")
	public Content content;
	
	@OneToOne
	@JoinColumn(name="images_id")
	public Image image;
	
	private Boolean active;
	
	@OneToMany(mappedBy="topic")
	public List<Resource> resources;
	
	

}
