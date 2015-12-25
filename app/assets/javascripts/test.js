$(function () {
    $('#container').highcharts({
        title: {
            text: 'Bicycle Traffic on the Fremont Bridge, 2014',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: data.seattle.gov',
            x: -20
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Number of Cyclists'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ' commuters'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Fremont Bridge East Path',
            data: [566, 456, 546, 567, 678, 567, 567, 789, 765, 789, 567, 456]
        }, {
            name: 'Fremont Bridge West Path',
            data: [456, 356, 412, 563, 453, 615, 612, 768, 612, 589, 540, 430]

        }]
    });
});