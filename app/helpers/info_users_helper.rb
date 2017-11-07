module InfoUsersHelper
  def quote_content quote = ""
    quote.blank? ? t("users.social_network.add_quote") : quote
  end

  def select_info_user_gender
    InfoUser.genders.keys
  end

  def select_info_user_relationship_status
    InfoUser.relationship_statuses.keys
  end
end
