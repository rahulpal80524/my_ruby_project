class Product < ApplicationRecord
  belongs_to :user

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Before callbacks
  before_validation :before_validation_callback
  before_validation :another_before_validation_callback

  before_save :before_save_callback
  before_create :before_create_callback
  before_update :before_update_callback
  before_destroy :before_destroy_callback

  # After callbacks
  after_validation :after_validation_callback
  after_save :after_save_callback
  after_create :after_create_callback
  after_update :after_update_callback
  after_destroy :after_destroy_callback

  # Around callbacks
  around_create :around_create_callback
  around_update :around_update_callback
  around_destroy :around_destroy_callback

  # Custom callback methods
  def before_validation_callback
    puts 'Before validation callback'
  end

  def another_before_validation_callback
    puts 'Another before validation callback'
  end

  def before_save_callback
    puts 'Before save callback'
  end

  def before_create_callback
    puts 'Before create callback'
  end

  def before_update_callback
    puts 'Before update callback'
  end

  def before_destroy_callback
    puts 'Before destroy callback'
  end

  def after_validation_callback
    puts 'After validation callback'
  end

  def after_save_callback
    puts 'After save callback'
  end

  def after_create_callback
    puts 'After create callback'
  end

  def after_update_callback
    puts 'After update callback'
  end

  def after_destroy_callback
    puts 'After destroy callback'
  end

  def around_create_callback
    puts 'Around create callback (before yield)'
    yield
    puts 'Around create callback (after yield)'
  end

  def around_update_callback
    puts 'Around update callback (before yield)'
    yield
    puts 'Around update callback (after yield)'
  end

  def around_destroy_callback
    puts 'Around destroy callback (before yield)'
    yield
    puts 'Around destroy callback (after yield)'
  end
end
