# Download TED videos

## Software needed

### Install youtube-dl

`youtube-dl` can download videos and subtitles.

The `--proxy` option doesn't work with shadowsocks, so I install it on a linode VPS.

```bash
sudo pip install youtube-dl
mkdir -p ~/Documents/Course/TED-Ed
```

### Install ffmpeg

Use ffmpeg to burn subtitles into videos.

```bash
brew install x264 lame libvo-aacenc xvid
brew install ffmpeg --with-libass
```

### Bring files back with rsync

```bash
rsync -avP wangq@45.79.80.100:Documents/Course/ ~/Documents/Course/
```

## TED

### On the linode VPS.

* Create `TED.yml` manually.

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/TED.yml
---
- URL: https://www.youtube.com/watch?v=qCrVpRBBSvY
  category: TED/Ecology
  original_title: 'Greg Asner: Ecology from the air'
- URL: https://www.youtube.com/watch?v=RgqtrlixYR4
  category: TED/Ecology
  original_title: 'Johan Rockstrom: Let the environment guide our development'
- URL: https://www.youtube.com/watch?v=X-HE4Hfa-OY
  category: TED/Ecology
  original_title: 'Jonathan Trent: Energy from floating algae pods'
- URL: https://www.youtube.com/watch?v=0QVXdEOiCw8
  category: TED/Evolution
  original_title: 'Jack Horner: Building a dinosaur from a chicken'
- URL: https://www.youtube.com/watch?v=i-icXZ2tMRM
  category: TED/Evolution
  original_title: 'Rob Knight: How our microbes make us who we are'
- URL: https://www.youtube.com/watch?v=nzj7Wg4DAbs
  category: TED/Evolution
  original_title: Why Humans Run the World | Yuval Noah Harari | TED Talks
- URL: https://www.youtube.com/watch?v=E5X6Qy772YU
  category: TED/Genetics
  original_title: 'Craig Venter: A voyage of DNA, genes and the sea'
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
- URL: https://www.youtube.com/watch?v=xossR6eHv3I
  category: TED/Others
  original_title: 'Cheryl Hayashi: The magnificence of spider silk'
- URL: https://www.youtube.com/watch?v=k_GFq12w5WU
  category: TED/Others
  original_title: 'Janine Benyus: Biomimicry in action'
- URL: https://www.youtube.com/watch?v=u2V0vOFexY4
  category: TED/Others
  original_title: 'Jim Fallon: Exploring the mind of a killer'
- URL: https://www.youtube.com/watch?v=176adlNeRy8
  category: TED/Others
  original_title: 'Paul Ewald: Can we domesticate germs?'
EOF
```

* Get video information with `dl_video.pl`.

```bash
cd ~/Scripts/lecture-slides/materials
perl dl_video.pl -a update -i TED.yml -o TED-update
```

* Then generate bash script with `dl_video.pl`.

```bash
cd ~/Scripts/lecture-slides/materials
mkdir -p ~/Documents/Course/TED
perl dl_video.pl -a download -i TED-update.yml -o TED-output -d ~/Documents/Course
```

* Download videos and subtitles with the generated bash script.

```bash
mkdir -p ~/Documents/Course/TED
bash ~/Documents/Course/TED-output.download.sh
```

* A working example which can be pasted line by line to terminal. 

    "Pamela Ronald: The case for engineering our food"

```bash
URL=https://www.youtube.com/watch?v=wZ2TF8-PGQ4
CATEGORY="TED/Genetics"
ORI_TITLE=`youtube-dl $URL --get-title`
TITLE=`youtube-dl $URL --restrict-filenames --get-filename  -o "%(title)s"`
EXT=`youtube-dl $URL --restrict-filenames --get-filename -o "%(ext)s"`
FULLPATH="~/Documents/Course/${CATEGORY}/${TITLE}.${EXT}"

youtube-dl $URL -o "${FULLPATH}"

youtube-dl $URL --list-subs
youtube-dl $URL -o "${FULLPATH}" --write-sub --sub-lang en --skip-download
youtube-dl $URL -o "${FULLPATH}" --write-sub --sub-lang zh-CN --skip-download
```

### Ecology

### Others

## TED Ed

### Genetics

* What happens when your DNA is damaged - Monica Menesini

```bash
URL=https://www.youtube.com/watch?v=vP8-5Bhd2ag
CATEGORY="TED-Ed/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* The race to sequence the human genome - Tien Nguyen

