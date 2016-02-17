class Developer

	attr_accessor :tasks
	
	def initialize(name)
		@dev_name = name
		@MAX_TASKS = 10
		@tasks = []
	end

	def tasks				
		@tasks.each {|i| puts "#{@tasks.index(i)+1}. #{i}"}
	end	

	def status
		if @tasks.empty?
			puts "свободен"
			elsif @tasks.length < @MAX_TASKS
				puts "работаю"
			else 
				puts "занят"
		end									 
	end

	def add_task(task_name)
		if @tasks.length < @MAX_TASKS
			puts "#{@dev_name}: добавлена задача \"#{task_name}\". Всего в списке задач: #{@tasks.length+1}"
			@tasks.push(task_name)						
		else 
			raise(ArgumentError, "Слишком много работы!")
		end								
	end

	def work!
		unless @tasks.empty?		 	
		puts "#{@dev_name}: выполнена задача \"#{@tasks.shift}\". Осталось задач: #{@tasks.length}"
		else
			raise(ArgumentError, "Нечего делать!")
		end
	end

	def can_work?
		@tasks.length == 0 ? false : true		
	end

	def can_add_task?		
		@tasks.length < @MAX_TASKS ? true : false 
	end	
end

class JuniorDeveloper < Developer	
	
	def initialize(name)
		super		
		@MAX_TASKS = 5		
	end

	def add_task(task_name)
		if task_name.length > 20
			raise(ArgumentError, "Слишком сложно!")
		elsif @tasks.length < @MAX_TASKS
			puts "#{@dev_name}: добавлена задача \"#{task_name}\". Всего в списке задач: #{@tasks.length+1}"
			@tasks.push(task_name)						
		else 
			raise(ArgumentError, "Слишком много работы!")
		end								
	end

	def work!
		unless @tasks.empty?		 	
		puts "#{@dev_name}: пытаюсь делать задачу \"#{@tasks.shift}\". Осталось задач: #{@tasks.length}"
		else
			raise(ArgumentError, "Нечего делать!")
		end
	end
end

class SeniorDeveloper < Developer	
	
def initialize(name)
		super		
		@MAX_TASKS = 15		
	end

	def work!
		unless @tasks.empty?		 	
		rand_call
		else
			raise(ArgumentError, "Нечего делать!")
		end
	end

	private
	def rand_call		
		call = rand(2)	
		if call == 0
			if @tasks.length > 1			
			puts "#{@dev_name}: выполнена задача \"#{@tasks.shift}\" и задача #{@tasks.shift}. Осталось задач: #{@tasks.length}"			
			else
				puts "#{@dev_name}: выполнена задача \"#{@tasks.shift}\". Осталось задач: #{@tasks.length}"
			end
		else
			puts "Что-то лень"		
		end
	end
end
