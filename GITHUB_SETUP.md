# GitHub Setup Guide for SkyRescue

## 🚀 Quick Push to GitHub

Follow these steps to push your project to GitHub for team collaboration.

---

## Step 1: Create GitHub Repository

### Option A: Via GitHub Website (Recommended)
1. Go to https://github.com/new
2. **Repository name:** `skyrescue` or `skyrescue-sih2026`
3. **Description:** "AI Landslide Early Warning System with Offline BLE Mesh - SIH 2026"
4. **Visibility:** 
   - ✅ **Public** (if SIH requires public repo)
   - ⚠️ **Private** (if you want to keep it private during development)
5. **DO NOT** check "Initialize with README" (we already have one)
6. **DO NOT** add .gitignore or license (we have them)
7. Click **"Create repository"**

### Option B: Via GitHub CLI (if installed)
```bash
gh repo create skyrescue --public --description "AI Landslide Early Warning - SIH 2026"
```

---

## Step 2: Configure Git (First Time Only)

Open Git Bash or terminal and run:

```bash
# Set your name and email (use your GitHub email)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Verify
git config --global user.name
git config --global user.email
```

---

## Step 3: Initialize and Push

### In the Project Directory

Open Git Bash in `C:\Landslider\` and run:

```bash
# 1. Check status (git is already initialized)
git status

# 2. Add all files
git add .

# 3. Create first commit
git commit -m "Initial commit: SkyRescue v0.2.0

- Android app with 13 screens and BLE mesh networking
- Python backend with XGBoost ML model
- 61 comprehensive tests
- Complete documentation (BUILD_SETUP, CODE_REVIEW, TESTING)
- Known issues documented in CODE_REVIEW.md

Co-Authored-By: Claude Code <noreply@anthropic.com>"

# 4. Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/skyrescue.git

# 5. Push to GitHub
git push -u origin main
```

**If you get an error about 'master' vs 'main':**
```bash
# Rename branch to main
git branch -M main
git push -u origin main
```

---

## Step 4: Verify Upload

1. Go to `https://github.com/YOUR_USERNAME/skyrescue`
2. You should see:
   - ✅ README.md displayed
   - ✅ `skyrescue/` folder with backend and mobile
   - ✅ All documentation files
   - ✅ `.gitignore` working (no build folders)

---

## 🤝 Team Collaboration

### Add Team Members

1. Go to your repository on GitHub
2. Click **Settings** (top right)
3. Click **Collaborators** (left sidebar)
4. Click **Add people**
5. Enter teammate's GitHub username
6. Select permission level:
   - **Write** - Can push code
   - **Admin** - Full access

### Team Members Clone Repository

Share this link with your team:
```
https://github.com/YOUR_USERNAME/skyrescue
```

They should run:
```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/skyrescue.git
cd skyrescue

# Set up Android app
cd mobile
# Open in Android Studio
```

---

## 📝 Daily Workflow for Team

### Pull Latest Changes (Start of Day)
```bash
git pull origin main
```

### Make Changes and Commit
```bash
# 1. Create feature branch
git checkout -b feature/your-feature-name

# 2. Make changes, then check what changed
git status

# 3. Add changes
git add .

# 4. Commit with message
git commit -m "feat: description of what you added"

# 5. Push your branch
git push origin feature/your-feature-name
```

### Create Pull Request
1. Go to GitHub repository
2. Click **"Compare & pull request"** button
3. Add description of changes
4. Assign reviewer (teammate)
5. Click **"Create pull request"**
6. Wait for review and approval
7. Merge when approved

---

## 🔄 Handling Conflicts

If you get merge conflicts:

```bash
# 1. Pull latest
git pull origin main

# 2. Git will show conflict files
# Open them in Android Studio or text editor

# 3. Look for conflict markers:
<<<<<<< HEAD
Your changes
=======
Their changes
>>>>>>> main

# 4. Resolve manually (keep correct version)

# 5. Stage resolved files
git add .

# 6. Complete merge
git commit -m "fix: resolved merge conflicts"

# 7. Push
git push origin your-branch-name
```

