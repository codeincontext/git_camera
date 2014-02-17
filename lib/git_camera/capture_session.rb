require 'grit'

module GitCamera
  class CaptureSession

    attr_accessor :before_all_command, :before_all_block, :before_each_command, :before_each_block
    attr_accessor :after_all_command, :after_all_block, :after_each_command, :after_each_block

    attr_accessor :page_url, :repo_path, :resolution, :delay, :fps

    def start_capture
      FileUtils.mkdir('git_camera/frames') unless Dir.exist?('git_camera/frames')

      repo = Grit::Repo.new(repo_path || Dir.getwd)

      before_all_block.call if before_all_block

      repo.commits('master', 99999).reverse.each_with_index do |commit, i|
        before_each_block.call if before_each_block

        repo.git.native :checkout, {:raise=>true}, commit.sha
        destination = "git_camera/frames/frame_#{"%05d" % i}.png"
        before_each_block.call if before_each_block

        take_screenshot(destination)
        puts '- '+commit.message

        after_each_block.call if after_each_block
      end

      compile_to_video

      delete_images

      after_all_block.call if after_all_block

      repo.git.native :checkout, {}, 'master'
    end

  private

    def take_screenshot(destination)
      lib_path = File.expand_path("..", File.dirname(__FILE__))

      phantom_command = [
        'phantomjs', 
        "#{lib_path}/phantom_task.js",
        page_url, 
        destination,
        resolution,
        delay
      ].join(' ')

      system phantom_command
    end

    def compile_to_video
      `ffmpeg -f image2 -r #{fps} -i git_camera/frames/frame_%05d.png -y git_camera/git_camera_video.mp4`
    end

    def delete_images

    end
  end
end
