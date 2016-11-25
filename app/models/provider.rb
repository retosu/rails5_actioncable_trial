class Provider < ActiveRecord::Base
  belongs_to :user

  def self.entry(params = {})
    "Providers::#{params[:provider].camelize}".constantize.entry(params)
  end
end
