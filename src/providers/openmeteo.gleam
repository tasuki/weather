import gleam/float
import gleam/http/request
import gleam/httpc
import gleam/option.{None, Some}
import gleam/result
import gleam/string
import gleam/uri.{type Uri}

pub fn fetch_data(lat: Float, lon: Float) -> Result(String, String) {
  let url = build_api_url(lat, lon)

  use req <- result.try(
    request.from_uri(url)
    |> result.map_error(fn(_) { "Invalid URI" }),
  )

  use resp <- result.try(
    httpc.send(req)
    |> result.map_error(fn(e) { "HTTP Error: " <> string.inspect(e) }),
  )

  Ok(resp.body)
}

fn build_api_url(lat: Float, lon: Float) -> Uri {
  uri.Uri(
    scheme: Some("https"),
    userinfo: None,
    host: Some("api.open-meteo.com"),
    port: Some(80),
    path: "v1/forecast",
    query: Some(
      uri.query_to_string([
        #("latitude", float.to_string(lat)),
        #("longitude", float.to_string(lon)),
        #("daily", "sunrise,sunset"),
        #(
          "hourly",
          string.join(
            [
              "temperature_2m",
              "relative_humidity_2m",
              "dew_point_2m",
              "apparent_temperature",
              "precipitation_probability",
              "precipitation",
              "rain",
              "showers",
              "snowfall",
              "snow_depth",
              "weather_code",
              "pressure_msl",
              "surface_pressure",
              "cloud_cover_low",
              "cloud_cover_mid",
              "cloud_cover_high",
              "visibility",
              "evapotranspiration",
              "et0_fao_evapotranspiration",
              "wind_speed_10m",
              "wind_gusts_10m",
              "cloud_cover",
              "vapour_pressure_deficit",
            ],
            ",",
          ),
        ),
        #("timezone", "auto"),
        #("past_days", "1"),
        #("wind_speed_unit", "ms"),
        #("forecast_hours", "24"),
        #("past_hours", "6"),
        #("temporal_resolution", "hourly_6"),
      ]),
    ),
    fragment: None,
  )
}
