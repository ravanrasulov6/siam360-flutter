# Siam360 Flutter App

A business management SaaS application built with Flutter.

## Features

- 11 screens with Azerbaijani UI
- go_router navigation
- flutter_riverpod state management
- Material 3 design

## Screens

| Route | Screen |
|-------|--------|
| `/login` | Giriş |
| `/register/personal` | Qeydiyyat - Şəxsi |
| `/register/verify` | Qeydiyyat - Təsdiq |
| `/register/business-type` | Qeydiyyat - Biznes Növü |
| `/register/business-size` | Qeydiyyat - Biznes Həcmi |
| `/dashboard` | İdarəetmə Paneli |
| `/products` | Məhsullar |
| `/pos` | Kassa |
| `/requests` | Sorğular |
| `/reservations` | Rezervasiyalar |
| `/reports` | Hesabatlar |

## Build

```bash
flutter pub get
flutter run -d chrome
```

## CI/CD

GitHub Actions builds APK on push to main.
Download from: Actions → Build Android APK → Artifacts
