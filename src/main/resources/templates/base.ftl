<html xmlns="http://www.w3.org/1999/html">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<div class="col-sm-12 col-lg-12">

    <h5 id="cvss_vector"></h5>
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <input type="submit" onclick="show(document.getElementById('base'))" title="Базовые метрики"
                           value="Базовые метрики">
                </h4>
            </div>
            <div id="base" style="display: none;" class="panel-collapse collapse in">
                <form class="panel-body">

                    <div>
                        <strong>Внимание!</strong> Для получения результата необходимо выбрать значение каждого
                        критерия!
                    </div>
                    <div>
                        <strong>Базовая оценка :</strong> <strong id="base_result"></strong>
                    </div>

                    <div class="row" name="base">
                        <div class="col-lg-6">
                            <div class="col-lg-12">
                                <h4>Вектор атаки (AV):</h4>
                                <form class="btn-group btn-group-justified" id="av">
                                    <input type="radio" class="radio" value="N" name="av"/>Сетевой (N)
                                    <input type="radio" class="radio" value="A" name="av"/>Смежная сеть
                                    (A)
                                    <input type="radio" class="radio" value="L" name="av"/>Локальная (L)
                                    <input type="radio" class="radio" value="P" name="av"/>Физическая (P)
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <h4>Сложность атаки (AC):</h4>
                                <form class="btn-group btn-group-justified" id="ac">
                                    <input type="radio" class="radio" data-bs-group="AC"
                                           value="H" name="ac"/>Высокая (H)
                                    <input type="radio" class="radio" data-bs-group="AC"
                                           value="L" name="ac"/>Низкая (L)
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <h4>Уровень привилегий (PR):</h4>
                                <form class="btn-group btn-group-justified" id="pr">
                                    <input type="radio" role="button" class="radio" data-bs-group="PR"
                                           value="N" name="pr"/>Высокая (H)
                                    <input type="radio" role="button" class="radio" data-bs-group="PR"
                                           value="L" name="pr"/>Низкая (L)
                                    <input type="radio" role="button" class="radio" data-bs-group="PR"
                                           value="H" name="pr"/>Не требуется (N)
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <h4>Взаимодействие с пользователем (UI):</h4>
                                <form class="btn-group btn-group-justified" id="ui">
                                    <input type="radio" role="button" class="radio" data-bs-group="UI"
                                           value="N" name="ui"/>Не требуется (N)
                                    <input type="radio" role="button" class="radio" data-bs-group="UI"
                                           value="R" name="ui"/>Требуется (R)
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <h4>Влияние на другие компоненты системы (S):</h4>
                                <form class="btn-group btn-group-justified" id="s">
                                    <input type="radio" role="button" class="radio" data-bs-group="S"
                                           value="U" name="s"/>Не оказывает (U)
                                    <input type="radio" role="button" class="radio" data-bs-group="S"
                                           value="C" name="s"/>Оказывает (C)
                                </form>
                            </div>

                        </div>
                        <div class="col-lg-6">
                            <div class="col-lg-12">
                                <h4>Влияние на конфиденциальность (С):</h4>
                                <form class="btn-group btn-group-justified" id="c">
                                    <input type="radio" role="button" class="radio" data-bs-group="C"
                                           value="N" name="c">Не оказывает (N)
                                    <input type="radio" role="button" class="radio" data-bs-group="C"
                                           value="L" name="c">Низкая (L)
                                    <input type="radio" role="button" class="radio" data-bs-group="C"
                                           value="H" name="c">Высокая (H)
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <h4>Влияние на целостность (I):</h4>
                                <form class="btn-group btn-group-justified" id="i">
                                    <input type="radio" role="button" class="radio" data-bs-group="I" value="N"
                                           name="i"/>Не
                                    оказывает (N)
                                    <input type="radio" role="button" class="radio" data-bs-group="I" value="L"
                                           name="i"/>Низкая
                                    (L)
                                    <input type="radio" role="button" class="radio" data-bs-group="I" value="H"
                                           name="i"/>Высокая
                                    (H)
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <h4>Влияние на доступность (A):</h4>
                                <form class=-group-jradio" id="a">
                                    <input type="radio" role="button" class="radio" data-bs-group="A" value="N"
                                           name="a"/>Не
                                    оказывает (N)
                                    <input type="radio" role="button" class="radio" data-bs-group="A" value="L"
                                           name="a"/>Низкая
                                    (L)
                                    <input type="radio" role="button" class="radio" data-bs-group="A" value="H"
                                           name="a"/>Высокая
                                    (H)
                                </form>
                            </div>
                        </div>
                    </div>
                    <button class="button-add" onclick="calculate(event)">Calculate</button>
                </form>
            </div>
        </div>
    </div>

