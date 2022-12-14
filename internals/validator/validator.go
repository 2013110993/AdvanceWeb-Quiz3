// Filename : internal/validator/validator.go

package validator

// create a type that wraps the validation errors map
type Validator struct {
	Errors map[string]string
}

// Create a new instance of Validator
func New() *Validator {
	return &Validator{
		Errors: make(map[string]string),
	}
}

// Valid checks the Errors map for entries
func (v *Validator) Valid() bool {
	return len(v.Errors) == 0
}

// In() checks if elements can be found in a provided list of elements
func In(elements string, list ...string) bool {
	for i := range elements {

		if elements == list[i] {
			return true
		}

	}
	return false
}

// AddError() adds an error entry to the Error map
func (v *Validator) AddError(key, message string) {
	if _, exists := v.Errors[key]; !exists {
		v.Errors[key] = message
	}
}

// Check() preforms the validation checks and calls the AddError method in turn if there is an error
func (v *Validator) Check(ok bool, key, message string) {
	if !ok {
		v.AddError(key, message)
	}
}

// Unique() checks that there are no repeating values in the slice
func Unique(values []string) bool {
	uniqueValues := make(map[string]bool)
	for _, value := range values {
		uniqueValues[value] = true
	}

	return len(uniqueValues) == len(values)
}
