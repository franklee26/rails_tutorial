module ApplicationHelper
	@@randNum
	def someMethod
		@@randNum = rand(100)
		return "called from someMethod in helper " + @@randNum.to_s
	end

	def specialHeader(flag)
		return "WITH NUM: #{@@randNum}" if flag
		return "NO SPECIAL GENERATED"
	end
end
