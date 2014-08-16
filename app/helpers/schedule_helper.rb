module ScheduleHelper

  def human_time_range(submission)
    "#{submission.start_hour.hours.since(Date.today.beginning_of_day).strftime('%l:%M%P')} &mdash; #{submission.end_hour.hours.since(Date.today.beginning_of_day).strftime('%l:%M%P')}".html_safe
  end

  def formatted_start_date_for_index(index, format = '%B %-d, %Y')
    (Date.new(2014, 9, 15) + index.days).strftime(format)
  end

end
