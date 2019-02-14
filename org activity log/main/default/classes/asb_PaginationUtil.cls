/**
 * @description Class to handle pagination of results
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_PaginationUtil {
	private Integer totalNoOfItems;
	private Integer maxPerPage;
	private Integer curPageNo;
	public Integer maxPageNo {get; set;}
	public Boolean displayNavg {get; set;}
	public Boolean disablePrev {get; set;}
	public Boolean disableNext {get; set;}
	private Integer curStartIndex;
	private Integer curEndIndex;


	public asb_PaginationUtil (Integer totalNoOfItems,Integer maxPerPage) {
		this.maxPerPage = maxPerPage;
		this.totalNoOfItems = totalNoOfItems;
		init();
	}

	public void reset (){
		init ();
	}

	private void init (){
		displayNavg = (totalNoOfItems > maxPerPage);

		if (displayNavg) {
		 	curPageNo   = 1;
		 	disablePrev = true;
		 	disableNext = false;
			maxPageNo   = totalNoOfItems / maxPerPage;
			if ((maxPerPage * maxPageNo) < totalNoOfItems) {
				maxPageNo += 1;
			}
			calculateCurIndices();
		}
		else {
			curStartIndex = 1;
			curEndIndex = totalNoOfItems < 0 ?  maxPerPage : totalNoOfItems;
			curPageNo = 1;
			disablePrev = true;
			disableNext = true;
			maxPageNo = totalNoOfItems > 0 ? 1 : 0;
		}
	}

    public Boolean getEnableNext() {
    	return !disableNext;
    }

	public Integer getCurPageNo() {
		return curPageNo;
	}

	public void setCurPageNo(Integer i) {
		if (totalNoOfItems < 0 || i <= maxPageNo) curPageNo = i;
		else curPageNo = 1;
		disableNext = (curPageNo == maxPageNo);
		disablePrev = (curPageNo == 1);
		curEndIndex = curPageNo * maxPerPage;
		curStartIndex = curEndIndex - maxPerPage;
		if (totalNoOfItems > 0) curEndIndex = (totalNoOfItems > curEndIndex) ? curEndIndex : totalNoOfItems;
		curStartIndex += 1;
	}
	
	public Integer getMaxPerPage() {
		return maxPerPage;
	}
	
	public void setMaxPerPage(Integer i) {
		maxPerPage = i;
	}

	public Integer getTotalNoOfItems() {
		return totalNoOfItems;
	}

	public void setTotalNoOfItems(Integer i) {
		totalNoOfItems = i;
		maxPageNo   = totalNoOfItems / maxPerPage;
		if ((maxPerPage * maxPageNo) < totalNoOfItems) {
			maxPageNo += 1;
		}
		disableNext = (curPageNo == maxPageNo);
		disablePrev = (curPageNo == 1);
		curEndIndex = (totalNoOfItems > curEndIndex) ? curEndIndex : totalNoOfItems;
	}

	public Integer getCurStartIndex() {
		return curStartIndex;
	}

	public Integer getCurEndIndex() {
		return curEndIndex;
	}

	/**
	 * Action listner for the <prev> link
	 **/
	public PageReference prevPage() {
		processPagenation(false);
		return null;
	}

	/**
	 * Action listner for the <next> link
	 **/
	public PageReference nextPage() {
		processPagenation(true);
		return null;
	}

	/**
	 * Action listner for the num per page link
	 **/
	public PageReference changeMaxPerPage() {
		processPagenation(false);
		return null;
	}

	private void processPagenation (Boolean nextPg){
		curPageNo   = (nextPg) ? curPageNo + 1 : curPageNo - 1;
		disableNext = (curPageNo == maxPageNo);
		disablePrev = (curPageNo == 1);
		calculateCurIndices();
	}

	private void calculateCurIndices() {
		curEndIndex = curPageNo * maxPerPage;
		curStartIndex = curEndIndex - maxPerPage;
		curEndIndex = (totalNoOfItems > curEndIndex) ? curEndIndex : totalNoOfItems;
		curStartIndex += 1;
	}
	
}