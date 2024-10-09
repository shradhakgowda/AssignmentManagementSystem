package com.crimsonlogic.ASM.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Users implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8058712997204313970L;
	private long userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userRole;
	
	
}
