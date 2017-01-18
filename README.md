# MSM - Mycroft Skill Manager

**Idea**: Create a skill manager to install and remove skills.

This project is a [skill][skills-repository] installer for [Mycroft][mycroft-website].

## Installation

To install MSM

```bash
sudo source install.sh
```

## Usage

Install a skill

```bash
sudo msm install <skill_repository>
```

**Example**

```bash
sudo msm install https://github.com/augustnmonteiro/mycroft-youtube.git
```

## License

MSM is released under the MIT license. See [LICENSE][license-file] for details.

## More

MSM is a work in progress, feel free to improve it.


[skills-repository]: https://github.com/MycroftAI/mycroft-skills
[mycroft-website]: https://mycroft.ai
[license-file]: ./LICENSE