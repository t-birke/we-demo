({
    opportunityReasons: [
        //Labels not working in 210. Swap back to label and formatString when available
        {
            "formatString": "AMOUNT_DECREASE_N",
            "formatStringOutput": "Lower likelihood to win when amount went down significantly",
            "trend": "NEG"
        },
        {
            "formatString": "AMOUNT_DECREASES_CONSTANTLY_N",
            "formatStringOutput": "Lower likelihood to win when amount keeps going down",
            "trend": "NEG"
        },
        {
            "formatString": "AMOUNT_INCREASES_CONSTANTLY_P",
            "formatStringOutput": "Lower likelihood to win when amount keeps going up",
            "trend": "NEG"
        },
        {
            "formatString": "MISSING_AMOUNT",
            "formatStringOutput": "Amount is missing",
            "trend": "NEG"
        },
        {
            "formatString": "DEAL_WRONG_ON_TIME",
            "formatStringOutput": "Wrong time of year for this deal",
            "trend": "NEG"
        },
        {
            "formatString": "OPP_AGING_N",
            "formatStringOutput": "Lower likelihood to win when deals take longer",
            "trend": "NEG"
        },
        {
            "formatString": "OPP_NO_RECENT_UPDATES",
            "formatStringOutput": "No recent updates to opportunity",
            "trend": "NEG"
        },
        {
            "formatString": "ACCOUNT_PAST_LOST",
            "formatStringOutput": "Past losses with accounts",
            "trend": "NEG"
        },
        {
            "formatString": "MISSING_LEAD_SOURCE",
            "formatStringOutput": "Missing lead source",
            "trend": "NEG"
        },
        {
            "formatString": "LEAD_SOURCE_LOW_SUCCESS",
            "formatStringOutput": "Low success rate from this lead source compared to other sources",
            "trend": "NEG"
        },
        {
            "formatString": "MISSING_TYPE",
            "formatStringOutput": "Opportunity type is missing",
            "trend": "NEG"
        },
        {
            "formatString": "OPP_TYPE_LOW_SUCCESS",
            "formatStringOutput": "Low success rate for this opportunity type compared to other types",
            "trend": "NEG"
        },
        {
            "formatString": "MISSING_INDUSTRY",
            "formatStringOutput": "Industry is missing",
            "trend": "NEG"
        },
        {
            "formatString": "INDUSTRY_LOW_SUCCESS",
            "formatStringOutput": "Low success rate from this industry compared to other industries",
            "trend": "NEG"
        },
        {
            "formatString": "CURR_STAGE_LOW_SUCCESS",
            "formatStringOutput": "Low success rate for opportunities reaching this stage compared to other stages",
            "trend": "NEG"
        },
        {
            "formatString": "DEAL_STAGES_MOVING_SLOW",
            "formatStringOutput": "Deal moving slowly through stages",
            "trend": "NEG"
        },
        {
            "formatString": "DEAL_CURR_STAGE_MOVING_SLOW",
            "formatStringOutput": "Current stage is taking too long",
            "trend": "NEG"
        },
        {
            "formatString": "MISSING_CLOSE_DATE",
            "formatStringOutput": "Missing close date",
            "trend": "NEG"
        },
        {
            "formatString": "CLOSE_DATE_DELAYED_N",
            "formatStringOutput": "Close date delayed",
            "trend": "NEG"
        },
        {
            "formatString": "CLOSE_DATE_DELAYS_CONSTANTLY_N",
            "formatStringOutput": "Close date repeatedly delayed",
            "trend": "NEG"
        },
        {
            "formatString": "CLOSE_DATE_OVERDUE_N",
            "formatStringOutput": "Close date overdue",
            "trend": "NEG"
        },
        {
            "formatString": "CURR_FORECAST_CATEGORY_LOW_SUCCESS",
            "formatStringOutput": "Low success rate for opportunities reaching this forecast category compared to other stages",
            "trend": "NEG"
        },
        {
            "formatString": "INSIGHT_PROSPECT_UNRESPONSIVE",
            "formatStringOutput": "Prospect has not responded",
            "trend": "NEG"
        },
        {
            "formatString": "INSIGHT_COMPETITION_MENTIONED",
            "formatStringOutput": "Competition was mentioned",
            "trend": "NEG"
        },
        {
            "formatString": "INSIGHT_NO_COMMUNICATION",
            "formatStringOutput": "No communication",
            "trend": "NEG"
        },
        {
            "formatString": "INSIGHT_CONTACT_LEAVING",
            "formatStringOutput": "Contact is leaving",
            "trend": "NEG"
        },
        {
            "formatString": "INSIGHT_TASK_OVERDUE",
            "formatStringOutput": "Task overdue",
            "trend": "NEG"
        },
        {
            "formatString": "INSIGHT_NO_FUTURE_ACTIVITY",
            "formatStringOutput": "Opportunity has no open activity",
            "trend": "NEG"
        },
        {
            "formatString": "PRODUCT_LOW_SUCCESS",
            "formatStringOutput": "Low success rate for this product compared to your other products",
            "trend": "NEG"
        },
        {
            "formatString": "AMOUNT_INCREASE_P",
            "formatStringOutput": "Higher likelihood to win when amount went up significantly",
            "trend": "POS"
        },
        {
            "formatString": "AMOUNT_DECREASE_P",
            "formatStringOutput": "Higher likelihood to win when amount went down significantly",
            "trend": "POS"
        },
        {
            "formatString": "AMOUNT_DECREASES_CONSTANTLY_P",
            "formatStringOutput": "Higher likelihood to win when amount keeps going down",
            "trend": "POS"
        },
        {
            "formatString": "AMOUNT_INCREASES_CONSTANTLY_P",
            "formatStringOutput": "Higher likelihood to win when amount keeps going up",
            "trend": "POS"
        },
        {
            "formatString": "DEAL_RIGHT_ON_TIME",
            "formatStringOutput": "Right time of year for this deal",
            "trend": "POS"
        },
        {
            "formatString": "OPP_AGING_P",
            "formatStringOutput": "Higher likelihood to win when deals take longer",
            "trend": "POS"
        },
        {
            "formatString": "ACCOUNT_PAST_WIN",
            "formatStringOutput": "Past wins with accounts",
            "trend": "POS"
        },
        {
            "formatString": "LEAD_SOURCE_HIGH_SUCCESS",
            "formatStringOutput": "High success rate from this lead source compared to other sources",
            "trend": "POS"
        },
        {
            "formatString": "OPP_TYPE_HIGH_SUCCESS",
            "formatStringOutput": "High success rate for opportunity type compared to other types",
            "trend": "POS"
        },
        {
            "formatString": "INDUSTRY_HIGH_SUCCESS",
            "formatStringOutput": "High success rate from this industry compared to other industries",
            "trend": "POS"
        },
        {
            "formatString": "CURR_STAGE_HIGH_SUCCESS",
            "formatStringOutput": "High success rate for opportunities reaching this stage compared to other stages",
            "trend": "POS"
        },
        {
            "formatString": "DEAL_STAGES_MOVING_FAST",
            "formatStringOutput": "Deal moving quickly through stages",
            "trend": "POS"
        },
        {
            "formatString": "DEAL_PREV_STAGE_MOVING_FAST",
            "formatStringOutput": "Previous stage completed quickly",
            "trend": "POS"
        },
        {
            "formatString": "CLOSE_DATE_MOVED_UP",
            "formatStringOutput": "Close date moved up",
            "trend": "POS"
        },
        {
            "formatString": "CLOSE_DATE_DELAYED_P",
            "formatStringOutput": "You are more likely to win when the close date is delayed",
            "trend": "POS"
        },
        {
            "formatString": "CLOSE_DATE_MOVES_UP_CONSTANTLY",
            "formatStringOutput": "Close date repeatedly moved up",
            "trend": "POS"
        },
        {
            "formatString": "CLOSE_DATE_DELAYS_CONSTANTLY_P",
            "formatStringOutput": "You are more likely to win when the close date is repeatedly delayed",
            "trend": "POS"
        },
        {
            "formatString": "CLOSE_DATE_OVERDUE_P",
            "formatStringOutput": "You are more likely to win when the close date overdue",
            "trend": "POS"
        },
        {
            "formatString": "CURR_FORECAST_CATEGORY_HIGH_SUCCESS",
            "formatStringOutput": "High success rate for opportunities reaching this forecast category compared to other stages",
            "trend": "POS"
        },
        {
            "formatString": "HIGH_ACTIVITY",
            "formatStringOutput": "Lots of activity in this opportunity",
            "trend": "POS"
        },
        {
            "formatString": "FUTURE_ACTIVITY",
            "formatStringOutput": "Future activity exists",
            "trend": "POS"
        },
        {
            "formatString": "INSIGHT_RE_ENGAGED",
            "formatStringOutput": "Re-engaged opportunity",
            "trend": "POS"
        },
        {
            "formatString": "PRODUCT_HIGH_SUCCESS",
            "formatStringOutput": "High success rate for this product compared to your other products",
            "trend": "POS"
        }
    ],
    filterReasons : function(component) {
        let confidence = component.find('confidence').get('v.value');
        let filterString = confidence.includes('POS') ? 'POS' : 'NEG';
        let opportunityReasons = this.opportunityReasons;
        let reasonOptions = opportunityReasons.filter( function(reason){
            return reason.trend === filterString;
        })
        
        component.set('v.reasonOptions', reasonOptions);
    }
})