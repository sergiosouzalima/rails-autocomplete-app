class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  def last_name
    # how to query:  j = User.first.to_json :methods => :last_name
    return "" if name.nil?
    name.split(" ").last
  end

end
