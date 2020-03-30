defmodule AuthWeb.Plug.BasicAuth do
  import Plug.Conn

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
    authorized_token = "Basic " <> Base.encode64("some_user:password")

    if String.equivalent?(authorized_token, token) do
      conn
    else
      authorized?([], conn)
    end
  end
end
