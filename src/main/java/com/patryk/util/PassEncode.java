package com.patryk.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PassEncode {
	public static void main(String[] args) {
		String password = "admin";
		String password2 = "user";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println(passwordEncoder.encode(password));
		System.out.println(passwordEncoder.encode(password2));
	}
}
