# SkyRescue - AI Landslide Early Warning System

[![Android](https://img.shields.io/badge/Platform-Android-green.svg)](https://developer.android.com)
[![Kotlin](https://img.shields.io/badge/Language-Kotlin-blue.svg)](https://kotlinlang.org)
[![Python](https://img.shields.io/badge/Backend-Python-yellow.svg)](https://www.python.org)
[![License](https://img.shields.io/badge/License-MIT-red.svg)](LICENSE)

**SIH 2026 Problem Statement 001** - AI-Based Early Warning and Landslide Risk Monitoring System for North-Eastern Region

An emergency response system combining AI-powered landslide prediction with offline BLE mesh networking for disaster-prone areas.

---

## 🌟 Features

### 🤖 AI Risk Prediction
- XGBoost model with H3 spatial grid
- Multi-source data fusion (rainfall, DEM, soil moisture, SAR)
- Per-cell explainability with SHAP
- 0.929 ± 0.005 AUC across spatial folds

### 📱 Offline-First Mobile App
- **BLE Mesh Networking** - Store-and-forward message relay
- **Works Without Internet** - Critical for remote areas
- **Emergency SOS** - I'M TRAPPED / NEED HELP / I'M SAFE
- **Citizen Reporting** - Photo + description of hazards
- **Multi-language** - English, Hindi, Bengali, Assamese, others

### 🚨 Real-Time Alerts
- Push notifications for high-risk zones
- Authority dashboard with GIS impact analysis
- Evacuation route suggestions
- Mesh sync when connectivity resumes

---

## 📂 Project Structure

```
skyrescue/
├── mobile/              # Android app (Kotlin + Jetpack Compose)
│   ├── app/src/
│   │   ├── main/       # Production code
│   │   ├── test/       # Unit tests (61 tests)
│   │   └── androidTest/# Integration & UI tests
│   ├── BUILD_SETUP.md  # Setup guide
│   ├── CODE_REVIEW.md  # Security audit
│   ├── TESTING.md      # Testing guide
│   └── FINAL_STATUS.md # Project status
│
├── backend/            # Python FastAPI backend
│   ├── app/
│   │   ├── api/       # REST endpoints
│   │   ├── ml/        # ML pipeline
│   │   └── core/      # Business logic
│   ├── data/          # Data generation
│   └── demo_scenario.py
│
├── dashboard/         # Authority web dashboard
│   └── index.html
│
├── README.md          # This file
└── AUDIT.md          # Known limitations
```

---

## 🚀 Quick Start

### Prerequisites

**For Android App:**
- Android Studio Hedgehog (2023.1.1+)
- JDK 17
- Android SDK API 34

**For Backend:**
- Python 3.10+
- pip packages (see `backend/requirements.txt`)

### Setup Android App

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/skyrescue.git
cd skyrescue/mobile

# 2. Open in Android Studio
# File → Open → Select 'mobile' folder
# Wait for Gradle sync

# 3. Run tests
./gradlew test

# 4. Run app on emulator/device
# Click green Run ▶ button in Android Studio
```

**Detailed setup:** See `mobile/BUILD_SETUP.md`

### Setup Backend

```bash
cd skyrescue/backend

# 1. Install dependencies
pip install -r requirements.txt

# 2. Run demo scenario
PYTHONPATH=. python3 demo_scenario.py

# 3. Start API server
PYTHONPATH=. uvicorn app.api.main:app --reload --port 8000

# API available at: http://localhost:8000
```

### View Dashboard

```bash
# Open in browser (no server needed)
open dashboard/index.html
```

---

## 📱 Android App Features

### Architecture
- **MVVM** with Jetpack Compose
- **Room Database** for offline storage
- **Retrofit** for API communication
- **Coroutines** for async operations
- **BLE Mesh** for peer-to-peer networking

### Screens (13 total)
1. **Home** - Risk dashboard with current status
2. **Warnings** - Active landslide warnings
3. **SOS Status** - Emergency status selection
4. **Citizen Report** - Photo + hazard reporting
5. **Mesh Status** - Connected peers and queue
6. **Settings** - Permissions, language, Bluetooth
7. **Onboarding** - First-time setup
8. And more...

### Key Components
- `MeshManager` - BLE mesh networking
- `AppViewModel` - Central state management
- `MeshRepository` - Data persistence
- `LocationTracker` - GPS updates
- `MeshForegroundService` - Background relay

---

## 🧪 Testing

**61 comprehensive tests** covering:
- ✅ Domain model behavior
- ✅ Message signature immutability
- ✅ Repository operations
- ✅ Database queries
- ✅ UI components

```bash
# Run all tests
cd mobile
./gradlew test connectedAndroidTest

# Run specific test
./gradlew test --tests "MeshSigningTest"

# Generate coverage report
./gradlew testDebugUnitTestCoverage
```

**Full testing guide:** See `mobile/TESTING.md`

---

## 🔒 Security

### ⚠️ Known Issues (See `mobile/CODE_REVIEW.md`)

**Critical (Must Fix Before Production):**
1. Hardcoded signing key → Use Android Keystore
2. Missing permission runtime checks
3. No SecurityException handling for BLE

**High Priority:**
4. Bluetooth state validation
5. Location permission checks
6. Null MeshManager in production

**20 total issues documented** with fixes in `CODE_REVIEW.md`

---

## 🗺️ System Architecture

```
┌─────────────────┐
│  Data Sources   │ Rainfall, DEM, Soil, SAR
└────────┬────────┘
         │
    ┌────▼─────┐
    │ ML Model │ XGBoost + H3 Grid
    └────┬─────┘
         │
    ┌────▼──────┐
    │ Backend   │ FastAPI + SQLite
    └────┬──────┘
         │
    ┌────▼──────┐
    │  Mobile   │ Android + BLE Mesh
    └───────────┘
         ▲
         │ Offline mesh when no internet
         │
    ┌────▼──────┐
    │  Peers    │ Store-and-forward relay
    └───────────┘
```

---

## 📊 Performance

- **Model:** 0.929 AUC (4-fold spatial cross-validation)
- **Backend:** <200ms API response time
- **Mobile:** Works offline, syncs when online
- **Mesh:** Up to 10 hops, priority-based routing

---

## 🛠️ Tech Stack

### Mobile (Android)
- **Language:** Kotlin 1.9.24
- **UI:** Jetpack Compose + Material 3
- **Database:** Room 2.6.1
- **Networking:** Retrofit 2.11.0
- **Async:** Kotlin Coroutines
- **BLE:** Android Bluetooth LE APIs
- **Testing:** JUnit, MockK, Espresso, Truth

### Backend (Python)
- **Framework:** FastAPI
- **ML:** XGBoost, Scikit-learn, SHAP
- **Spatial:** H3-py, GeoPandas
- **Data:** Pandas, NumPy
- **Database:** SQLite (dev), PostgreSQL (production)

---

## 📖 Documentation

| Document | Description |
|----------|-------------|
| `mobile/BUILD_SETUP.md` | Complete Android Studio setup guide |
| `mobile/CODE_REVIEW.md` | Security audit (20 issues + fixes) |
| `mobile/TESTING.md` | Testing guide and best practices |
| `mobile/FINAL_STATUS.md` | Current project status |
| `AUDIT.md` | Known limitations |
| `README.md` | This file |

---

## 🤝 Contributing

### Team Collaboration

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/skyrescue.git
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make changes and test**
   ```bash
   # Run tests before committing
   cd mobile
   ./gradlew test
   ```

4. **Commit and push**
   ```bash
   git add .
   git commit -m "feat: description of changes"
   git push origin feature/your-feature-name
   ```

5. **Create Pull Request**
   - Go to GitHub repository
   - Click "New Pull Request"
   - Select your branch
   - Add description and submit

### Commit Message Convention

```
feat: Add new feature
fix: Fix bug
docs: Update documentation
test: Add tests
refactor: Code refactoring
style: Code formatting
chore: Build/config changes
```

---

## 🐛 Known Limitations

- **Training data is synthetic** - Real data integration needed
- **BLE GATT is stubbed** - Needs physical device testing
- **No compiled APK** - Build in Android Studio
- **Security hardening needed** - See CODE_REVIEW.md

**Full audit:** See `AUDIT.md`

---

## 📋 Roadmap

### Phase 1 (Current)
- [x] AI model implementation
- [x] Backend API
- [x] Mobile app UI (13 screens)
- [x] Test suite (61 tests)
- [x] Documentation

### Phase 2 (Next 2 weeks)
- [ ] Fix critical security issues
- [ ] Implement BLE GATT communication
- [ ] Real data integration
- [ ] Multi-device mesh testing

### Phase 3 (Month 1)
- [ ] Field testing in NER
- [ ] Performance optimization
- [ ] Load testing
- [ ] Security audit

---

## 📄 License

MIT License - See `LICENSE` file for details

---

## 👥 Team

**SIH 2026 Team**
- Backend & ML: [Your Names]
- Android Development: [Your Names]
- UI/UX Design: [Your Names]

---

## 📞 Support

**Issues:** [GitHub Issues](https://github.com/YOUR_USERNAME/skyrescue/issues)  
**Email:** your-email@example.com  
**SIH Portal:** [Link to submission]

---

## 🙏 Acknowledgments

- **Smart India Hackathon 2026**
- **Problem Statement Contributor:** [Ministry/Department Name]
- **Data Sources:** IMD, ISRO, USGS
- **Open Source Libraries:** See `mobile/app/build.gradle.kts`

---

## ⚡ Quick Links

- [Setup Guide](mobile/BUILD_SETUP.md)
- [Code Review](mobile/CODE_REVIEW.md)
- [Testing Guide](mobile/TESTING.md)
- [API Documentation](backend/README.md)
- [Known Issues](AUDIT.md)

---

**Built with ❤️ for disaster resilience in India**

**Status:** 🟢 Active Development | **Last Updated:** September 2026
