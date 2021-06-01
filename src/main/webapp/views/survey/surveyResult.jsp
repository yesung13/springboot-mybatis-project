<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-06-01
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>실태조사 결과</title>
    <meta charset="UTF-8">
    <script src="https://d3js.org/d3.v5.min.js"></script>
</head>
<body>
<%-- 헤더(navbar) --%>
<c:import url="/views/common/header.jsp"/>

<section class="container">
    <div class="mt-5">
        <svg width="350px" height="350px">
        </svg>
        <script>
            const data = [
                {value: 3, time: new Date("2019-03-22T03:00:00")},
                {value: 1, time: new Date("2019-03-22T03:05:00")},
                {value: 9, time: new Date("2019-03-22T03:10:00")},
                {value: 6, time: new Date("2019-03-22T03:15:00")},
                {value: 2, time: new Date("2019-03-22T03:20:00")},
                {value: 6, time: new Date("2019-03-22T03:25:00")}
            ];

            const xScale = d3.scaleTime()
                .domain([new Date("2019-03-22T03:00:00"), new Date("2019-03-22T03:25:00")])
                .range([20, 330]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.

            const yScale = d3.scaleLinear()
                .domain([1, 9])
                .range([330, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

            //SVG 안에 G 태그를 생성한다.
            // const xAxisSVG = d3.select("svg").append("g");
            const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0, 330)");
            const yAxisSVG = d3.select("svg").append("g");

            //축을 만드는 함수를 만든다.
            const xAxis = d3.axisBottom(xScale).tickSize(10).ticks(10);
            const yAxis = d3.axisRight(yScale).tickSize(10).ticks(10);
            xAxis(xAxisSVG);  //x축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
            yAxis(yAxisSVG);  //y축을 만드는 함수로 SVG > G 태그에 축을 생성한다.

            //점을 생성한다.
            d3.select("svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
                .data(data)                         // 2.찾은 요소에 데이터를 씌운다.
                .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..
                .append("circle")                   // 4.circle 을 추가한다.
                .attr("r", 5)                       //  - 반지름 5픽셀
                .attr("cx", d => xScale(d.time))      //  - x 위치값 설정.
                .attr("cy", d => yScale(d.value))     //  - y 위치값 설정.
                .style("fill", "black")             //  - 검정색

            //선을 생성하는 함수
            const linearGenerator = d3.line()
                .x(d => xScale(d.time))
                .y(d => yScale(d.value))

            d3.select("svg")
                .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
                .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
                .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
                .attr("stroke-width", 2)            // - 굵기
                .attr("stroke", "black")            // - 검정색
        </script>
    </div>
    <div class="mt-5">
        <script>
            $(function () {
                showD3Chart();
            });

            function showD3Chart() {
                var barGraph = "barGraph";

                $.ajax({
                    method: 'GET',
                    url: '/survey/surveyResultProc/'+ barGraph,
                    dataType: 'json',
                    success: function (res) {
                        console.log("success: ", res);
                        // location.replace("/survey/surveyResult")
                    },
                    error: function (xhr, e, response) {
                        console.log("Error:", xhr, e, response);
                        alert("에러!!")
                    }
                });
            }
        </script>
    </div>
</section>


<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
