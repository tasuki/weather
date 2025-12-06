import gleam/float
import gleam/int
import gleam/json.{type Json}
import gleam/result
import wisp.{type Response}

pub fn parse_float(s: String) -> Result(Float, Nil) {
  case float.parse(s) {
    Ok(f) -> Ok(f)
    Error(_) ->
      case int.parse(s) {
        Ok(i) -> Ok(int.to_float(i))
        Error(e) -> Error(e)
      }
  }
  |> result.map(fn(fl) { float.to_precision(fl, 2) })
}

pub type JsonData =
  List(#(String, Json))

pub fn json_response(data: JsonData, response_code: Int) -> Response {
  wisp.json_response(json.to_string(json.object(data)), response_code)
}

pub fn json_200(data: JsonData) -> Response {
  json_response(data, 200)
}

pub fn json_400(data: JsonData) -> Response {
  json_response(data, 400)
}

pub fn json_404(data: JsonData) -> Response {
  json_response(data, 404)
}
