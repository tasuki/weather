import backend/router
import envoy
import gleam/erlang/process
import mist
import wisp/wisp_mist

pub fn serve() -> Nil {
  let assert Ok(secret_key_base) = envoy.get("SECRET_KEY_BASE")

  let assert Ok(_) =
    wisp_mist.handler(router.handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8080)
    |> mist.start()

  process.sleep_forever()
}
