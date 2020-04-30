package cn.jit.service;

import cn.jit.dao.RatingDao;
import cn.jit.po.Rating;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RatingService {
    @Autowired
    private RatingDao ratingDao;
    @Transactional
    public int addRatingByUser(Rating rating){
        return ratingDao.addRatingByUser(rating);
    }
    public int updateRatingByUser(Rating rating){return ratingDao.updateRatingByUser(rating);}

    @Transactional
    public List<Rating> queryRatingByClientId(Integer clientId){return ratingDao.queryRatingByClientId(clientId);}
    public Rating queryRatingByExampleId(Integer exampleId){return ratingDao.queryRatingByExampleId(exampleId);}
}
