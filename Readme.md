# TestFramework

A gem that contains generators a test framework for your chosen driver and cucumber.

To build a project using Watir then run the following command:
```
  test_framework project <project name> --driver=watir
```

To build a project using Watir then run the following command:
```
  test_framework project <project name> --driver=capybara
```

To use environment variables set the browser url:
```
   @browser.goto "#{EnvConfig['BASE_URL']}"
```

Define the BASE_URL in the config.yml file:
```
   BASE_URL: http://www.google.co.uk
```

From the command line make sure you pass this in:
```
   rake CONFIG=ci
```
