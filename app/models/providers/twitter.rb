class Providers::Twitter < Provider

  def self.entry(params = {})
    provider = self.find_by uid: params[:uid]
    return provider if provider.present?

    # uidで見つからなかったら新規登録
    ActiveRecord::Base.transaction do
      user = User.create!(
        name: params[:info][:nickname],
        icon: params[:info][:image]
      )
      provider = self.create!(
        user: user,
        uid: params[:uid]
      )
    end
    return provider
  end
end
