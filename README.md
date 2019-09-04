# Workhours Calculator

A Ruby app to calculate how many time you spent in a given period of time.

## How to use

Let's supose you:

- Start to work at 09:37
- Take a break to lunch at 12:00
- Back to work at 12:42
- Finish your workday at 18:19

To calculate the spent time, use this at your terminal command line:

```bash
$ ruby calculator.rb -p '09:37 12:00 12:42 18:19'
You worked for 8:00 in this period.
```

Simple!

## Important information ⚠️

- You must have to use 24-format in times.
- You must have to provide always a pair of start and finish time to calculate. And you can provide how many pairs you want.
  - Example:
     ```bash
    $ ruby calculator.rb -p '09:37 12:00 12:42 18:19'
    You worked for 8:00 in this period.

    $ ruby calculator.rb -p '09:37 12:00 12:42 18:19 18:53 20:03'
    You worked for 9:10 in this period.
    ```
