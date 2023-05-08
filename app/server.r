
server <- function(input, output, session) {

  # These are test outputs - must be altered to fit real data set!
  # WARNING! THESE LOOK TERRIBLE!
  
  filtered_temporal <- eventReactive(eventExpr = input$update_temporal,
                                     valueExpr = {
                                       clean_hosp_admissions_qyear %>% 
                                         filter(admission_type %in% input$admission_input_tempo,
                                                nhs_health_board %in% input$health_board_input_tempo) %>%
                                         group_by(quarter) %>% 
                                         summarise(total_episodes = sum(episodes))
                                     })
  
  filtered_geo <- eventReactive(eventExpr = input$update_geo,
                                valueExpr = {
                                  test_data_year %>% 
                                    filter(HB %in% input$health_board_input,
                                           year == input$year_input_geo)
                                })
  
  filtered_age_demo <- eventReactive(eventExpr = input$update_demo,
                                 valueExpr = {
                                   admission_demographics_all %>%
                                     filter(age %in% input$age_input) %>% 
                                     group_by(quarter, age, pre_post_2020) %>% 
                                     summarise(mean_admissions = mean(episodes)) %>% 
                                     ggplot(aes(x = quarter, y = mean_admissions)) +
                                     geom_point(aes(colour = age)) +
                                     geom_line(aes(group = age, colour = age)) +
                                     facet_wrap(~pre_post_2020) +
                                     labs(
                                       x = "\n Quarter",
                                       y = "Mean Episodes of Care \n",
                                       title = "Mean Episodes of Care by Age & Quarter",
                                       colour = "Age:")
                                   })
  max_total_episodes <- eventReactive(eventExpr = input$update_temporal,
                                      valueExpr = {
                                        clean_hosp_admissions_qyear %>%
                                          filter(admission_type %in% input$admission_input_tempo,
                                                 nhs_health_board %in% input$health_board_input_tempo) %>%
                                          group_by(quarter) %>%
                                          summarise(total_episodes = sum(episodes)) %>%
                                          select(total_episodes) %>%
                                          slice_max(total_episodes, n = 1) %>% 
                                          pull()
                                      })
  output$temporal_out <- renderPlot(
    filtered_temporal() %>% 
      ggplot() +
      aes(x = quarter, y = total_episodes) +
      geom_line(aes(group = 1, colour = "red"),show.legend = FALSE) +
      geom_point(size = 4, shape = 17, colour = "red") +
      geom_line(aes(group = quarter)) +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 0.5))+
      scale_colour_brewer(palette = "Dark2") +
      geom_label(
        label = "Pre-2020",
         x = 2.5,
         y = max_total_episodes(),
        label.padding = unit(0.15, "lines"),
        label.size = 0.15,
        color = "black"
      ) +
      geom_label(
        label = "Post-2020",
         x = 20,
         y = max_total_episodes(),
        label.padding = unit(0.15, "lines"),
        label.size = 0.15,
        color = "black"
      ) +
      geom_vline(xintercept = 10.5, linetype = "dashed") +
      labs(
        title = "Total Number of Hospital Admissions",
        subtitle = "Quarterly Data from Q3 2017-Q3 2022\n",
        x = "Quarter",
        y = "Hospital Admissions")
  )
  
  output$geo_output <- renderPlot(
    filtered_geo() %>% 
      ggplot(aes(x = WeekEnding, y = NumberAdmissions)) +
      geom_line(aes(colour = HB))
  )
  
  output$demo_age_output <- renderPlot(
    filtered_age_demo()
  )
}