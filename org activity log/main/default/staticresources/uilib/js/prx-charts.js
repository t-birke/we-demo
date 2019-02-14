jQuery(document).ready(function() {
    PrX.initChartButtons();
    PrX.initChart();
    
    jQuery(window).on('debouncedresize', function() {
	    PrX.initChart()
	});
});

PrX.initChartButtons = function() {
    // chart type/subject buttons 
    jQuery('#prx_ul_chart_subject a').each(function() {
        var $thisA = jQuery(this);
        $thisA.on('click', function() {
            jQuery('#prx_ul_chart_subject li').each(function() {
                jQuery(this).removeClass('prx-selected');
            });
            var $clickedA = jQuery(this);
            var $clickedLi = $clickedA.closest('li');
            $clickedLi.addClass('prx-selected');
            PrX.emptyChart();
        });
    });
    // chart interval buttons 
    jQuery('#chart_interval a').each(function() {
        var $thisA = jQuery(this);
        $thisA.on('click', function() {
            jQuery('#chart_interval a').each(function() {
                jQuery(this).removeClass('prx-btn-selected');
            });
            var $clickedA = jQuery(this);
            $clickedA.addClass('prx-btn-selected');
            // when we change the interval, we will start at today's date again
            jQuery('#analytics_charts_top_controls').attr('data-chart-start','0');
            jQuery('#analytics_charts_top_controls a.prx-btn-next').addClass('prx-btn-disabled');
            PrX.emptyChart();
        });
    });
    // chart prev next buttons 
    jQuery('#analytics_charts_top_controls a.prx-btn-prev').on('click',function() {
        jQuery('#analytics_charts_top_controls a.prx-btn-next').removeClass('prx-btn-disabled');
        var currentChartStart = parseFloat(jQuery('#analytics_charts_top_controls').attr('data-chart-start'));
        var newChartStart = currentChartStart-1;
        jQuery('#analytics_charts_top_controls').attr('data-chart-start',newChartStart);
        PrX.emptyChart();
    });
    jQuery('#analytics_charts_top_controls a.prx-btn-next').on('click',function() {
        var currentChartStart = parseFloat(jQuery('#analytics_charts_top_controls').attr('data-chart-start'));
        if (currentChartStart >= 0) {
            jQuery('#analytics_charts_top_controls').attr('data-chart-start','0');
            if (!jQuery(this).hasClass('prx-btn-disabled')) {
                jQuery(this).addClass('prx-btn-disabled');
            }
        }
        else {
            var newChartStart = currentChartStart+1;
            if (newChartStart >= 0) {
                newChartStart = 0;
                jQuery(this).addClass('prx-btn-disabled');
            }
            jQuery('#analytics_charts_top_controls').attr('data-chart-start',newChartStart);
        }
        PrX.emptyChart();
    });
};

PrX.initChart = function() {
    PrX.emptyChart();
    PrX.initCreateChart();
};

PrX.emptyChart = function() {
    // emptying out the chart region and adding a spinner
    jQuery('#analytics_charts').html('<div class="prx-loading"></div>');
    // emptying out the chart title (y-axis)
    jQuery('#analytics_charts_top_title').html('');
};

PrX.initCreateChart = function() {
    // the next function is on the page
    if (typeof(PrX.createChart) === 'function') {
        PrX.createChart();
    }
};

PrX.chartSubject = function() {
    var chartSubject = '';
    jQuery('#prx_ul_chart_subject li').each(function() {
        var $thisLi = jQuery(this);
        if ($thisLi.hasClass('prx-selected')) {
            chartSubject = $thisLi.attr('id');
        }
    });
    // if none were in selected state: find the first li and add the selected class name and make that the subject 
    if (chartSubject === '') {
        var $firstLi = jQuery('#prx_ul_chart_subject li:first');
        if ($firstLi !== undefined) {
            $firstLi.addClass('prx-selected');
            chartSubject = $firstLi.attr('id');
        }
    }
    return chartSubject;
};

PrX.chartInterval = function() {
    var chartInterval = '';
    jQuery('#chart_interval a').each(function() {
        var $thisA = jQuery(this);
        if ($thisA.hasClass('prx-btn-selected')) {
            chartInterval = $thisA.attr('id');
        }
    });
    // if none were in selected state: find the first li and add the selected class name and make that the subject 
    if (chartInterval === '') {
        var $firstA = jQuery('#chart_interval a:first');
        if ($firstA !== undefined) {
            $firstA.addClass('prx-btn-selected');
            chartInterval = $firstA.attr('id');
        }
    }
    return chartInterval;
};

