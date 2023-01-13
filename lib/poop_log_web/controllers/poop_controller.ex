defmodule PoopLogWeb.PoopController do
  use PoopLogWeb, :controller

  alias PoopLog.Logs
  alias PoopLog.Logs.Poop

  def index(conn, _params) do
    poops = Logs.list_poops()
    render(conn, "index.html", poops: poops)
  end

  def new(conn, _params) do
    changeset = Logs.change_poop(%Poop{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"poop" => poop_params}) do
    case Logs.create_poop(poop_params) do
      {:ok, poop} ->
        conn
        |> put_flash(:info, "Poop created successfully.")
        |> redirect(to: Routes.poop_path(conn, :show, poop))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    poop = Logs.get_poop!(id)
    render(conn, "show.html", poop: poop)
  end

  def edit(conn, %{"id" => id}) do
    poop = Logs.get_poop!(id)
    changeset = Logs.change_poop(poop)
    render(conn, "edit.html", poop: poop, changeset: changeset)
  end

  def update(conn, %{"id" => id, "poop" => poop_params}) do
    poop = Logs.get_poop!(id)

    case Logs.update_poop(poop, poop_params) do
      {:ok, poop} ->
        conn
        |> put_flash(:info, "Poop updated successfully.")
        |> redirect(to: Routes.poop_path(conn, :show, poop))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", poop: poop, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poop = Logs.get_poop!(id)
    {:ok, _poop} = Logs.delete_poop(poop)

    conn
    |> put_flash(:info, "Poop deleted successfully.")
    |> redirect(to: Routes.poop_path(conn, :index))
  end
end
