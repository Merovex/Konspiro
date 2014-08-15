module OrganizationsHelper
	def show_alignments(o)
		 [
			kratos(o.kratos),
		
		    reverence(o.reverence),
		
			sector(o.sector),
		
			law(o.law),
			zeal(o.zeal),
			odd(o.odd),
			show_politics(o)
		 ].compact.join(", ").html_safe
	end
	def show_politics(o)
		nolan = case 
			when (o.personal > 1 and o.economic > 1) then "Libertarian"
			when (o.personal < -1 and o.economic < -1) then "Statist"
			when (o.personal > 1 and o.economic < -1) then "Leftist"
			when (o.personal < -1 and o.economic > 1) then "Rightist"
			else "Centrist"
		end
		jennifer = if o.political > 1 
			"Permissive"
		elsif o.political < -1
			"Repressed"
		else
			nil
		end
		return [jennifer, nolan].compact.join(" ")

	end
	def kratos(i,j=0)
		level = {
			'3' => 'Violent',
			'2' => 'Violent',
			'1' => nil,
			'0' => nil,
			'-1' => nil,
			'-2' => 'Peaceful',
			'-3' => 'Peaceful',
		}[i.to_s]
		level += " (#{i})" if (j == 1)
		level
	end
	def zeal(i,j=0)
		level = {
			'3' => 'Zealous',
			'2' => 'Zealous',
			'1' => nil,
			'0' => nil,
			'-1' => nil,
			'-2' => 'Apathetic',
			'-3' => 'Apathetic',
		}[i.to_s]
		level += " (#{i})" if (j == 1)
		level
	end
	def law(i,j=0)
		level = {
			'3' => 'Lawful',
			'2' => 'Lawful',
			'1' => nil,
			'0' => nil,
			'-1' => nil,
			'-2' => 'Criminal',
			'-3' => 'Criminal',
		}[i.to_s]
		level += " (#{i})" if (j == 1)
		level
	end
	def odd(i,j=0)
		level = {
			'3' => 'Strange',
			'2' => 'Odd',
			'1' => nil,
			'0' => nil,
			'-1' => nil,
			'-2' => 'Normal',
			'-3' => 'Boring',
		}[i.to_s]
		level += " (#{i})" if (j == 1)
		level
	end
	def reverence(i,j=0)
		level = {
			'3' => 'Theist',
			'2' => 'Theist',
			'1' => nil,
			'0' => nil,
			'-1' => nil,
			'-2' => 'Atheist',
			'-3' => 'Atheist',
		}[i.to_s]
		level += " (#{i})" if (j == 1)
		level
	end
	def degrees(low,hi,value)
		adj = %w(Totally Very Slightly Not Slightly Very Totally)[value + 3]
		adj = 'Far' if low == 'Left' and value.abs == 3
		return "#{adj} #{low}" if value < 0
		return "#{adj} #{hi}"
	end
	def excrement(left, right, value)
		return degrees(left,right,value)
		percent = ((value.to_f + 4.to_f) / 0.07).to_i - 7
		row = <<-EOS;
		<div class='row'>
		  <div class='medium-2 large-2 columns'>#{left}</div>
		  <div class='medium-7 large-7 columns progress'><span class='meter' style='width:#{percent}%'></span></div>
		  <div class='medium-2 large-2 columns'>#{right}</div>
		</div>
		EOS
		row.html_safe
	end
	def starTrait(l,r,i,j=0)
		x = i + 3
		cells = ["<th>#{l}</th>"]
		7.times do |j|
			cells << if j == x
				"<td>*</td>"
			else
				"<td></td>"
			end
		end
		cells << "<th>#{r}</th>"
		return "<tr>#{cells.join("\n")}</tr>".html_safe
	end
	def ptraits(i,j=0)
		traits(i-3,j)
	end
	def traits(i,j=0)
		level = {'3' => 'Superb',
		'2' => 'Great',
		'1' => 'Good',
		'0' => 'Fair',
		'-1' => 'Mediocre',
		'-2' => 'Poor',
		'-3' => 'Terrible',
		}[i.to_s]
		level += " (#{i})" if (j == 1)
		level
	end
	def sector(i,j=0)
		level = {
			'3' => 'Private',
			'2' => 'Private',
			'1' => 'Private',
			'0' => 'Non-Profit',
			'-1' => 'Public',
			'-2' => 'Public',
			'-3' => 'Public',
		}[i.to_s]
		level += " (#{i})" if (j == 1)
		level
	end
end
