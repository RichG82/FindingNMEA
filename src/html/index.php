<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Finding NMEA</title>

    <link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">

</head>
  <body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 main-panel">
            <canvas id="myChart" width="400" height="400"></canvas>
		</div>
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-12 side-top-right">
                    
                    <div class="row">
                        <div class="col-md-12">
                            <select>
                                <option>Item 1</option>
                                <option>Item 2</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 metric-value">
                            12mph
                        </div>
                    </div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 side-middle-right">
                    <div class="row">
                        <div class="col-md-12">
                            <select>
                                <option>Item 1</option>
                                <option>Item 2</option>
                            </select>
                        </div>
                    <div class="row">
                        <div class="col-md-12 metric-value">
                            12mph
                        </div>
                    </div>                        
                    </div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 side-bottom-right">
                    <div class="row">
                        <div class="col-md-12">
                            <select>
                                <option>Item 1</option>
                                <option>Item 2</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 metric-value">
                            12mph
                        </div>
                    </div>                    
				</div>
			</div>
		</div>
	</div>
</div>

    <!-- Including Bootstrap JS (with its jQuery dependency) so that dynamic components work -->
    <script src="/bower_components/jquery/dist/jquery.slim.min.js"></script>
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/bower_components/chart.js/dist/Chart.bundle.min.js"></script>

<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["Red"],
        datasets: [{
            label: '# of Votes',
            data: [1,2,3,4,5, 19, 3, 5, 2, 3],
            backgroundColor: ['rgba(255, 99, 132, 0.2)'],
            borderColor: ['rgba(255,99,132,1)'],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
  </body>
</html>