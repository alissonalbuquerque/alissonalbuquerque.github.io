class MakePost
  PATH_POST  = '_posts/'
  PATH_DRAFT = '_drafts/'

  attr_accessor :command, :options
  attr_reader :date, :base_path, :file_name
  attr_reader :name, :extension, :draft

  def initialize(command, options)
    @command = command
    @options = options
    self.init_options()
  end

  def init_options()
    @draft     = options[:draft] || false
    @base_path = @draft ? PATH_DRAFT : PATH_POST
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
    describe   = 'Subtitle: '.concat(options[:name] || 'New Post')
    datetime   = Time.now.strftime('%Y-%m-%d %H:%M:%S %z')
    categories = ''
    thumbnail  = 'https://placehold.co/1600x900'

    File.open(self.path, "w") do |file|
      file.puts(
        <<~FILE
        ---
        layout     : #{layout}
        title      : "#{title}"
        describe   : "#{describe}"
        date       : #{datetime}
        categories : [#{categories}]
        thumbnail  : #{thumbnail}
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
