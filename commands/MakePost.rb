class MakePost
  attr_accessor :command, :options
  attr_reader :date, :base_path, :file_name
  attr_reader :name, :extension

  def initialize(command, options)
    @command = command
    @options = options
    self.init_options()
  end

  def init_options()
    @base_path = '_posts/'
    @date      = Time.now.strftime('%Y-%m-%d'+'-')
    @file_name = (options[:name] || 'new-post').downcase.gsub(' ', '-')
    @extension = (options[:extension] || '.markdown')
  end

  def path()
    "#{@base_path}#{@date}#{@file_name}#{@extension}"
  end

  def create_file()

    layout     = 'post'
    title      = (options[:name] || 'New Post')
    datetime   = Time.now.strftime('%Y-%m-%d %H:%M:%S %z')
    categories = ''

    File.open(self.path, "w") do |file|
      file.puts(
        <<~FILE
        ---
        layout: #{layout}
        title:  "#{title}"
        date:   #{datetime}
        categories: #{categories}
        ---
        FILE
      )
    end
  end

  def execute()

    if !File.exist?(self.path)
      self.create_file()
      puts "Create File -> #{@base_path}#{@date}#{@file_name}#{@extension}"
    else
      puts "File already exists -> #{@base_path}#{@date}#{@file_name}#{@extension}"
    end

  end
end
