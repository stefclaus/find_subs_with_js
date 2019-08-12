module ApplicationHelper

	def if_logged_in_display_home
		if user_present?
			link_to 'Home', root_path
		end
	end

	def if_logged_in_display_logout
		if user_present?
			link_to 'Log Out', logout_path, method: :delete
		end
	end

	def if_logged_in_display_user_show
		if user_present?
			link_to 'Assistant', assistant_path(@assistant)
		end
	end

	def if_logged_in_display_yogaclasses
		if user_present?
			link_to 'Yogaclass', yogaclasses_path, class: "all-yogaclasses"
		end
	end

	def if_logged_in_display_subrequests
		if user_present?
			link_to 'Subrequests', subrequests_path
		end
	end

	private

	def user_present?
		if session[:assistant_id].present?
			@assistant = Assistant.find(session[:assistant_id])
		end
	end

end
