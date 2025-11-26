import gleam/bytes_tree
import gleam/erlang/process
import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import gleam/io
import mist.{type Connection, type ResponseData}

pub fn main() -> Nil {
  io.println("Starting web server...")

  let assert Ok(_) =
    request_handler
    |> mist.new
    |> mist.port(8080)
    |> mist.start()

  process.sleep_forever()
}

pub fn request_handler(req: Request(Connection)) -> Response(ResponseData) {
  case request.path_segments(req) {
    [] ->
      response.new(200)
      |> response.set_body(mist.Bytes(bytes_tree.from_string("hello world")))
    _ ->
      response.new(404)
      |> response.set_body(
        mist.Bytes(bytes_tree.from_string("not found too bad")),
      )
  }
}
