module QuestionsHelper
	def show_tree(params = {})
		question = Question.find(params[:id])
		subtree = @question.root.self_and_descendants

		html= '<div class="treeview">'.html_safe
		open_ul = 0 
		prev_depth =  -1
		subtree.each do |q| 
			curr_depth = q.depth
			diff = curr_depth - prev_depth
			if curr_depth > prev_depth
				(curr_depth - prev_depth-1).times do
					html.safe_concat '<ul><li style="list-style: none">'
				end
				if q.leaf?
					html.safe_concat '<ul><li>'
				else
					html.safe_concat '<ul><li>'
				end
				open_ul += diff
			elsif curr_depth == prev_depth
				if q.leaf?
					html.safe_concat '</li><li>'
				else
					html.safe_concat '</li>><li>'
				end			
			elsif curr_depth < prev_depth
				(prev_depth - curr_depth).times do
					html.safe_concat '</li></ul>'
				end
				if q.leaf?
					html.safe_concat '</li><li>'
				else
					html.safe_concat '</li><li>'
				end
				open_ul -= diff			
			end
			prev_depth = curr_depth
			html.safe_concat block_given? ? yield(q) : q.title
		end
		open_ul.times do
			html.safe_concat '</li></ul>'
		end
		html.safe_concat '</div>'
		html
	end
end
