<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Horoscope Finder</title>
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
  <form id="horoscopeForm">
    <label for="name">Name</label>
    <input type="text" id="name" required>
    <label for="dob">Date of Birth</label>
    <input type="date" id="dob" required max="">
    <button type="submit">Get Sign</button>
  </form>
  <div id="result"></div>
  <script>
    // Set max to today so future dates not allowed
    document.getElementById('dob').max = new Date().toISOString().split('T')[0];

    function getWesternZodiac(month, day) {
      // month: 1-12
      if ((month === 3 && day >= 21) || (month === 4 && day <= 19)) return "Aries";
      if ((month === 4 && day >= 20) || (month === 5 && day <= 20)) return "Taurus";
      if ((month === 5 && day >= 21) || (month === 6 && day <= 20)) return "Gemini";
      if ((month === 6 && day >= 21) || (month === 7 && day <= 22)) return "Cancer";
      if ((month === 7 && day >= 23) || (month === 8 && day <= 22)) return "Leo";
      if ((month === 8 && day >= 23) || (month === 9 && day <= 22)) return "Virgo";
      if ((month === 9 && day >= 23) || (month === 10 && day <= 22)) return "Libra";
      if ((month === 10 && day >= 23) || (month === 11 && day <= 21)) return "Scorpio";
      if ((month === 11 && day >= 22) || (month === 12 && day <= 21)) return "Sagittarius";
      if ((month === 12 && day >= 22) || (month === 1 && day <= 19)) return "Capricorn";
      if ((month === 1 && day >= 20) || (month === 2 && day <= 18)) return "Aquarius";
      return "Pisces"; // (Feb 19 - Mar 20)
    }

    document.getElementById('horoscopeForm').addEventListener('submit', function (e) {
      e.preventDefault();
      const name = document.getElementById('name').value.trim();
      const dobValue = document.getElementById('dob').value;
      if (!dobValue) {
        document.getElementById('result').textContent = "Enter a valid date of birth.";
        return;
      }
      const dob = new Date(dobValue + 'T00:00:00');
      if (isNaN(dob.getTime())) {
        document.getElementById('result').textContent = "Invalid date format.";
        return;
      }
      const month = dob.getMonth() + 1;
      const day = dob.getDate();
      const western = getWesternZodiac(month, day);

      // Optional: Chinese zodiac (kept for interest)
      const year = dob.getFullYear();
      const chineseAnimals = ["Rat", "Ox", "Tiger", "Rabbit", "Dragon", "Snake", "Horse", "Goat", "Monkey", "Rooster", "Dog", "Pig"];
      const chinese = chineseAnimals[(year - 4) % 12];

      document.getElementById('result').textContent = `${name}, your western zodiac sign is ${western}. Chinese zodiac: ${chinese}.`;
    });
  </script>  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8">
    <title>Horoscope Finder</title>
    <style>
      body { font-family: Arial, sans-serif; margin: 2rem; }
      label { display:block; margin-top:1rem; }
      button { margin-top:1.5rem; padding:0.5rem 1rem; }
      #result { margin-top:2rem; font-weight:bold; }
    </style>
  </head>
  <body>
    <h1>Find Your Horoscope Sign</h1>
    <form id="horoscopeForm">
      <label for="name">Name</label>
      <input type="text" id="name" required>
      <label for="dob">Date of Birth</label>
      <input type="date" id="dob" required max="">
      <button type="submit">Get Sign</button>
    </form>
    <div id="result"></div>
    <script>
      document.getElementById('dob').max = new Date().toISOString().split('T')[0];
  
      function getWesternZodiac(month, day) {
        if ((month === 3 && day >= 21) || (month === 4 && day <= 19)) return "Aries";
        if ((month === 4 && day >= 20) || (month === 5 && day <= 20)) return "Taurus";
        if ((month === 5 && day >= 21) || (month === 6 && day <= 20)) return "Gemini";
        if ((month === 6 && day >= 21) || (month === 7 && day <= 22)) return "Cancer";
        if ((month === 7 && day >= 23) || (month === 8 && day <= 22)) return "Leo";
        if ((month === 8 && day >= 23) || (month === 9 && day <= 22)) return "Virgo";
        if ((month === 9 && day >= 23) || (month === 10 && day <= 22)) return "Libra";
        if ((month === 10 && day >= 23) || (month === 11 && day <= 21)) return "Scorpio";
        if ((month === 11 && day >= 22) || (month === 12 && day <= 21)) return "Sagittarius";
        if ((month === 12 && day >= 22) || (month === 1 && day <= 19)) return "Capricorn";
        if ((month === 1 && day >= 20) || (month === 2 && day <= 18)) return "Aquarius";
        return "Pisces";
      }
  
      document.getElementById('horoscopeForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const name = document.getElementById('name').value.trim();
        const dobValue = document.getElementById('dob').value;
        if (!dobValue) {
          document.getElementById('result').textContent = "Enter a valid date of birth.";
          return;
        }
        const dob = new Date(dobValue + 'T00:00:00');
        if (isNaN(dob.getTime())) {
          document.getElementById('result').textContent = "Invalid date format.";
          return;
        }
        const month = dob.getMonth() + 1;
        const day = dob.getDate();
        const western = getWesternZodiac(month, day);
        const year = dob.getFullYear();
        const chineseAnimals = ["Rat","Ox","Tiger","Rabbit","Dragon","Snake","Horse","Goat","Monkey","Rooster","Dog","Pig"];
        const chinese = chineseAnimals[(year - 4) % 12];
  
        // Use concatenation to avoid JSP EL (${...}) being evaluated server-side
        document.getElementById('result').textContent =
          name + ", your western zodiac sign is " + western + ". Chinese zodiac: " + chinese + ".";
      });
    </script>
  </body>
  </html>