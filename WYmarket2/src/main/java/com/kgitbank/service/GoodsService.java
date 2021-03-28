package com.kgitbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.mapper.goodsMapper;
import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.UserInfo;

@Service
public class GoodsService implements GoodsServiceImpl{
	
	@Autowired
	goodsMapper goods_mapper;
	
	@Override
	public List<GoodsVO> getGoodsList(String userNick){
		return goods_mapper.getGoodsList(userNick);
	}

	@Override
	public GoodsVO getGoods(int itemid) {		
		return goods_mapper.getGoods(itemid);
	}
	
	/*
	 * @Override public void goodsModify(GoodsVO goods, String ititle, String
	 * icategory, String icontent, Integer price, String iimagepath) {
	 * goods_mapper.goodsModify(goods, ititle, icategory, icontent, price,
	 * iimagepath); }
	 */
	@Override
	public void goodsModify(GoodsVO goods) {
		goods_mapper.goodsModify(goods);
	}

	
	@Override
	public String getId(String userNick) {
		return goods_mapper.getId(userNick);
	}

	@Override public int createGoods(GoodsVO goods,String user, String ititle,
			String icategory, String icontent, Integer price, String iimagepath) { 
		return goods_mapper.createGoods(goods, user, ititle, icategory, icontent, price, iimagepath); }

	@Override
	public void goodsDelete(int itemid) {
		goods_mapper.goodsDelete(itemid);
	}


}
