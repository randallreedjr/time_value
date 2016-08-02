# Time Value of Money calculator

## Performs financial calculations for:
* n (number of periods)
* pv (present value)
* pmt (payment amount)
* fv (future value)
* i (interest rate)

**NOTE:** Only supports annuity due.

## Usage

Install the gem:
```
gem install time_value
```
Initialize with a hash:
```
details = {
  n: 12,
  pv: 0,
  pmt: -100,
  i: 0.05
}

time_value = TimeValue.new(details)
```

Or set values after initialization:
```
time_value = TimeValue.new()
time_value.n = my_n
time_value.i = my_i
time_value.pv = my_pv
time_value.pmt = my_pmt
my_fv = time_value.calc_fv()
```

Remember to follow a convention for signs of values:

* Money being paid should have a negative value (-)
* Money being received should have a positive value (+)

Failing to follow this convention may yield unexpected results
