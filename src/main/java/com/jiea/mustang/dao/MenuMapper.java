package com.jiea.mustang.dao;

import java.util.List;

import com.jiea.mustang.entity.Menu;
import org.apache.ibatis.annotations.Param;

public interface MenuMapper {
	
	/**
	 * 通过用户主键查询菜单
	 */
	List<Menu> findMenuByEmpId(Integer empId);
	
	/**
	 * 通过父id查询菜单
	 */
	List<Menu> findMenuByParentId(List<Integer> menuPid);

    /**
     * 查询所有菜单
     */
    List<Menu> selectAllMenu();

    /**
     * 根据主键查询菜单
     */
    Menu getMenuById(Integer id);

    /**
     * 新增菜单
     */
    void insert(Menu menu);

    /**
     * 根据主键修改菜单
     */
    void updateMenuById(Menu menu);

    /**
     * 验证中文名称是否存在
     */
    int verifyNameZh(@Param("nameZh") String nameZh, @Param("id") Integer id);

    /**
     * 验证英文名称是否存在
     */
    int verifyNameEn(@Param("nameEn") String nameEn, @Param("id") Integer id);

    /**
     * 根据主键删除菜单
     */
    int deleteMenu(Integer id);
}