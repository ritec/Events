class Registration < ActiveRecord::Base

	validates :name, presence: true

	validates :email, format: {with: /(\S+)@(\S+)/}

	HOW_HEARD_OPTIONS = [
		'Newsletter',
		'Blog Post',
		'Twitter',
		'Web Search',
		'Friend/Coworker',
		'Other'
	]

	validates :how_heard,
			inclusion: {in: HOW_HEARD_OPTIONS }

  belongs_to :event
end
