require "diverter/version"

class Diverter

  def initialize(condition: true)
    return unless block_given?

    if !!condition
      pid = fork do
        yield
        exit!(0)
      end

      # ensure the child process has terminated
      Process::waitpid(pid)
    else
      yield
    end
  end

end
