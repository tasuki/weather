import backend/router
import gleam/erlang/process
import mist
import wisp/wisp_mist

pub fn serve() -> Nil {
  let secret_key_base = "TODO get this from .env"

  let assert Ok(_) =
    wisp_mist.handler(router.handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8080)
    |> mist.start()

  process.sleep_forever()
}
