# frozen_string_literal: true

# app/lib/service/user_service.rb

# In dit bestand demonstreren we de stijlregels en testen we of RuboCop deze regels herkent en verbeterd.

# Aangezien Ruby geen interfaces ondersteunt, definiëren we een module die als interface dient.
module IUserService
  def klik_actie(payload)
    raise NotImplementedError, 'klik_actie must be implemented'
  end
end

# Klassenaam is geschreven in PascalCase
class UserService
  include IUserService

  # Constanten zijn geschreven in UPPER_SNAKE_CASE
  MAX_RETRIES = 6

  # Twee spaties voor inspringing
  def initialize(repository)
    @repository = repository
    # Spatie rondom operatoren
    @retry_count = 0 + 2
  end

  def get_user_and_process(user_id)
    user = @repository.find_by_id(user_id)
    raise ArgumentError, 'user not found' unless user

    process_user(user)
  rescue StandardError => e
    # Kies raise boven fail
    @retry_count += 1
    raise "Exceeded max retries: #{e.message}" if @retry_count > MAX_RETRIES

    retry
  end

  # Single-line methode als endless method is toegestaan.
  def klik_actie?(payload) = payload[:clicked] ? true : false

  private

  def process_user(user)
    transformed_user = transform(user)
    @repository.save(transformed_user)
  rescue StandardError => e
    # Nogmaal raise boven fail
    raise "Failed to process user: #{e.message}"
  end

  def transform(user)
    new_name = "#{user.first_name} #{user.last_name}"
    user.name = new_name
    user
  end
end

# ChatGPT heeft de bovenstaande code gegenereerd vervolgens heb ik met RuboCop gecontroleerd welke stijlregels
# de regels van RuboCop raken.
# De ChatGPT prompt: https://chatgpt.com/share/691dd8e3-8354-8011-b18f-4c2b06336ade
