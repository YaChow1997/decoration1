package cn.jit.dao;

import cn.jit.po.Rating;

import java.util.List;

public interface RatingDao {
    public int addRatingByUser(Rating rating);

    public int updateRatingByUser(Rating rating);

    public List<Rating> queryRatingByClientId(Integer clientId);

    public Rating queryRatingByExampleId(Integer exampleId);
}
