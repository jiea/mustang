package com.jiea.mustang.common.utils;

import java.util.List;

/**
 * 分页实体
 */
public class Pagination {

	/**
	 * 总记录数
	 */
	private Long total;

	/**
	 * 当前页
	 */
	private int page;

	/**
	 * 页容量
	 */
	private int pageSize;
	
	/**
	 * 结果集
	 */
	private List<?> pageList;

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<?> getPageList() {
		return pageList;
	}

	public void setPageList(List<?> pageList) {
		this.pageList = pageList;
	}

	/**
	 * 
	 * Description: 取得总页数
	 *
	 * @return
	 * @Author lijie
	 * @Create Date: 2015年6月19日 下午4:46:50
	 */
	public int getTotalPages() {
		return (total.intValue() + pageSize - 1) / pageSize;
	}

	/**
	 * 
	 * Description: 取得第一页
	 *
	 * @return
	 * @Author lijie
	 * @Create Date: 2015年6月19日 下午4:47:47
	 */
	public int getFirstPage() {
		return 1;
	}

	/**
	 * 
	 * Description: 取得上一页
	 *
	 * @return
	 * @Author lijie
	 * @Create Date: 2015年6月19日 下午4:49:15
	 */
	public int getPrePage() {
		if (page <= 1) {
			return 1;
		}
		return page - 1;

	}

	/**
	 * 
	 * Description: 取得下一页
	 *
	 * @return
	 * @Author lijie
	 * @Create Date: 2015年6月19日 下午4:52:25
	 */
	public int getNextPage() {
		if (page >= this.getTotalPages()) {
			return this.getTotalPages() == 0 ? 1 : this.getTotalPages();
		}
		return page + 1;
	}

	/**
	 * 
	 * Description: 获得最后一页
	 *
	 * @return
	 * @Author lijie
	 * @Create Date: 2015年6月19日 下午4:54:20
	 */
	public int getLastPage() {
		return this.getTotalPages() == 0 ? 1 : this.getTotalPages();
	}

	/**
	 * 
	 * Description: 起始索引
	 *
	 * @return
	 * @Author lijie
	 * @Create Date: 2015年6月19日 下午4:55:28
	 */
	public int getStartIndex() {
		return (page - 1) * pageSize;
	}

	/**
	 * 
	 * Description: 结束索引
	 *
	 * @return
	 * @Author lijie
	 * @Create Date: 2015年6月19日 下午4:56:35
	 */
	public int getEndIndex() {
		return (page - 1) * pageSize + pageSize;
	}
}
