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
public class Content {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="written_content_id")
	public WrittenContent writtenContent;
	
	@OneToOne
	@JoinColumn(name="image_id")
	public Image image;
	
	@OneToMany(mappedBy="")
	public List<Resource> resources;
	
	

}
