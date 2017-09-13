defmodule GrabCikgu.Web.Router do
  use GrabCikgu.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug GrabCikgu.Web.Auth, repo: GrabCikgu.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GrabCikgu.Web do
    pipe_through :browser # Use the default browser stack

    get "/hello/:name", HelloController, :world
    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/videos", VideoController

  end

  scope "/manage", GrabCikgu.Web do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
    resources "/profiles", ProfileController
  end

  # Other scopes may use custom stacks.
  # scope "/api", GrabCikgu.Web do
  #   pipe_through :api
  # end
end
