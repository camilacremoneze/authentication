defmodule AuthWeb.Plug.BasicAuthTest do
  use AuthWeb.ConnCase
  alias AuthWeb.Plug.BasicAuth

  test "it authorizes api requests if token match" do
    basic_token = "Basic " <> Base.encode64("some_user:password")

    conn =
      build_conn(:get, "/")
      |> put_req_header("authorization", basic_token)
      |> BasicAuth.call(:api_basic)

    refute conn.halted
    assert conn
  end

  test "it halts with 401 if token does not match" do
    conn =
      build_conn(:get, "/")
      |> put_req_header("authorization", "Basic invalid")
      |> BasicAuth.call(:api_basic)

    assert conn.halted
    assert conn.status == 401
  end
end
