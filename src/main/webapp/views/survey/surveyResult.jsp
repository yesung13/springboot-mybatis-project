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
    <style>
        .bar {
            fill: steelblue;
        }

    </style>
    <meta charset="UTF-8">
    <%--    <script src="${pageContext.request.contextPath}/resources/d3/d3.min.js"></script>--%>
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
    <div class="mt-5" id="barGraph">
        <script>
            $(function () {
                // showD3Chart();
                drawChart();
            });

            function showD3Chart() {
                var barGraph = "barGraph";

                $.ajax({
                    method: 'GET',
                    url: '/survey/surveyResultProc/' + barGraph,
                    dataType: 'json',
                    success: function (res) {
                        console.log("success: ", res);
                        // $.each(res, function (index, item) {
                        //
                        // });
                    },
                    error: function (xhr, e, response) {
                        console.log("Error:", xhr, e, response);
                        alert("에러!!")
                    }
                });
            }

            function drawChart() {
                // // set the dimensions and margins of the graph
                // var margin = {top: 20, right: 20, bottom: 30, left: 40},
                //     width = 960 - margin.left - margin.right,
                //     height = 500 - margin.top - margin.bottom;
                //
                // // set the ranges
                // var x = d3.scaleBand()
                //     .range([0, width])
                //     .padding(0.1);
                // var y = d3.scaleLinear()
                //     .range([height, 0]);
                //
                // // append the svg object to the body of the page
                // // append a 'group' element to 'svg'
                // // moves the 'group' element to the top left margin
                // var svg = d3.select("#barGraph").append("svg")
                //     .attr("width", width + margin.left + margin.right)
                //     .attr("height", height + margin.top + margin.bottom)
                //     .append("g")
                //     .attr("transform",
                //         "translate(" + margin.left + "," + margin.top + ")");
                //
                //
                // // get the data
                // d3.json("/survey/surveyResultProc/barGraph").then(function (data) {
                //     console.log(data);
                //     // format the data
                //     data.forEach(function (d) {
                //         console.log(d.majorValue + "," + d.majorItem);
                //         d.majorValue = +d.majorValue;
                //     });
                //
                //     // Scale the range of the data in the domains
                //     x.domain(data.map(function (d) {
                //         return d.majorValue;
                //     }));
                //     y.domain([0, d3.max(data, function (d) {
                //         return d.majorValue;
                //     })]);
                //
                //     // append the rectangles for the bar chart
                //     svg.selectAll(".bar")
                //         .data(data)
                //         .enter().append("rect")
                //         .attr("class", "bar")
                //         .attr("x", function (d) {
                //             return x(d.majorItem);
                //         })
                //         .attr("width", x.bandwidth())
                //         .attr("y", function (d) {
                //             return y(d.majorValue);
                //         })
                //         .attr("height", function (d) {
                //             return height - y(d.majorValue);
                //         });
                //
                //     // add the x Axis
                //     svg.append("g")
                //         .attr("transform", "translate(0," + height + ")")
                //         .call(d3.axisBottom(x));
                //
                //     // add the y Axis
                //     svg.append("g")
                //         .call(d3.axisLeft(y));
                //
                // });
                //     const svg = d3.create("svg")
                //         .attr("viewBox", [0, 0, width, height]);
                //
                //     svg.append("g")
                //         .attr("fill", color)
                //         .selectAll("rect")
                //         .data(data)
                //         .join("rect")
                //         .attr("x", (d, i) => x(i))
                //         .attr("y", d => y(d.value))
                //         .attr("height", d => y(0) - y(d.value))
                //         .attr("width", x.bandwidth());
                //
                //     svg.append("g")
                //         .call(xAxis);
                //
                //     svg.append("g")
                //         .call(yAxis);
                //
                //     return svg.node();

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
                    .range(["#16A085", "#33435C"]);

                var vals = '[{"Race":"R1","HTC":270,"Registry":449},{"Race":"R2","HTC":202,"Registry":327},{"Race":"R3","HTC":120,"Registry":214},{"Race":"R4","HTC":114,"Registry":193},{"Race":"R5","HTC":894,"Registry":155},{"Race":"R6","HTC":737,"Registry":134}]';
                data = JSON.parse(vals);
                var keys = Object.keys(data[0]).slice(1);

                x0.domain(data.map(function(d) {
                    return d.Race;
                }));
                x1.domain(keys).rangeRound([0, x0.bandwidth()]);
                y.domain([0, d3.max(data, function(d) {
                    return d3.max(keys, function(key) {
                        return d[key];
                    });
                })]).nice();

                g.append("g")
                    .selectAll("g")
                    .data(data)
                    .enter().append("g")
                    .attr("transform", function(d) {
                        return "translate(" + x0(d.Race) + ",0)";
                    })
                    .selectAll("rect")
                    .data(function(d) {
                        debugger;
                        return keys.map(function(key) {
                            return {
                                key: key,
                                value: d[key]
                            };
                        });
                    })
                    .enter().append("rect")
                    .attr("x", function(d) {
                        return x1(d.key);
                    })
                    .attr("y", function(d) {
                        return y(d.value);
                    })
                    .attr("width", x1.bandwidth())
                    .attr("height", function(d) {
                        return height - y(d.value);
                    })
                    .attr("fill", function(d) {
                        return z(d.key);
                    });

                g.append("g")
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
                    .text("Population");

                var legend = g.append("g")
                    .attr("font-family", "sans-serif")
                    .attr("font-size", 10)
                    .attr("text-anchor", "end")
                    .selectAll("g")
                    .data(keys.slice().reverse())
                    .enter().append("g")
                    .attr("transform", function(d, i) {
                        return "translate(0," + i * 20 + ")";
                    });

                legend.append("rect")
                    .attr("x", width - 19)
                    .attr("width", 19)
                    .attr("height", 19)
                    .attr("fill", z);

                legend.append("text")
                    .attr("x", width - 24)
                    .attr("y", 9.5)
                    .attr("dy", "0.32em")
                    .text(function(d) {
                        return d;
                    });

            }
        </script>
    </div>
</section>


<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
