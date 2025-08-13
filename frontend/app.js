document.addEventListener('DOMContentLoaded', () => {
    const learn123Btn = document.getElementById('learn-123-btn');
    const learnAbcBtn = document.getElementById('learn-abc-btn');
    const currentAffairsBtn = document.getElementById('current-affairs-btn');
    const contentDisplay = document.getElementById('content-display');

    learn123Btn.addEventListener('click', async () => {
        try {
            const response = await fetch('http://127.0.0.1:5000/api/numbers');
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const numbers = await response.json();

            contentDisplay.innerHTML = ''; // Clear previous content

            numbers.forEach(number => {
                const item = document.createElement('div');
                item.className = 'item';
                item.textContent = number;
                contentDisplay.appendChild(item);
            });
        } catch (error) {
            console.error('Error fetching numbers:', error);
            contentDisplay.innerHTML = '<p>Sorry, something went wrong. Please try again later.</p>';
        }
    });

    learnAbcBtn.addEventListener('click', async () => {
        try {
            const response = await fetch('http://127.0.0.1:5000/api/alphabet');
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const alphabet = await response.json();

            contentDisplay.innerHTML = ''; // Clear previous content

            alphabet.forEach(letter => {
                const item = document.createElement('div');
                item.className = 'item';
                item.textContent = letter;
                contentDisplay.appendChild(item);
            });
        } catch (error) {
            console.error('Error fetching alphabet:', error);
            contentDisplay.innerHTML = '<p>Sorry, something went wrong. Please try again later.</p>';
        }
    });

    currentAffairsBtn.addEventListener('click', async () => {
        try {
            const response = await fetch('http://127.0.0.1:5000/api/current-affairs');
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const affairs = await response.json();

            contentDisplay.innerHTML = ''; // Clear previous content

            const ul = document.createElement('ul');
            affairs.forEach(fact => {
                const li = document.createElement('li');
                li.textContent = fact;
                ul.appendChild(li);
            });
            contentDisplay.appendChild(ul);
        } catch (error) {
            console.error('Error fetching current affairs:', error);
            contentDisplay.innerHTML = '<p>Sorry, something went wrong. Please try again later.</p>';
        }
    });
});
