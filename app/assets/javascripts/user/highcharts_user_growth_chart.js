var date = new Date();
var firstDayOfMonth = Date.UTC(date.getFullYear(), date.getMonth(), 1);

function userGrowthChart (data) {
  Highcharts.chart('user-growth', {
    title: {
      text: ''
    },
    xAxis: {
      type: 'datetime'
    },
    yAxis: {
      title: {
	text: 'Users'
      },
      min: 0
    },
    legend: {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle'
    },
    plotOptions: {
      series: {
	showInLegend: false,
	label: {
	  connectorAllowed: false
	}
      }
    },
    series: data,
    responsive: {
      rules: [{
	condition: {
	  maxWidth: 500
	},
	chartOptions: {
	  legend: {
	    layout: 'horizontal',
	    align: 'center',
	    verticalAlign: 'bottom'
	  }
	}
      }]
    }
  });
}
$(document).ready(function() {
  $.ajax({
    url: '/user_growth_json_data',
    type: 'GET',
    async: true,
    dataType: "json",
    success: function (data) {
      userGrowthChart(data);
    }
  });
});
