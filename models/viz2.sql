{{ config(
	type='table', 
	dimensions=[1],
	title='Bigfoot Sightings',
    sortable=true,
    searchable=true,
    download_csv=true
)}}

-- test
SELECT sightings.state, sightings.season, ss.humidity, ss.moon_phase as moon, ss.wind_speed as wind
FROM `hashpath-demo-data.hashpath_dataset.bigfoot_sightings_ts` sightings
LEFT JOIN {{ ref('viz1') }} ss on ss.geohash = sightings.geohash 
WHERE sightings.state='{{ filter('state') }}'

{{ column_settings(
    name='moon',
    html='<a-tag>[[ rendered ]]</a-tag>'
)}}