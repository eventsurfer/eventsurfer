# frozen_string_literal: true



class User < ApplicationRecord
  ##
  # Model for User



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  enum role: [:costumer, :employer]
  # def send_devise_notification(notification, *args)
  #  devise_mailer.send(notification, self, *args).deliver_later
  # end
end
