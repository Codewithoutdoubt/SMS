const selectElement = document.getElementById('academicYear');
removeDuplicateOptions(selectElement);
// Function to remove duplicate options
function removeDuplicateOptions(selectElement) {
    const seen = new Set();
    const options = Array.from(selectElement.options);

    options.forEach(option => {
        if (seen.has(option.value)) {
            option.remove();  // Remove duplicate option
        } else {
            seen.add(option.value);  // Add unique value to the Set
        }
    });
}
// Function to sort options in ascending order (numeric values only)
function sortNumericOptions(selectElement) {
    const options = Array.from(selectElement.options);

    options.sort((a, b) => {
        // Convert option values to numbers for comparison
        const valueA = parseInt(a.value, 10);
        const valueB = parseInt(b.value, 10);

        // Handle cases where parsing fails (non-numeric values)
        if (isNaN(valueA) || isNaN(valueB)) {
            return 0; // Keep original order for non-numeric values
        }

        return valueA - valueB; // Sort in ascending order
    });

    // Re-append sorted options to the select element
    options.forEach(option => selectElement.appendChild(option));
}
sortNumericOptions(selectElement);
document.getElementById('rollNoSearch').addEventListener('input', function () {
    const filter = this.value.toLowerCase();
    const rows = document.querySelectorAll('#studentTable tbody tr');
    rows.forEach(row => {
        const rollNoCell = row.querySelector('.rollNoCell');
        if (rollNoCell) {
            const rollNoText = rollNoCell.textContent.toLowerCase();
            if (rollNoText.indexOf(filter) > -1) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        }
    });
});