</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <input type="submit" onclick="show(document.getElementById('time'))" value="Временные метрики">
        </h4>
    </div>
    <div id="time" style="display: none;" class="panel-collapse collapse in" aria-expanded="true">
        <form class="panel-body">
            <div>
                <strong>Внимание!</strong> Для получения результата необходимо выбрать значение каждого критерия,
                а также рассчитать базовую метрику!
            </div>
            <div>
                <strong>Временная оценка :</strong> <strong id="time_result"></strong>
            </div>

            <div class="col-lg-12">
                <h4>Доступность средств эксплуатации (E):</h4>
                <form class="btn-group btn-group-justified" id="e">
                    <input type="radio" role="button" class="btn btn-default btn-danger" data-ts-group="E" name="e"
                           value="X">Не
                    определено (X)
                    <input type="radio" role="button" class="btn btn-default btn-danger" data-ts-group="E" name="e"
                           value="U">Теоретически (U)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="E" name="e" value="P">Есть концепция (P)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="E" name="e" value="F">Есть
                    сценарий (F)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="E" name="e" value="H">Высокая (H)
                </form>
            </div>
            <div class="col-lg-12">
                <h4>Уровень исправления (RL):</h4>
                <form class="btn-group btn-group-justified" id="rl">
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="RL" name="rl" value="X">Не
                    определено (X)
                    <input type="radio" role="button" class="btn btn-default btn-success" data-ts-group="RL" name="rl"
                           value="O">Официальное
                    (OF)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="RL" name="rl" value="T">Временное
                    (T)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="RL" name="rl" value="W">Рекомендации
                    (W)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="RL" name="rl" value="U">Недоступно
                    (U)
                </form>
            </div>
            <div class="col-lg-12">
                <h4>Степень достоверности источника (RC):</h4>
                <form class="btn-group btn-group-justified" id="rc">
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="RC" name="rc" value="X">Не
                    определено (X)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="RC" name="rc" value="U">Не
                    подтверждена (U)
                    <input type="radio" role="button" class="btn btn-default btn-warning" data-ts-group="RC" name="rc"
                           value="R">Не
                    доказана (R)
                    <input type="radio" role="button" class="btn btn-default" data-ts-group="RC" name="rc" value="C">Подтверждена
                    (C)
                </form>
            </div>
            <button class="button-add" onclick="calculateTime(event)">Calculate</button>
        </form>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <input type="submit" onclick="show(document.getElementById('context'))" value="Контекстные метрики">
        </h4>
    </div>
    <div id="context" style="display: none;" class="panel-collapse collapse in" aria-expanded="true">
        <form class="panel-body">
            <div>
                <strong>Внимание!</strong> Для получения результата необходимо выбрать значение каждого критерия,
                а также выбрать критерии временной метрики и рассчитать базовую метрику
            </div>
            <div>
                <strong>Контекстная оценка :</strong> <strong id="context_result"></strong>
            </div>

            <div class="col-lg-12">
                <h4>Вектор атаки (MAV):</h4>
                <form class="btn-group btn-group-justified" name="cdp">
                    <input type="radio" value="X" name="MAV">Не определено (X)
                    <input type="radio" value="N" name="MAV">Сетевая
                    (N)
                    <input type="radio" value="A" name="MAV">Смежная сеть
                    (A)
                    <input type="radio" value="L" name="MAV">Локальная
                    (L)
                    <input type="radio" value="P" name="MAV">Физическая
                    (P)
                </form>
            </div>

            <div class="col-lg-12">
                <h4>Сложность атаки(MAC):</h4>
                <form class="btn-group btn-group-justified" name="MAC">
                    <input type="radio" name="MAC" value="X">Не определено (X)
                    <input type="radio" name="MAC" value="H">Высокая
                    (H)
                    <input type="radio" name="MAC" value="L">Низкая
                    (L)

                </form>
            </div>

            <div class="col-lg-12">
                <h4>Уровень привилегий (корр.) (MPR):</h4>
                <form class="btn-group btn-group-justified" id="MPR">
                    <input type="radio" name="MPR" value="X">Не определено (X)
                    <input type="radio" name="MPR" value="H">Высокая (H)
                    <input type="radio" name="MPR" value="L">Низкая (L)
                    <input type="radio" name="MPR" value="N">Не требуется (N)
                </form>
            </div>

            <div class="col-lg-12">
                <h4>Взаимодействие с пользователем (корр.) (MUI):</h4>
                <form class="btn-group btn-group-justified" name="MAC">
                    <input type="radio" name="MUI" value="X">Не определено (X)
                    <input type="radio" name="MUI" value="R">Требуется
                    (H)
                    <input type="radio" name="MUI" value="N">Не требуется
                    (L)

                </form>
            </div>
            <div class="col-lg-12">
                <h4>Влияние на другие компоненты системы (корр.) (MS):</h4>
                <form class="btn-group btn-group-justified" name="MS">
                    <input type="radio" name="MS" value="X">Не определено(X)
                    <input type="radio" name="MS" value="U">Не оказывает
                    (U)
                    <input type="radio" name="MS" value="C">Оказывает
                    (C)

                </form>
            </div>

            <div class="col-lg-12">
                <h4>Влияние на конфиденциальность (корр.) (MС):</h4>
                <form class="btn-group btn-group-justified" id="MC">
                    <input type="radio" name="MC" value="X">Не определено (X)
                    <input type="radio" name="MC" value="N">Не оказывает (N)
                    <input type="radio" name="MC" value="L">Низкий (L)
                    <input type="radio" name="MC" value="H">Высокое (H)
                </form>
            </div>
            <div class="col-lg-12">
                <h4>Влияние на целостность (корр.) (MI):</h4>
                <form class="btn-group btn-group-justified" id="MC">
                    <input type="radio" name="MI" value="X">Не определено (X)
                    <input type="radio" name="MI" value="N">Не оказывает (N)
                    <input type="radio" name="MI" value="L">Низкий (L)
                    <input type="radio" name="MI" value="H">Высокое (H)
                </form>
            </div>
            <button class="button-add" onclick="calculateContext(event)">Calculate</button>
        </form>
    </div>
</div>

<script>
    function show(div) {
        if (div.style.display === "none") {
            div.style.display = "block";
        } else
            div.style.display = "none"
    }
</script>
<script type="application/javascript" src="/js/base.js"></script>
</body>
</html>