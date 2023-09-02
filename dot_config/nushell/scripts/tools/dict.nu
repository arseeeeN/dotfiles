export def main [
    ...word # word(s) to query the dictionary API but they have to make sense together like "martial law", not "cats dogs"
    -d # print out the definitions and examples (default)
    -p # print out the phonetics
    -s # print out the synonyms
] {
	let query = ($word | str join %20)
    let base_url = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    let link = ($base_url + ($query|str replace " " "%20"))
    let output = (http get $link | rename word)
    let w = ($output.word | first)

    if $w == "No Definitions Found" {
        $output.word
    } else {
        if $d or (not $s or $p) {
            print ($output
            | get meanings
            | flatten
            | select partOfSpeech definitions
            | flatten
            | flatten
            | reject "synonyms"
            | reject "antonyms")
        }
        if $s {
            print ($output
            | get meanings
            | flatten
            | select synonyms
            | flatten)
        }
        if $p {
            print ($output
            | get phonetics
            | flatten
            | flatten
            | select text
            | rename phonetics)
        }
    }
}
