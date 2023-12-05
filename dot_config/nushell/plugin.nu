register /opt/homebrew/Cellar/nushell/0.87.1/bin/nu_plugin_query  {
  "sig": {
    "name": "query",
    "usage": "Show all the query commands",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

register /opt/homebrew/Cellar/nushell/0.87.1/bin/nu_plugin_query  {
  "sig": {
    "name": "query json",
    "usage": "execute json query on json file (open --raw <file> | query json 'query string')",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "query",
        "desc": "json query",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

register /opt/homebrew/Cellar/nushell/0.87.1/bin/nu_plugin_query  {
  "sig": {
    "name": "query web",
    "usage": "execute selector query on html/web",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "query",
        "short": "q",
        "arg": "String",
        "required": false,
        "desc": "selector query",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "as-html",
        "short": "m",
        "arg": null,
        "required": false,
        "desc": "return the query output as html",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "attribute",
        "short": "a",
        "arg": "String",
        "required": false,
        "desc": "downselect based on the given attribute",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "as-table",
        "short": "t",
        "arg": {
          "Table": []
        },
        "required": false,
        "desc": "find table based on column header list",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "inspect",
        "short": "i",
        "arg": null,
        "required": false,
        "desc": "run in inspect mode to provide more information for determining column headers",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Network"
  },
  "examples": [
    {
      "example": "http get https://phoronix.com | query web --query 'header'",
      "description": "Retrieve all `<header>` elements from phoronix.com website",
      "result": null
    },
    {
      "example": "http get https://en.wikipedia.org/wiki/List_of_cities_in_India_by_population\n    | query web --as-table [Rank City 'Population(2011)[3]' 'Population(2001)[3][a]' 'State or union territory']",
      "description": "Retrieve a html table from Wikipedia and parse it into a nushell table using table headers as guides",
      "result": null
    },
    {
      "example": "http get https://www.nushell.sh | query web --query 'h2, h2 + p' | group 2 | each {rotate --ccw tagline description} | flatten",
      "description": "Pass multiple css selectors to extract several elements within single query, group the query results together and rotate them to create a table",
      "result": null
    },
    {
      "example": "http get https://example.org | query web --query a --attribute href",
      "description": "Retrieve a specific html attribute instead of the default text",
      "result": null
    }
  ]
}

register /opt/homebrew/Cellar/nushell/0.87.1/bin/nu_plugin_query  {
  "sig": {
    "name": "query xml",
    "usage": "execute xpath query on xml",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "query",
        "desc": "xpath query",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

