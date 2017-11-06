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
    post "/search", SearchController, :index
    get "/tutors", TutorController, :index
  end

  scope "/manage", GrabCikgu.Web do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
    resources "/profiles", ProfileController
    resources "/requests", RequestController
    resources "/classes", ClassController
    get "/profile", ProfileController, :show_profile
    get "/profile/edit", ProfileController, :edit_profile
    put "/profile/update", ProfileController, :update_profile
    get "/profile/student/edit", StudentProfileController, :edit_profile
    put "/profile/student/update", StudentProfileController, :update_profile

  end

  # Other scopes may use custom stacks.
  # scope "/api", GrabCikgu.Web do
  #   pipe_through :api
  # end
end
