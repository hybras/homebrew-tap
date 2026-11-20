# Agent Instructions for hybras/homebrew-tap

## References

- [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook): how to write and maintain casks in `Casks/`.
- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook): how to write and maintain formulae in `Formula/`.

## Attribution

- These instructions take precedence over the Homebrew/brew `AGENTS.md` at `$(brew --repository)/AGENTS.md`, which agents may also load because taps live inside that repository.
- Add AI attribution: a `Co-Authored-By` trailer naming the agent or model on agent commits and a line naming the agent that generated pull request descriptions.

## Testing

- Test changes locally before pushing so CI failures are anticipated rather than discovered: `brew install --build-from-source`, `brew test`, `brew audit --online` and `brew style`.
- Simulate Linux with Docker using the CI image. Docker Desktop doesn't share `/usr/local`, so stream the tap in with `tar` rather than a volume mount: `tar -cf - . | docker run -i --rm --privileged ghcr.io/homebrew/brew:main bash -c 'T=$(brew --repository)/Library/Taps/hybras/homebrew-tap; rm -rf "$T"; mkdir -p "$T"; tar -C "$T" -xf -; ...'`. Start Docker Desktop with `open -a Docker` if it isn't running.

## GitHub

- Wait for pull request updates (checks, state and reviews) with `gh event listen --resource <PR URL> --event <types>`; see `gh event listen --help`.
- Where events are unavailable (e.g. workflow runs not tied to a pull request or event subscriptions not enabled for the account), poll GitHub status updates every 3 minutes.
- A green `brew test-bot` check doesn't mean `brew test` passed: test-bot ignores test failures and logs `failed step ignored`. Before saying CI passed or adding the `pr-pull` label, check the logs, e.g. `gh run view <id> --log | grep -E "failed step|FAILED|##\[error\]"`.
