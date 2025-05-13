defmodule NxDemoWeb.ContextLiveTest do
  use NxDemoWeb.ConnCase

  import Phoenix.LiveViewTest
  import NxDemo.PresentationFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_context(_) do
    context = context_fixture()
    %{context: context}
  end

  describe "Index" do
    setup [:create_context]

    test "lists all context", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/context")

      assert html =~ "Listing Context"
    end

    test "saves new context", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/context")

      assert index_live |> element("a", "New Context") |> render_click() =~
               "New Context"

      assert_patch(index_live, ~p"/context/new")

      assert index_live
             |> form("#context-form", context: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#context-form", context: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/context")

      html = render(index_live)
      assert html =~ "Context created successfully"
    end

    test "updates context in listing", %{conn: conn, context: context} do
      {:ok, index_live, _html} = live(conn, ~p"/context")

      assert index_live |> element("#context-#{context.id} a", "Edit") |> render_click() =~
               "Edit Context"

      assert_patch(index_live, ~p"/context/#{context}/edit")

      assert index_live
             |> form("#context-form", context: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#context-form", context: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/context")

      html = render(index_live)
      assert html =~ "Context updated successfully"
    end

    test "deletes context in listing", %{conn: conn, context: context} do
      {:ok, index_live, _html} = live(conn, ~p"/context")

      assert index_live |> element("#context-#{context.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#context-#{context.id}")
    end
  end

  describe "Show" do
    setup [:create_context]

    test "displays context", %{conn: conn, context: context} do
      {:ok, _show_live, html} = live(conn, ~p"/context/#{context}")

      assert html =~ "Show Context"
    end

    test "updates context within modal", %{conn: conn, context: context} do
      {:ok, show_live, _html} = live(conn, ~p"/context/#{context}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Context"

      assert_patch(show_live, ~p"/context/#{context}/show/edit")

      assert show_live
             |> form("#context-form", context: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#context-form", context: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/context/#{context}")

      html = render(show_live)
      assert html =~ "Context updated successfully"
    end
  end
end
