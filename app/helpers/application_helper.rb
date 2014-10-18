module ApplicationHelper
  def nice_controller_name
    name = ([Object].include? controller.class.parent) ? controller_name : "#{controller.class.parent}_#{controller_name}" 
    name.demodulize.gsub("Controller", "").underscore
  end
end
