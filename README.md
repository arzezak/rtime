# rtime

A simple command-line tool written in Crystal that converts Unix timestamps to human-readable relative time strings.

## Description

`rtime` takes one or more Unix timestamps and outputs how long ago they occurred in a human-friendly format (e.g., "5 minutes ago", "2 days ago", "3 years ago").

## Building

```bash
make build
```

## Installing

Symlinks the built binary into `~/.local/bin`, so rebuilds are picked up automatically:

```bash
make install
```

Override the location with `PREFIX` or `BINDIR` (e.g. `make install PREFIX=/usr/local`).
Remove the link with `make uninstall`.

## Testing

```bash
make test
```

## Usage

```bash
./rtime <timestamp>
```

### Examples

```bash
# Single timestamp
./rtime 1729000000

# Multiple timestamps
./rtime 1729000000 1728000000 1727000000
```

## Output Format

The tool displays relative time in the most appropriate unit:
- Seconds (0-59 seconds ago)
- Minutes (1-59 minutes ago)
- Hours (1-23 hours ago)
- Days (1-6 days ago)
- Weeks (1-4 weeks ago)
- Months (1-11 months ago)
- Years (12+ months ago)

Future timestamps are displayed as "in the future".
