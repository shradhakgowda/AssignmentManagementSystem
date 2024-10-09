package com.crimsonlogic.ASM.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8009008837444021191L;

	private String userName;
	private String userPassword;
	private String userRole;

}
