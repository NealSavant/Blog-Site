package com.skilldistillery.sdelp.data;

import com.skilldistillery.sdelp.entities.Resource;

public interface ResourceDAO {
	
	Resource addResource(Resource resource);
	
	Resource updateResource(Resource resource);

	Resource getResourceById(int id);

}
