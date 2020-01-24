package com.skilldistillery.sdelp.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


@Entity
public class Topic {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	public String title;
	
	@Column(name="created_at")
	@CreationTimestamp
	public LocalDateTime createdAt;
	
	@Column(name="updated_at")
	@UpdateTimestamp
	public LocalDateTime updatedAt;
	
	@OneToMany(mappedBy="topic")
	public List<Content> contents;
	
	
	@ManyToMany
	@JoinTable(name="topic_image",
			joinColumns=@JoinColumn(name="topic_id"),
			inverseJoinColumns=@JoinColumn(name="image_id"))
	public List<Image> images;
	
	private Boolean active;
	
	@OneToMany(mappedBy="topic")
	public List<Resource> resources;
	
	@OneToMany(mappedBy="topic")
	public List<Log> logs;
	
	@OneToMany(mappedBy="topic")
	public List<TopicComment> topicComments;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	

	public List<Content> getContents() {
		List<Content> copy = new ArrayList<>(contents);
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	public List<Image> getImages() {
		List<Image> copy = new ArrayList<>(images);
		return copy;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}
	
	// add/remove
	
	public void addImage(Image image) {
		if (images == null) {
			images = new ArrayList<>();
		}
		
		if (!images.contains(image)) {
			images.add(image);
			image.addTopic(this);
		}
	}
	
	public void removeImage(Image image) {
		if (images != null && images.contains(image)) {
			images.remove(image);
			image.removeTopic(this);
		}
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

	public List<Log> getLogs() {
		List<Log> copy = new ArrayList<>(logs);
		return copy;
	}

	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}
	
	

	public List<TopicComment> getTopicComments() {
		List<TopicComment> copy = new ArrayList<>(topicComments);
		return copy;
	}

	public void setTopicComments(List<TopicComment> topicComments) {
		this.topicComments = topicComments;
	}

	@Override
	public String toString() {
		return "Topic [id=" + id + ", title=" + title + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt
				+ ", active=" + active + "]";
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
		Topic other = (Topic) obj;
		if (id != other.id)
			return false;
		return true;
	}

	
	
	
	
	

}
