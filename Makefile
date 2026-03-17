.PHONY: help run build clean gen watch test lint format

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

run: ## Run app in debug mode
	flutter run

build-apk: ## Build release APK
	flutter build apk --release

build-ios: ## Build release iOS
	flutter build ios --release

build-web: ## Build release web
	flutter build web --release

build-windows: ## Build release Windows
	flutter build windows --release

build-macos: ## Build release macOS
	flutter build macos --release

build-linux: ## Build release Linux
	flutter build linux --release

clean: ## Clean build artifacts
	flutter clean
	flutter pub get

gen: ## Run build_runner code generation
	dart run build_runner build --delete-conflicting-outputs

watch: ## Run build_runner in watch mode
	dart run build_runner watch --delete-conflicting-outputs

test: ## Run all tests
	flutter test

lint: ## Run analyzer
	flutter analyze

format: ## Format all Dart files
	dart format lib/ test/

l10n: ## Generate localization files
	flutter gen-l10n

icons: ## Generate app launcher icons
	dart run flutter_launcher_icons

splash: ## Generate native splash screen
	dart run flutter_native_splash:create
