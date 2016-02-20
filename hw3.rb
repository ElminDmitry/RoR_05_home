class Developer
	
  def initialize(name)
    @dev_name = name
	  @MAX_TASKS = 10
	  @tasks = []
  end

  def tasks
     @tasks.map.each_with_index.each{|a, i| "#{i+1}. #{a}"}  
  end	

  def status
    case
    when !can_work?
    	"свободен"
    when can_add_task?
    	"работаю"
    else
    	"занят"
    end    							 
  end

  def add_task(task_name)
    if can_add_task?	    
	    puts %Q{%s: добавлена задача "%s". Всего в списке задач: %i} %
      [@dev_name, task_name, @tasks.length+1]
	    @tasks.push(task_name)						
	  else 
	    raise("Слишком много работы!")
	  end								
  end

  def work!
    if can_work?
	    puts %Q{%s: выполнена задача "%s". Осталось задач: %i} %
      [@dev_name, @tasks.shift, @tasks.length]
	  else
	    raise("Нечего делать!")
	  end
  end

  def can_work?
    @tasks.length != 0
  end

  def can_add_task?		
    @tasks.length < @MAX_TASKS
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
	  elsif can_add_task?
	    puts %Q{%s: добавлена задача "%s" . Всего в списке задач: %i} %
      [@dev_name, task_name, @tasks.length+1]
	    @tasks.push(task_name)						
	  else 
	    raise("Слишком много работы!")
	  end								
  end

  def work!
    if can_work?		 	
	    puts %Q{%s: пытаюсь делать задачу "%s". Осталось задач: %i} %
      [@dev_name, @tasks.shift, @tasks.length]
	  else
	    raise("Нечего делать!")
	  end
  end
end

class SeniorDeveloper < Developer
	
  def initialize(name)
    super		
	  @MAX_TASKS = 15
  end

  def work!
    if can_work?	 	
	    rand_call
	  else
	    raise("Нечего делать!")
	  end
  end

  private
  def rand_call					
    if rand(2).even?
	    if @tasks.length > 1			
	      puts %Q{%s: выполнена задача "%s" и задача "%s". Осталось задач: %i} %
        [@dev_name, @tasks.shift, @tasks.shift, @tasks.length]
	    else
        puts %Q{%s: выполнена задача "%s". Осталось задач: %i} %
        [@dev_name, @tasks.shift, @tasks.length]
	    end
	  else
      puts "Что-то лень"		
	  end
  end
end