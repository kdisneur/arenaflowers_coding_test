class Dictionary < ActiveRecord::Base
  mount_uploader :file, DictionaryUploader

  validates :file, presence: true
  validates :name, presence: true, uniqueness: true

  scope :imported, -> { where(state: :imported) }
  scope :ongoing,  -> { where(state: :ongoing) }

  state_machine :state, initial: :ongoing do
    event :finalize_import do
      transition ongoing: :imported
    end
  end
end