```bash
URL=https://www.youtube.com/watch?v=AhsIF-cmoQQ
CATEGORY="TED-Ed/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* How Mendel's pea plants helped us understand genetics - Hortensia Jiménez Díaz

```bash
URL=https://www.youtube.com/watch?v=Mehz7tCxjSE
CATEGORY="TED-Ed/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* The cancer gene we all have - Michael Windelspecht

```bash
URL=https://www.youtube.com/watch?v=pOyKFgGKmHE
CATEGORY="TED-Ed/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* RNAi: Slicing, dicing and serving your cells - Alex Dainis

```bash
URL=https://www.youtube.com/watch?v=tzlGU5EI9rU
CATEGORY="TED-Ed/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Sex Determination: More Complicated Than You Thought

```bash
URL=https://www.youtube.com/watch?v=kMWxuF9YW38
CATEGORY="TED-Ed/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

### Evolution

* Five fingers of evolution - Paul Andersen

```bash
URL=https://www.youtube.com/watch?v=5NdMnlt2keE
CATEGORY="TED-Ed/Evolution"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* The evolution of the human eye - Joshua Harvey

```bash
URL=https://www.youtube.com/watch?v=qrKZBh8BL_U
CATEGORY="TED-Ed/Evolution"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Where do genes come from? - Carl Zimmer

```bash
URL=https://www.youtube.com/watch?v=z9HIYjRRaDE
CATEGORY="TED-Ed/Evolution"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* How we think complex cells evolved - Adam Jacobson

```bash
URL=https://www.youtube.com/watch?v=9i7kAt97XYU
CATEGORY="TED-Ed/Evolution"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Which Came First - The Chicken or the Egg

```bash
URL=https://www.youtube.com/watch?v=1a8pI65emDE
CATEGORY="TED-Ed/Evolution"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
#youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

### Ecology

* How bees help plants have sex - Fernanda S. Valdovinos

```bash
URL=https://www.youtube.com/watch?v=Y5uRVv7GGQM
CATEGORY="TED-Ed/Ecology"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Why is biodiversity so important? - Kim Preshoff

```bash
URL=https://www.youtube.com/watch?v=GK_vRtHJZu4
CATEGORY="TED-Ed/Ecology"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

### Others

* How do vaccines work? - Kelwalin Dhanasarnsombut

```bash
URL=https://www.youtube.com/watch?v=GK_vRtHJZu4
CATEGORY="TED-Ed/Ecology"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Learning from smallpox: How to eradicate a disease - Julie Garon and Walter A. Orenstein

```bash
URL=https://www.youtube.com/watch?v=oBSandHijDc
CATEGORY="TED-Ed/Others"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Cell vs. virus: A battle for health - Shannon Stiles

```bash
URL=https://www.youtube.com/watch?v=oqGuJhOeMek
CATEGORY="TED-Ed/Others"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* How Life Begins in the Deep Ocean

```bash
URL=https://www.youtube.com/watch?v=i_R7ouD8-Eo
CATEGORY="TED-Ed/Others"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* The brilliance of bioluminescence - Leslie Kenna

```bash
URL=https://www.youtube.com/watch?v=oKjFVBVGad0
CATEGORY="TED-Ed/Others"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

## Embed subtitles

```bash
mkdir -p ~/Docuemnts/Course/TED-Ed/Evolution/embed
cd ~/Docuemnts/Course/TED-Ed/Evolution

TITLE="Five fingers of evolution - Paul Andersen"
cat "${TITLE}.en.srt" "${TITLE}.zh-Hans.srt" > "${TITLE}.merged.srt"
ffmpeg -i "${TITLE}.mp4" -vf "subtitles='${TITLE}.merged.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    "embed/${TITLE}.mp4"

TITLE="The evolution of the human eye - Joshua Harvey"
cat "${TITLE}.en.srt" "${TITLE}.zh-Hans.srt" > "${TITLE}.merged.srt"
ffmpeg -i "${TITLE}.mp4" -vf "subtitles='${TITLE}.merged.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    "embed/${TITLE}.mp4"

TITLE="Where do genes come from - Carl Zimmer"
cat "${TITLE}.en.srt" "${TITLE}.zh-Hans.srt" > "${TITLE}.merged.srt"
ffmpeg -i "${TITLE}.mp4" -vf "subtitles='${TITLE}.merged.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    "embed/${TITLE}.mp4"

TITLE="How we think complex cells evolved - Adam Jacobson"
ffmpeg -i "${TITLE}.mp4" -vf "subtitles='${TITLE}.en.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    "embed/${TITLE}.mp4"

TITLE="Which Came First - The Chicken or the Egg"
ffmpeg -i "${TITLE}.mp4" -vf "subtitles='${TITLE}.en.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    "embed/${TITLE}.mp4"
```
