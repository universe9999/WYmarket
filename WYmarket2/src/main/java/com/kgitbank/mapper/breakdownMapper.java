package com.kgitbank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.Pageination;
import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.ShUserInfoVO;

public interface breakdownMapper {

   
   List<ShUserInfoVO> getShuserInfo();
      
   List<ShItemVO> getUserItemList(Pageination paging);
   
   List<ShItemVO> searchUserItemList(Pageination paging);
   
   List<ShItemVO> selectStateCategory(Pageination paging);
   
   List<ShItemVO>  getShitemVO(String usernick); 
         
   List<PurchasedetailsVO> getPurchaserPhVO(String purchaser);
   
   List<PurchasedetailsVO> getSellerPhVO(String usernick);
   
   
   int onsaleCount();
   
   int getCount(String usernick);
   
   int searchCount(Pageination paging);
   
   int completedIstate(
         @Param("istate") String istate, 
         @Param("ititle") String ititle,
         @Param("usernick") String usernick,
         @Param("itemid") String itemid
         );
   
   int hiddenIstate(
         @Param("istate") String istate, 
         @Param("ititle") String ititle,
         @Param("usernick") String usernick,
         @Param("itemid") String itemid
         );
   
   int reservationStateChange(
         @Param("iReservationState") String iReservationState, 
         @Param("ititle") String ititle,
         @Param("istate") String istate, 
         @Param("usernick") String usernick,
         @Param("itemid") String itemid);
         
   int insertPurchase(
         PurchasedetailsVO pvo,
         @Param("purchaser") String purchaser,
         @Param("usernick") String usernick,
         @Param("ititle") String ititle,
         @Param("istate") String istate,
         @Param("itemid") String itemid
         );
   
   int productPullUp(
         @Param("ititle") String ititle, 
         @Param("usernick") String usernick,
         @Param("istate") String istate,
         @Param("itemid") String itemid
         );
   
   int productDelete(
         @Param("ititle") String ititle, 
         @Param("usernick") String usernick,
         @Param("istate") String istate,
         @Param("itemid") String itemid
         );

   int purchasedetailsCount(@Param("usernick") String usernick);
      
   int shitemVOCount(@Param("usernick") String usernick);
   
   int getShuserInfoCdate(@Param("usernick") String usernick);
   
   
   int updateUserInfoNick(@Param("modiyusernick") String modiyusernick ,
         @Param("usernick") String usernick);
   
   int updateUserItemNick(@Param("modiyusernick") String modiyusernick ,
         @Param("usernick") String usernick);
   

   
         
}