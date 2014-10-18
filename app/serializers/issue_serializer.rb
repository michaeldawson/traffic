class IssueSerializer < ActiveModel::Serializer
  # attributes :id, :due, :title, :description, :done, :status

  def attributes
    data[:lat] = object.latitude
    data[:lng] = object.longitude
    data[:title] = "Issue"
    data[:content] = {infoWindow: {content: '<strong>Marker #1: HTML Content</strong>'}}
  end
end