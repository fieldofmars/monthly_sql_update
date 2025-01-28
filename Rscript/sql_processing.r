    library(sql)
    library(dplyr)

    # Load SQL script from sql directory
    sql_file <- 'create_tables.sql'
    
    # Validate SQL file exists and has content
    if (!file.exists(sql_file)) {
      stop("SQL file not found")
    }
    if (readLines(sql_file) == 0) {
      stop("SQL file is empty")
    }

    # Execute SQL script in R
    db <- src("sqlite", "database.db")
    sql(tbl("create_tables"))$exec()

    # Load second SQL script for analysis
    analysis_sql <- 'analysis.sql'
    
    if (!file.exists(analysis_sql)) {
      stop("Analysis SQL file not found")
    }
    if (readLines(analysis_analysis) == 0) {
      stop("Analysis SQL file is empty")
    }

    # Create dataframe from tables
    df <- tbl(db, "results")$exec()

    # Export dataframe to Excel
    write_excel("results.xlsx", df)

    # Email results using HTML template
    send_email(
      to = "stakeholder@example.com",
      subject = "Daily Report",
      body = render_html("email_template.html")
    )

    # Cleanup database connection
    db.close()
  </Rscript>

  <boltAction type="file" filePath="sql/template.html">
