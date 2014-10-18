module ApplicationHelper
  def nice_controller_name
    name = ([Object].include? controller.class.parent) ? controller_name : "#{controller.class.parent}_#{controller_name}" 
    name.demodulize.gsub("Controller", "").underscore
  end

  def json_for(target, options = {})
    options[:scope] ||= self
    options[:url_options] ||= url_options
    target.active_model_serializer.new(target, options).to_json
  end
end
