package com.patryk.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.patryk.model.Book;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao<Integer, Book> implements BookDao {

	public Book findById(int id) {
		return getByKey(id);
	}

	public void save(Book book) {
		persist(book);
	}

	public void delete(Book book) {
		delete(book);
	}

	public void deleteBookById(Integer id) {
		Query query = getSession().createSQLQuery("delete from Books where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Book> findAvailable(String available) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.like("available", "TRUE"));
		return (List<Book>) crit.list();
	}

	@SuppressWarnings("unchecked")
	public List<Book> findAllBooks() {
		Criteria criteria = createEntityCriteria();
		return (List<Book>) criteria.list();
	}
}
