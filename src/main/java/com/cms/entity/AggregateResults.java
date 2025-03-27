package com.cms.entity;

import jakarta.persistence.SqlResultSetMapping;

@SqlResultSetMapping(name="mm")
public class AggregateResults {
    private Long count;
    private String sname;

    public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public AggregateResults(Long count, String sname) {
        this.count = count;
        this.sname = sname;
    }

	public String getNotimes() {
		return null;
	}

    // Getters and setters
}