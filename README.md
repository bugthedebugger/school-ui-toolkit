# Basic UI Toolkit [Theme: School]

![Featured image](https://user-images.githubusercontent.com/9513691/88762659-541ef700-d191-11ea-8492-19acdc90e71c.png)

## Descrption

A basic UI toolkit to get you started with flutter application development.

**Widget List:**

- **SchoolToolkitButton:** Button with a busy indicator
- **SchoolLocationWidget:** Card to display school information
- **OutlinedButton:** Button with only outline border with a busy indicator
- **SchoolToolkitTextField:** Custom text field
- **SchoolToolkitRoleButton:** Animated role selection button
- **OverlappingButtonCard:** Overlapping container with a hovering button on the bottom
- **Calendar:** Calendar with two view states: [expanded(shows the entire calendar), shrink(shows only a week)]
- **NepaliCalendar:** Nepali Calendar with two view states: [expanded(shows the entire calendar), shrink(shows only a week)]
- **EventCard:** Displays the time and event
- **RoutineCard:** Displays the Name of class, Subject, Time and Professor.
- **DeadlineCard:** Display a deadline
- **AssignmentCard:** Displays the assignment, deadline, subject with optional parameters to handle upload
- **HighlightedIcon:** Custom container that highlights the icon passed. Takes in an optional busy parameter to display loading indicator.
- **FeaturedVideoCard:** Display a featured video thumbnail with a title.
- **VideoListTileCard:** Display a listtile with thumbnail, title and author.
- **ProfileCard:** Custom profile card.
- **BusRouteWidget:** Display a bus route. Takes in title and a subtitle.
- **NoticeCard:** Custom notice widget that takes in title, subtitle, formatted date string with exposed on tap handler.
- **LabelCard:** Display a custom text label. Takes in label string, width, height, text style and color.

## Example

The example file contains a catalog for all the available widgets.

### SchoolToolkitButton

```dart
SchoolToolkitButton(
    onPressed: () {
        // handle on pressed
    },
    busy: true, // defaults to false
    label: 'Text Label'.toUpperCase(),
),
```

![toolkit button](https://user-images.githubusercontent.com/9513691/88875257-aec35c00-d240-11ea-958c-90a26ea70a6f.gif)

### SchoolLocationWidget

```dart
SchoolLocationWidget(
    imageURL: 'http://via.placeholder.com/350x350',
    address: 'Area 69',
    name: 'Alien High School',
),
```

![school location widget](https://user-images.githubusercontent.com/9513691/88875572-34470c00-d241-11ea-946b-f55ce8ff658f.gif)

### OutlinedButton

```dart
OutlinedButton(
    onPressed: () {
        // handle on pressed
    },
    busy: true, // defaults to false
    label: 'Edit Info'.toUpperCase(),
),
```

![outlined button](https://user-images.githubusercontent.com/9513691/88875702-76704d80-d241-11ea-91bd-1f220675f221.gif)

### SchoolToolkitTextField

```dart
SchoolToolkitTextField(
    hint: 'Custom text field',
    controller: ...,
    errorText: ...,
    key: ...,
    label: ...,
    obscureText: ...,
    onChanged: ...,
    onFieldSubmitted: ...,
    onSaved: ...,
    onTap: ...,
),
```

![custom text field](https://user-images.githubusercontent.com/9513691/88875792-a91a4600-d241-11ea-8ce1-a879c142b3ee.gif)

### SchoolToolkitRoleButton

```dart
SchoolToolkitRoleButton(
    iconData: FontAwesomeIcons.userGraduate,
    label: 'Student'.toUpperCase(),
    selected: true, // defaults to false
),
```

![Role button](https://user-images.githubusercontent.com/9513691/88875948-ef6fa500-d241-11ea-9d48-f730113995ae.gif)

### OverlappingButtonCard

```dart
OverlappingButtonCard(
    width: 354,
    height: 589,
    label: 'Button label'.toUpperCase(),
    onPressed: () {
        // handle on presssed
    },
    chld: ...,
    padding: ..., // optional field
),
```

![overlapping button card](https://user-images.githubusercontent.com/9513691/88876043-29d94200-d242-11ea-972d-1a137c4369f8.gif)

### Calendar

```dart
Calendar(
    startExpanded: true, // set this to false if you need the calendar to be built shrinked (show only active week)
    onDateSelected: (date) {
        print('Selected date: $date');
        // handle date selection
    },
    onNextMonth: (date) {
        print('Next month: $date');
        // handle on next month.
    },
    onPreviousMonth: (date) {
        print('Previous month: $date');
        // handle previous month
    },
    calendarEvents: [
        CalendarEvent.fromDateTime(
            dateTime: DateTime.now(),
            color: SchoolToolkitColors.red,
        ),
    ],
    recurringEventsByDay: [
        CalendarEvent.fromDateTime(
            dateTime: DateTime(2020, 7, 1),
            color: SchoolToolkitColors.blue,
        ),
        CalendarEvent.fromDateTime(
            dateTime: DateTime(2020, 7, 2),
            color: SchoolToolkitColors.red,
        ),
    ],
    recurringEventsByWeekday: [
        CalendarEvent.fromWeekDay(
            weekDay: DateTime.sunday,
            color: SchoolToolkitColors.green,
            holiday: true,
        ),
    ],
),
```

![calendar](https://user-images.githubusercontent.com/9513691/88876207-80df1700-d242-11ea-8437-963039795c8f.gif)

### NepaliCalendar

**Important:** Please note the date returned by the NepaliCalendar methods use the NepaliDateTime instead of DateTime class

```dart
NepaliCalendar(
    startExpanded: true, // set this to false if you need the calendar to be built shrinked (show only active week)
    onDateSelected: (date) {
        print('Selected date: $date');
        // handle date selection
    },
    onNextMonth: (date) {
        print('Next month: $date');
        // handle on next month.
    },
    onPreviousMonth: (date) {
        print('Previous month: $date');
        // handle previous month
    },
    calendarEvents: [
        NepaliCalendarEvent.fromDateTime(
            dateTime: NepaliDateTime.now(),
            color: SchoolToolkitColors.red,
        ),
    ],
    recurringEventsByDay: [
        NepaliCalendarEvent.fromDateTime(
            dateTime: NepaliDateTime(2020, 7, 1),
            color: SchoolToolkitColors.green,
        ),
    ],
    recurringEventsByWeekday: [
        NepaliCalendarEvent.fromWeekDay(
            weekDay: 1,
            color: SchoolToolkitColors.brown,
        ),
    ],
),
```

![nepali calendar](https://user-images.githubusercontent.com/9513691/88877688-d832b680-d245-11ea-8c45-91276dd57fd1.gif)

### EventCard

```dart
EventCard(
    event: 'Sports week Class 3 - Class 10',
    time: '1:00 - 3:00 PM',
    secondaryColor: SchoolToolkitColors.lighterGrey,
    primaryColor: SchoolToolkitColors.grey,
),
```

![event card](https://user-images.githubusercontent.com/9513691/88877828-28aa1400-d246-11ea-8533-07d183c8876c.gif)

### RoutineCard

```dart
RoutineCard(
    classTopic: 'Fundamentals of Mathematics',
    classType: 'Theory Class',
    subject: 'Mathematics',
    professor: 'Mr. Ram Prasad Yadav',
    time: '8:00 - 9:00 AM',
),
```

![routine card](https://user-images.githubusercontent.com/9513691/88877905-542cfe80-d246-11ea-9f82-bae4ce51956c.gif)

### DeadlineCard

```dart
 DeadlineCard(
    deadline: DateTime.now(),
    secondaryColor: ..., // optional
    primaryColor: ..., // optional
),
```

![deadline card](https://user-images.githubusercontent.com/9513691/88877949-7161cd00-d246-11ea-823d-0962184a6175.gif)

### AssignmentCard

```dart
AssignmentCard(
    // optional, if deadline is not passed, deadline card will not be shown
    deadline: DateTime.now(),
    question:
        'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
    subject: 'Mathematics',
    teacher: 'Dr. Stone',
    deadlineBackgroundColor: SchoolToolkitColors.red,
    onUploadHandler: () {
        print('Handle upload');
        // optional, if null is passsed upload button will be hidden
    },
    // optional
    fileList: [
        FileWrapper(
            fileName: 'assignment-information.pdf',
            fileSize: '11.5 KB',
            onTap: () {
            print('Handle on tap');
            },
        ),
    ],
),

```

![assignment card](https://user-images.githubusercontent.com/9513691/88878024-a66e1f80-d246-11ea-973d-c1c989b5fc67.gif)

### HighlightedIcon

```dart
HighlightedIcon(
    icon: Icons.class_,
    busy: true, // optional. If busy is set to true, displays a loading indicator instead of the icons passed.
),
```

![highlighted icon](https://user-images.githubusercontent.com/9513691/88878248-36ac6480-d247-11ea-9a45-9100fa874c6f.gif)

### FeaturedVideoCard

```dart
FeaturedVideoCard(
    title: 'Professor KPR Lecture - Neuroscience Lecture 32',
    thumbnailURL:
        'https://www.teachermagazine.com.au/files/ce-image/cache/1c03ffc10fd4ef6a/Cognitive_load_theory_-_teaching_strategies_855_513_60.jpg',
    onTap: () {
        print('Handling on tap');
    },
),
```

![featured video card](https://user-images.githubusercontent.com/9513691/88878327-707d6b00-d247-11ea-9fe9-2a84c37e364d.gif)

### VideoListTileCard

```dart
VideoListTileCard(
    author: 'Dr. Richard',
    title: 'The science of gamma radiation.',
    margin: EdgeInsets.all(5.0),
    thumbnailURL:
        'https://www.teachermagazine.com.au/files/ce-image/cache/1c03ffc10fd4ef6a/Cognitive_load_theory_-_teaching_strategies_855_513_60.jpg',
    color: ..., // Optional. use to set the background color of the tile
    onTap: ..., // Optional. use to handle on tap
    padding: ..., // Optional. use to add desired padding
    showIcon: ..., // Optional. set this to flase if you don't want the icon besides the author.
),
```

![video list tile card](https://user-images.githubusercontent.com/9513691/88878406-a3bffa00-d247-11ea-9407-9023189f7db7.gif)

### ProfileCard

```dart
ProfileCard(
    imageURL:
        'https://cdn1.iconfinder.com/data/icons/female-avatars-vol-1/256/female-portrait-avatar-profile-woman-sexy-afro-2-512.png',
    email: 'email@email.com',
    name: 'Dr. Steven Stones',
    phoneNumber: '9843XXXXXX',
    post: 'Sorceror',
    margin: EdgeInsets.all(5.0), // optional
),
```

![profile card](https://user-images.githubusercontent.com/9513691/88878633-13ce8000-d248-11ea-8fb2-9f3435c884a7.gif)

### BusRouteWidget

```dart
InformationTileWidget(
    margin: EdgeInsets.all(5.0),
    icon: FontAwesomeIcons.bus,
    biggerTitle: true,
    title: 'Bus Route 1',
    subTitle: 'Tinkune-Dhobhighat-NewRoad',
    iconColor: Colors.white,
    rounded: false,
    iconBackgroundColor: SchoolToolkitColors.blue,
    onTap: ..., // Optional.
),
```

![bus route widget](https://user-images.githubusercontent.com/9513691/88878739-47110f00-d248-11ea-93d6-42661c37d324.gif)

### NoticeCard

```dart
NoticeCard(
    date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    title: 'School Reopens',
    subTitile:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    onTap: () {
        // Handle readmore
    },
),
```

![notice card](https://user-images.githubusercontent.com/9513691/88878862-948d7c00-d248-11ea-8dc3-58c390201458.gif)

### LabelCard

```dart
LabelCard(
    label: 'Text label',
    color: SchoolToolkitColors.red,
    height: ..., // Optional
    width: ..., // Optional
    textStyle: ..., // Optional
),
```

![label card](https://user-images.githubusercontent.com/9513691/88878914-b981ef00-d248-11ea-8a0e-a316b37d8948.gif)

## Support

Like what you see? Support me by buying me a coffee :)

<a href="https://www.buymeacoffee.com/bugthedebugger" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>

## License

`MIT License`
