register /usr/bin/nu_plugin_formats  {
  "sig": {
    "name": "from eml",
    "usage": "Parse text as .eml and create record.",
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
        "long": "preview-body",
        "short": "b",
        "arg": "Int",
        "required": false,
        "desc": "How many bytes of the body to preview",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Record": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'From: test@email.com\nSubject: Welcome\nTo: someone@somewhere.com\nTest' | from eml",
      "description": "Convert eml structured data into record",
      "result": {
        "Record": {
          "cols": [
            "Subject",
            "From",
            "To",
            "Body"
          ],
          "vals": [
            {
              "String": {
                "val": "Welcome",
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "Record": {
                "cols": [
                  "Name",
                  "Address"
                ],
                "vals": [
                  {
                    "Nothing": {
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "test@email.com",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "Record": {
                "cols": [
                  "Name",
                  "Address"
                ],
                "vals": [
                  {
                    "Nothing": {
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "someone@somewhere.com",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "String": {
                "val": "Test",
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "span": {
            "start": 0,
            "end": 0
          }
        }
      }
    },
    {
      "example": "'From: test@email.com\nSubject: Welcome\nTo: someone@somewhere.com\nTest' | from eml -b 1",
      "description": "Convert eml structured data into record",
      "result": {
        "Record": {
          "cols": [
            "Subject",
            "From",
            "To",
            "Body"
          ],
          "vals": [
            {
              "String": {
                "val": "Welcome",
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "Record": {
                "cols": [
                  "Name",
                  "Address"
                ],
                "vals": [
                  {
                    "Nothing": {
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "test@email.com",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "Record": {
                "cols": [
                  "Name",
                  "Address"
                ],
                "vals": [
                  {
                    "Nothing": {
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "someone@somewhere.com",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "String": {
                "val": "T",
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register /usr/bin/nu_plugin_formats  {
  "sig": {
    "name": "from ics",
    "usage": "Parse text as .ics and create table.",
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
    "input_output_types": [
      [
        "String",
        {
          "Table": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'BEGIN:VCALENDAR\n            END:VCALENDAR' | from ics",
      "description": "Converts ics formatted string to table",
      "result": {
        "List": {
          "vals": [
            {
              "Record": {
                "cols": [
                  "properties",
                  "events",
                  "alarms",
                  "to-Dos",
                  "journals",
                  "free-busys",
                  "timezones"
                ],
                "vals": [
                  {
                    "List": {
                      "vals": [],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "List": {
                      "vals": [],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "List": {
                      "vals": [],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "List": {
                      "vals": [],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "List": {
                      "vals": [],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "List": {
                      "vals": [],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "List": {
                      "vals": [],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register /usr/bin/nu_plugin_formats  {
  "sig": {
    "name": "from ini",
    "usage": "Parse text as .ini and create table.",
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
    "input_output_types": [
      [
        "String",
        {
          "Record": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'[foo]\na=1\nb=2' | from ini",
      "description": "Converts ini formatted string to record",
      "result": {
        "Record": {
          "cols": [
            "foo"
          ],
          "vals": [
            {
              "Record": {
                "cols": [
                  "a",
                  "b"
                ],
                "vals": [
                  {
                    "String": {
                      "val": "1",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "2",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register /usr/bin/nu_plugin_formats  {
  "sig": {
    "name": "from vcf",
    "usage": "Parse text as .vcf and create table.",
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
    "input_output_types": [
      [
        "String",
        {
          "Table": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'BEGIN:VCARD\nN:Foo\nFN:Bar\nEMAIL:foo@bar.com\nEND:VCARD' | from vcf",
      "description": "Converts ics formatted string to table",
      "result": {
        "List": {
          "vals": [
            {
              "Record": {
                "cols": [
                  "properties"
                ],
                "vals": [
                  {
                    "List": {
                      "vals": [
                        {
                          "Record": {
                            "cols": [
                              "name",
                              "value",
                              "params"
                            ],
                            "vals": [
                              {
                                "String": {
                                  "val": "N",
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              },
                              {
                                "String": {
                                  "val": "Foo",
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              },
                              {
                                "Nothing": {
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              }
                            ],
                            "span": {
                              "start": 0,
                              "end": 0
                            }
                          }
                        },
                        {
                          "Record": {
                            "cols": [
                              "name",
                              "value",
                              "params"
                            ],
                            "vals": [
                              {
                                "String": {
                                  "val": "FN",
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              },
                              {
                                "String": {
                                  "val": "Bar",
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              },
                              {
                                "Nothing": {
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              }
                            ],
                            "span": {
                              "start": 0,
                              "end": 0
                            }
                          }
                        },
                        {
                          "Record": {
                            "cols": [
                              "name",
                              "value",
                              "params"
                            ],
                            "vals": [
                              {
                                "String": {
                                  "val": "EMAIL",
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              },
                              {
                                "String": {
                                  "val": "foo@bar.com",
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              },
                              {
                                "Nothing": {
                                  "span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              }
                            ],
                            "span": {
                              "start": 0,
                              "end": 0
                            }
                          }
                        }
                      ],
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

