import backend/utils.{json_200, json_400, json_404, parse_float}
import gleam/json
import gleam/string
import providers/openmeteo
import wisp.{type Request, type Response}

pub fn handle_request(req: Request) -> Response {
  case wisp.path_segments(req) {
    [] -> home(req)
    ["lat", lat_str, "lon", lon_str] ->
      case parse_float(lat_str), parse_float(lon_str) {
        Ok(lat), Ok(lon) -> {
          let forecast = openmeteo.fetch_data(lat, lon)

          json_200([
            #("response", json.string(string.inspect(forecast))),
          ])
        }
        _, _ ->
          json_400([
            #("msg", json.string("both lat and lon should be floats")),
          ])
      }
    _ ->
      json_404([
        #("msg", json.string("not found")),
      ])
  }
}

fn home(_req: Request) -> Response {
  wisp.ok()
  |> wisp.json_body(json.to_string(json.object([])))
}
