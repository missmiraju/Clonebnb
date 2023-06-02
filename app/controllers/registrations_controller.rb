class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, new_params)
    # Require current password if user is trying to change password.
    return super if new_params["password"]&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(new_params.except("current_password"))

    tags_handler(params)
  end

  private

  def tags_handler(params)
    current_user.tags.destroy_all

    tag_titles = Tag.all.map { |tag| tag.title }
    true_tags = params.select { |key, _value| tag_titles.include?(key) }
    true_tags.each do |true_tag|
      utag = UserTag.new
      utag.user_id = current_user.id
      utag.tag = Tag.find_by(title: true_tag)
      utag.save
    end
  end
end
