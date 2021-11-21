package com.company.exchange;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.company.exchange.dao")
public class ExchangeApplication {

    private static final Logger logger = LoggerFactory.getLogger(ExchangeApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(ExchangeApplication.class, args);
        logger.info(ExchangeApplication.class.getSimpleName() + "：启动成功!");
    }

}
