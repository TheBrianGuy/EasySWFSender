module ApplicationHelper

  def timeOfDay
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    day_end = Time.now.end_of_day.to_i

    case 
     when midnight.upto(noon).include?(current_time)
      return "Good Morning"
     when noon.upto(five_pm).include?(current_time)
      return  "Good Afternoon"
     when five_pm.upto(day_end).include?(current_time)
      return "Good Evening"
    end
  end

end
