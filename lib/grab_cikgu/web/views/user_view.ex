defmodule GrabCikgu.Web.UserView do 
	use GrabCikgu.Web, :view
	alias GrabCikgu.Account.User

	def first_name(%user{name: name}) do
		name
		|>String.split(" ")
		|>Enum.at(0)
	end

	def username(%user{username: username}) do
		username
		|>String.split(" ")
		|>Enum.at(0)
	end

end