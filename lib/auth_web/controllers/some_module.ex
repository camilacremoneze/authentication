defmodule AuthWeb.Controller.SomeModule do
  use AuthWeb, :controller

  def some_func(conn, _params) do
    send_resp(conn, 200, "ok")
  end
end
