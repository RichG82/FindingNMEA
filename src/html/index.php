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
		<div class="col-md-8 main-panel" id="chart-panel">
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
    <script src="/bower_components/plotlyjs/plotly.js"></script>

<script>
	TESTER = document.getElementById('chart-panel');
	Plotly.plot( TESTER, [{
	x: [1, 3, 3, 4, 5],
	y: [1, 2, 4, 8, 16] }], {
	margin: { t: 0 } } );
</script>

  </body>
</html>