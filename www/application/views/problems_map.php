<html lang="en">
        <?php include Kohana::find_file("views","header");?>
    <body>
        <?php include Kohana::find_file("views","header_menu");?>

			<div class="main-bg">
				<div data-lat="<?php echo $city->latitude?>" data-lng="<?php echo $city->longitude?>" class="main" data-auto-controller="MapController" >	 
					<section id="content" style="height: 500px;">

					</section> 
				</div>
				<script type="text/javascript">
					
					var coords = [];

					$(function(){
					window.initialize()
					

				    <?php foreach ($city->districts as $kd => $district): ?>
				        coords[<?php echo $kd?>] = [
				        <?php foreach (geometry::render($district->the_geom, 'polygon') as $key => $geom): ?>
				        <?php if ($key) echo ",";?>new google.maps.LatLng(<?php echo $geom[1].','.$geom[0];?>)
				        <?php endforeach ?>
				        ];

				        districts[<?php echo $kd?>] = new google.maps.Polygon({
				            paths: coords[<?php echo $kd?>],
				            strokeColor: "#<?php echo $district->color?>",
				            strokeOpacity: 0.7,
				            strokeWeight: 1,
				            fillColor: "#<?php echo $district->color?>",
				            fillOpacity: 0.25,
				            title: "<?php echo $district->name?>",
				            zoom: "<?php echo $district->zoom?>",
				            lat: "<?php echo $district->latitude?>",
				            lon: "<?php echo $district->longitude?>",
				            district_id: "<?php echo $district->id?>"
				        });

				        districts[<?php echo $kd?>].setMap(window.G_map);


				        google.maps.event.addListener(districts[<?php echo $kd?>], 'mouseover', function() {
				            districts[<?php echo $kd?>].setOptions({
				                fillOpacity:0.1,
				                strokeOpacity:0.4
				            });
				        });

				        google.maps.event.addListener(districts[<?php echo $kd?>], 'mouseout', function() {
				            districts[<?php echo $kd?>].setOptions({
				                fillOpacity:0.25,
				                strokeOpacity:0.7
				            });
				        });

				        google.maps.event.addListener(districts[<?php echo $kd?>], 'click', showDistrict/*function(){
				        	showDistrict(<?php echo $district->id?>)
				        }*/);
				        google.maps.event.addListener(window.G_map, 'zoom_changed', function(){
				            var currentZoom = window.G_map.getZoom();
				            if (currentZoom < 11) {
				                showDistricts();
				            }
				        });
	
				    <?php endforeach ?>
				});

				</script>
			</div>

        <?php include Kohana::find_file("views","footer");?>
         

    </body>
</html>