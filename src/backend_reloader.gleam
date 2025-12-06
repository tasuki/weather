import backend/server
import radiate

pub fn main() -> Nil {
  let _ =
    radiate.new()
    |> radiate.add_dir("src")
    |> radiate.start()

  server.serve()
}
