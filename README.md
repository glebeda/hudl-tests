# Hudl Login Test Suite

This repository contains automated tests for the Hudl login functionality using Ruby, Watir, Cucumber, and the page-object pattern. The test suite covers various login scenarios including successful login, invalid credentials, and security tests.

## Prerequisites

- Ruby 3.2.2 or higher
- Bundler
- Chrome browser
- Git

## Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd hudl-tests
```

2. Install dependencies:
```bash
bundle install
```

3. Set up environment variables:
```bash
cp .env.example .env
```

Edit the `.env` file with your Hudl credentials:
```
HUDL_EMAIL=your.email@example.com
HUDL_PASSWORD=your_password
```

## Running Tests

### Basic Test Execution

Run all tests:
```bash
bundle exec cucumber
```

### Running Specific Scenarios

Run tests with specific tags:
```bash
# Run only sanity tests
bundle exec cucumber --tags @sanity

# Run only security tests
bundle exec cucumber --tags @security
```

### Test Reports

After test execution, reports will be available in the `reports` directory:
- HTML report: `reports/cucumber.html`
- Screenshots of failed tests: `reports/screenshots/`

## Project Structure

```
.
├── features/
│   ├── step_definitions/
│   │   └── login_steps.rb      # Step definitions for login scenarios
│   ├── support/
│   │   ├── env.rb             # Environment setup and hooks
│   │   └── page_factory.rb    # Page object factory
│   ├── successful_login.feature    # Happy path login scenarios
│   └── login_validation_and_errors.feature  # Error and validation scenarios
├── pages/
│   ├── base_page.rb           # Base page object with common functionality
│   ├── home_page.rb           # Home page object
│   ├── login_page.rb          # Login page object
│   ├── main_page.rb           # Main page object
│   └── password_page.rb       # Password page object
├── reports/                   # Test execution reports and screenshots
├── .env.example              # Example environment variables
├── .env                      # Your environment variables (not in git)
├── cucumber.yml              # Cucumber configuration
├── Gemfile                   # Ruby dependencies
└── README.md                 # This file
```

## Test Scenarios

The test suite includes the following scenarios:

1. **Successful Login** (`successful_login.feature`)
   - Complete login flow with valid credentials
   - Email editing during login process (correcting email after initial error)

2. **Login Validation and Errors** (`login_validation_and_errors.feature`)
   - Invalid email format validation
   - Incorrect username/password handling
   - Security tests:
     - SQL injection attempts
     - XSS injection attempts
