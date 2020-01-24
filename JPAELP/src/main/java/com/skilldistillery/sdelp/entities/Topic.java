package com.skilldistillery.sdelp.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public List<Resource> getResources() {
		List<Resource> copy = new ArrayList<>(resources);
		return copy;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}
	
	
	
	

}
