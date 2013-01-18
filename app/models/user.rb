class User < ActiveRecord::Base
  attr_accessible :username

  has_many :profiles

  def serializable_hash(options={})
    options ||= {}
    options = {
      :include => [:profiles]
    }.update(options)

    super(options)
  end
end
