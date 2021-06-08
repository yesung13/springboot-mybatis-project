<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-06-01
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html lang="en">
<head>
    <title>실태조사 결과</title>
    <meta charset="UTF-8">
    <%--    <script src="${pageContext.request.contextPath}/resources/d3/d3.min.js"></script>--%>
    <style>
        .jumbotronCus {
            min-width: 576px;
            height: 500px;
            padding: 4rem 2rem;
            margin-bottom: 2rem;
            background-color: #e9ecef;
            border-radius: 0.3rem;
        }
        .jumbotronCus2{
            min-width: 1000px;
            height: 1300px;
            padding: 4rem 2rem;
            margin-bottom: 2rem;
            background-color: #e9ecef;
            border-radius: 0.3rem;
        }

    </style>
    <script src="https://d3js.org/d3.v6.min.js"></script>
    <script src="https://d3js.org/d3.v4.min.js"></script>
    <script>
        $(function () {
            showBarGraph();
            showPieGraph();
        });

        function showBarGraph() {
            var path = "barGraph";

            $.ajax({
                method: 'GET',
                url: '/survey/surveyBarGraphProc/' + path,
                dataType: 'json',
                success: function (res) {
                    console.log("success: ", res);
                    drawBarGraph(res);
                },
                error: function (xhr, e, response) {
                    console.log("Error:", xhr, e, response);
                    alert("barGraph 에러!")
                }
            });
        }
    </script>
</head>

<body>
<%-- 헤더(navbar) --%>
<c:import url="/views/common/header.jsp"/>

