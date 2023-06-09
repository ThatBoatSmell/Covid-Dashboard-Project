ui <- fluidPage(theme = bs_theme(bootswatch = "pulse"),
                column(width = 5,
                       h1(id="big-heading", " PHS Dashboard"),
                       tags$style(HTML("#big-heading{color: #FFFFFF;
                                 background-color: #3F3685;
                                 border-style: solid;
                                 border-color: #C1DD93}"))
                ),
                # titlePanel("Change me!", windowTitle = "Covid-19 Dashboard - DR20 group project"),
                tabsetPanel(
                  
                  tabPanel(
                    title = ".README",
                    
                    fluidRow(
                      column(width = 10,
                             offset = 0.5,
                             tags$br(),
                             p("This dashboard has been created by members of Codeclan's DR20 Professional Data Analysis Cohort. 
                         The purpose of the dashboard is to enable users to explore data relating to the provision of acute 
                         healthcare in Scotland. Although split into various sections, the  same 3x Key Performance Indicators
                         have been utilised throughout."),
                         tags$br(),
                         p(tags$b("1. Number of Hospital Admissions"), tags$br(), "Metric: Number of Episodes",
                           tags$br(), "Definition:", tags$em("An admission marks the start of an inpatient episode or day case episode. 
                         (The National Data Catalogue, Data Dictionary)")),
                         tags$br(),
                         p(tags$b("2. Average Length of Hospital Stay"), tags$br(), "Metric: Length of Stay OR Avg. Length of Stay",
                           tags$br(), "Definition:", tags$em("Length of stay is the length of an inpatient episode. 
                         (The National Data Catalogue, Data Dictionary)")),
                         tags$br(),
                         p(tags$b("3. Percentage of Bed Occupancy"), tags$br(), "Metric: Percentage of Bed Occupancy",
                           tags$br(), "Definition:", tags$em("An occupied bed is an available staffed bed which is either being used to 
                         accommodate an inpatient or reserved for a patient on pass. 
                         (The National Data Catalogue, Data Dictionary)")),
                         tags$br(),
                         p(tags$b("Data Quality:"), tags$br(), "All data has been sourced from Public Health Scotland 
                         (www.opendata.nhs.scot) and data used ranges from 2017Q3 to 2022Q3. All efforts have been made to ensure 
                         that the dashboard utilises as much of the available data as possible. For Percentage of Bed Occupancy, Length of Stay and
                         Year/Quarter data however, complete data was not always available and this should be taken into consideration when interpreting results."),
                      ),
                    )
                    
                  ),
                  
                  tabPanel(
                    title = "Statistical Analysis",
                    tags$br(),
                    tabsetPanel(
                      tabPanel(
                        title = "Hospital Admissions",
                        tags$h3("Number of Hospital Admissions"),
                        tags$br(),
                        print("The table below contains descriptive statistics for hospital admissions from 2017 Q3 - 2022 Q3. The graph shows the data distribution and provides statistical analysis for the following question."),
                        tags$br(),
                        tags$br(),
                        print("Question: Does the mean number of hopsital admissions differ between the Spring/Summer and Autumn/Winter months for all Health Boards?"),
                        tags$br(),
                        print("Significance level: α = 0.05"),
                        tags$br(),
                        tags$br(),
                        print("Interpretation:"),
                        tags$br(),
                        print("Based on our two-sample test of means using bootstrap resampling our p-value (0.976) is not less than our significance level so we fail to reject
                               the null hypothesis. Based on our data there is not sufficient evidence to suggest that the mean number of hospital admissions differs between 
                               the Spring/Summer and Autumn/Winter months."), 
                        tags$br(),
                        tags$br(),
                        fluidRow(
                          column(width = 3,
                                 actionButton(inputId = "hospital_admission_stat_update",
                                              label = "Update Tables",
                                              icon = icon("refresh"))
                          )
                        ),
                        fluidRow(
                          column(width = 4,
                                 selectInput(inputId = "hospital_admission_stats_health_board_input",
                                             label = "Select Health Board(s):",
                                             choices = health_board_choice,
                                             multiple = TRUE
                                 )
                          ),
                          column(width = 4,
                                 selectInput(inputId = "hospital_admission_stats_quarter_input",
                                             label = "Select Quarter(s):",
                                             choices = c("1", "2", "3", "4"),
                                             multiple = TRUE
                                 ),
                          ),
                          column(width = 4,
                                 selectInput(inputId = "hospital_admission_stats_year_input",
                                             label = "Select Year:",
                                             choices = c("2017", "2018", "2019", "2020", "2021", "2022"),
                                             multiple = TRUE
                                 )
                          ),
                        ),
                        
                        
                        fluidRow(
                          column(width = 8,
                                 dataTableOutput("hospital_admission_stats_split_output")
                          ),
                          column(width = 1,
                                 img(src = "av_hosp_correcto.png", style = "width: 800px"))
                        ),
                      ), # tab panel - admissions
                      tabPanel(
                        title = "Average Length of Stay",
                        tags$h3("Length of Stay"),
                        tags$br(),
                        print("The table below contains descriptive statistics for hospital admissions from 2017 Q3 - 2022 Q3. The graph shows the data distribution and provides statistical analysis for the following question."),
                        tags$br(),
                        tags$br(),
                        print("Question: Does the mean average length of stay differ between the Spring/Summer and Autumn/Winter months for all Health Boards?"),
                        tags$br(),
                        print("Significance level: α = 0.05"),
                        tags$br(),
                        tags$br(),
                        print("Interpretation:"),
                        tags$br(),
                        print("Based on our two-sample test of means using bootstrap resampling our p-value (0.984) is not less than our significance level so we fail to reject
                               the null hypothesis. Based on our data there is not sufficient evidence to suggest that the mean average length of stay differs between 
                               the Spring/Summer and Autumn/Winter months."), 
                        tags$br(),
                        tags$br(),
                        fluidRow(
                          column(width = 3,
                                 actionButton(inputId = "length_of_stay_stat_update",
                                              label = "Update Tables",
                                              icon = icon("refresh"))
                          )
                        ),
                        fluidRow(
                          column(width = 4,
                                 selectInput(inputId = "length_of_stay_stats_health_board_input",
                                             label = "Select Health Board(s):",
                                             choices = health_board_choice,
                                             multiple = TRUE
                                 )
                          ),
                          column(width = 4,
                                 selectInput(inputId = "length_of_stay_stats_quarter_input",
                                             label = "Select Quarter(s):",
                                             choices = c("1", "2", "3", "4"),
                                             multiple = TRUE
                                 ),
                          ),
                          column(width = 4,
                                 selectInput(inputId = "length_of_stay_stats_year_input",
                                             label = "Select Year:",
                                             choices = c("2017", "2018", "2019", "2020", "2021", "2022"),
                                             multiple = TRUE
                                 )
                          ),
                        ),
                        fluidRow(
                          column(width = 8,
                                 dataTableOutput("length_of_stay_stats_output")
                          ),
                          column(width = 1,
                                 img(src = "av_length_graph.png", style = "width: 800px"))
                        ),
                        
                      ), # tab panel length of stay
                      tabPanel(
                        title = "Percentage of Bed Occupancy",
                        tags$h3("Hospital Beds Occupancy"),
                        tags$br(),
                        print("The table below contains descriptive statistics for the percentage of bed occupancy from 2017 Q3 - 2022 Q3. The graph shows the data distribution and provides statistical analysis for the following question."),
                        tags$br(),
                        tags$br(),
                        print("Question: Does the mean percentage of bed occupancy differ between the Spring/Summer and Autumn/Winter months for all Health Boards?"),
                        tags$br(),
                        print("Significance level: α = 0.05"),
                        tags$br(),
                        tags$br(),
                        print("Interpretation:"),
                        tags$br(),
                        print("Based on our two-sample test of means using bootstrap resampling, our p-value (0.986) is not less than our significance level so we fail to reject
                               the null hypothesis. Based on our data there is not sufficient evidence to suggest that the mean percentage of bed occupancy differs between 
                               the Spring/Summer and Autumn/Winter months."),
                        tags$br(),
                        tags$br(),
                        fluidRow(
                          column(width = 3,
                                 actionButton(inputId = "beds_stat_update",
                                              label = "Update Tables",
                                              icon = icon("refresh"))
                          )
                        ),
                        fluidRow(
                          column(width = 4,
                                 selectInput(inputId = "beds_stats_health_board_input",
                                             label = "Select Health Board(s):",
                                             choices = health_board_choice,
                                             multiple = TRUE
                                 )
                          ),
                          column(width = 4,
                                 selectInput(inputId = "beds_stats_quarter_input",
                                             label = "Select Quarter(s):",
                                             choices = c("Q1", "Q2", "Q3", "Q4"),
                                             multiple = TRUE
                                 ),
                          ),
                          column(width = 4,
                                 selectInput(inputId = "beds_stats_year_input",
                                             label = "Select Year:",
                                             choices = c("2017", "2018", "2019", "2020", "2021", "2022"),
                                             multiple = TRUE
                                 )
                          ),
                        ),
                        fluidRow(
                          column(width = 8,
                                 dataTableOutput("beds_stats_output")
                          ),
                          column(width = 1,
                                 img(src = "av_bed_occ_graph.png", style = "width: 800px"))
                        ),
                      ) 
                    ) # tab set panel
                  ),
                  
                  
                  tabPanel(
                    title = "Trends over Time",
                    tags$br(),
                    fluidRow(
                      column(width = 3,
                                    radioButtons(inputId = "temporal_plot_type_input",
                                                 label = tags$b("View:"),
                                                 choices = c("Total Number of Admissions", "Mean Length of Stay")
                                    ),
                    ),
                    ),
                    fluidRow(
                    column(width = 3,
                           pickerInput(inputId = "admission_input_tempo",
                                       label = tags$b("Admission Type:"),
                                       choices = admission_choice,
                                       selected = "All Inpatients")
                           
                           
                    ),
                    column(width = 3,
                           
                           pickerInput(inputId = "health_board_input_tempo",
                                       label = tags$b("Health Board:"),
                                       choices = health_board_choice,
                                       selected = "All of Scotland",
                                       multiple = TRUE,
                                       pickerOptions(actionsBox = TRUE))
                    ),
                    
                    column(width = 3,
                           p("The selections allow visualisation of trends in the total number of admissions and the mean length of stay from Q3 2017 to Q3 2022.", style="text-align:justify;color:black;background-color:#DAEBBE;padding:15px;border-radius:10px"))
                    
                    ),
                    fluidRow(
                      column(width = 3,
                             actionButton(inputId = "update_temporal",
                                          label = tags$b("Update"),
                                          icon = icon("refresh"))
                      ),
                    ), 
                    fluidRow(column(width = 10,
                                    offset = 1,
                                    plotOutput("temporal_output"),
                    ),
                    ),
                  ),
                  
                  tabPanel(
                    title = "Trends by Location",
                    tags$br(),
                    fluidRow(
                      
                      column(width = 3,
                             selectInput(inputId = "year_input_geo",
                                         label = tags$b("Select Year:"),
                                         choices = geo_year_choice,
                                         selected = 2020)
                      ),
                      column(width = 3,
                             selectInput(inputId = "quarter_input_geo",
                                         label = tags$b("Select Quarter:"),
                                         choices = geo_quarter_choice,
                                         selected = "Q1")
                      ),
                      column(width = 5,
                             p("Bed Occupancy Numbers for each Hospital in each Quarter", style="text-align:justify;color:black;background-color:#DAEBBE;padding:15px;border-radius:10px"))
                    ),
                    fluidRow(
                      column(width = 4,
                             actionButton(inputId = "update_geo_date",
                                          label = tags$b("Update Map"),
                                          icon = icon("map-location-dot")))
                    ),
                    
                    fluidRow(
                      column(offset = 1,
                             width = 10,
                             leafletOutput("geo_map_output")
                      ),
                      
                      tags$hr(),
                    ),
                    tags$br(),
                    fluidRow(
                      column(width = 4,
                             pickerInput(inputId = "health_board_input_geo",
                                         label = tags$b("Select Health Board:"),
                                         choices = geo_healthboard_choice,
                                         selected = "All of Scotland",
                                         pickerOptions(actionsBox = TRUE),
                                         multiple = TRUE),
                             
                      ),
                     
                      
                      column(width = 8,
                             p("Trends in the Percentage of Bed Occupancy Numbers for each NHS Health Board", style="text-align:justify;color:black;background-color:#DAEBBE;padding:15px;border-radius:10px"))
                    # ),
                    ),
                  fluidRow(
                  column(width = 3,
                             actionButton(inputId = "update_geo",
                                          label = "Update",
                                          icon = icon("refresh")
                             ),
                         )
                  ),
                    tags$br(),
                    fluidRow(column(width = 10,
                                    offset = 1,
                                    plotOutput("geo_output"),
                    ),
                    ),
                  ),
                  tabPanel(
                    title = "Changes to Medical Speciality Numbers",
                    tabsetPanel(
                      tabPanel(
                        title = "Average Length of Stay by Speciality",
                        
                        fluidRow( 
                          column(width = 4,
                                 pickerInput(
                                   inputId = "speciality_input",
                                   label = "Please select Speciality(s)",
                                   choices = speciality_choice,
                                   multiple = TRUE,
                                   selected = "General Surgery",
                                   pickerOptions(actionsBox = TRUE)
                                 ),
                          ),
                          column(width = 5,
                                 p("Differences in average length of stay for admissions to Medical Speciality Departments", style="text-align:justify;color:black;background-color:#DAEBBE;padding:15px;border-radius:10px"))
                        ),
                        
                        actionButton(inputId = "update_speciality",
                                     label = "Update Dashboard",
                                     icon = icon("cat", class = "fa-bounce")),
                        fluidRow(
                          plotOutput("speciality_output"),
                        ),
                      ), # closes tabPanel for speciality by mean
                      tabPanel(
                        title = "Hospital Admissions by Medical Speciality",
                        fluidRow(
                          column(width = 4,
                                 pickerInput(
                                   inputId = "speciality_input_longer",
                                   label = "Please select Speciality(s)",
                                   choices = speciality_choice_longer,
                                   multiple = TRUE,
                                   selected = "General Surgery",
                                   pickerOptions(actionsBox = TRUE)
                                 )
                          ),
                          column(width = 5,
                                 p("Differences in hospital admissions to Medical Speciality Departments", style="text-align:justify;color:black;background-color:#DAEBBE;padding:15px;border-radius:10px"))
                        ),
                        fluidRow(
                          column(width = 4,
                                 actionButton(inputId = "update_speciality_means",
                                              label = "Update Dashboard",
                                              icon = icon("cat", class = "fa-bounce")),
                          )
                        ),
                        fluidRow(
                          plotOutput("speciality_occupancy"),
                        )
                        
                      ) # closes tabPanel
                    ) # closes tabSetPanel
                  ), # closes tabPanel for speciality
                  
                  
                  
                  
                  tabPanel(
                    title = "Demographics",
                    tabsetPanel(
                      tabPanel(
                        title = "Age",
                        tags$br(),
                        fluidRow(
                          tags$br(),
                          column(width = 3,
                                 
                                 radioButtons(inputId = "age_plot_type_input",
                                              label = tags$b("View:"),
                                              choices = c("Mean No. of Admissions", "Mean Length of Stay"))
                          ),

                          column(width = 3,
                                 
                                 
                                 pickerInput(inputId = "age_input",
                                             label = tags$b("Age Range(s):"),
                                             choices = age_choice,
                                             multiple = TRUE,
                                             selected = "20-29",
                                             pickerOptions(actionsBox = TRUE))
                          ),
                          
                          
                          
                          column(width = 6,
                                 p(tags$b("Question:"), "Does the mean number of hospital admissions differ between individuals over 50 and under 50?",tags$br(),
                                   tags$b("Test:"), "Two Sample Mean Test", tags$br(),
                                   tags$b("Significance Level:"), "α0.05", tags$br(),
                                   tags$b("Results/Interpretation:"), "Based on a bootstrapped NULL distribution, a very low p-value which is less than 0.05 is returned. We therefor reject 
                                   H0 with evidence suggesting that there is a statistically significant difference in admission numbers 
                                   between those over 50 and those under 50."),
                                   
                        ),
                        ),
                        
                        fluidRow(
                          
                          column(width = 4,
                                 actionButton(inputId = "update_demo_age",
                                              label = tags$b("Update"),
                                              icon = icon("refresh"))
                          )
                        ),
                        
                        fluidRow(
                          column(width = 10,
                                 offset = 1,
                                 plotOutput("demo_age_output"),
                          ),
                          
                        ),
                      ),
                      tabPanel(
                        title = "Deprivation",
                        tags$br(),
                        fluidRow( 
                          column(width = 3,
                                 
                                 radioButtons(inputId = "deprivation_plot_type_input",
                                              label = tags$b("View:"),
                                              choices = c("Mean No. of Admissions", "Mean Length of Stay"))
                          ),

                          column(width = 3,
                                 
                                 
                                 pickerInput(inputId = "deprivation_input",
                                             label = tags$b("Deprivation Index (1 Most Deprived / 5 Least Deprived):"),
                                             choices = deprivation_choice,
                                             multiple = TRUE,
                                             pickerOptions(actionsBox = TRUE),
                                             selected = 1)
                          ),
                          
                          column(width = 6,
                                 p(tags$b("Question:"), "Does the mean number of hospital admissions differ between highest and lowest deprivation index?",tags$br(),
                                   tags$b("Test:"), "Two Sample Mean Test", tags$br(),
                                   tags$b("Significance Level:"), "α0.05", tags$br(),
                                   tags$b("Results/Interpretation:"), "Based on a bootstrapped NULL distribution, a very low p-value which is less than 0.05 is returned. 
                                   We therefor reject H0 with evidence suggesting that there is a statistically significant 
                                   difference in admission numbers between those in the highest and lowest deprivation groups."),
                          ),
                        ), 
                  
                  fluidRow(
                    column(width = 4,
                           actionButton(inputId = "update_demo_deprivation",
                                        label = tags$b("Update"),
                                        icon = icon("refresh")
                           )
                    ),
                    
                    fluidRow(
                      plotOutput("demo_deprivation_output")
                    ),
                    
                  ),
                      ),
                  tabPanel(
                    title = "Gender & Age",
                    tags$br(),
                    fluidRow(
                      column(width = 3,
                             radioButtons(inputId = "age_gender_plot_type_input",
                                          label = tags$b("View:"),
                                          choices = c("No. of Admissions", "Average Length of Stay"))
                      ),

                      tags$br(),
                      column(width = 3,
                             pickerInput(inputId = "gender_age_input",
                                         label = tags$b("Age Range(s):"),
                                         choices = age_choice,
                                         multiple = TRUE,
                                         pickerOptions(actionsBox = TRUE),
                                         selected = "20-29"),
                      ),
                      
                    
                    column(width = 6,
                           p(tags$b("Question:"), "Does the mean number of hospital admissions differ between females and males?",tags$br(),
                             tags$b("Test:"), "Two Sample Mean Test",tags$br(),
                             tags$b("Significance Level:"), "α0.05",tags$br(),
                             tags$b("Results/Interpretation:"), "Based on a bootstrapped NULL distribution, a p-value of 0.62 is returned which is greater than the 
                             significance level. We therefor fail to reject H0 as there is insufficient evidence to suggest there 
                             is a statistically significant difference in number of admissions between females and males."), 
                           
                    ),
                    ),
                    
                    fluidRow(
                      column(width = 4,
                             actionButton(inputId = "update_demo_gender_age",
                                          label = tags$b("Update"),
                                          icon = icon("refresh")),
                      )
                    ),
                    
                    fluidRow(column(width = 10,
                                    offset = 1,
                                    plotOutput("demo_age_gender_output"),
                    ),
                    ),
                    
                    fluidRow(
                      print("Only years where complete data is available have been included.")
                      
                    ),
                  ),
                    ),
                  ),
                ),
                # WARNING: THIS MUST BE OUTSIDE tabSetPanel!
                hr(),
                print("Data taken from "),
                tags$a(href = "https://www.opendata.nhs.scot/dataset?groups=covid-19",
                       "Public Health Scotland"),
                tags$br(),
                print("Icons taken from "),
                tags$a(href = "https://fontawesome.com/icons",
                       "FontAwesome")
)
