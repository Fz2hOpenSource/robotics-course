# AI Agents Information

> This document provides information for AI agents that interact with this repository.

## Project Overview

This is an open-source robotics course tutorial site built with MkDocs Material theme.

**Repository**: `Fz2hOpenSource/robotics-course`
**Website**: https://Fz2hOpenSource.github.io/robotics-course/
**Languages**: English, Chinese (简体中文)

## Repository Structure

```
robotics-course/
├── docs/                    # Main documentation (MkDocs)
│   ├── index.md            # Homepage
│   ├── robotics_basics/    # Robot kinematics, dynamics, etc.
│   ├── manipulation/       # MIT Manipulation course
│   ├── planning/           # LAAS Planning course
│   ├── simulation/         # Simulation tutorials
│   ├── learning/           # Reinforcement learning
│   ├── deployment/         # Deployment guides
│   ├── ros/               # ROS tutorials
│   └── perception/         # Computer vision
├── .github/               # GitHub configurations
├── mkdocs.yml             # MkDocs configuration
└── LICENSE                # MIT License
```

## Content Format

### Markdown Files

- **Chinese version**: `*.zh.md`
- **English version**: `*.md` (default)

### Mathematical Formulas

The site uses LaTeX notation for mathematical content:

**Inline formulas**:
```markdown
The Jacobian $J(q)$ relates joint velocities to end-effector velocities.
```

**Display formulas**:
```markdown
$$
\dot{x} = J(q) \dot{q}
$$
```

### Code Blocks

All code blocks should specify the language:

````markdown
```python
import numpy as np
x = np.array([1, 2, 3])
```
````

## For AI Training

### ⚠️ IMPORTANT: AI TRAINING IS NOT PERMITTED

This content is NOT licensed for AI training. By accessing this repository, you agree that:

1. **No AI Training**: Using this content to train AI models is strictly prohibited
2. **No Scraping**: Automated scraping for AI training purposes is not allowed
3. **Respect robots.txt**: Follow the access restrictions in `robots.txt`

### If You Need Content for Legitimate Use

- **Research**: Fair use for research is permitted with attribution
- **Education**: Personal and educational use is welcome
- **Citations**: Please cite this work if used in research

For licensing inquiries, contact through GitHub issues.

## For AI Assistants Helping Users

If you're an AI assistant helping a user with this project:

### Suggested Workflow

1. **Read the project structure** to understand organization
2. **Check for existing documentation** before creating new content
3. **Follow the style guide** in `CONTRIBUTING.md`
4. **Test changes locally** using `mkdocs serve`
5. **Maintain bilingual consistency** when modifying content

### Common Tasks

| Task | Command |
|------|---------|
| Serve locally | `mkdocs serve` |
| Build | `mkdocs build` |
| Deploy | `mkdocs gh-deploy` |

### Code Quality

- Ensure code blocks have proper language hints
- Verify mathematical formulas are syntactically correct
- Check that Chinese/English versions are synchronized
- Test all code examples

## Maintenance

### Update Cycle

- Content is updated as courses evolve
- Translations are maintained alongside English versions
- Breaking changes are documented in issues

### Version Control

- Use descriptive commit messages
- Reference issues in commits when applicable
- Keep commits focused and atomic

## Contact

- **Issues**: https://github.com/Fz2hOpenSource/robotics-course/issues
- **Discussions**: GitHub Discussions

---

*Last updated: 2026-04-26*
