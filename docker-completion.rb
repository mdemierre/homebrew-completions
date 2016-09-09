class DockerCompletion < Formula
  desc "Bash, Zsh and Fish completion for Docker"
  homepage "https://github.com/docker/docker"
  url "https://github.com/docker/docker/archive/v1.12.1.tar.gz"
  sha256 "0c71255fc69ffec377800468e2b1c97681f150f3719ffa09829a17b717ff4e01"
  head "https://github.com/docker/docker"

  bottle :unneeded

  conflicts_with "docker",
    :because => "docker already includes these completion scripts"

  def install
    bash_completion.install "contrib/completion/bash/docker"
    fish_completion.install "contrib/completion/fish/docker.fish"
    zsh_completion.install "contrib/completion/zsh/_docker"
  end

  test do
    assert_match "-F _docker",
      shell_output("bash -c 'source #{bash_completion}/docker && complete -p docker'")
  end
end
