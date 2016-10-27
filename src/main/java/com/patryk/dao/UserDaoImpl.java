package com.patryk.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.patryk.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	public void save(User user) {
		persist(user);
	}

	public User findById(int id) {
		return getByKey(id);
	}

	// custonUserDetailsService.java - korzysta
	public User findBySSO(String sso) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("username", sso));
		return (User) crit.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria();
		return (List<User>) criteria.list();
	}

	public void deleteUserById(Integer id) {
		Query query = getSession().createSQLQuery("delete from app_user_user_profile where user_id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		Query query2 = getSession().createSQLQuery("delete from app_user where id = :id");
		query2.setInteger("id", id);
		query2.executeUpdate();
	}
}
