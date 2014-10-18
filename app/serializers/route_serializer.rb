class RouteSerializer < ActiveModel::Serializer
  attributes :id, :route_from, :route_to, :start_time, :end_time
end
