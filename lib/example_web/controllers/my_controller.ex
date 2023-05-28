defmodule ExampleWeb.MyController do
  use ExampleWeb, :controller

  # example path: /my_get_endpoint?my_query_param=foo
  def my_get_endpoint(conn, %{"my_query_param" => my_query_param}) do
    csrf_token = Phoenix.Controller.get_csrf_token()
    render(conn, :my_form, my_query_param: my_query_param, csrf_token: csrf_token)
  end

  # if the params don't have the "my_query_param" key inside, redirect to root path
  def my_get_endpoint(conn, _params) do
    redirect(conn, to: "/")
  end

  def my_post_endpoint(conn, params) do
    # here params should contain the key "my_hidden_input"
    # (along with "_csrf_token", which Phoenix verifies automatically for us)
    text(conn, "received params from form submit: #{inspect(params, pretty: true)}")
  end
end
