package edu.neu.csye6220.dao;

import edu.neu.csye6220.domain.Movie;

import java.util.List;

public interface MovieDao {
    List<Movie> getAll();
    void add(Movie movie);
    Movie findById(String id);
}
