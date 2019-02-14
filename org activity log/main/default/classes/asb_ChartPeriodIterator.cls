public abstract class asb_ChartPeriodIterator {
	public static final String TIME_SPAN_YEAR = 'Year';
	public static final String TIME_SPAN_MONTH = 'Month';
	public static final String TIME_SPAN_WEEK = 'Week';
	
	private Integer offset;
	private Integer fullResultSet;
	private Date startDate;
	private String startDateClause;
	private String endDateClause;
	private String periodType;
	private DATA_POINT_TYPE dataPointType;
	public enum DATA_POINT_TYPE{MONTH,DAY}
	
	protected asb_ChartPeriodIterator() {
		offset = 0;
		refreshStartDate();
	}
	
	public void prev() {
		offset--;
		refreshStartDate();
	}
	
	public void next() {
		offset++;
		refreshStartDate();
	}
	
	public boolean getHasNext() {
		return (offset < 0);
	}
	
	public virtual String getGroupByClause() {
		return (getDataPointType() == DATA_POINT_TYPE.MONTH ? 'CALENDAR_MONTH(convertTimezone(CreatedDate))' : 'DAY_ONLY(convertTimezone(CreatedDate))');
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public String getStartDateClause() {
		if (startDateClause == null) {
			computeStartEndDateClause();
		}
		
		return startDateClause;
	}
	
	public String getEndDateClause() {
		if (startDateClause == null) {
			computeStartEndDateClause();
		}
		
		return endDateClause;
	}
	
	public DATA_POINT_TYPE getDataPointType() {
		return dataPointType;
	}
	
	public String getPeriodType() {
		return periodType;
	}
	
	private abstract void refreshStartDate();
	private abstract void computeStartEndDateClause();
	
	public Map<Date, asb_ChartData> getDataPoints() {
		Map<Date, asb_ChartData> allDataPoints = new Map<Date, asb_ChartData>();
		Date targetDate;
		//Loop for what the expected result set should be 	
		for (Integer dataPoint = 0; dataPoint < fullResultSet; dataPoint++) {
			//get each date for the target time span
			if (dataPointType == DATA_POINT_TYPE.MONTH) {
				targetDate = startDate.addMonths(dataPoint);
			} else if (dataPointType == DATA_POINT_TYPE.DAY) {	
				targetDate = startDate.addDays(dataPoint);
			}
		
			allDataPoints.put(targetDate, new asb_ChartData(targetDate, 0));
		}
		
		return allDataPoints;
	}
	
	public class ChartWeekPeriodIterator extends asb_ChartPeriodIterator {
		public final Integer WEEK_DATA_POINTS = 7;
		
		public ChartWeekPeriodIterator() {
			super();
			periodType = TIME_SPAN_WEEK;
			dataPointType = DATA_POINT_TYPE.DAY;
			//one data point per day when displaying week
			fullResultSet = WEEK_DATA_POINTS;
		}
		
		private override void refreshStartDate() {
			//get the date for the begining of the target week
			startDate = Date.today().addDays(offset*7).toStartOfWeek();
			startDateClause = null;
			endDateClause = null;
		}
		
		private override void computeStartEndDateClause() {
			if (offset < 0) {
				//LAST_N_XXXXX needs a positive number
				startDateClause = 'LAST_N_WEEKS:' + (offset * -1);
				endDateClause = (offset < -1) ? 'LAST_N_WEEKS:' + ((offset-1) * -1) : 'THIS_WEEK';
			} else {
				startDateClause = 'THIS_WEEK';
			}	
		}
	}
	
	public class ChartMonthPeriodIterator extends asb_ChartPeriodIterator {
		public ChartMonthPeriodIterator() {
			super();
			periodType = TIME_SPAN_MONTH;
			dataPointType = DATA_POINT_TYPE.DAY;
			//one data point per day when displaying month
			fullResultSet = Date.daysInMonth(startDate.year(), startDate.month());
		}
		
		private override void refreshStartDate() {
			//get the date for the begining of the target month
			startDate = Date.today().addMonths(offset).toStartOfMonth();
			startDateClause = null;
			endDateClause = null;
		}
		
		private override void computeStartEndDateClause() {
			if (offset < 0) {
				//LAST_N_XXXXX needs a positive number
				startDateClause = 'LAST_N_MONTHS:' + (offset * -1);
				endDateClause = (offset < -1) ? 'LAST_N_MONTHS:' + ((offset-1) * -1) : 'THIS_MONTH';
			} else {
				startDateClause = 'THIS_MONTH';
			}	
		}
	}
	
	public class ChartYearPeriodIterator extends asb_ChartPeriodIterator {
		public final Integer YEAR_DATA_POINTS = 12;
	
		public ChartYearPeriodIterator() {
			super();
			periodType = TIME_SPAN_YEAR;
			dataPointType = DATA_POINT_TYPE.MONTH;
			//only one data point per month when displaying year
			fullResultSet = YEAR_DATA_POINTS;
		}
		
		private override void refreshStartDate() {
			//get the date for the begining of the target year
			startDate = Date.newInstance(Date.today().addYears(offset).year(), 1, 1);
			startDateClause = null;
			endDateClause = null;
		}
		
		private override void computeStartEndDateClause() {
			if (offset < 0) {
				//LAST_N_XXXXX needs a positive number
				startDateClause = 'LAST_N_YEARS:' + (offset * -1);
				endDateClause = (offset < -1) ? 'LAST_N_YEARS:' + ((offset-1) * -1) : 'THIS_YEAR';
			} else {
				startDateClause = 'THIS_YEAR';
			}	
		}
	}
}