<section class="container">
    <div class="mt-5"><h1>Part1. 개발자 정보</h1></div>
    <%-- 막대 그래프 - 예비/경력 개발자 전공 여부 --%>
    <div class="mt-5">
        <div>
            <h3>예비/경력 개발자 전공 여부 조사 결과</h3>
            <h6>설명란....</h6>
        </div>
        <div class="jumbotron">
            <svg id="barGraph" width="900" height="500"></svg>
        </div>
        <script>
            function drawBarGraph(res) {

                var svg = d3.select("#barGraph"),
                    margin = {
                        top: 20,
                        right: 20,
                        bottom: 30,
                        left: 40
                    },
                    width = +svg.attr("width") - margin.left - margin.right,
                    height = +svg.attr("height") - margin.top - margin.bottom,
                    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

                var x0 = d3.scaleBand()
                    .rangeRound([0, width])
                    .paddingInner(0.1);

                var x1 = d3.scaleBand()
                    .padding(0.05);

                var y = d3.scaleLinear()
                    .rangeRound([height, 0]);

                var z = d3.scaleOrdinal()
                    .range(["#16A085", "#33435C"]); // 첫번째/두번쩨 막대 색상

                /* sample data */
                // var vals = '[{"Race":"R1","HTC":270,"Registry":449},{"Race":"R2","HTC":202,"Registry":327},{"Race":"R3","HTC":120,"Registry":214},{"Race":"R4","HTC":114,"Registry":193},{"Race":"R5","HTC":894,"Registry":155},{"Race":"R6","HTC":737,"Registry":134}]';
                // data = JSON.parse(vals);
                // console.log("vals:", JSON.parse(vals));
                /* //sample data */

                console.log("Bar Data:", res);
                barData = res;
                var keys = Object.keys(barData[0]).slice(1);

                x0.domain(barData.map(function (d) {
                    return d.barName;
                }));
                x1.domain(keys).rangeRound([0, x0.bandwidth()]);
                y.domain([0, d3.max(barData, function (d) {
                    return d3.max(keys, function (key) {
                        return d[key];
                    });
                })]).nice();

                g.append("g")
                    .selectAll("g")
                    .data(barData)
                    .enter().append("g")
                    .attr("transform", function (d) {
                        return "translate(" + x0(d.barName) + ",0)";
                    })
                    .selectAll("rect")
                    .data(function (d) {
                        // debugger;
                        return keys.map(function (key) {
                            return {
                                key: key,
                                value: d[key]
                            };
                        });
                    })
                    .enter().append("rect")
                    .attr("x", function (d) {
                        console.log("d Key1:::", d.key);
                        return x1(d.key);
                    })
                    .attr("y", function (d) {
                        return y(d.value);
                    })
                    .attr("width", x1.bandwidth())
                    .attr("height", function (d) {
                        return height - y(d.value);
                    })
                    .attr("fill", function (d) {
                        return z(d.key);
                    });

                g.append("g")
                    .style("font-size", 20) // 하단 글자 크기기
                    .attr("class", "axis")
                    .attr("transform", "translate(0," + height + ")")
                    .call(d3.axisBottom(x0));


                g.append("g")
                    .attr("class", "axis")
                    .call(d3.axisLeft(y).ticks(null, "s"))
                    .append("text")
                    .attr("x", 2)
                    .attr("y", y(y.ticks().pop()) + 0.5)
                    .attr("dy", "0.32em")
                    .attr("fill", "#000")
                    .attr("font-weight", "bold")
                    .attr("text-anchor", "start")
                    .text("전공/비전공 인원수");

                /* 오른쪽 상단 글자 */
                var legend = g.append("g")
                    .attr("font-family", "sans-serif")
                    .attr("font-size", 20)
                    .attr("text-anchor", "end")
                    .selectAll("g")
                    .data(keys.slice().reverse())
                    .enter().append("g")
                    .attr("transform", function (d, i) {
                        return "translate(0," + i * 20 + ")";
                    });

                /* 오른쪽 상단 사각형 위치 */
                legend.append("rect")
                    .attr("x", width - 19)
                    .attr("width", 19)
                    .attr("height", 19)
                    .attr("fill", z);

                /* 오른쪽 상단 글자 위치 */
                legend.append("text")
                    .attr("x", width - 24)
                    .attr("y", 9.5)
                    .attr("dy", "0.32em")
                    .text(function (d) {
                        // return d;
                        /* 텍스트 name 변경 */
                        console.log("d Key2:::", d);

                        if (d === "barVal2") {
                            console.log("비전공:::");
                            return "비전공";
                        } else if (d === "barVal1") {
                            console.log("전공:::");
                            return "전공";
                        }

                    });

            }
        </script>
    </div>

    <%-- 파이 그래프 --%>
    <div class="mt-5">
        <div><h3>비전공자의 개발 공부 학습 방법 조사 결과</h3>
            <h6>설명란....</h6>
        </div>
        <div class="jumbotronCus">

            <div class="">
                <svg id="pieGraph" width="900" height="400"></svg>
                <script src="${pageContext.request.contextPath}/resources/js/d3/pie-chart.js/"></script>
            </div>
        </div>
    </div>

    <%-- 가로 막대 그래프 --%>
    <div class="mt-5"><h1>Part3. 개발 시 사용하는 프로그래밍 언어</h1></div>
    <div class="mt-5">
        <div><h3>직무별 자신있는 프로그래밍 언어 조사 결과</h3>
            <h6>설명란....</h6>
        </div>
        <div class="jumbotronCus2">
            <div id="chart" style="width: 960px;height: 1500px"></div>
            <script>
                window.addEventListener('resize', function (event) {
                    $("#chart").width(window.innerWidth * 0.5);
                    $("#chart").height(window.innerHeight);
                });
            </script>
            <script src="${pageContext.request.contextPath}/resources/js/d3/horizonBar-chart.js/"></script>
            <script>
                const path = "horizonBarChart";
                $.ajax({
                    method: 'GET',
                    url: '/survey/surveyHorizonBarChart/' + path,
                    dataType: 'json',
                    success: function (res) {
                        // console.log("success: ", res);
                        horizonBarConf(res);
                    },
                    error: function (xhr, e, response) {
                        console.log("Error:", xhr, e, response);
                        alert("horizonBarChart 에러!")
                    }
                });

                function horizonBarConf(res) {
                    // var groupChartData1 = [
                    //     {"dataCnt1": 17, "dataCnt2": 12, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":3, "dataCnt8":2, "dataCnt9":0,"itemcd":"BAC"},
                    //     {"dataCnt1": 0, "dataCnt2": 7, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":0, "dataCnt8":7, "dataCnt9":0,"itemcd":"FRO"},
                    //     {"dataCnt1": 4, "dataCnt2": 0, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":4, "dataCnt8":0, "dataCnt9":0,"itemcd":"FUL"},
                    //     {"dataCnt1": 0, "dataCnt2": 0, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":0, "dataCnt8":0, "dataCnt9":0,"itemcd":"MAI"},
                    //     {"dataCnt1": 1, "dataCnt2": 2, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":1, "dataCnt8":0, "dataCnt9":0,"itemcd":"AND"},
                    //     {"dataCnt1": 0, "dataCnt2": 0, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":0, "dataCnt8":0, "dataCnt9":0,"itemcd":"IOS"},
                    //     {"dataCnt1": 0, "dataCnt2": 0, "dataCnt3":0, "dataCnt4":1, "dataCnt5":1, "dataCnt6":0, "dataCnt7":0, "dataCnt8":0, "dataCnt9":0,"itemcd":"SEC"},
                    //     {"dataCnt1": 0, "dataCnt2": 0, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":0, "dataCnt8":0, "dataCnt9":0,"itemcd":"GAM"},
                    //     {"dataCnt1": 0, "dataCnt2": 0, "dataCnt3":0, "dataCnt4":0, "dataCnt5":0, "dataCnt6":0, "dataCnt7":0, "dataCnt8":0, "dataCnt9":0,"itemcd":"ETC106"}
                    // ];
                    // console.log("groupChartData1 Sample: ", groupChartData1);

                    var groupChartData = res;
                    console.log("groupChartData: ", res);
                    var columnsInfo = {
                        "dataCnt1": "Java",
                        "dataCnt2": "JavaScript",
                        "dataCnt3": "Python",
                        "dataCnt4": "C++",
                        "dataCnt5": "C",
                        "dataCnt6": "PHP",
                        "dataCnt7": "Kotlin",
                        "dataCnt8": "TypeScript",
                        "dataCnt9": "ETC"
                    };

                    const colors = ["#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"]
                    $("#chart").empty();
                    var barChartConfig = {
                        mainDiv: "#chart",
                        colorRange: colors,
                        data: groupChartData,
                        columnsInfo: columnsInfo,
                        xAxis: "data",
                        yAxis: "itemCd", /* 문제 위치 */
                        label: {
                            xAxis: "Total",
                            yAxis: "프로그래밍 언어"
                        },
                        requireLegend: true
                    };
                    drawHorizonBarChart(barChartConfig);
                }
            </script>

        </div>

    </div>
</section>


<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
