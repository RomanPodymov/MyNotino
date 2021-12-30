# MyNotino

See [this page](https://github.com/cernfr1993/notino-assignment) for more details.

### Setup

1. Install Xcode 13.2.1 or higher.
2. Install [mint](https://github.com/yonaskolb/Mint).
3. Set `export SWIFT_ACTIVE_COMPILATION_CONDITIONS='$(inherited)'` if you don't want to add pagiantion, or `export SWIFT_ACTIVE_COMPILATION_CONDITIONS='$(inherited) SIMULATE_PAGINATION'` if you want to add pagination.
4. Run `mint bootstrap && mint run xcodegen`.
5. Open **MyNotino.xcodeproj** in Xcode.
6. Run **MyNotinoApp**.