---

## 🎯 Branch Strategy

### Main Branches
- **`main`** - Stable, working code only
- **`develop`** - Integration branch (optional)

### Feature Branches
```bash
feature/android-ble-mesh
feature/backend-api
feature/ml-model
fix/permission-bug
docs/update-readme
```

### Example Workflow
```bash
# Create feature branch from main
git checkout main
git pull origin main
git checkout -b feature/mesh-networking

# Work on feature...
git add .
git commit -m "feat: implement BLE mesh manager"

# Push feature branch
git push origin feature/mesh-networking

# Create PR on GitHub
# After approval, merge to main
```

---

## 🔐 Protecting Sensitive Data

### Never Commit These Files:
- ❌ `local.properties`
- ❌ `keystore.jks` / `*.keystore`
- ❌ `.env` files with API keys
- ❌ `secrets.json`
- ❌ Database files with real data

### Already in `.gitignore`:
- ✅ Build folders
- ✅ IDE config
- ✅ Local properties
- ✅ Keystores and secrets

### If You Accidentally Committed Secrets:
```bash
# Remove from history (DANGEROUS - coordinate with team)
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch path/to/secret/file" \
  --prune-empty --tag-name-filter cat -- --all

# Then force push
git push origin --force --all
```

**Better:** Rotate the compromised secret immediately!

---

## 📦 Large Files (.apk, .zip)

GitHub has a 100MB file size limit. For large files:

### Option 1: Use Git LFS (Large File Storage)
```bash
# Install Git LFS
git lfs install

# Track large files
git lfs track "*.apk"
git lfs track "*.zip"

# Commit .gitattributes
git add .gitattributes
git commit -m "chore: add Git LFS tracking"
```

### Option 2: Use Releases
- Don't commit APK to repo
- Build APK locally
- Upload via GitHub Releases:
  1. Go to repository → Releases
  2. Click "Create a new release"
  3. Upload APK file
  4. Tag version (e.g., v0.2.0)

---

## 🚨 Troubleshooting

### Error: "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/skyrescue.git
```

### Error: "fatal: refusing to merge unrelated histories"
```bash
git pull origin main --allow-unrelated-histories
```

### Error: "Permission denied (publickey)"
```bash
# Switch to HTTPS instead of SSH
git remote set-url origin https://github.com/YOUR_USERNAME/skyrescue.git
```

### Error: "large files prevented push"
```bash
# Use Git LFS or remove large files
git rm --cached path/to/large/file
git commit --amend
```

### Undo Last Commit (Not Pushed Yet)
```bash
# Keep changes
git reset --soft HEAD~1

# Discard changes
git reset --hard HEAD~1
```

---

## 📊 Project Size

Current project size:
- **Mobile:** ~15MB (without build folders)
- **Backend:** ~5MB
- **Documentation:** ~500KB
- **Total:** ~20MB (well under GitHub limits)

---

## ✅ Checklist Before Pushing

- [ ] All tests pass: `./gradlew test`
- [ ] No secrets in code
- [ ] `.gitignore` is correct
- [ ] README.md is updated
- [ ] Documentation is complete
- [ ] Build files excluded
- [ ] Commit message is clear

---

## 🎓 Git Resources for Team

- **GitHub Guide:** https://guides.github.com/
- **Git Cheat Sheet:** https://education.github.com/git-cheat-sheet-education.pdf
- **Pull Request Tutorial:** https://docs.github.com/en/pull-requests
- **Resolving Conflicts:** https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts

---

## 📞 Support

**Team Lead:** [Your Name]  
**GitHub Issues:** Create issue if stuck  
**Team Chat:** [Slack/Discord/WhatsApp link]

---

**Ready to push? Run the commands in Step 3!** 🚀
