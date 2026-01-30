# Contributing Guidelines

Thank you for your interest in contributing to the Student Counseling App!

## Code of Conduct

This project prioritizes:
- Student safety and privacy
- Code quality and maintainability
- Security best practices
- Professional collaboration

## How to Contribute

### Reporting Issues

1. Check existing issues first
2. Use issue templates if available
3. Provide detailed reproduction steps
4. Include environment information

### Pull Requests

1. Fork the repository
2. Create a feature branch
3. Follow coding standards
4. Write/update tests
5. Update documentation
6. Submit PR with clear description

## Coding Standards

### File Structure
- Maximum 100 lines per file
- Clear separation of concerns
- Follow clean architecture pattern

### Naming Conventions
- Files: `snake_case.dart`
- Classes: `PascalCase`
- Variables/Functions: `camelCase`
- Constants: `UPPER_SNAKE_CASE`

### Code Quality
- Follow Dart style guide
- Use `flutter analyze`
- No compiler warnings
- Meaningful variable names
- Clear comments when necessary

### Security Requirements
- Never commit secrets or API keys
- Follow OWASP guidelines
- Maintain anonymity features
- Test security rules
- Review Firebase configurations

### Testing
- Write unit tests for models
- Write widget tests for UI
- Maintain test coverage
- Test edge cases

## Development Workflow

1. **Setup**
   ```bash
   git clone https://github.com/petmsyh/Counsiling.git
   cd Counsiling
   flutter pub get
   ```

2. **Create Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Changes**
   - Follow coding standards
   - Keep commits atomic
   - Write clear commit messages

4. **Test**
   ```bash
   flutter analyze
   flutter test
   ```

5. **Commit**
   ```bash
   git add .
   git commit -m "feat: your feature description"
   ```

6. **Push and PR**
   ```bash
   git push origin feature/your-feature-name
   ```

## Commit Message Convention

Format: `type: description`

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style/formatting
- `refactor`: Code refactoring
- `test`: Tests
- `chore`: Maintenance

Examples:
- `feat: add group messaging feature`
- `fix: resolve authentication timeout`
- `docs: update README installation steps`

## Review Process

1. Automated checks must pass
2. Code review by maintainers
3. Security review if applicable
4. Testing in development environment
5. Merge approval

## Areas for Contribution

### High Priority
- UI/UX improvements
- Accessibility features
- Performance optimization
- Test coverage

### Medium Priority
- Documentation improvements
- Code refactoring
- Bug fixes
- Feature enhancements

### Low Priority
- Visual polish
- Minor optimizations
- Code comments

## Questions?

Feel free to open an issue for:
- Clarification on guidelines
- Technical questions
- Feature proposals
- General discussion

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.
