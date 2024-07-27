<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.YearMonth"%>
<%@page import="DAOs.OrderDAO"%>
<div class="content-wrapper">
    <div class="container-full">
        <!-- Main content -->
        <section class="content">			
            <div class="card mb-3">
                <div class="card-header-tab card-header">
                    <div style="font-size: 20px" class="">
                        View Income In Month
                    </div>
                </div>
                <div id="chart3" ></div>
                <%
                    OrderDAO orderChartDao = new OrderDAO();
                    LocalDate currentDate = LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");

                    String monthYear = "";
                    if (session.getAttribute("month") != null) {
                        monthYear = (String) session.getAttribute("month");
                    } else {
                        monthYear = currentDate.format(formatter);
                    }

                    String month = monthYear.split("-")[1];

                    YearMonth yearMonth = YearMonth.of(Integer.parseInt(monthYear.split("-")[0]), Integer.parseInt(month));
                    int numberOfDaysInMonth = yearMonth.lengthOfMonth();

                    ArrayList<String> dates = new ArrayList<String>();

                    for (int i = 1; i <= numberOfDaysInMonth; i++) {
                        if (i < 10) {
                            dates.add(monthYear + "-" + "0" + String.valueOf(i));
                        } else {
                            dates.add(monthYear + "-" + String.valueOf(i));
                        }
                    }

                    String datesInMonth = "";
                    String dataIncome = "";
                    String dataOrders = "";
                    for (String date : dates) {
                        datesInMonth += "'" + date.split("-")[2] + "',";
                        dataIncome += orderChartDao.getTotalOfDate(Date.valueOf(date)) + ",";
                    }

                %>
                <script>
                    var options = {
                        series: [{
                                name: 'series1',
                                data: [<%=dataIncome%>]
                            }],
                        chart: {
                            height: 350,
                            type: 'area'
                        },
                        dataLabels: {
                            enabled: false
                        },
                        stroke: {
                            curve: 'smooth'
                        },
                        xaxis: {
                            type: 'month',
                            categories: [<%=datesInMonth%>]
                        },
                        tooltip: {
                            x: {
                                format: 'dd/MM/yy HH:mm'
                            },
                        },
                    };

                    var chart3 = new ApexCharts(document.querySelector("#chart3"), options);
                    chart3.render();

                </script>
            </div>
            <div class="card mb-3">
                <div class="card-header-tab card-header">

                    <form action="/admin" method="POST" class="container" >
                        <div class="row align-items-center">
                            <label for="month" class="col-sm-2 col-form-label">Choose Time</label>
                            <div class="col-sm-5">
                                <input type="month" class="form-control" id="month" name="month" value="<%=(String) session.getAttribute("month") != null ? session.getAttribute("month") : currentDate.format(formatter)%>">
                                <div class="message"></div>
                            </div>
                            <div class="col-sm-5">
                                <input type="hidden" name="setMonth" value="setMonth">
                                <button type="submit" class="btn btn-primary btn-lg">Set Month</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>