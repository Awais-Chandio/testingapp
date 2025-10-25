# Simple Login App

This Flutter project demonstrates:
- flutter_bloc (Cubit)
- dio for networking
- get_it for dependency injection
- json_serializable for model parsing
- basic MVVM-like separation (model, view, viewmodel/bloc)

## How to run
1. Create a new Flutter project and replace/add the files above in the correct paths.
2. Update `pubspec.yaml` and run:

```bash
flutter pub get
```

3. If you removed the pre-generated `login_response.g.dart` file, generate the JSON serialization code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:

```bash
flutter run
```

## Notes
- The API base URL is set to `http://softkhata.store` in the service locator. The login endpoint `/api/login` is used with POST data `{ "email": "...", "password": "..." }`.
- Adjust model fields to match the real API response. If the API uses a different JSON shape, update `LoginResponse` accordingly and re-run build_runner.

## To upload to GitHub
```bash
git init
git add .
git commit -m "Initial commit - simple login app"
# create repo on GitHub and follow instructions, e.g.:
git remote add origin git@github.com:yourusername/simple_login_app.git
git branch -M main
git push -u origin main
```

---

# End of project files

