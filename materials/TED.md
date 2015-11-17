# Download TED videos

## Software needed

### Install youtube-dl

`youtube-dl` can download videos and subtitles.

The `--proxy` option doesn't work with shadowsocks, so I install it on a linode VPS.

```bash
sudo pip install youtube-dl
```

### Install ffmpeg in VPS

Ubuntu 14.04 ships `libav-tools` other than `ffmpeg`, so get it by [ppa](https://launchpad.net/~mc3man/+archive/ubuntu/trusty-media).

```bash
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update

sudo apt-get install ffmpeg

sudo add-apt-repository --remove ppa:mc3man/trusty-media
sudo apt-get update
```

### Install ffmpeg in Mac

Use ffmpeg to burn subtitles into videos.

```bash
brew install x264 lame libvo-aacenc xvid
brew install ffmpeg --with-libass
```

## TED

For videos that max resolution less than 480p in youtube (e.g., ones released before 2010), download them directly from ted.com.

### On the linode VPS.

* Create `TED.yml` manually.

    Human beings make mistakes. Compare `TED.yml` and auto-generated `TED-update.yml` to fix errors.

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
  original_title: 'Why Humans Run the World | Yuval Noah Harari | TED Talks'
- URL: https://www.youtube.com/watch?v=WjBwhwe5-cc
  category: TED/Evolution
  original_title: "Isabel Behncke: Evolution's gift of play, from bonobo apes to humans"
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
  category: LOW/TED/Others
  original_title: 'Paul Ewald: Can we domesticate germs?'
EOF
```

* Get video information with `dl_video.pl`.

```bash
cd ~/Scripts/lecture-slides/materials
perl dl_video.pl -a update -i TED.yml -o TED-update
```

* Generate downloading bash script, download files and generate reports.

```bash
cd ~/Scripts/lecture-slides/materials
mkdir -p ~/Documents/Course/TED
perl dl_video.pl -a download -i TED-update.yml -o TED-output -d ~/Documents/Course

mkdir -p ~/Documents/Course/TED
bash ~/Documents/Course/TED-output.download.sh

perl dl_video.pl -a report -i TED-update.yml -o TED-output -d ~/Documents/Course
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

youtube-dl $URL --list-formats
youtube-dl $URL --format 22 -o "${FULLPATH}"

youtube-dl $URL --list-subs
youtube-dl $URL -o "${FULLPATH}" --write-sub --sub-lang en --skip-download
youtube-dl $URL -o "${FULLPATH}" --write-sub --sub-lang zh-CN --skip-download
```

### On my Mac

* Generate merging bash script.

```bash
cd ~/Scripts/lecture-slides/materials
mkdir -p ~/Documents/Course/TED
perl dl_video.pl -a merge -i TED-update.yml -o TED-output -d ~/Documents/Course
```

* Burn subtitles into videos with the generated script.

    Or copy and paste command lines of a video to terminal.

```bash
rsync -avP wangq@45.79.80.100:Documents/Course/ ~/Documents/Course/

mkdir -p ~/Documents/Course/embed
cd ~/Documents/Course
bash ~/Documents/Course/TED-output.merge.sh
```

## TED Ed

### On the linode VPS.

```bash
cat <<'EOF' > ~/Scripts/lecture-slides/materials/TED-Ed.yml
---
- URL: https://www.youtube.com/watch?v=Y5uRVv7GGQM
  category: TED-Ed/Ecology
  original_title: 'How bees help plants have sex - Fernanda S. Valdovinos'
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
EOF
```

```bash
cd ~/Scripts/lecture-slides/materials
perl dl_video.pl -a update -i TED-Ed.yml -o TED-Ed-update

mkdir -p ~/Documents/Course/TED-Ed
perl dl_video.pl -a download -i TED-Ed-update.yml -o TED-Ed-output -d ~/Documents/Course

bash ~/Documents/Course/TED-Ed-output.download.sh

perl dl_video.pl -a report -i TED-Ed-update.yml -o TED-Ed-output -d ~/Documents/Course
```

### On my Mac

```bash
cd ~/Scripts/lecture-slides/materials
mkdir -p ~/Documents/Course/TED-Ed
perl dl_video.pl -a merge -i TED-Ed-update.yml -o TED-Ed-output -d ~/Documents/Course

rsync -avP wangq@45.79.80.100:Documents/Course/ ~/Documents/Course/

mkdir -p ~/Documents/Course/embed
cd ~/Documents/Course
bash ~/Documents/Course/TED-Ed-output.merge.sh
```
