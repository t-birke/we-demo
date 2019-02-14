/**
 * @description Tests for asb_ChartPeriodIterator
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestChartPeriodIterator {
	public static testMethod void testChartWeekPeriodIterator() {
		asb_ChartPeriodIterator week = new asb_ChartPeriodIterator.ChartWeekPeriodIterator();
		System.assertEquals('DAY_ONLY(convertTimezone(CreatedDate))', week.getGroupByClause());
		System.assertEquals(Date.today().toStartOfWeek(), week.getStartDate());
		System.assertEquals('THIS_WEEK', week.getStartDateClause());
		System.assertEquals(null, week.getEndDateClause());
		System.assertEquals(7, week.getDataPoints().size());
		
		week.prev();
		System.assertEquals(Date.today().addDays(-1*7).toStartOfWeek(), week.getStartDate());
		System.assertEquals('LAST_N_WEEKS:1', week.getStartDateClause());
		System.assertEquals('THIS_WEEK', week.getEndDateClause());
	}
	
	public static testMethod void testChartMonthPeriodIterator() {	
		asb_ChartPeriodIterator month = new asb_ChartPeriodIterator.ChartMonthPeriodIterator();
		System.assertEquals('DAY_ONLY(convertTimezone(CreatedDate))', month.getGroupByClause());
		System.assertEquals(Date.today().toStartOfMonth(), month.getStartDate());
		System.assertEquals('THIS_MONTH', month.getStartDateClause());
		System.assertEquals(null, month.getEndDateClause());
		System.assertEquals(Date.daysInMonth(Date.today().year(), Date.today().month()), month.getDataPoints().size());
		
		month.prev();
		System.assertEquals(Date.today().addMonths(-1).toStartOfMonth(), month.getStartDate());
		System.assertEquals('LAST_N_MONTHS:1', month.getStartDateClause());
		System.assertEquals('THIS_MONTH', month.getEndDateClause());
	}
	
	public static testMethod void testChartYearPeriodIterator() {
		asb_ChartPeriodIterator year = new asb_ChartPeriodIterator.ChartYearPeriodIterator();
		System.assertEquals('CALENDAR_MONTH(convertTimezone(CreatedDate))', year.getGroupByClause());
		System.assertEquals(Date.newInstance(Date.today().year(), 1, 1), year.getStartDate());
		System.assertEquals('THIS_YEAR', year.getStartDateClause());
		System.assertEquals(null, year.getEndDateClause());
		System.assertEquals(12, year.getDataPoints().size());
		
		year.prev();
		System.assertEquals(Date.newInstance(Date.today().addYears(-1).year(), 1, 1), year.getStartDate());
		System.assertEquals('LAST_N_YEARS:1', year.getStartDateClause());
		System.assertEquals('THIS_YEAR', year.getEndDateClause());
	}
}