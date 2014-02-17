require 'fileutils'

module GitCamera
  class Config

    def exists?
      dir = 'git_camera'
      Dir.exist?(dir)
    end

    def load_to_session(capture_session)
      @c = capture_session
      instance_eval(File.read('git_camera/default_config.rb'))
    end

    def init_project
      FileUtils.mkdir('git_camera')

      default_conf_location = File.expand_path("../../default_config.rb", __FILE__)
      FileUtils.cp(default_conf_location, 'git_camera/default_config.rb')
    end

  private

    def before_all(command=nil, &block)
      @c.before_all_command = command
      @c.before_all_block = block
    end
    def before_each(command=nil, &block)
      @c.before_each_command = command
      @c.before_each_block = block
    end
    def after_all(command=nil, &block)
      @c.after_all_command = command
      @c.after_all_block = block
    end
    def after_each(command=nil, &block)
      @c.after_each_command = command
      @c.after_each_block = block
    end

    def page_url(url)
      @c.page_url = url
    end

    def repo_path(path)
      @c.repo_path = path
    end

    def resolution(res)
      @c.resolution = res
    end

    def delay(delay_amount)
      @c.delay = delay_amount
    end

    def frames_per_second(fps)
      @c.fps = fps
    end
  end
end
