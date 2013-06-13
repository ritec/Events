module EventsHelper
	def format_price(events)
		if events.free?
			content_tag(:strong, "Free!")
		else
			number_to_currency(events.price)
		end
	end

	def image_for(events)
		if events.image_file_name.blank?
			image_tag 'placeholder.png'
		else
			image_tag events.image_file_name
		end
	end

end
