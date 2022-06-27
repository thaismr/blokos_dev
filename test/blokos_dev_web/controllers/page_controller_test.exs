defmodule BlokosDevWeb.PageControllerTest do
  use BlokosDevWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Blokos · Dev"
  end
end
