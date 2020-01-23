package com.skilldistillery.sdelp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Log {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	


}
