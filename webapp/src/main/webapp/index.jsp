<%@ page isELIgnored="true" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Horoscope Insight</title>
    <br>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 2rem;
      }

      label {
        display: block;
        margin-top: 1rem;
      }

      button {
        margin-top: 1.5rem;
        padding: 0.5rem 1rem;
      }

      #result {
        margin-top: 2rem;
        font-weight: bold;
      }
    </style>
  </head>

  <body>
    <h1>Find Your Horoscope Sign</h1>
    <form id="horoscopeForm" autocomplete="off">
      <label for="name">Name</label>
      <input type="text" id="name" required>
      <label for="dob">Date of Birth</label>
      <input type="date" id="dob" required max="">
      <button type="submit">Get Sign</button>
    </form>
    <div id="result" aria-live="polite"></div>

    <script>
      document.getElementById('dob').max = new Date().toISOString().split('T')[0];

      function getWesternZodiac(m, d) {
        if ((m === 3 && d >= 21) || (m === 4 && d <= 19)) return "Aries";
        if ((m === 4 && d >= 20) || (m === 5 && d <= 20)) return "Taurus";
        if ((m === 5 && d >= 21) || (m === 6 && d <= 20)) return "Gemini";
        if ((m === 6 && d >= 21) || (m === 7 && d <= 22)) return "Cancer";
        if ((m === 7 && d >= 23) || (m === 8 && d <= 22)) return "Leo";
        if ((m === 8 && d >= 23) || (m === 9 && d <= 22)) return "Virgo";
        if ((m === 9 && d >= 23) || (m === 10 && d <= 22)) return "Libra";
        if ((m === 10 && d >= 23) || (m === 11 && d <= 21)) return "Scorpio";
        if ((m === 11 && d >= 22) || (m === 12 && d <= 21)) return "Sagittarius";
        if ((m === 12 && d >= 22) || (m === 1 && d <= 19)) return "Capricorn";
        if ((m === 1 && d >= 20) || (m === 2 && d <= 18)) return "Aquarius";
        return "Pisces";
      }

      document.getElementById('horoscopeForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const name = document.getElementById('name').value.trim();
        const dobVal = document.getElementById('dob').value;
        if (!name) { document.getElementById('result').textContent = "Enter a name."; return; }
        if (!dobVal) { document.getElementById('result').textContent = "Enter a valid date."; return; }
        const dob = new Date(dobVal + "T00:00:00");
        if (isNaN(dob.getTime())) { document.getElementById('result').textContent = "Invalid date."; return; }

        const western = getWesternZodiac(dob.getMonth() + 1, dob.getDate());
        const year = dob.getFullYear();
        const animals = ["Rat", "Ox", "Tiger", "Rabbit", "Dragon", "Snake", "Horse", "Goat", "Monkey", "Rooster", "Dog", "Pig"];
        const chinese = animals[(year - 4) % 12];

        document.getElementById('result').textContent =
          name + ", your western zodiac sign is " + western + ". Chinese zodiac: " + chinese + ".";
      });
    </script>
  </body>

  </html>