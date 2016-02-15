#!/usr/bin/env ruby
#
#   Copyright
#
#       Copyright (C) 2014 Jari Aalto <jari.aalto@cante.net>
#       Copyright (C) 2007-2014 Peter Hutterer <peter.hutterer@who-t.net>
#       Copyright (C) 2007-2014 Benjamin Close <Benjamin.Close@clearchain.com>
#
#   License
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#  Description
#
PROGRAM = "splitpatch"
MYVERSION = 1.0
LICENSE = "GPL-2+"  # See official acronyms: https://spdx.org/licenses/
HOMEPAGE = "https://github.com/jaalto/splitpatch"

#       Splitpatch is a simple script to split a patch up into
#       multiple patch files. If the --hunks option is provided on the
#       command line, each hunk gets its own patchfile.

class Splitter
    def initialize(file)
       @filename = file
       @fullname = false
    end

    def fullname(opt)
       @fullname = opt
    end

    def validFile?
        return File.exist?(@filename) && File.readable?(@filename)
    end

    def createFile(filename)
        if File.exists?(filename)
            puts "File #{filename} already exists. Renaming patch."
            appendix = 0
            zero = appendix.to_s.rjust(3, '0')
            while File.exists?("#{filename}.#{zero}")
                appendix += 1
                zero = appendix.to_s.rjust(3, '0')
            end
            filename << ".#{zero}"
        end
        return open(filename, "w")
    end

    def getFilename(line)
        tokens = line.split(" ")
        tokens = tokens[1].split(":")
        tokens = tokens[0].split("/")
        if @fullname
            return tokens.join('-')
        else
            return tokens[-1]
        end
    end

    # Split the patchfile by files 
    def splitByFile
        legacy = false
        outfile = nil
        stream = open(@filename)
        until (stream.eof?)
            line = stream.readline

            # we need to create a new file
            if (line =~ /^Index: .*/) == 0
                # patch includes Index lines
                # drop into "legacy mode"
                legacy = true
                if (outfile)
                    outfile.close_write
                end
                filename = getFilename(line)
                filename << ".patch"
                outfile = createFile(filename)
                outfile.write(line)
            elsif (line =~ /--- .*/) == 0 and not legacy
                if (outfile) 
                    outfile.close_write
                end
                #find filename
                filename = getFilename(line)
                filename << ".patch"
                outfile = createFile(filename)
                outfile.write(line)
            else
                if outfile
                    outfile.write(line)
                end
            end
        end
    end

    def splitByHunk
        legacy = false
        outfile = nil
        stream = open(@filename)
        filename = ""
        counter = 0
        header = ""
        until (stream.eof?)
            line = stream.readline

            # we need to create a new file
            if (line =~ /^Index: .*/) == 0
                # patch includes Index lines
                # drop into "legacy mode"
                legacy = true
                filename = getFilename(line)
                header = line
                # remaining 3 lines of header
                for i in 0..2
                    line = stream.readline
                    header << line
                end
                counter = 0
            elsif (line =~ /--- .*/) == 0 and not legacy
                #find filename
                filename = getFilename(line)
                header = line
                # next line is header too
                line = stream.readline
                header << line
                counter = 0
            elsif (line =~ /@@ .* @@/) == 0
                if (outfile) 
                    outfile.close_write
                end

                zero = counter.to_s.rjust(3, '0')
                hunkfilename = "#{filename}.#{zero}.patch"
                outfile = createFile(hunkfilename)
                counter += 1

                outfile.write(header)
                outfile.write(line)
            else
                if outfile
                    outfile.write(line)
                end
            end
        end
    end

end

def help
    puts <<EOF
SYNOPSIS
    #{PROGRAM} [options] FILE.patch

OPTIONS
    -h,--help
    -H,--hunk
    -V,--version

DESCRIPTION

    Split the patch up into files or hunks

    Divide a patch or diff file into pieces. The split can made by file
    or by hunk basis. This makes it possible to separate changes that
    might not be desirable or assemble the patch into a more coherent set
    of changes. See e.g. combinediff(1) from patchutils package.

    Note: only patches in unified format are recognized.

AUTHORS

    Peter Hutterer (orig. Author) <peter.hutterer@who-t.net>
    Benjamin Close (orig. Author) <Benjamin.Close@clearchain.com>
    Jari Aalto (Maintainer) <jari.aalto@cante.net>"

    Homepage: #{HOMEPAGE}
EOF
end

def version
  puts "#{MYVERSION} #{LICENSE} #{HOMEPAGE}"
end

########################     MAIN     ########################

if ARGV.length < 1 or ARGV.length > 2
    puts "ERROR: missing argument. See --help."
    exit 1
else
    opt = ARGV[0]
    if /^-h$|--help/.match(opt)
        help
        exit 0
    elsif /^-H$|--hunks?/.match(opt)
        hunk = 1
    elsif /^-V$|--version/.match(opt)
        version
        exit 0
    elsif /^-/.match(opt)
        puts "ERROR: Unknown option: #{opt}. See --help."
        exit 1
        end
    file = ARGV[-1]
    s = Splitter.new(file)
    if s.validFile?
        if hunk
            s.splitByHunk
        else
            s.splitByFile
        end
    else
        puts "File does not exist or is not readable: #{file}"
    end
end

# End of file
