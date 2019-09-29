class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  belongs_to :author

  before_validation :bind_author

  enum role: %i[admin professor student]

  def type=(_)
    nil
  end

  private
  def bind_author
    if self.author.nil?
      aux = Author.where('name = ? or email = ?', name, email)
      self.author = aux.present? ? aux.first : Author.new(name: name, email: email)
    else
      author.name = name if name != author.name
      author.email = email if email != author.email
    end
  end
end
