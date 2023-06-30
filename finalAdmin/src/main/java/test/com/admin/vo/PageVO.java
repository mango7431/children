package test.com.admin.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageVO {
	
	private int page;
	private int size;
	private int totalCount;
	
	private int start;
	private int end;
	
	private int startPage;
	private int endPage;
	private int totalPage;
	
	private boolean prev, next;
	
	public PageVO(int page,int size, int totalCount) {
		this.size=size;
		this.totalCount=totalCount;
		
		// 페이지 갯수
		totalPage = (totalCount - 1)/size+1;
		
		//페이지가 잘못 넘어왔을때
		this.page = (page<1)?1:page;
		this.page = (page>totalPage)? totalPage:page;
		
		start = (this.page-1)*size+1;
		end = start + (size-1);
		
		// totalCount 이하의 값이어야 한다.
		this.end = this.end>totalCount? totalCount:this.end;
		
		// page가 11~20일때 startpage는 모두 11
		startPage=(this.page-1)/10*10+1;
		
		endPage = startPage + 9;
		
		// totalPage 이하의 값이어야 한다.
		this.endPage = this.endPage>totalPage? totalPage:this.endPage;
		
		prev = (page>1);
		next = (page<totalPage);
		
	}

}