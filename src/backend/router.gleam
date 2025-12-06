import gleam/json
import utils.{json_200, json_400, json_404, parse_float}
import wisp.{type Request, type Response}

pub fn handle_request(req: Request) -> Response {
  case wisp.path_segments(req) {
    [] -> home(req)
    ["lat", lat_str, "lon", lon_str] ->
      case parse_float(lat_str), parse_float(lon_str) {
        Ok(lat), Ok(lon) ->
          json_200([
            #("lat", json.float(lat)),
            #("lon", json.float(lon)),
          ])
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
