# Download TED videos

# Software needed

* Install youtube-dl

`youtube-dl` can download videos and subtitles.

The `--proxy` option doesn't work with shadowsocks, so I install it on a linode VPS.

```bash
sudo pip install youtube-dl
```

* Install ffmpeg on Ubuntu

Ubuntu 14.04 ships `libav-tools` other than `ffmpeg`, so get it by
[ppa](https://launchpad.net/~mc3man/+archive/ubuntu/trusty-media).

```bash
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update

sudo apt-get install ffmpeg

sudo add-apt-repository --remove ppa:mc3man/trusty-media
sudo apt-get update
```

* Install ffmpeg on Mac

Use ffmpeg to burn subtitles into videos.

```bash
brew install x264 lame libvo-aacenc xvid fdk-aac
brew install ffmpeg --with-libass --with-fdk-aac
```

* Install Aegisub

```bash
brew cask install aegisub
```

## One command for all

On May 10, 2016, youtube-dl supports socks proxy.

```bash
youtube-dl \
    -o "%(title)s.%(ext)s" --recode-video mp4 \
    --format bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm] \
    --restrict-filenames --continue --ignore-errors --no-call-home \
    --write-sub --write-auto-sub --convert-subs srt --sub-lang en \
    --proxy socks5://127.0.0.1:1080 \
    https://www.youtube.com/watch?v=zY3nRgEZTm8

```

# TED

For videos that max resolution less than 480p in youtube (e.g., ones released before 2010), download
them directly from ted.com.

* Config file

    Human beings make mistakes. Compare `TED.yml` and auto-generated `TED-update.yml` to fix errors.

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/TED.yml
---
- URL: https://www.youtube.com/watch?v=176adlNeRy8
  category: LOW/TED/Others
  original_title: 'Paul Ewald: Can we domesticate germs?'
- URL: https://www.youtube.com/watch?v=qCrVpRBBSvY
  category: TED/Ecology
  original_title: 'Greg Asner: Ecology from the air'
- URL: https://www.youtube.com/watch?v=RgqtrlixYR4
  category: TED/Ecology
  original_title: 'Johan Rockstrom: Let the environment guide our development'
- URL: https://www.youtube.com/watch?v=X-HE4Hfa-OY
  category: TED/Ecology
  original_title: 'Jonathan Trent: Energy from floating algae pods'
- URL: https://www.youtube.com/watch?v=WjBwhwe5-cc
  category: TED/Evolution
  original_title: "Isabel Behncke: Evolution's gift of play, from bonobo apes to humans"
- URL: https://www.youtube.com/watch?v=0QVXdEOiCw8
  category: TED/Evolution
  original_title: 'Jack Horner: Building a dinosaur from a chicken'
- URL: https://www.youtube.com/watch?v=i-icXZ2tMRM
  category: TED/Evolution
  original_title: 'Rob Knight: How our microbes make us who we are'
- URL: https://www.youtube.com/watch?v=nzj7Wg4DAbs
  category: TED/Evolution
  original_title: Why Humans Run the World | Yuval Noah Harari | TED Talks
- URL: https://www.youtube.com/watch?v=rHbjwH2Blfg
  category: TED/Genetics
  original_title: 'Elizabeth Murchison: Fighting a contagious cancer'
- URL: https://www.youtube.com/watch?v=O8e8Ttfz-pY
  category: TED/Genetics
  original_title: 'Hendrik Poinar: Bring back the woolly mammoth!'
- URL: https://www.youtube.com/watch?v=wZ2TF8-PGQ4
  category: TED/Genetics
  original_title: 'Pamela Ronald: The case for engineering our food'
- URL: https://www.youtube.com/watch?v=u8bsCiq6hvM
  category: TED/Genetics
  original_title: 'Richard Resnick: Welcome to the genomic revolution'
- URL: https://www.youtube.com/watch?v=TdBAHexVYzc
  category: TED/Genetics
  original_title: We Can Now Edit Our DNA. But Let's Do it Wisely | Jennifer Doudna | TED Talks
- URL: https://www.youtube.com/watch?v=Fivy99RtMfM
  category: TED/Others
  original_title: 'Bart Knols: Cheese, dogs and a pill to kill mosquitoes and end malaria'
- URL: https://www.youtube.com/watch?v=xossR6eHv3I
  category: TED/Others
  original_title: 'Cheryl Hayashi: The magnificence of spider silk'
- URL: https://www.youtube.com/watch?v=k_GFq12w5WU
  category: TED/Others
  original_title: 'Janine Benyus: Biomimicry in action'
- URL: https://www.youtube.com/watch?v=u2V0vOFexY4
  category: TED/Others
  original_title: 'Jim Fallon: Exploring the mind of a killer'
EOF
```

* Download

    1. Get video information with `dl_video.pl`.
    2. Generate downloading bash script and download video and subtitles files.
    3. Generate reports.

```bash
cd ~/Scripts/lecture-slides/materials

# step 1
perl dl_video.pl -a update --proxy socks5://127.0.0.1:1080 \
    -i TED.yml -o TED-update

# step 2
perl dl_video.pl -a download --proxy socks5://127.0.0.1:1080 -d ~/Documents/Course \
    -i TED-update.yml -o TED-output 

bash ~/Documents/Course/TED-output.download.sh

# step 3
perl dl_video.pl -a report -d ~/Documents/Course\
    -i TED-update.yml -o TED-output 

```

* A working example which can be pasted to terminal line by line.

    "Pamela Ronald: The case for engineering our food"

```bash
URL=https://www.youtube.com/watch?v=wZ2TF8-PGQ4
CATEGORY="TED/Genetics"
ORI_TITLE=`youtube-dl $URL --get-title`
TITLE=`youtube-dl $URL --restrict-filenames --get-filename  -o "%(title)s"`
EXT=`youtube-dl $URL --restrict-filenames --get-filename -o "%(ext)s"`
FULLPATH="~/Documents/Course/${CATEGORY}/${TITLE}.${EXT}"

youtube-dl $URL --list-formats
youtube-dl $URL --format 22 -o "${FULLPATH}"

youtube-dl $URL --list-subs
youtube-dl $URL -o "${FULLPATH}" --write-sub --sub-lang en --skip-download
youtube-dl $URL -o "${FULLPATH}" --write-sub --sub-lang zh-CN --skip-download
```

* Burn

    * Generate merging bash script.
    * Burn subtitles into videos with the generated script.
    * Or copy and paste command lines of a video to terminal.

```bash
cd ~/Scripts/lecture-slides/materials

# step 4
perl dl_video.pl -a burn -d ~/Documents/Course \
    -i TED-update.yml -o TED-output 

bash ~/Documents/Course/TED-output.burn.sh
```

# TED Ed

* Config file

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/TED-Ed.yml
---
- URL: https://www.youtube.com/watch?v=Y5uRVv7GGQM
  category: TED-Ed/Ecology
  original_title: 'How bees help plants have sex - Fernanda S. Valdovinos'
- URL: https://www.youtube.com/watch?v=RLmKfXwWQtE
  category: TED-Ed/Ecology
  original_title: 'Population pyramids: Powerful predictors of the future - Kim Preshoff'
- URL: https://www.youtube.com/watch?v=GK_vRtHJZu4
  category: TED-Ed/Ecology
  original_title: 'Why is biodiversity so important? - Kim Preshoff'
- URL: https://www.youtube.com/watch?v=5NdMnlt2keE
  category: TED-Ed/Evolution
  original_title: 'Five fingers of evolution - Paul Andersen'
- URL: https://www.youtube.com/watch?v=9i7kAt97XYU
  category: TED-Ed/Evolution
  original_title: 'How we think complex cells evolved - Adam Jacobson'
- URL: https://www.youtube.com/watch?v=qrKZBh8BL_U
  category: TED-Ed/Evolution
  original_title: 'The evolution of the human eye - Joshua Harvey'
- URL: https://www.youtube.com/watch?v=z9HIYjRRaDE
  category: TED-Ed/Evolution
  original_title: 'Where do genes come from? - Carl Zimmer'
- URL: https://www.youtube.com/watch?v=1a8pI65emDE
  category: TED-Ed/Evolution
  original_title: 'Which Came First - The Chicken or the Egg?'
- URL: https://www.youtube.com/watch?v=Mehz7tCxjSE
  category: TED-Ed/Genetics
  original_title: "How Mendel's pea plants helped us understand genetics - Hortensia Jimnez Daz"
- URL: https://www.youtube.com/watch?v=tzlGU5EI9rU
  category: TED-Ed/Genetics
  original_title: 'RNAi: Slicing, dicing and serving your cells - Alex Dainis'
- URL: https://www.youtube.com/watch?v=kMWxuF9YW38
  category: TED-Ed/Genetics
  original_title: 'Sex Determination: More Complicated Than You Thought'
- URL: https://www.youtube.com/watch?v=pOyKFgGKmHE
  category: TED-Ed/Genetics
  original_title: 'The cancer gene we all have - Michael Windelspecht'
- URL: https://www.youtube.com/watch?v=AhsIF-cmoQQ
  category: TED-Ed/Genetics
  original_title: 'The race to sequence the human genome - Tien Nguyen'
- URL: https://www.youtube.com/watch?v=vP8-5Bhd2ag
  category: TED-Ed/Genetics
  original_title: 'What happens when your DNA is damaged? - Monica Menesini'
- URL: https://www.youtube.com/watch?v=oqGuJhOeMek
  category: TED-Ed/Others
  original_title: 'Cell vs. virus: A battle for health - Shannon Stiles'
- URL: https://www.youtube.com/watch?v=i_R7ouD8-Eo
  category: TED-Ed/Others
  original_title: How Life Begins in the Deep Ocean
- URL: https://www.youtube.com/watch?v=rb7TVW77ZCs
  category: TED-Ed/Others
  original_title: 'How do vaccines work? - Kelwalin Dhanasarnsombut'
- URL: https://www.youtube.com/watch?v=oBSandHijDc
  category: TED-Ed/Others
  original_title: 'Learning from smallpox: How to eradicate a disease - Julie Garon and Walter A. Orenstein'
- URL: https://www.youtube.com/watch?v=oKjFVBVGad0
  category: TED-Ed/Others
  original_title: 'The brilliance of bioluminescence - Leslie Kenna'
- URL: https://www.youtube.com/watch?v=XMriWTvPXHI
  category: TED-Ed/Others
  original_title: 'The mathematical secrets of Pascals triangle - Wajdi Mohamed Ratemi'

EOF
```

* Download

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a update --proxy socks5://127.0.0.1:1080 \
    -i TED-Ed.yml -o TED-Ed-update

perl dl_video.pl -a download --proxy socks5://127.0.0.1:1080 -d ~/Documents/Course \
    -i TED-Ed-update.yml -o TED-Ed-output 

bash ~/Documents/Course/TED-Ed-output.download.sh

perl dl_video.pl -a report -d ~/Documents/Course\
    -i TED-Ed-update.yml -o TED-Ed-output 

```

* Burn

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a burn -d ~/Documents/Course \
    -i TED-Ed-update.yml -o TED-Ed-output 

bash ~/Documents/Course/TED-Ed-output.burn.sh

```

# WEHI and dnalc animations

* Config file

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/Animation.yml
---
- URL: https://www.youtube.com/watch?v=28mgfg8nRT4
  category: Animation
  original_title: DNA transcription and translation Dr Osama Ma3rof .
- URL: https://www.youtube.com/watch?v=0JpOJ4F4984
  category: Animation/WEHI
  original_title: Chromosome and Kinetochore
- URL: https://www.youtube.com/watch?v=aA5fyWJh5S0
  category: Animation/WEHI
  original_title: Restriction Enzyme EcoR1
- URL: https://www.youtube.com/watch?v=DA2t5N72mgw
  category: Animation/WEHI
  original_title: 'Transcription - Central Dogma Part 1'
- URL: https://www.youtube.com/watch?v=WkI_Vbwn14g
  category: Animation/WEHI
  original_title: 'Translation - Central Dogma Part 2'
- URL: https://www.youtube.com/watch?v=mHak9EZjySs
  category: Animation/WEHI
  original_title: X Inactivation and Epigenetics
- URL: https://www.youtube.com/watch?v=SMtWvDbfHLo
  category: Animation/dnalc
  original_title: DNA Transcription (Advanced)
- URL: https://www.youtube.com/watch?v=gbSIBhFwQ4s
  category: Animation/dnalc
  original_title: How DNA is Packaged (Advanced)
- URL: https://www.youtube.com/watch?v=I9ArIJWYZHI
  category: Animation/dnalc
  original_title: Mechanism of DNA Replication (Advanced)
- URL: https://www.youtube.com/watch?v=8rXizmLjegI
  category: Animation/dnalc
  original_title: Mechanism of Recombination
- URL: https://www.youtube.com/watch?v=2KoLnIwoZKU
  category: Animation/dnalc
  original_title: Polymerase Chain Reaction (PCR)
- URL: https://www.youtube.com/watch?v=aVgwr0QpYNE
  category: Animation/dnalc
  original_title: RNA Splicing
- URL: https://www.youtube.com/watch?v=6ldtdWjDwes
  category: Animation/dnalc
  original_title: Sanger Sequencing
- URL: https://www.youtube.com/watch?v=TfYf_rPWUdY
  category: Animation/dnalc
  original_title: mRNA Translation (Advanced)
EOF

```

* Download

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a update -i Animation.yml -o Animation-update

perl dl_video.pl -a download -d ~/Documents/Course \
    -i Animation-update.yml -o Animation-output

bash ~/Documents/Course/Animation-output.download.sh

perl dl_video.pl -a report -d ~/Documents/Course \
    -i Animation-update.yml -o Animation-output

```

* Burn

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a burn -d ~/Documents/Course \
    -i Animation-update.yml -o Animation-output 

bash ~/Documents/Course/Animation-output.burn.sh

```

# Random sources

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/Random.yml
---
- URL: https://www.youtube.com/watch?v=Dw4Fr4eyGv8
  category: Random
  original_title: 'Discovering Religion  Ep 08 - Archaeopteryx'
- URL: https://www.youtube.com/watch?v=_ApDinCBt8g
  category: Random
  original_title: '1st, 2nd, and 3rd Generation Genome Sequencing Technologies'
- URL: https://www.youtube.com/watch?v=YTR21os8gTA
  category: Random
  original_title: Birds-of-Paradise Project Introduction
- URL: https://www.youtube.com/watch?v=TE6wqG4nb3M
  category: Random
  original_title: Food Chains
- URL: https://www.youtube.com/watch?v=mcM23M-CCog
  category: Random
  original_title: Galapagos Finch Evolution  HHMI BioInteractive Video
- URL: https://www.youtube.com/watch?v=l25MBq8T77w
  category: Random
  original_title: 'Galapagos: the finches (4/7)'
- URL: https://www.youtube.com/watch?v=2pp17E4E-O8
  category: Random
  original_title: Genome Editing with CRISPR-Cas9
- URL: https://www.youtube.com/watch?v=MkUgkDLp2iE
  category: Random
  original_title: 'How Genes are Regulated: Transcription Factors'
- URL: https://www.youtube.com/watch?v=oBwtxdI1zvk
  category: Random
  original_title: Lac Operon
- URL: https://www.youtube.com/watch?v=NWqgZUnJdAY
  category: Random
  original_title: Mendelian Genetics
- URL: https://www.youtube.com/watch?v=R6La6_kIr9g
  category: Random
  original_title: Natural Selection
- URL: https://www.youtube.com/watch?v=fQwI90bkJl4
  category: Random
  original_title: Phylogenetics
- URL: https://www.youtube.com/watch?v=xPkOAnK20kw
  category: Random
  original_title: Solving Hardy Weinberg Problems
- URL: https://www.youtube.com/watch?v=8yvEDqrc3XE
  category: Random
  original_title: 'Speciation: An Illustrated Introduction'
- URL: https://www.youtube.com/watch?v=GKGtkzgKfkc
  category: Random
  original_title: 'The Scientific Method'
- URL: https://www.youtube.com/watch?v=iMz6lApJgu4
  category: Random
  original_title: Xanthopan morgani praedicta The Darwin's Moth
- URL: https://www.youtube.com/watch?v=PUwmA3Q0_OE
  category: Random
  original_title: Human Population Through Time
- URL: https://www.youtube.com/watch?v=ymI5Uv5cGU4
  category: Random
  original_title: 'History of the World: Every Year'
- URL: https://www.youtube.com/watch?v=4EpI7UbQvUI
  category: Random
  original_title: 'Solving Compound Interest Problems'
- URL: https://www.youtube.com/watch?v=pg827uDPFqA
  category: Random
  original_title: 'What is the number e and where does it come from'

EOF

cd ~/Scripts/lecture-slides/materials
perl dl_video.pl -p socks5://127.0.0.1:1080 -a update -i Random.yml -o Random-update

perl dl_video.pl -p socks5://127.0.0.1:1080 -a download -i Random-update.yml -o Random-output -d ~/Documents/Course

bash ~/Documents/Course/Random-output.download.sh

perl dl_video.pl -a report -i Random-update.yml -o Random-output -d ~/Documents/Course

cd ~/Scripts/lecture-slides/materials
perl dl_video.pl -a burn -i Random-update.yml -o Random-output -d ~/Documents/Course

bash ~/Documents/Course/Random-output.burn.sh
```

# Khan

Videos of human prehistory from 23andme.

* Create .ass subtitles manually by Aegisub.

* Config file

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/Khan.yml
---
- URL: https://www.youtube.com/watch?v=8183HPmA2_I
  category: Human-Prehistory
  original_title: 'Human Prehistory 101 (Part 1 of 3): Out of (Eastern) Africa'
  subs:
    en: Human-Prehistory/Human_Prehistory_101_Part_1_of_3_-_Out_of_Eastern_Africa.en.ass
- URL: https://www.youtube.com/watch?v=T9Nw66RCMhg
  category: Human-Prehistory
  original_title: 'Human Prehistory 101 (Part 2 of 3): Weathering The Storm'
  subs:
    en: Human-Prehistory/Human_Prehistory_101_Part_2_of_3_-_Weathering_The_Storm.en.ass
- URL: https://www.youtube.com/watch?v=IVHD9wGlbho
  category: Human-Prehistory
  original_title: 'Human Prehistory 101 (Part 3 of 3): Agriculture Rocks Our World'
  subs:
    en: Human-Prehistory/Human_Prehistory_101_Part_3_of_3_-_Agriculture_Rocks_Our_World.en.ass
- URL: https://www.youtube.com/watch?v=F-zRXHAo4-U
  category: Human-Prehistory
  original_title: 'Human Prehistory 101: Epilogue'
  subs:
    en: Human-Prehistory/Human_Prehistory_101_-_Epilogue.en.ass
- URL: https://www.youtube.com/watch?v=Mm-IxK1GrYE
  category: Human-Prehistory
  original_title: 'Human Prehistory 101: Prologue'
  subs:
    en: Human-Prehistory/Human_Prehistory_101_-_Prologue.en.ass
EOF

```

* Download

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a update -i Khan.yml -o Khan-update

perl dl_video.pl -a download -d ~/Documents/Course \
    -i Khan-update.yml -o Khan-output 

bash ~/Documents/Course/Khan-output.download.sh

perl dl_video.pl -a report -d ~/Documents/Course\
    -i Khan-update.yml -o Khan-output 

```

* Burn

```bash

cp ~/Scripts/lecture-slides/materials/subtitles/Human-Prehistory/*.en.ass ~/Documents/Course/Human-Prehistory/

cd ~/Scripts/lecture-slides/materials
perl dl_video.pl -a burn -d ~/Documents/Course \
    -i Khan-update.yml -o Khan-output 

bash ~/Documents/Course/Khan-output.burn.sh

```


# 3Blue1Brown

Math

* Config file

```bash
# Essence of linear algebra
youtube-dl -j --flat-playlist \
    --proxy socks5://127.0.0.1:1080 \
    'https://www.youtube.com/playlist?list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab' |
    jq '{URL: ("https://www.youtube.com/watch?v=" + .url), original_title: .title}' |
    jq '. + {category: "3Blue1Brown/algebra"}' |
    jq -s '.' |
    perl -MYAML -MJSON -0777 -e '$c = <>; print YAML::Dump(decode_json($c))' \
    > tmp1.yml

# Essence of calculus
youtube-dl -j --flat-playlist \
    --proxy socks5://127.0.0.1:1080 \
    'https://www.youtube.com/playlist?list=PLZHQObOWTQDMsr9K-rj53DwVRMYO3t5Yr' |
    jq '{URL: ("https://www.youtube.com/watch?v=" + .url), original_title: .title}' |
    jq '. + {category: "3Blue1Brown/calculus"}' |
    jq -s '.' |
    perl -MYAML -MJSON -0777 -e '$c = <>; print YAML::Dump(decode_json($c))' \
    > tmp2.yml

# Neural networks
youtube-dl -j --flat-playlist \
    --proxy socks5://127.0.0.1:1080 \
    'https://www.youtube.com/playlist?list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi' |
    jq '{URL: ("https://www.youtube.com/watch?v=" + .url), original_title: .title}' |
    jq '. + {category: "3Blue1Brown/neural"}' |
    jq -s '.' |
    perl -MYAML -MJSON -0777 -e '$c = <>; print YAML::Dump(decode_json($c))' \
    > tmp3.yml

# Recommended
youtube-dl -j --flat-playlist \
    --proxy socks5://127.0.0.1:1080 \
    'https://www.youtube.com/playlist?list=PLZHQObOWTQDPHP40bzkb0TKLRPwQGAoC-' |
    jq '{URL: ("https://www.youtube.com/watch?v=" + .url), original_title: .title}' |
    jq '. + {category: "3Blue1Brown/Recommended"}' |
    jq -s '.' |
    perl -MYAML -MJSON -0777 -e '$c = <>; print YAML::Dump(decode_json($c))' \
    > tmp4.yml

# PLAY ALL
youtube-dl -j --flat-playlist \
    --proxy socks5://127.0.0.1:1080 \
    'https://www.youtube.com/playlist?list=UUYO_jab_esuFRV4b17AJtAw' |
    jq '{URL: ("https://www.youtube.com/watch?v=" + .url), original_title: .title}' |
    jq '. + {category: "3Blue1Brown"}' |
    jq -s '.' |
    perl -MYAML -MJSON -0777 -e '$c = <>; print YAML::Dump(decode_json($c))' \
    > tmp5.yml

# remove duplicates
perl -MYAML -e '
    my @entries, %seen;
    for (@ARGV) {
        warn qq{$_\n};
        my $yml = YAML::LoadFile($_);
        for my $e (@{$yml}) {
            if (exists $seen{$e->{URL}}) {
                warn qq{    SEEN\n};
                next;
            }
            push @entries, $e;
            $seen{$e->{URL}}++;
        }
    }
    print YAML::Dump(\@entries);
    ' \
    tmp1.yml tmp2.yml tmp3.yml tmp4.yml tmp5.yml \
    > ~/Scripts/lecture-slides/materials/3Blue1Brown.yml

rm tmp*.yml

```

* Download

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a update --proxy socks5://127.0.0.1:1080 \
    -i 3Blue1Brown.yml -o 3Blue1Brown-update

perl dl_video.pl -a download --proxy socks5://127.0.0.1:1080 -d ~/Documents/Course \
    -i 3Blue1Brown-update.yml -o 3Blue1Brown-output 

bash ~/Documents/Course/3Blue1Brown-output.download.sh

perl dl_video.pl -a report -d ~/Documents/Course\
    -i 3Blue1Brown-update.yml -o 3Blue1Brown-output 

```

* Burn

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a burn -d ~/Documents/Course \
    -i 3Blue1Brown-update.yml -o 3Blue1Brown-output 

bash ~/Documents/Course/3Blue1Brown-output.burn.sh

```

# CrashCourse

* Config file

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/CrashCourse.yml
---
- URL: https://www.youtube.com/watch?v=CeVtPDjJBPU
  category: CrashCourse/Immunology
  original_title: 'Your Immune System: Natural Born Killer - Crash Course Biology #32'
- URL: https://www.youtube.com/watch?v=GIJK3dwCWCw
  category: CrashCourse/Immunology
  original_title: 'Immune System, part 1: Crash Course A&P #45'
- URL: https://www.youtube.com/watch?v=2DFN4IBZ3rI
  category: CrashCourse/Immunology
  original_title: 'Immune System, part 2: Crash Course A&P #46'
- URL: https://www.youtube.com/watch?v=rd2cf5hValM
  category: CrashCourse/Immunology
  original_title: 'Immune System, part 3: Crash Course A&P #47'

EOF

```

* Download

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a update --proxy socks5://127.0.0.1:1080 \
    -i CrashCourse.yml -o CrashCourse-update

perl dl_video.pl -a download --proxy socks5://127.0.0.1:1080 -d ~/Documents/Course \
    -i CrashCourse-update.yml -o CrashCourse-output 

bash ~/Documents/Course/CrashCourse-output.download.sh

perl dl_video.pl -a report -d ~/Documents/Course\
    -i CrashCourse-update.yml -o CrashCourse-output 

```

* Burn

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a burn -d ~/Documents/Course \
    -i CrashCourse-update.yml -o CrashCourse-output 

bash ~/Documents/Course/CrashCourse-output.burn.sh

```


# Kurzgesagt

* Config file

```bash
youtube-dl -j --flat-playlist \
    --proxy socks5://127.0.0.1:1080 \
    'https://www.youtube.com/watch?v=NxvQPzrg2Wg&list=UUsXVk37bltHxD1rDPwtNM8Q' |
    jq '{URL: ("https://www.youtube.com/watch?v=" + .url), original_title: .title}' |
    jq '. + {category: "Kurzgesagt"}' |
    jq -s '.' |
    perl -MYAML -MJSON -0777 -e '$c = <>; print YAML::Dump(decode_json($c))' \
    > ~/Scripts/lecture-slides/materials/Kurzgesagt.yml

```

* Download

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a update --proxy socks5://127.0.0.1:1080 \
    -i Kurzgesagt.yml -o Kurzgesagt-update

perl dl_video.pl -a download --proxy socks5://127.0.0.1:1080 -d ~/Documents/Course \
    -i Kurzgesagt-update.yml -o Kurzgesagt-output 

bash ~/Documents/Course/Kurzgesagt-output.download.sh

perl dl_video.pl -a report -d ~/Documents/Course\
    -i Kurzgesagt-update.yml -o Kurzgesagt-output 

```

* Burn

```bash
cd ~/Scripts/lecture-slides/materials

perl dl_video.pl -a burn -d ~/Documents/Course \
    -i Kurzgesagt-update.yml -o Kurzgesagt-output 

bash ~/Documents/Course/Kurzgesagt-output.burn.sh

```

# Immunotherapy

* Config file

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/Immunotherapy.yml
---
- URL: https://www.youtube.com/watch?v=UbFjiWOBErA
  category: Immunotherapy
  original_title: 'IMMUNOTHERAPY: The Path to a Cancer Cure (For Clinicians)'
- URL: https://www.youtube.com/watch?v=furOPdyMDjU
  category: Immunotherapy
  original_title: 'Webinar - PD-1/PD-L1 Inhibitors: The First Wave of Immuno-Oncology'
- URL: https://www.youtube.com/watch?v=aobxYfY-8p0
  category: Immunotherapy
  original_title: 'Cancer Immunotherapy - PD-1 and PD-L1'
- URL: https://www.youtube.com/watch?v=K09xzIQ8zsg
  category: Immunotherapy
  original_title: 'Tumour immunology and immunotherapy'
- URL: https://www.youtube.com/watch?v=3kiDfLS0UXQ
  category: Immunotherapy
  original_title: 'Immune to Cancer | Michael Jensen | TEDxStMarksSchool'

EOF

```

