class Material < ActiveRecord::Base
  has_and_belongs_to_many :users

  before_validation :clean_body

  validates :title,
    presence: true

  validates :body,
    presence: true

  protected

  def clean_body
    self.body = Sanitize.fragment(self.body,
     :elements => ['b', 'i', 'u', 'p', 'span', 'strong', 'strike', 'em', 'ol', 'li', 'ul', 'a', 'img', 'style'],
     :attributes => {'div' => ['style'], 'a' => ['href']},
     :css => { :properties => ['color']
    })
  end

end
