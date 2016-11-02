package com.patryk.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.patryk.dao.BookDao;
import com.patryk.model.Book;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDao dao;

	public void save(Book book) {
		dao.save(book);
	}

	public void delete(Book book) {
		dao.delete(book);
	}

	public Book findById(int id) {
		return dao.findById(id);
	}

	public void deleteBookById(Integer id) {
		dao.deleteBookById(id);
	}

	public List<Book> findAvailable(String available) {
		return dao.findAvailable(available);
	}

	public List<Book> findAllBooks() {
		return dao.findAllBooks();
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate
	 * update explicitly. Just fetch the entity from db and update it with
	 * proper values within transaction. It will be updated in db once
	 * transaction ends.
	 */
	public void updateBook(Book book) {
		Book entity = dao.findById(book.getId());
		if (entity != null) {
			entity.setAuthor(book.getAuthor());
			entity.setTitle(book.getTitle());
			entity.setAvailable(book.getAvailable());
		}
	}
}
