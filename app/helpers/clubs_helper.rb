module ClubsHelper
  def authorize_edit_and_destroy(object)
    link_to "edit", edit_club_path(object) if can? :update, object
    link_to "delete", club_path(object), method: "DELETE" if can? :destroy, object
  end
end
