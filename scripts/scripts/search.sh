#!/bin/bash

# Define default search engine
DEFAULT_SEARCH_ENGINE="google"

# Parse arguments
search_query=""
search_engine="$DEFAULT_SEARCH_ENGINE"

while getopts ":e:" opt; do
    case $opt in
        e)
            # Update flag name
            search_engine="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done
#
# Shift arguments to remove options
shift $((OPTIND - 1))
# Read from stdin if no query provided
    # Check if search query is provided as an argument
if [[ -z "$1" ]]; then
    read search_query
else
    search_query="$1"
fi

if [[ -z "$search_query" ]]; then
    echo "Error: Please provide a search query as an argument or via stdin" >&2
    exit 1
fi

# Construct search URL based on engine and query
case "$search_engine" in
    google)
        search_url="https://www.google.com/search?q=${search_query}"
        ;;
        # Add more cases for other search engines like duckduckgo, bing, etc.
        # alias for duckduckgo : ddg
    ddg)
        search_url="https://duckduckgo.com/?q=${search_query}"
        ;;
        # who tf uses bing? seriously...?
    bing)
        search_url="https://www.bing.com/search?q=${search_query}"
        ;;
    *)
        echo "Invalid search engine: $search_engine" >&2
        exit 1
        ;;
esac

# Open the search URL in your default browser
xdg-open "$search_url"

echo "Opened search for '$search_query' in '$search_engine'"
