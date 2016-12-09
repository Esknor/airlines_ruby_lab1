module FlightsHelper

	class Command
	  attr_reader :table, :name, :data

	  def initialize(table, name, data)
	    @table = table
	    @name = name
	    @data = data
	  end

	  def name
	    self.class
	  end
	end

	class AddToBaseCommand < Command

	  def initialize(table, name, data)
	    super(table, name, data)
	  end

	  def execute
	    record = table.find_by name: name
	    record.staffs<<data
	  end
	end

	class DeleteFromBaseCommand < Command

	  def initialize(table, name, data)
	    super(table, name, data)
	  end

	  def execute
	    record = table.find_by name: name
	    record.staffs.delete(data)
	  end
	end

	class Macro
	  attr_accessor :commands

	  def initialize
	    @commands = []
	  end

	  def add_command(*args)
	    args.each { |arg| commands << arg }
	  end

	  def execute
	    commands.each { |command| command.execute }
	  end
	end

end
