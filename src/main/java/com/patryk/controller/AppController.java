package com.patryk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.patryk.model.Book;
import com.patryk.model.User;
import com.patryk.model.UserProfile;
import com.patryk.service.BookService;
import com.patryk.service.UserProfileService;
import com.patryk.service.UserService;

@Controller
public class AppController {

	@Autowired
	UserProfileService userProfileService;

	@Autowired
	UserService userService;
	@Autowired
	BookService bookService;

	@RequestMapping(value = { "/", "/index", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "index";
	}

	@RequestMapping(value = { "/logged" }, method = RequestMethod.GET)
	public String loggedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		model.addAttribute("allBooks", bookService.findAvailable("TRUE"));
		return "logged";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "admin";
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@RequestMapping(value = "/newuser", method = RequestMethod.GET)
	public String newRegistration(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "newuser";
	}

	/*
	 * This method will be called on form submission, handling POST request It
	 * also validates the user input
	 */
	@RequestMapping(value = "/newuser", method = RequestMethod.POST)
	public String saveRegistration(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("There are errors");
			return "newuser";
		}
		userService.save(user);
		System.out.println("Login : " + user.getUsername());
		System.out.println("Password : " + user.getPassword());
		System.out.println("Email : " + user.getEmail());
		System.out.println("Checking UsrProfiles....");
		if (user.getUserProfiles() != null) {
			for (UserProfile profile : user.getUserProfiles()) {
				System.out.println("Profile : " + profile.getType());
			}
		}
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
	public String updateUser(User user, BindingResult result, ModelMap model, @PathVariable Integer id) {

		if (result.hasErrors()) {
			return "newuser";
		}
		userService.updateUser(user);
		return "redirect:/users";
	}

	@RequestMapping(value = { "/delete-{id}-user" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable Integer id) {
		userService.deleteUserById(id);
		return "redirect:/users";
	}

	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public String booksPage(ModelMap model) {
		model.addAttribute("allBooks", bookService.findAllBooks());
		return "books";
	}

	@RequestMapping(value = { "/newBook" }, method = RequestMethod.GET)
	public String newBook(ModelMap model) {
		Book book = new Book();
		model.addAttribute("book", book);
		model.addAttribute("edit", false);
		return "newBook";
	}

	@RequestMapping(value = { "/newBook" }, method = RequestMethod.POST)
	public String saveEmployee(Book book, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "newBook";
		}
		bookService.save(book);
		return "redirect:/books";
	}

	@RequestMapping(value = { "/edit-{id}-book" }, method = RequestMethod.GET)
	public String editBook(@PathVariable Integer id, ModelMap model) {
		Book book = bookService.findById(id);
		model.addAttribute("book", book);
		model.addAttribute("edit", true);
		return "newBook";
	}

	@RequestMapping(value = { "/edit-{id}-book" }, method = RequestMethod.POST)
	public String updateBook(Book book, BindingResult result, ModelMap model, @PathVariable Integer id) {

		if (result.hasErrors()) {
			return "newBook";
		}
		bookService.updateBook(book);
		return "redirect:/books";
	}

	@RequestMapping(value = { "/delete-{id}-book" }, method = RequestMethod.GET)
	public String deleteBook(@PathVariable Integer id) {
		bookService.deleteBookById(id);
		return "redirect:/books";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}

}