import gleam/json
import wisp.{type Request, type Response}

pub fn handle_request(req: Request) -> Response {
  case wisp.path_segments(req) {
    [] -> home(req)
    _ ->
      wisp.json_response(
        json.to_string(json.object([#("msg", json.string("not found"))])),
        404,
      )
  }
}

fn home(_req: Request) -> Response {
  wisp.ok()
  |> wisp.json_body(json.to_string(json.object([])))
}
