#!/usr/bin/env ruby

require 'English'
require 'fileutils'

include FileUtils

# Filter branch command:
#
# (With this script in $PATH):
#     git filter-branch --tree-filter git-rename-project.rb --tag-name-filter cat

def update
  puts <<~TEXT
  Renaming ANSIFormatting to TerminalOutput::Styling
  = = =

  TEXT

  Dir['test/**/*.rb', 'init.rb', 'lib/**/*.rb'].each do |file|
    updated = false

    verbose <<~TEXT
    File: #{file}
    - - -

    TEXT

    update_require_statements(file) and updated = true

    update_namespacing(file) and updated = true

    update_constant_references(file) and updated = true

    move(file) and updated = true

    verbose ' ' if updated
  end
end

def update_require_statements(file)
  change_count = 0

  update_file(file) do |contents|
    require_statement_pattern = %r{require[[:blank:]]+['"](?<prev>ansi_formatting)}

    contents.gsub!(require_statement_pattern) do |fragment|
      change_count += 1

      fragment.gsub($LAST_MATCH_INFO[:prev], 'terminal_output/styling')
    end
  end and verbose "Updated #{change_count} require statement(s)"
end

def update_namespacing(file)
  update_file(file) do |contents|
    toplevel_constant_pattern = %r{module (?<prev>ANSIFormatting)}

    changed = contents.match?(toplevel_constant_pattern)

    if changed
      nested_line_pattern = %r{^(?<prev>[[:blank:]]+|end)}

      contents.gsub!(nested_line_pattern) do |fragment|
        fragment.gsub($LAST_MATCH_INFO[:prev], "  #{fragment}")
      end

      contents.gsub!(toplevel_constant_pattern) do |fragment|
        fragment.gsub($LAST_MATCH_INFO[:prev], <<~TEXT.chomp)
        TerminalOutput
          module Styling
        TEXT
      end

      contents << "end\n"
    end
  end and verbose "Updated namespacing"
end

def update_constant_references(file)
  change_count = 0

  update_file(file) do |contents|
    constant_reference_pattern = %r{(?<prev>ANSIFormatting)}

    contents.gsub!(constant_reference_pattern) do |fragment|
      change_count += 1

      fragment.gsub($LAST_MATCH_INFO[:prev], 'TerminalOutput::Styling')
    end
  end and verbose "Updated #{change_count} reference(s) to ANSIFormatting::*"
end

def update_file(file, &block)
  contents = File.read(file)

  prev_contents = contents.dup

  block.(contents)

  changed = contents != prev_contents

  if changed
    File.write(file, contents)
    true
  else
    false
  end
end

def move(prev_file)
  file = prev_file.gsub('ansi_formatting', 'terminal_output/styling')

  return false if file == prev_file

  mkdir_p(File.dirname(file))

  mv(prev_file, file)

  verbose "Moved file: #{prev_file} => #{file}"
end

if ENV['VERBOSITY'] == 'on'
  def verbose(text)
    puts text
    true
  end
else
  def verbose(text)
    true
  end
end

update
