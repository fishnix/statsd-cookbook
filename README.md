# statsd-cookbook

Installs and configures [StatsD](https://github.com/quasor/statsd).

*Note:* this is not etsy's (statsd)[https://github.com/etsy/statsd]

## Supported Platforms

CentOS 6.6

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['statsd-cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### statsd-cookbook::default

Include `statsd-cookbook` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[statsd-cookbook::default]"
  ]
}
```

## License and Authors

Author:: E Camden Fisher (<camden@northpage.com>)
