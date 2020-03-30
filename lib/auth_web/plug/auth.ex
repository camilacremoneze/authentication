defmodule AuthWeb.Plug.Auth do
  import Plug.Conn

  alias Plug.Crypto

  def init(default), do: default

  def call(conn, _params) do
    conn
    |> get_req_header("authorization")
    |> authorized?(conn)
  end

  defp authorized?([], conn) do
    conn
    |> send_resp(401, "unauthorized")
    |> halt
  end

  defp authorized?([token], conn) do
    authorized_token = "some_token"

    if Crypto.secure_compare(authorized_token, token) do
      conn
    else
      authorized?([], conn)
    end
  end
end
