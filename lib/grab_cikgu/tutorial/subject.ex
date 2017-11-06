defmodule GrabCikgu.Tutorial.Subject do
  use GrabCikgu.Web, :model

  schema "subjects" do
    field :name, :string
    field :grade, :string
  end
end
