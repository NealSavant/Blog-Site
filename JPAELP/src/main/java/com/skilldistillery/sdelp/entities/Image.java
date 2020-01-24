package com.skilldistillery.sdelp.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Image {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="content_img_url")
	private String imageUrl;
	
	@ManyToMany(mappedBy="images")
	private List<Topic> topics;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public List<Topic> getTopics() {
		List<Topic> copy = new ArrayList<>(topics);
		return copy;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}
	
	// add, remove
	
	public void addTopic(Topic topic) {
		if (topics == null) {
			topics = new ArrayList<>();
		}
		
		if (!topics.contains(topic)) {
			topics.add(topic);
			topic.addImage(this);
		}
	}
	
	public void removeTopic(Topic topic) {
		if (topics != null && topics.contains(topic)) {
			topics.remove(topic);
			topic.removeImage(this);
		}
	}

	@Override
	public String toString() {
		return "Image [id=" + id + ", imageUrl=" + imageUrl + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Image other = (Image) obj;
		if (id != other.id)
			return false;
		return true;
	}

	

	
	
}
