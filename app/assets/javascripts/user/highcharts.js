(function() {
  Highcharts.setOptions({
    global: {
      useUTC: false
    }
  });

  // Draw success rate chart
  Highcharts.chart('success-rate-chart', {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie',
      // height: 200,
      // width: 400
    },
    title: {
      text: null
    },
    credits: {
      enabled: false
    },
    exporting: {
      enabled: false
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        colors: ['#11ff11', '#ff1111'],
        dataLabels: {
          enabled: true
        }
      }
    },
    series: [{
      name: 'Biometric Auth',
      colorByPoint: true,
      data: [{
        name: 'Success',
        y: 95,
        selected: true,
        sliced: true
      }, {
        name: 'Failure',
        y: 5
      }]
    }]
  });

  // Draw top applications chart
  var charts = [],
    $containers = $('#top-apps'),
    datasets = [{
      // name: '# of Users',
      data: [1000, 2000]
    }];


  $.each(datasets, function(i, dataset) {
    charts.push(new Highcharts.Chart({

      chart: {
        renderTo: $containers[i],
        type: 'bar',
        marginLeft: i === 0 ? 100 : 10
      },

      title: {
        text: dataset.name,
        align: 'left',
        x: i === 0 ? 90 : 0
      },

      credits: {
        enabled: false
      },

      xAxis: {
        categories: ['Web Application', 'Mobile Application'],
        labels: {
          enabled: i === 0
        }
      },

      yAxis: {
        allowDecimals: false,
        title: {
          text: null
        },
        min: 0,
        max: 10000
      },


      legend: {
        enabled: false
      },

      series: [dataset]

    }));
  });

  Highcharts.chart('user-growth', {
    title: {
      text: ''
    },
    yAxis: {
      title: {
        text: 'Users'
      }
    },
    legend: {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle'
    },
    plotOptions: {
      series: {
        label: {
          connectorAllowed: false
        },
        pointStart: 2010
      }
    },
    series: [{
      name: 'App 1',
      data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
    }, {
      name: 'App 2',
      data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
    }],
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
})();