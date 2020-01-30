package com.skilldistillery.sdelp.data;

import java.util.List;

import com.skilldistillery.sdelp.entities.Log;

public interface LogDAO {

	Log writeLog(Log log);
	
	List<Log> retrieveCurrentLogs(int userId);
}
