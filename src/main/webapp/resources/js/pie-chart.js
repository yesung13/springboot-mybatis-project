function showPieGraph() {
    const path = "pieGraph";

    $.ajax({
        method: 'GET',
        url: '/survey/surveyPieGraphProc/' + path,
        dataType: 'json',
        success: function (res) {
            console.log("success: ", res);
            drawPieGraph(res);
        },
        error: function (xhr, e, response) {
            console.log("Error:", xhr, e, response);
            alert("pieGraph 에러!")
        }
    });
}

function drawPieGraph(res) {
    // pie-chart.js
    const data = res;
    console.log("Pie Data:", res);

    const svg = d3.select("#pieGraph"),
        width = +svg.attr("width"),
        height = +svg.attr("height"),
        radius = Math.min(width, height) / 2,
        g = svg.append("g").attr("transform", "translate(" + radius + ",200 )");

    const color = d3.scaleOrdinal(d3.schemeCategory10);

    const pie = d3.pie()
        // .sort(null)
        // data의 value 큰값 > 작은값 순으로 정렬합니다. ex. 반대 순서는 a.value - b.value
        .sort((a, b) => b.pieVal - a.pieVal)
        .value(function (d) {
            return d.pieVal;
        });

    const path = d3.arc()
        .outerRadius(radius - 10)
        .innerRadius(30);

    const label = d3.arc()
        .outerRadius(radius + 10)
        .innerRadius(radius + 10);

    svg.append("text")
        .attr("transform", "translate(20,30)")
        .attr("font-size", "0.9em")
        .text("전체 (100%)");

    const arc = g.selectAll(".arc")
        .data(pie(data))
        .enter().append("g")
        .attr("class", "arc")
        .attr('stroke', 'white');

    arc.append("path")
        .attr("d", path)
        // .attr("fill", function(d) { return color(d.data.pieName); });
        .attr("fill", (data, i) => {
            // let value=data.data;
            return d3.schemeSet3[i];
            // return d3.schemeCategory10[i+4];
        }); // 파이 색상

    // Setup legend
    const legendDotSize = 70;
    const legendWrapper = svg.append("g")
        .attr("class", "legend")
        // .attr("transform", function(d) { return "translate("+radius*2+",20)"; });
        .attr("transform", function (d) {
            return "translate(600,20)";
        });

    // The text of the legend
    const legendText = legendWrapper.selectAll("text")
        .data(data);

    legendText.enter().append("text")
        .attr("y", function (d, i) {
            return i * legendDotSize + 20;
        })
        .attr("x", 60)
        .merge(legendText)
        .attr("font-size", "1.2em")
        .text(function (d) {
            return d.pieName;
            // return d.pieName + '(' + d.pieVal + '%)';
        });

    legendText.exit().remove();

    // The dots of the legend
    const legendDot = legendWrapper.selectAll("rect")
        .data(data);

    legendDot.enter().append("rect")
        .attr("y", function (d, i) {
            return i * legendDotSize;
        })
        .attr("rx", legendDotSize * 0.5)
        .attr("ry", legendDotSize * 0.5)
        .attr("width", legendDotSize * 0.5)
        .attr("height", legendDotSize * 0.5)
        .merge(legendDot)
        // .style("fill", function(d) { return color(d.label); })
        .style("fill", (data, i) => {
            return d3.schemeSet3[i];
        });

    legendDot.exit().remove();

    const arcs = pie(data);

    const arcLabel = (() => {
        const radius = Math.min(width, height) / 2 * 0.6;
        return d3.arc().innerRadius(radius).outerRadius(radius);
    })();
// 라벨이 위치할 반지름 값을 설정합니다.


    const text = g.selectAll('text')
        .data(arcs)
        .enter().append('text')
        .attr('transform', d => `translate(${arcLabel.centroid(d)})`)
        .attr('dy', '1em');
    // 라벨을 취가하기 위한 text 엘리먼트를 만들고 위치를 지정합니다.

    // text.append('tspan')
    //     .attr('x', 0)
    //     .attr('y', '-0.7em')
    //     .style('font-weight', 'bold')
    //     .text(d => d.data.pieName)
    // // 해당 데이터 항목의 이름을 두꺼운 글씨로 출력합니다. ex. A

    text.filter(d => (d.endAngle - d.startAngle > 0.25)).append('tspan')
        .attr('x', '-1.0em')
        .attr('y', '-0.3em')
        .attr('fill-opacity', 0.7)
        .style('font-size', '1.7em')
        .style('font-weight', 'bold')
        .text(d => d.data.pieVal + '%');
    // 해당 데이터의 수치값을 투명도를 주어 출력합니다. ex. 1000
}

