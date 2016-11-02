package com.patryk.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.patryk.model.Book;
import com.patryk.service.BookService;

@Controller
public class BooksController {
	@Autowired
	BookService bookService;

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
	public String saveBook(@Valid Book book, BindingResult result, ModelMap model) {
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
	public String updateBook(@Valid Book book, BindingResult result, ModelMap model, @PathVariable Integer id) {
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
}
