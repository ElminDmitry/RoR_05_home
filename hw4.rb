require_relative "hw3"

class Team
  attr_reader :seniors, :juniors, :developers

  
  
  option = 0
  def initialize(&block)    
    @team_of_dev = []
    @task_callbacks = {}
    instance_eval &block    
  end

  
  def have_seniors(*names)
    @seniors = names.map {|name| SeniorDeveloper.new(name)}
    @team_of_dev.concat(@seniors)
  end

  def all
    @team_of_dev
  end

  def on_task(dev, &blok)
    #dev.to_s.concat("s").to_sym
    @task_callbacks[dev.to_s.concat("s").to_sym] = blok
    #сохранить соответсвие
    
  end  

  def add_task(task, **options)    
   
    team = @team_of_dev

    if options.has_key?(:to)
      team = @team_of_dev.reject { |x| x.dev_name != options[:to]}
    end

    if options.has_key?(:complexity)
      team = @team_of_dev.reject { |x| x.dev_type != options[:complexity]}
    end


          
    # найти, какому девелоперу добавить задание
    team.sort_by!{|dev| [dev.tasks.length, @priority.index(dev.dev_type)]}    
    team.first.add_task(task)
    @task_callbacks[team.first.dev_type].call(team.first, task) if @task_callbacks[team.first.dev_type]
    # проверить есть ли сохраненный блок, который соответсвует типу того девелопера
    #blok.call(dev, task)
  end

  def have_developers(*names)
    @developers = names.map {|name| Developer.new(name) }
    @team_of_dev.concat(@developers)
  end

  

  def have_juniors(*names)
    @juniors = names.map {|name| JuniorDeveloper.new(name)}
    @team_of_dev.concat(@juniors)
  end

  def report
   @team_of_dev.map{|a| puts "#{a.dev_name} (#{a.dev_type}): #{a.tasks}"}
  end

  def priority(*primary_right)
    @priority = primary_right   
  end
  
end