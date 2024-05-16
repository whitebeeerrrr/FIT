<?php
$servername = "localhost";
$username = "root"; // Замените на ваше имя пользователя БД
$password = ""; // Замените на ваш пароль БД
$dbname = "fitness_schedule"; // Обновленное имя базы данных

// Создание подключения
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверка подключения
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Получение данных из POST-запроса
    $day = $_POST['day'];
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $time = $_POST['time'];
    $trainer = $_POST['trainer'];

    // Подготовка и выполнение SQL-запроса для вставки данных
    $sql = "INSERT INTO appointments (day, name, phone, email, time, trainer) VALUES ('$day', '$name', '$phone', '$email', '$time', '$trainer')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>document.addEventListener('DOMContentLoaded', function() { showMessage('Вы успешно записаны!'); });</script>";
    } else {
        echo "<script>document.addEventListener('DOMContentLoaded', function() { showMessage('Ошибка: " . $sql . "<br>" . $conn->error . "'); });</script>";
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['action']) && $_GET['action'] == 'load') {
    // Запрос на получение всех записей
    $sql = "SELECT day, name, phone, email, time, trainer FROM appointments";
    $result = $conn->query($sql);

    $bookings = array();

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $bookings[] = $row;
        }
    }

    echo json_encode($bookings);
    exit;
}

// Закрытие подключения
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Расписание фитнес-клуба</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('да_out.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            color: black;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.5) !important;
            font-family: 'Butcherman', cursive;
        }

        .navbar-brand {
            color: white !important;
            display: inline;
        }

        .navbar-nav .nav-link {
            font-family: 'Butcherman', cursive;
            color: white !important;
        }

        .navbar-nav .nav-link:hover {
            color: #D8D9E9 !important;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        main {
            padding: 80px 20px 20px;
        }

        .card-columns {
            column-count: 3;
        }

        .card {
            margin-bottom: 20px;
            cursor: pointer;
        }

        .booked {
            background-color: #90EE90;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-light fixed-top bg-transparent">
        <div class="container">
            <a class="navbar-brand" href="#">Фитнес клуб</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Главная</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Расписание</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Групповые программы</a></li>
                    <li class="nav-item"><a class="nav-link" href="trainers.php">Тренеры</a></li>
                    <li class="nav-item"><a class="nav-link" href="vakancii.html">Вакансии</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Атрибутика</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Личный кабинет</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <main>
        <section id="calendar">
            <h2 class="text-center">Календарь</h2>
            <div class="container">
                <div class="row" id="calendar-body">
                    <!-- Дни будут добавлены с помощью JavaScript -->
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="container">
            <span>© 2024 Ваш Фитнес Клуб</span>
        </div>
    </footer>

    <!-- Модальное окно -->
    <div class="modal fade" id="appointmentModal" tabindex="-1" role="dialog" aria-labelledby="appointmentModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="appointmentModalLabel">Запись на тренировку</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="modalDay"></p>
                    <form id="booking-form" method="post" action="zapis.php">
                        <div class="form-group">
                            <label for="name">Имя:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Телефон:</label>
                            <input type="tel" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="time">Время:</label>
                            <input type="time" class="form-control" id="time" name="time" required>
                        </div>
                        <div class="form-group">
                            <label for="trainer">Тренер:</label>
                            <select class="form-control" id="trainer" name="trainer" required>
                                <option value="Иван Иванов">Иван Иванов</option>
                                <option value="Мария Смирнова">Мария Смирнова</option>
                                <option value="Анна Петрова">Анна Петрова</option>
                            </select>
                        </div>
                        <input type="hidden" id="day" name="day">
                        <button type="submit" class="btn btn-primary">Записаться</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <p>Отправляя данную форму, вы соглашаетесь с <a href="#">нашей политикой обработки персональных данных</a>.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Модальное окно для сообщений -->
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel">Сообщение</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="messageContent">
                    <!-- Сообщение будет вставлено с помощью JavaScript -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const calendarBody = document.getElementById('calendar-body');
            const daysInMonth = new Date(new Date().getFullYear(), new Date().getMonth() + 1, 0).getDate();
            const firstDay = new Date(new Date().getFullYear(), new Date().getMonth(), 1).getDay();

            // Загрузка данных из базы данных
            fetch('zapis.php?action=load')
                .then(response => response.json())
                .then(bookings => {
                    const bookingsMap = {};
                    bookings.forEach(function(booking) {
                        if (!bookingsMap[booking.day]) {
                            bookingsMap[booking.day] = [];
                        }
                        bookingsMap[booking.day].push(booking);
                    });

                    for (let day = 1; day <= daysInMonth; day++) {
                        const dayCard = document.createElement('div');
                        dayCard.className = 'col-md-4 mb-3';
                        dayCard.setAttribute('data-day', day);

                        const card = document.createElement('div');
                        card.className = 'card';

                        const cardBody = document.createElement('div');
                        cardBody.className = 'card-body';
                        cardBody.innerHTML = `<h5 class="card-title">${day}</h5>`;

                        if (bookingsMap[day]) {
                            bookingsMap[day].forEach(function(booking) {
                                card.classList.add("booked");
                                cardBody.innerHTML += `
                                    <p>Записан: ${booking.name}</p>
                                    <p>Время: ${booking.time}</p>
                                    <p>Тренер: ${booking.trainer}</p>`;
                            });
                        }

                        card.appendChild(cardBody);
                        dayCard.appendChild(card);

                        dayCard.addEventListener('click', function() {
                            if (!card.classList.contains('booked')) {
                                selectedCard = card;
                                document.querySelector('#modalDay').textContent = `Вы выбрали день: ${day}`;
                                document.getElementById('day').value = day;
                                $('#appointmentModal').modal('show');
                            } else {
                                showMessage("Вы уже записаны на этот день.");
                            }
                        });

                        calendarBody.appendChild(dayCard);
                    }
                });

            let selectedCard = null;

            function showMessage(message) {
                document.getElementById('messageContent').textContent = message;
                $('#messageModal').modal('show');
            }
        });
    </script>
</body>
</html>
