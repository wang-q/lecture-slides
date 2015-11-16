# Download TED videos

## Software needed

### Install youtube-dl

`youtube-dl` can download videos and subtitles.

The `--proxy` option doesn't work with shadowsocks, so I install it on a linode VPS.

```bash
sudo pip install youtube-dl
mkdir -p ~/Documents/Course/TED-Ed
mkdir -p ~/Documents/Course/TED
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

### Genetics

* Pamela Ronald: The case for engineering our food

```bash
URL=https://www.youtube.com/watch?v=wZ2TF8-PGQ4
CATEGORY="TED/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* We Can Now Edit Our DNA. But Let's Do it Wisely _ Jennifer Doudna _ TED Talks

```bash
URL=https://www.youtube.com/watch?v=TdBAHexVYzc
CATEGORY="TED/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Craig Venter: A voyage of DNA, genes and the sea

```bash
URL=https://www.youtube.com/watch?v=E5X6Qy772YU
CATEGORY="TED/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Hendrik Poinar: Bring back the woolly mammoth!

```bash
URL=https://www.youtube.com/watch?v=O8e8Ttfz-pY
CATEGORY="TED/Genetics"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

### Evolution

* Why Humans Run the World | Yuval Noah Harari | TED Talks

```bash
URL=https://www.youtube.com/watch?v=nzj7Wg4DAbs
CATEGORY="TED/Evolution"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

### Ecology

* Johan Rockstrom: Let the environment guide our development

```bash
URL=https://www.youtube.com/watch?v=RgqtrlixYR4
CATEGORY="TED/Ecology"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Jonathan Trent: Energy from floating algae pods

```bash
URL=https://www.youtube.com/watch?v=X-HE4Hfa-OY
CATEGORY="TED/Ecology"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Greg Asner: Ecology from the air

```bash
URL=https://www.youtube.com/watch?v=qCrVpRBBSvY
CATEGORY="TED/Ecology"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

### Others

* Paul Ewald: Can we domesticate germs

```bash
URL=https://www.youtube.com/watch?v=176adlNeRy8
CATEGORY="TED/Others"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

* Cheryl Hayashi: The magnificence of spider silk

```bash
URL=https://www.youtube.com/watch?v=xossR6eHv3I
CATEGORY="TED/Others"
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-CN $URL -o "~/Documents/Course/${CATEGORY}/%(title)s.%(ext)s"
```

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
