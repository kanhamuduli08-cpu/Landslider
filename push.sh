#!/bin/bash
# Quick Push Script for SkyRescue
# Run this after creating your GitHub repository

echo "🚀 SkyRescue - Quick Push to GitHub"
echo "===================================="
echo ""

# Check if remote exists
if git remote get-url origin > /dev/null 2>&1; then
    echo "✅ Remote 'origin' already configured"
    git remote -v
else
    echo "⚠️  Remote 'origin' not configured yet"
    echo ""
    echo "Please run:"
    echo "  git remote add origin https://github.com/YOUR_USERNAME/skyrescue.git"
    echo ""
    echo "Replace YOUR_USERNAME with your GitHub username"
    exit 1
fi

echo ""
echo "📦 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Done! Check your repository at:"
echo "   https://github.com/YOUR_USERNAME/skyrescue"
