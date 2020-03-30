defmodule AuthWeb.Controller.SomeModuleTest do
  use AuthWeb.ConnCase
  alias AuthWeb.Controller.SomeModule

  test "it returns sucess to any request", %{conn: conn} do
    response = SomeModule.some_func(conn, "")
    assert 200 === response.status
  end
end
