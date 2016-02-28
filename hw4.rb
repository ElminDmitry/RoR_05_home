require_relative "hw3"
require 'pry'

class Team
  attr_reader :seniors, :juniors, :developers

  @team_of_dev = []
  option = 0
  def initialize(&block)    
    instance_eval &block    
  end

  
  def have_seniors(*names)
    @seniors = names.map {|name| SeniorDeveloper.new(name)}

    @team_of_dev = @seniors
  end

  # def add_task task_name
  #   #@seniors.first.add_task(task_name)
  # end

  def all
    @team_of_dev
  end

  def on_task(dev, &blok)
    instance_eval &block
    if @team_of_dev.dev_type == dev
      option = Proc.new(blok) #?????
    end
    #сохранить соответсвие
    
  end  

  def add_task(task, **options)    
    # case complexity
    #   when complexity == :senior
    #     @seniors.add_task
    #   when complexity == :developer
    #     @developers.add_task
    #   when complexity == :junior
    #     @juniors.add_task
    #   end
    #option.to_h    
    if options.has_key?(:to)
      # @team_of_dev.select{|dev| p dev.dev_name}
      # options.each_value{|value| return value}
      devops = @team_of_dev.select{|dev| dev.dev_name == options.each_value{|value| value}}
      devops.each{|dev| dev.add_task(task)}
      #p devops
    end
          
    # найти, какому девелоперу добавить задание
    @team_of_dev.sort_by!{|dev| [dev.tasks.size, @priority.index(dev.dev_type)]}
    @team_of_dev.first.add_task(task)
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

team = Team.new do 
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"
  
  priority :juniors , :developers, :seniors

  # on_task :junior do |dev, task|
  #   #puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  # end
end
binding.pry