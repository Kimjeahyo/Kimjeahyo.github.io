<?php
// DB 연결 (필요 시 주석 해제)
$conn = new mysqli("localhost", "root", "", "ticket_db");

$ticket_types = [
    ["name" => "입장권", "child_price" => 7000, "adult_price" => 10000, "note" => "입장"],
    ["name" => "BIG3", "child_price" => 12000, "adult_price" => 16000, "note" => "입장+놀이3종"],
    ["name" => "자유이용권", "child_price" => 21000, "adult_price" => 26000, "note" => "입장+놀이자유"],
    ["name" => "연간이용권", "child_price" => 70000, "adult_price" => 90000, "note" => "입장+놀이자유"]
];

$total = 0;
$output = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["customer_name"];
    $summary = "";

    foreach ($ticket_types as $index => $ticket) {
        $child_key = "child_{$index}";
        $adult_key = "adult_{$index}";
        $child_count = isset($_POST[$child_key]) ? (int)$_POST[$child_key] : 0;
        $adult_count = isset($_POST[$adult_key]) ? (int)$_POST[$adult_key] : 0;
        
        if ($child_count > 0) {
            $summary .= "어린이 {$ticket['name']} {$child_count}매<br>";
        }
        if ($adult_count > 0) {
            $summary .= "어른 {$ticket['name']} {$adult_count}매<br>";
        }

        $total += $child_count * $ticket['child_price'] + $adult_count * $ticket['adult_price'];
    }

    $output = date("Y년 m월 d일 A g:i") . "분<br>" .
              "{$name} 고객님 감사합니다.<br>" .
              $summary .
              "합계 " . number_format($total) . "원입니다.";
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Homework4 - 티켓 계산기</title>
</head>
<body>
    <form method="POST">
        <label>고객성명 <input type="text" name="customer_name" required></label>
        <button type="submit">합계</button>
        <br><br>

        <table border="1" cellpadding="5">
            <tr>
                <th>No</th>
                <th>구분</th>
                <th>어린이</th>
                <th>어른</th>
                <th>비고</th>
            </tr>
            <?php foreach ($ticket_types as $i => $ticket): ?>
            <tr>
                <td><?= $i + 1 ?></td>
                <td><?= $ticket["name"] ?></td>
                <td><?= number_format($ticket["child_price"]) ?> 
                    <select name="child_<?= $i ?>">
                        <?php for ($j = 0; $j <= 5; $j++): ?>
                            <option value="<?= $j ?>"><?= $j ?></option>
                        <?php endfor; ?>
                    </select>
                </td>
                <td><?= number_format($ticket["adult_price"]) ?> 
                    <select name="adult_<?= $i ?>">
                        <?php for ($j = 0; $j <= 5; $j++): ?>
                            <option value="<?= $j ?>"><?= $j ?></option>
                        <?php endfor; ?>
                    </select>
                </td>
                <td><?= $ticket["note"] ?></td>
            </tr>
            <?php endforeach; ?>
        </table>
    </form>

    <br>
    <div style="font-family:돋움; font-size:14px;">
        <?= $output ?>
    </div>
</body>
</html>
