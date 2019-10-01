module ApplicationHelper
	@@randNum
	@@numTimesCalled = 0
	def someMethod
		@@numTimesCalled += 1
		return "Number of times called " + @@numTimesCalled.to_s if @@numTimesCalled < 51
		return "Number of times called 50"
	end

	def specialHeader(flag)
		@@randNum = rand(10)
		return "WITH NUM: #{@@randNum}" if flag
		return "NO SPECIAL GENERATED"
	end

	def getTitle(s)
		default = "Frank's rails app"
		return default if s.empty?
		return s + " | " + default
	end

	def tempHeader(s)
		default = "This is a temporary header and filled with: "
		return default + "Nothing" if s.empty?
		return default + s
	end

	def resetNumTimesCalled
		@@numTimesCalled = 0
	end
end
