package com.company.exchange.service;

import com.company.exchange.pojo.CommentExtend;
import com.company.exchange.pojo.Comments;
import com.company.exchange.pojo.Goods;

import java.util.List;

public interface GoodsService {

    public int addGood(Goods goods, Integer duration);


    public Goods getGoodsByPrimaryKey(Integer goodsId);

    public Goods getGoodsById(Integer goodsId);


    public void updateGoodsByPrimaryKeyWithBLOBs(int goodsId, Goods goods);


    public void deleteGoodsByPrimaryKey(Integer id);//更新

    public void deleteGoodsByPrimaryKeys(Integer id);//删除


    public List<Goods> getAllGoods();

    List<Goods> searchGoods(String name, String describle);


    public List<Goods> getGoodsByStr(Integer limit, String name, String describle);


    public List<Goods> getGoodsByCatelog(Integer id, String name, String describle);



    public List<Goods> getGoodsOrderByDate(Integer limit);

    public List<Goods> getGoodsByCatelogOrderByDate(Integer catelogId, Integer limit);


    public List<Goods> getGoodsByUserId(Integer user_id);


	public void updateGoodsByGoodsId(Goods goods);
	

	public int getGoodsNum();

	public List<Goods> getPageGoods(int pageNum, int pageSize);
	

	public List<Goods> getPageGoodsByGoods(Integer id, String name, Integer status, int pageNum, int pageSize);

	
	public CommentExtend selectCommentsByGoodsId(Integer id);
	

	public void addComments(Comments comments);

}