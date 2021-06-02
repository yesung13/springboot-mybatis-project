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
    </style>
    <script src="https://d3js.org/d3.v6.min.js"></script>
    <script>
        $(function () {
            showD3Chart();
        });

        function showD3Chart() {
            var barGraph = "barGraph";

            $.ajax({
                method: 'GET',
                url: '/survey/surveyResultProc/' + barGraph,
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
    <%-- 선 그래프--%>
    <div class="mt-5">
        <%--        <svg width="350px" height="350px">--%>
        <%--        </svg>--%>
        <%--        <script>--%>
        <%--            const data1 = [--%>
        <%--                {value: 3, time: new Date("2019-03-22T03:00:00")},--%>
        <%--                {value: 1, time: new Date("2019-03-22T03:05:00")},--%>
        <%--                {value: 9, time: new Date("2019-03-22T03:10:00")},--%>
        <%--                {value: 6, time: new Date("2019-03-22T03:15:00")},--%>
        <%--                {value: 2, time: new Date("2019-03-22T03:20:00")},--%>
        <%--                {value: 6, time: new Date("2019-03-22T03:25:00")}--%>
        <%--            ];--%>

        <%--            const xScale = d3.scaleTime()--%>
        <%--                .domain([new Date("2019-03-22T03:00:00"), new Date("2019-03-22T03:25:00")])--%>
        <%--                .range([20, 330]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.--%>

        <%--            const yScale = d3.scaleLinear()--%>
        <%--                .domain([1, 9])--%>
        <%--                .range([330, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.--%>

        <%--            //SVG 안에 G 태그를 생성한다.--%>
        <%--            // const xAxisSVG = d3.select("svg").append("g");--%>
        <%--            const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0, 330)");--%>
        <%--            const yAxisSVG = d3.select("svg").append("g");--%>

        <%--            //축을 만드는 함수를 만든다.--%>
        <%--            const xAxis = d3.axisBottom(xScale).tickSize(10).ticks(10);--%>
        <%--            const yAxis = d3.axisRight(yScale).tickSize(10).ticks(10);--%>
        <%--            xAxis(xAxisSVG);  //x축을 만드는 함수로 SVG > G 태그에 축을 생성한다.--%>
        <%--            yAxis(yAxisSVG);  //y축을 만드는 함수로 SVG > G 태그에 축을 생성한다.--%>

        <%--            //점을 생성한다.--%>
        <%--            d3.select("svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.--%>
        <%--                .data(data1)                         // 2.찾은 요소에 데이터를 씌운다.--%>
        <%--                .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..--%>
        <%--                .append("circle")                   // 4.circle 을 추가한다.--%>
        <%--                .attr("r", 5)                       //  - 반지름 5픽셀--%>
        <%--                .attr("cx", d => xScale(d.time))      //  - x 위치값 설정.--%>
        <%--                .attr("cy", d => yScale(d.value))     //  - y 위치값 설정.--%>
        <%--                .style("fill", "black")             //  - 검정색--%>

        <%--            //선을 생성하는 함수--%>
        <%--            const linearGenerator = d3.line()--%>
        <%--                .x(d => xScale(d.time))--%>
        <%--                .y(d => yScale(d.value))--%>

        <%--            d3.select("svg")--%>
        <%--                .append("path")                     // SVG 태그 안에 path 속성을 추가한다.--%>
        <%--                .attr("d", linearGenerator(data1))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.--%>
        <%--                .attr("fill", "none")               // - 라인 안쪽 채우지 않음.--%>
        <%--                .attr("stroke-width", 2)            // - 굵기--%>
        <%--                .attr("stroke", "black")            // - 검정색--%>
        <%--        </script>--%>
    </div>

    <div><h1>Par1. 개발자 정보</h1></div>
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

                console.log("res:", res);
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
        <div class="jumbotronCus justify-content-center">

            <div class="row ">
                <svg id="pieGraph" width="900" height="400"></svg>
            </div>
            <script>
                var data = [1, 2, 4.4, 2, 1, 5, 4];

                // Selecting SVG using d3.select()
                var svg = d3.select("#pieGraph");

                // Creating Pie generator
                var pie = d3.pie();

                // Creating arc
                var arc = d3.arc()
                    .innerRadius(0) //안쪽 반지름 값, 0이면 완전한 원이되고 값이 있으면 도넛 형태
                    .outerRadius(150); //바깥쪽 반지름값

                let g = svg.append("g")
                    .attr("transform", "translate(150,120)");

                // Grouping different arcs
                var arcs = g.selectAll("arc")
                    .data(pie(data))
                    .enter()
                    .append("g");

                // Appending path
                arcs.append("path")
                    .attr("fill", (data, i) => {
                        let value = data.data;
                        return d3.schemeSet3[i + 1];
                    })
                    .attr("d", arc);

                // Adding data to each arc
                arcs.append("text")
                    .attr("transform", (d) => {
                        return "translate(" +
                            arc.centroid(d) + ")";
                    })
                    .text(function (d) {
                        return d.data;
                    });
            </script>
        </div>
    </div>



</section>


<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
