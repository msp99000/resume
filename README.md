# 💼 Super Dev — A Clean, Developer-Focused Resume Template in LaTeX

Super Dev is a modern, minimalist, and highly customizable LaTeX resume template tailored for software developers and engineers. It's structured in a two-column layout, easy to adapt, and designed for clarity and impact.

Whether you're a new graduate or a senior engineer, this template helps you present your skills, projects, and experience in the most professional way possible.

---

## ✨ Features

- ⚡️ Modern, two-column layout
- ✅ ATS Friendly (82/100)
- 📄 Full control over formatting
- 🧑‍💻 Includes sections for projects, experience, education, skills, certifications, achievements, and more
- 🌐 Works perfectly on [Overleaf](https://overleaf.com) — no setup required
- 💻 Supports offline compilation (Linux, macOS, Windows)

---

<h2>🔖 Resume Preview</h2>

<img src="preview.png" alt="Resume Preview" width="500"/>

---

## 🛠️ Getting Started

### 🔗 Option 1: Use with Overleaf (Recommended for Beginners)

1. Go to [Overleaf.com](https://overleaf.com)
2. Click on **"New Project → Upload Project"**
3. Upload all the files in this repo
4. Open `main.tex` and click **"Recompile"**
5. Export as PDF

---

### 💻 Option 2: Compile Locally

If you prefer offline editing and compiling:

#### 🐧 Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install texlive-full
```

#### 🍎 macOS 

Install MacTeX:

```bash
brew install --cask mactex
```

Add to your shell path if needed:

```bash
export PATH="/Library/TeX/texbin:$PATH"
```

#### 🪟 Windows

Install MiKTeX and optionally TeXworks or TeXstudio

📦 Compile

Navigate to the folder and run:

```bash
pdflatex main.tex
```

#### 🧾 Folder Structure

```
.
├── config.tex              # Color and font setup
├── layout.cls              # Custom LaTeX class for styling
├── main.tex                # Main file to compile
├── preview.png             # Resume Preview
└── sections/
    ├── achievements.tex
    ├── certifications.tex
    ├── education.tex
    ├── experience.tex
    ├── header.tex
    ├── projects.tex
    ├── skills.tex
    └── strengths.tex
```

#### 📌 Customization Tips

Start by editing sections/header.tex to add your name and contact info.
You can remove or add sections from main.tex as needed.
Adjust color schemes or fonts in config.tex.


#### 🔑 License

This template is released under the MIT License. You're free to use, modify, and share it.

#### 🙌 Contribute

If you find a bug or want to improve the layout, feel free to open an issue or pull request.


