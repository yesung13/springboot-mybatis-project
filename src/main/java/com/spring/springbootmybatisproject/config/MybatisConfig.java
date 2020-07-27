package com.spring.springbootmybatisproject.config;

import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement // 트랜잭션 관리: <tx:anntation-driven>
@MapperScan(basePackages = "com.spring.springbootmybatisproject.*.repository")
// java config를 통한 mapper 검색을 하기 위함. dao 인터페이스 패키지 위치
public class MybatisConfig {

    @Bean
    @Primary // 첫번째 DB인 경우
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    public DataSource datasource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }


    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws
            Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
//        sqlSessionFactoryBean.setConfigLocation((new PathMatchingResourcePatternResolver().getResource(
//                "classpath:mybatis-config.xml")));
        sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(
                "classpath:mybatis/mapper/**/*.xml"
        ));
        sqlSessionFactoryBean.setTypeAliasesPackage("com.spring.springbootmybatisproject.*.model"); // @Alias 사용할 패키지 명
        return sqlSessionFactoryBean.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(datasource());
    }
}
