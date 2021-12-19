package com.company.exchange.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface PhoneMapper {



    @Select("select user.phone from user where id=#{userId}")
    String getUserPhone(@Param("userId") Integer userId);
}
