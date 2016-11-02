package com.patryk.controller;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.patryk.model.User;
import com.patryk.model.UserProfile;
import com.patryk.service.UserProfileService;
import com.patryk.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserProfileService userProfileService;
	@Autowired
	UserService userService;

	@RequestMapping(value = "/newuser", method = RequestMethod.GET)
	public String newRegistration(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "newuser";
	}

	@RequestMapping(value = "/newuser", method = RequestMethod.POST)
	public String saveRegistration(@Valid User user, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "newuser";
		}
		userService.save(user);
		return "redirect:/users";
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String usersPage(ModelMap model) {
		model.addAttribute("allUsers", userService.findAllUsers());
		return "users";
	}

	@RequestMapping(value = { "/edit-{id}-user" }, method = RequestMethod.GET)
	public String editUser(@PathVariable Integer id, ModelMap model) {
		User user = userService.findById(id);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		return "newuser";
	}

	@RequestMapping(value = { "/edit-{id}-user" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable Integer id) {
		if (result.hasErrors()) {
			return "newuser";
		}
		userService.findById(id);
		return "redirect:/users";
	}

	@RequestMapping(value = { "/delete-{id}-user" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable Integer id) {
		userService.deleteUserById(id);
		return "redirect:/users";
	}

	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}
}
