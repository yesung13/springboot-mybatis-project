const data = [
    {
        State: "CA",
        val1: 2704659,
        val2: 4499890,
        val3: 2159981,
        val4: 3853788,
        val5: 10604510,
        val6: 8819342,
        val7: 4114496
    },
    {
        State: "TX",
        val1: 2027307,
        val2: 3277946,
        val3: 1420518,
        val4: 2454721,
        val5: 7017731,
        val6: 5656528,
        val7: 2472223
    },
    {
        State: "NY",
        val1: 1208495,
        val2: 2141490,
        val3: 1058031,
        val4: 1999120,
        val5: 5355235,
        val6: 5120254,
        val7: 2607672
    },
    {
        State: "FL",
        val1: 1140516,
        val2: 1938695,
        val3: 925060,
        val4: 1607297,
        val5: 4782119,
        val6: 4746856,
        val7: 3187797
    }
];

const groupKey = data.columns[0];

const keys = data.columns.slice(1);

const margin = ({top: 10, right: 150, bottom: 20, left: 40});

const height = 500;


const y0 = d3.scaleBand()
    .domain(data.map(d => d[groupKey]))
    .rangeRound([margin.top, height - margin.bottom])
    .paddingInner(0.1);

const y1 = d3.scaleBand()
    .domain(keys)
    .rangeRound([y0.bandwidth(), 0])
    .padding(0.05);

const x = d3.scaleLinear()
    .domain([0, d3.max(data, d => d3.max(keys, key => d[key]))]).nice()
    .rangeRound([margin.left, width - margin.right]);

const legend = svg => {
    const g = svg
        .attr("transform", `translate(${width},0)`)
        .attr("text-anchor", "end")
        .attr("font-family", "sans-serif")
        .attr("font-size", 10)
        .selectAll("g")
        .data(color.domain().slice().reverse())
        .join("g")
        .attr("transform", (d, i) => `translate(0,${i * 20})`);
}

const xAxis = g => g
    .attr("transform", `translate(0,${height - margin.bottom})`)
    .call(d3.axisBottom(x).tickSizeOuter(0))
    .call(g => g.select(".domain").remove())
    .call(d3.axisBottom(x).ticks(3, "s"))
    .call(g => g.select(".tick:last-of-type text").clone()
        .attr("x", 15)
        .attr("text-anchor", "start")
        .attr("font-weight", "bold")
        .text(data.y));

const yAxis = g => g
    .attr("transform", `translate(${margin.left},0)`)
    .call(d3.axisLeft(y0).ticks(null, "s"))
    .call(g => g.select(".domain").remove());


// const svg = d3.select(DOM.svg(width, height));
const svg = d3.select('#horizonBarChart');

svg.append("g")
    .selectAll("g")
    .data(data)
    .join("g")
    .attr("transform", d => `translate(0,${y0(d[groupKey])})`)
    .selectAll("rect")
    .data(d => keys.map(key => ({key, value: d[key]})))
    .join("rect")
    .attr("x", d => x(0))
    .attr("y", d => y1(d.key))
    .attr("height", y1.bandwidth())
    .attr("width", d => x(d.value) - x(0))
    .attr("fill", d => color(d.key));

svg.append("g")
    .call(xAxis);

svg.append("g")
    .call(yAxis);

svg.append("g")
    .call(legend);

svg.node();




