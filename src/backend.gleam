import gleam/erlang/process
import gleam/io
import gleam/json
import mist
import wisp.{type Request, type Response}
import wisp/wisp_mist

pub fn main() -> Nil {
  io.println("Starting web server...")
  let secret_key_base = "TODO get this from .env"

  let assert Ok(_) =
    wisp_mist.handler(handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8080)
    |> mist.start()

  process.sleep_forever()
}

pub fn handle_request(req: Request) -> Response {
  case wisp.path_segments(req) {
    [] -> home_page(req)
    _ ->
      wisp.json_response(
        json.to_string(
          json.object([#("msg", json.string("not found too bad"))]),
        ),
        404,
      )
  }
}

fn home_page(_req: Request) -> Response {
  wisp.ok()
  |> wisp.json_body(json.to_string(json.object([])))
}
