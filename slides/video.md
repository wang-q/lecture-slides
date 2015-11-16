# Download videos from youtube

## Install youtube-dl

`youtube-dl` can download videos with subtitles.

The `--proxy` option doesn't work with shadowsocks, so I install it on a linode VPS.

```bash
sudo pip install youtube-dl
mkdir -p ~/Documents/Course/TED-Ed
```

## Install ffmpeg

Use ffmpeg to burn subtitles into videos.

```bash
brew install x264 lame libvo-aacenc xvid
brew install ffmpeg --with-libass
```

## TED Ed

### Genetics

* What happens when your DNA is damaged - Monica Menesini

```bash
URL=https://www.youtube.com/watch?v=vP8-5Bhd2ag
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* The race to sequence the human genome - Tien Nguyen

```bash
URL=https://www.youtube.com/watch?v=AhsIF-cmoQQ
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* How Mendel's pea plants helped us understand genetics - Hortensia Jiménez Díaz

```bash
URL=https://www.youtube.com/watch?v=Mehz7tCxjSE
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* The cancer gene we all have - Michael Windelspecht

```bash
URL=https://www.youtube.com/watch?v=pOyKFgGKmHE
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* RNAi: Slicing, dicing and serving your cells - Alex Dainis

```bash
URL=https://www.youtube.com/watch?v=tzlGU5EI9rU
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* Sex Determination: More Complicated Than You Thought

```bash
URL=https://www.youtube.com/watch?v=kMWxuF9YW38
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

### Evolution

* The evolution of the human eye - Joshua Harvey

```bash
URL=https://www.youtube.com/watch?v=qrKZBh8BL_U
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* Where do genes come from? - Carl Zimmer

```bash
URL=https://www.youtube.com/watch?v=z9HIYjRRaDE
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* How we think complex cells evolved - Adam Jacobson

```bash
URL=https://www.youtube.com/watch?v=9i7kAt97XYU
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* Which Came First - The Chicken or the Egg

```bash
URL=https://www.youtube.com/watch?v=1a8pI65emDE
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
youtube-dl --skip-download --write-auto-sub --sub-lang zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* Five fingers of evolution - Paul Andersen

```bash
URL=https://www.youtube.com/watch?v=5NdMnlt2keE
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

### Ecology

* How bees help plants have sex - Fernanda S. Valdovinos

```bash
URL=https://www.youtube.com/watch?v=Y5uRVv7GGQM
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* Why is biodiversity so important? - Kim Preshoff

```bash
URL=https://www.youtube.com/watch?v=GK_vRtHJZu4
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

### Others

* How do vaccines work? - Kelwalin Dhanasarnsombut

```bash
URL=https://www.youtube.com/watch?v=rb7TVW77ZCs
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* Learning from smallpox: How to eradicate a disease - Julie Garon and Walter A. Orenstein

```bash
URL=https://www.youtube.com/watch?v=oBSandHijDc
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* Cell vs. virus: A battle for health - Shannon Stiles

```bash
URL=https://www.youtube.com/watch?v=oqGuJhOeMek
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* How Life Begins in the Deep Ocean

```bash
URL=https://www.youtube.com/watch?v=i_R7ouD8-Eo
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-Hans $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

* The brilliance of bioluminescence - Leslie Kenna

```bash
URL=https://www.youtube.com/watch?v=oKjFVBVGad0
youtube-dl --list-subs $URL
youtube-dl --write-sub --sub-lang en,zh-TW $URL -o '~/Documents/Course/TED-Ed/%(title)s.%(ext)s'
```

## Embed subtitles

```bash
mkdir -p embed

ffmpeg -i 'Five fingers of evolution - Paul Andersen.mp4' -vf "subtitles='Five fingers of evolution - Paul Andersen.zh-Hans.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    'embed/Five fingers of evolution - Paul Andersen.mp4'

ffmpeg -i 'The evolution of the human eye - Joshua Harvey.mp4' -vf "subtitles='The evolution of the human eye - Joshua Harvey.zh-Hans.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    'embed/The evolution of the human eye - Joshua Harvey.mp4'

ffmpeg -i 'Where do genes come from - Carl Zimmer.mp4' -vf "subtitles='Where do genes come from - Carl Zimmer.zh-Hans.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    'embed/Where do genes come from - Carl Zimmer.mp4'

ffmpeg -i 'How we think complex cells evolved - Adam Jacobson.mp4' -vf "subtitles='How we think complex cells evolved - Adam Jacobson.en.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    'embed/How we think complex cells evolved - Adam Jacobson.mp4'

ffmpeg -i 'Which Came First - The Chicken or the Egg.mp4' -vf "subtitles='Which Came First - The Chicken or the Egg.en.srt'" \
    -c:v libx264 -crf 20 \
    -c:a copy \
    'embed/Which Came First - The Chicken or the Egg.mp4'
```