var analyticsChart;

/**
 * chartType: The type of chart to render: line, area, bar, or donut.
 * element: ID of the element in which to draw the chart.
 * xkey: The name of the data record attribute that contains x-values. 
 * ykeys: A list of names of data record attributes that contain y-values. 
 * labels: Labels for the ykeys -- will be displayed when you hover over the chart. 
 * 
 */
PrX.plotChart = function(chartType, element, data, xkey, ykeys, labels, chartInterval) {
    // emptying out the chart region 
    jQuery('#analytics_charts').html('');
    // setting the chart title (y-axis)
    var chartTitle = jQuery('ul#prx_ul_chart_subject li.prx-selected span.prx-analytics-text').html();
    
    jQuery('#analytics_charts_top_title').html(chartTitle);
    labels = [chartTitle];
    
    var format = 'mmm d yyyy';
    if (chartInterval === 'chart_interval_year') {
        format = 'mmm yyyy';
    }
    var chartOptions;
    
    if (chartType === 'donut') {
        chartOptions = {
                element: element,
                data: data,
                colors: ['#2A94D6','#344A5F','#999'],
                formatter: function (y, data) { return y + ' apps' }
        }
    }
    else {
        chartOptions = {
                element: element,
                xkey: xkey,
                ykeys: ykeys,
                labels: labels,
                data: data,
                hideHover: true,
                grid: true,
                continuousLine: false,
                lineWidth: 1,
                xLabelFormat: function(x) { return PrX.formatDate(x,'short',format) },
                hoverCallback: function(index, options, content) {
                    var row = options.data[index];
                    var d = row.date.split("-");
                    var newDate = new Date(d[0],(d[1]-1),d[2]);
                    
                    var rowTop = '';
                    if (row.value !== null) {
                        rowTop = '<div class="morris-hover-row-label"><span class="morris-hover-row-value">' + row.value + '</span> ' + chartTitle + '</div>';
                    }
                    var rowBottom = '<div class="morris-hover-point">' + PrX.formatDay(newDate) + ', ' + PrX.formatDate(newDate,'long') + '</div>';
                    if (chartInterval === 'chart_interval_year') {
                        var rowBottom = '<div class="morris-hover-point">' + PrX.formatDate(newDate,'long',format) + '</div>';
                    }
                    return rowTop + rowBottom;
                }
        };
    }
  
    if (chartType === 'line' || chartType === 'area' ) {
        chartOptions.smooth = true;
        chartOptions.fillOpacity = 0.2;
        chartOptions.lineColors = ['#0085cb'];
        
        if (chartType === 'line') {
            analyticsChart = Morris.Line(chartOptions);
        }
        else if (chartType === 'area') {
            analyticsChart = Morris.Area(chartOptions);
        }
    }
    else if (chartType === 'bar') {
        chartOptions.barColors = ['#0085cb'];
        analyticsChart = Morris.Bar(chartOptions);
    }
    else if (chartType === 'donut') {
        analyticsChart = Morris.Donut(chartOptions);
    }
};

PrX.setChartData = function() {
    analyticsChart.setData(data);
};

// user's locale 
PrX.locale = $('#userLocale').val();
		        
PrX.createChart = function(element, xkey, ykeys, labels) {
    // creating the chart elements 
    var element = 'analytics_charts';
    // what chart to create? 
    var chartSubject = PrX.chartSubject();
    // what chart interval to create? 
    var chartInterval = PrX.chartInterval();
    // what is the starting point to calculate back from 
    var chartStartTime = jQuery('#analytics_charts_top_controls').attr('data-chart-start');
    // chart settings
    var xkey = 'date';
    var ykeys = ['value'];
    var labels = ['Value'];
    var chartType = 'area';
    if (chartSubject === 'prx_chart_subject_apps') {
        chartType = 'donut';
    }
    
    var $chartsTop = jQuery('#analytics_charts_top'); 
    if (chartSubject === 'prx_chart_subject_apps') {
        $chartsTop.css('visibility','hidden');
    }
    else {
        $chartsTop.css('visibility','visible');
    }
    
    // creating the chart 
    PrX.plotChart(chartType, element, data, xkey, ykeys, labels, chartInterval);
};