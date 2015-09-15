class UsersController < ApplicationController

  def index
    if User.nil?
      render text: 'no users', status: 404
    else
      user_array = []
      User.all.each do |n|
        user_array << n.id.to_s + " " + n.full_name + " " + n.age.to_s
      end
    render text: "#{user_array.join(" ")}", status: 200
    end
  end

  def show
    begin
      user = User.find(params[:id])
      render text: "#{user.id} #{user.full_name} #{user.age}", status: 200
    rescue ActiveRecord::RecordNotFound
      render text: "Sorry, user with id of #{params[:id]} was not found.", status: 404
    end
  end
end
