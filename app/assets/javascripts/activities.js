$(document).ready(function(){
$("#fecha").datepicker({
              language:'es',
              todayHighlight: false,
              format: 'yyyy-mm-dd',
              beforeShowDay: DisableDays

        });
        //var arr_list_days = new Array();
        //arr_list_days = list_days.split(",");
        //$('#fecha').datepicker('setDates', arr_list_days);  
        $('#fecha').datepicker('setDates', $("#first_day").val());  
        $('#fecha').datepicker().on('changeDate', function() {
                           param_day = '{"timetables_execution_date_eq"' + "=>" + "'" + $('#fecha').datepicker('getFormattedDate') + '"}'
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "script",
                                      url: "/activities/index_i",
                                      success: function(data) {
                                          
                                                                           
                                      },
                                      error: function(data){
                                          
                                          // mostramos mensaje de error
                                      },
                                      "data":{day:$('#fecha').datepicker('getFormattedDate') },
                                      "async": true,
                                      
                               });
        }); 

        function DisableDays(date){
           var formatted = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
           var str = list_days.toString();
           var res = (str.indexOf(formatted,0) >= 0) ? true : false
           return res

        }


        $('#q_addresses_district_eq').on('click', function() {
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "json",
                                      url: "/activities/boroughs",
                                      success: function(data) {
                                          $('#q_addresses_borough_eq').children().remove();
                                          $.each(data, function(i, location) 
             
                                          {
                                              $('#q_addresses_borough_eq').append('<option value=' + location + '>' + location + '</option>');
                                           
                                          });  




                                                                           
                                      },
                                      error: function(data){
                                          
                                          $('#q_addresses_borough_eq').children().remove();
                                      },
                                      "data":{district:$('#q_addresses_district_eq').val() },
                                      "async": true,
                                      
                               });
        }); 


});