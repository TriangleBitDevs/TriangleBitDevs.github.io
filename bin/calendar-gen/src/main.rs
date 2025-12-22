use chrono::{DateTime, NaiveDate, NaiveTime, TimeZone, Utc};
use chrono_tz::Tz;
use dialoguer::{Input, Select};
use std::str::FromStr;

fn main() {
    println!("\n=== Triangle BitDevs Event Calendar Generator ===\n");

    // Get event title
    let title: String = Input::new()
        .with_prompt("Event title")
        .interact_text()
        .unwrap();

    // Get event date
    let date_str: String = Input::new()
        .with_prompt("Event date (YYYY-MM-DD)")
        .interact_text()
        .unwrap();

    let date = NaiveDate::parse_from_str(&date_str, "%Y-%m-%d")
        .expect("Invalid date format. Use YYYY-MM-DD");

    // Get start time
    let start_time_str: String = Input::new()
        .with_prompt("Start time (HH:MM, local time)")
        .with_initial_text("18:00")
        .interact_text()
        .unwrap();

    let start_time = NaiveTime::parse_from_str(&start_time_str, "%H:%M")
        .expect("Invalid time format. Use HH:MM");

    // Get end time
    let end_time_str: String = Input::new()
        .with_prompt("End time (HH:MM, local time)")
        .with_initial_text("20:00")
        .interact_text()
        .unwrap();

    let end_time = NaiveTime::parse_from_str(&end_time_str, "%H:%M")
        .expect("Invalid time format. Use HH:MM");

    // Get timezone
    let timezone_str: String = Input::new()
        .with_prompt("Timezone")
        .with_initial_text("America/New_York")
        .interact_text()
        .unwrap();

    let timezone: Tz = Tz::from_str(&timezone_str)
        .expect("Invalid timezone. Use IANA timezone format (e.g., America/New_York)");

    // Get location
    let location: String = Input::new()
        .with_prompt("Location")
        .with_initial_text("Fidelity Investments, 3200 Chapel Hill Blvd, Durham, NC 27707")
        .interact_text()
        .unwrap();

    // Get description
    let description: String = Input::new()
        .with_prompt("Description")
        .with_initial_text("Monthly Socratic Seminar discussing Bitcoin development")
        .interact_text()
        .unwrap();

    // Get event type
    let event_types = vec!["socratic", "reading_group"];
    let event_type_index = Select::new()
        .with_prompt("Event type")
        .items(&event_types)
        .default(0)
        .interact()
        .unwrap();
    let event_type = event_types[event_type_index];

    // Convert local times to UTC
    let start_local = timezone
        .from_local_datetime(&date.and_time(start_time))
        .single()
        .expect("Ambiguous datetime");
    let start_utc: DateTime<Utc> = start_local.with_timezone(&Utc);

    let end_local = timezone
        .from_local_datetime(&date.and_time(end_time))
        .single()
        .expect("Ambiguous datetime");
    let end_utc: DateTime<Utc> = end_local.with_timezone(&Utc);

    // Generate frontmatter
    println!("\n=== Generated Frontmatter ===\n");
    println!("+++");
    println!("title = \"{}\"", title);
    println!("date = {}", date);
    println!("template = \"page.html\"");
    println!();
    println!("[extra]");
    println!("event_type = \"{}\"", event_type);
    println!("add_to_calendar = true");
    println!("start = \"{}\"", start_utc.to_rfc3339());
    println!("end = \"{}\"", end_utc.to_rfc3339());
    println!("location = \"{}\"", location);
    println!("description = \"{}\"", description);
    println!("+++");
    println!();

    // Show conversion info
    println!("\n=== Time Conversion Info ===");
    println!("Local start: {} {} ({})", date, start_time_str, timezone_str);
    println!("UTC start:   {}", start_utc.format("%Y-%m-%d %H:%M:%S UTC"));
    println!("Local end:   {} {} ({})", date, end_time_str, timezone_str);
    println!("UTC end:     {}", end_utc.format("%Y-%m-%d %H:%M:%S UTC"));
    println!();
}
