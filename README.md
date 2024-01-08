# Event Planner


This GitHub repository houses a Ruby on Rails application, part of The Odin Project's track, designed for managing events and invitations, enabling users to create events, invite others, and track attendance.

## Features:

### 1. User Management
- Users can sign up, log in, and manage their accounts.
- Unique usernames are enforced with a length requirement.
- The application includes user authentication using Devise gem.

### 2. Event Creation and Management
- Authenticated users can create new events with details such as title, description, location, date, and privacy setting.
- Events are categorized into past and future, with a validation to ensure the event date is not in the past.
- Event creators have the ability to edit or delete their own events.

### 3. Attendance Tracking
- Users can attend events, and the application prevents duplicate attendance.
- Attendance status is shown, and users can remove their attendance if needed.

### 4. Invitations
- Authenticated users can invite others to events.
- Invitations are tracked, and duplicate invitations are avoided.

### 5. User Profile
- Each user has a profile page where their details are displayed.

## Usage:

1. Clone the repository.
2. Install dependencies with `bundle install`.
3. Set up the database with `rails db:create`, `rails db:migrate`.
4. Run the server with `rails server`.
5. Access the application in your browser at `http://localhost:3000`.

Feel free to contribute, report issues, or suggest improvements. Happy coding!

## License:
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.