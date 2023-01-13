defmodule PoopLogWeb.PoopControllerTest do
  use PoopLogWeb.ConnCase

  import PoopLog.LogsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all poops", %{conn: conn} do
      conn = get(conn, Routes.poop_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Poops"
    end
  end

  describe "new poop" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.poop_path(conn, :new))
      assert html_response(conn, 200) =~ "New Poop"
    end
  end

  describe "create poop" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.poop_path(conn, :create), poop: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.poop_path(conn, :show, id)

      conn = get(conn, Routes.poop_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Poop"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.poop_path(conn, :create), poop: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Poop"
    end
  end

  describe "edit poop" do
    setup [:create_poop]

    test "renders form for editing chosen poop", %{conn: conn, poop: poop} do
      conn = get(conn, Routes.poop_path(conn, :edit, poop))
      assert html_response(conn, 200) =~ "Edit Poop"
    end
  end

  describe "update poop" do
    setup [:create_poop]

    test "redirects when data is valid", %{conn: conn, poop: poop} do
      conn = put(conn, Routes.poop_path(conn, :update, poop), poop: @update_attrs)
      assert redirected_to(conn) == Routes.poop_path(conn, :show, poop)

      conn = get(conn, Routes.poop_path(conn, :show, poop))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, poop: poop} do
      conn = put(conn, Routes.poop_path(conn, :update, poop), poop: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Poop"
    end
  end

  describe "delete poop" do
    setup [:create_poop]

    test "deletes chosen poop", %{conn: conn, poop: poop} do
      conn = delete(conn, Routes.poop_path(conn, :delete, poop))
      assert redirected_to(conn) == Routes.poop_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.poop_path(conn, :show, poop))
      end
    end
  end

  defp create_poop(_) do
    poop = poop_fixture()
    %{poop: poop}
  end
end
