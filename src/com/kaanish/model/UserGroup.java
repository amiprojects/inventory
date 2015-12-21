package com.kaanish.model;

import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class UserGroup {

	@Id@GeneratedValue
	private int id;
	private String groupName;

	@OneToMany(mappedBy = "userGroup")
	private List<Users> users;

	@ManyToMany
	private List<PageList> pageLists;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public List<Users> getUsers() {
		return users;
	}

	public void setUsers(List<Users> users) {
		this.users = users;
	}

	public List<PageList> getPageLists() {
		return pageLists;
	}

	public void setPageLists(List<PageList> pageLists) {
		this.pageLists = pageLists;
	}

}
