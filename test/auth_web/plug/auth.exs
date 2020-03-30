defmodule AuthWeb.Plug.AuthTest do
  use AuthWeb.ConnCase
  alias AuthWeb.Plug.Auth

  test "it authorizes api requests if token match" do
    conn =
      build_conn(:get, "/")
      |> put_req_header("authorization", "some_token")
      |> Auth.call(:api_tok)

    refute conn.halted
    assert conn
  end

  test "it halts with 401 if token does not match" do
    conn =
      build_conn(:get, "/")
      |> put_req_header("authorization", "invalid")
      |> Auth.call(:api_tok)

    assert conn.halted
    assert conn.status == 401
  end
end
