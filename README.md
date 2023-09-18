# Popmenu Assessment

Hey there, thanks again for the opportunity to try this assessment out!

# Running the Rake Task

Navigate to the `popmenu` application directory and run the following command:

```
rake 'import_data:from_json[lib/assets/data.json]'
```

This will generate and save the records from the given json if it doesn't already exist in the database, along with logging a pass/fail for said record.

# Models

## Restaurant

Name: `String`

## Menu

Restaurant: `Restaurant`\
Name: `String`

## Menu Item

Menu: `Menu`\
Name: `String`\
Price: `Float`
