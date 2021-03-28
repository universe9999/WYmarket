package com.kgitbank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.UserInfo;

public interface goodsMapper {

	 List<GoodsVO> getGoodsList(String userNick);
	
	  public int createGoods(
	  GoodsVO goods,
	  
	  @Param("user") String user,
	  
	  @Param("ititle") String ititle,
	  
	  @Param("icategory") String icategory,
	  
	  @Param("icontent") String icontent,
	  
	  @Param("price") Integer price,
	  
	  @Param("iimagepath") String iimagepath );
	
	
	
	public GoodsVO getGoods(int itemid);

	/*
	 * public void goodsModify( GoodsVO goods,
	 * 
	 * @Param("ititle") String ititle,
	 * 
	 * @Param("icategory") String icategory,
	 * 
	 * @Param("icontent") String icontent,
	 * 
	 * @Param("price") Integer price,
	 * 
	 * @Param("iimagepath") String iimagepath);
	 */
	public void goodsModify(
			GoodsVO goods);
	
	public String getId(String userNick);
	
	public void goodsDelete(int itemid);
	 
	 
}
