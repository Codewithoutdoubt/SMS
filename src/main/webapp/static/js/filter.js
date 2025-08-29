const semesterSelect = document.getElementById('semesterSelect');
if (semesterSelect) {
    semesterSelect.addEventListener('change', function () {
        const branchIdInput = document.getElementById('branchId');
        const subjectsTableBody = document.getElementById('subjectsTableBody');
        const resultImageInput = document.getElementById('resultImage');
        const imagePreview = document.getElementById('imagePreview');

        const semesterId = this.value;
        const branchId = branchIdInput.value;

        if (!branchId) {
            alert('Branch ID is not available.');
            return;
        }

        if (!semesterId) {
            subjectsTableBody.innerHTML = '';
            return;
        }

        fetch('/result/subjects?branchId=' + branchId + '&semesterId=' + semesterId)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(subjects => {
                subjectsTableBody.innerHTML = '';
                if (subjects.length === 0) {
                    subjectsTableBody.innerHTML = '<tr><td colspan="3" class="text-center">No subjects found for selected semester and branch.</td></tr>';
                    return;
                }
                subjects.forEach((subject, index) => {
                    const row = document.createElement('tr');

                    const srNoCell = document.createElement('td');
                    srNoCell.textContent = index + 1;
                    row.appendChild(srNoCell);

                    const nameCell = document.createElement('td');
                    nameCell.textContent = subject.subjectName;
                    row.appendChild(nameCell);

                    const passFailCell = document.createElement('td');
                    passFailCell.innerHTML = '<input type="radio" name="subjects[' + index + '].status" value="Pass" required> Pass <input type="radio" name="subjects[' + index + '].status" value="Fail" required> Fail <input type="hidden" name="subjects[' + index + '].subject.id" value=' + subject.id + ' required>';

                    row.appendChild(passFailCell);

                    subjectsTableBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error fetching subjects:', error);
                subjectsTableBody.innerHTML = '<tr><td colspan="3" class="text-center text-danger">Error loading subjects.</td></tr>';
            });
    });
}

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

