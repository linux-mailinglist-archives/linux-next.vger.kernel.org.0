Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC5F9138916
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 01:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387519AbgAMAio (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 19:38:44 -0500
Received: from ozlabs.org ([203.11.71.1]:35789 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387514AbgAMAin (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Jan 2020 19:38:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47wvpQ1gFRz9s4Y;
        Mon, 13 Jan 2020 11:38:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578875920;
        bh=FiURUh2mFc4HQ9UIrHK3z5QteD9cXjaRsSTkvfSMqS4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nftgDKy9fUhMmB6/q4cJKojIqxs+rH/9eR3ioOlXA9ePTCDmEF5LSWZPTzAhk3wXc
         tadLKyrW/gPpiJAbE4mOtovKzJ4FOgdh/MgPoZKX8mMytekOCcbONLOmWcBKKdfTfV
         imhy93aE5YP37Ldgxa2scX+50EAvFiEv89bmLq/eyOup2sYtO85qR/DnBjd37hoMD9
         toOHvAghnFAGBDxFitczXdgTPcR09ndHGmfQOj/WsSWyq7dTiu8dB3KTqVeOitB/zb
         4baRVFsYZCKW0XopahaEtTjNAlVz6mUU4RpRgmBgEM9Ir1n3J33GbbCl6SKR4q2Ttv
         bYJz+0SbYeIAQ==
Date:   Mon, 13 Jan 2020 11:38:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ludovic Barre <ludovic.barre@st.com>,
        Yann Gautier <yann.gautier@st.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc
 tree
Message-ID: <20200113113837.130c3936@canb.auug.org.au>
In-Reply-To: <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
References: <20200113065808.25f28c40@canb.auug.org.au>
        <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xAPHW8WNd+cjuv+kKEVsi=t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xAPHW8WNd+cjuv+kKEVsi=t
Content-Type: multipart/mixed; boundary="MP_/1UReg_GeVyG6XiAZZeEqkIT"

--MP_/1UReg_GeVyG6XiAZZeEqkIT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Olof,

On Sun, 12 Jan 2020 11:59:58 -0800 Olof Johansson <olof@lixom.net> wrote:
>
> Thanks for the report. Time to automate this at our end, we've had a
> few too many of these slip through all the way to you lately.
>=20
> Where do you keep your scripts that you catch these things with? Do
> you have a writeup of the checks you do? I should add it to my
> automation once and for all.

I should export my linux-next scripts as a git repo, but I haven't (yet) :-(

Attached pleas find check_commits which I run after fetching each tree
and pass the changed commit range.  This, in turn, runs check_fixes
(also attached).

--=20
Cheers,
Stephen Rothwell

--MP_/1UReg_GeVyG6XiAZZeEqkIT
Content-Type: application/x-shellscript
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=check_commits

#!/bin/bash

if [ "$#" -lt 1 ]; then
	printf 'Usage: %s <commit range>\n' "$0" 1>&2
	exit 1
fi

commits=3D$(git rev-list --no-merges "$@")
if [ -z "$commits" ]; then
	printf 'No commits\n'
	exit 0
fi

"$(realpath "$(dirname "$0")")/check_fixes" "$@"

declare -a author_missing committer_missing

print_commits()
{
	if [ "$#" -eq 1 ]; then
		return
	fi

	local t=3D"$1"

	shift

	s=3D
	is=3D'is'
	its=3D'its'
	if [ "$#" -gt 1 ]; then
		s=3D's'
		is=3D'are'
		its=3D'their'
	fi
	printf 'Commit%s\n\n' "$s"
	git log --no-walk --pretty=3D'format:  %h ("%s")' "$@"
	printf '\n%s missing a Signed-off-by from %s %s%s.\n\n' \
		"$is" "$its" "$t" "$s"
}

check_unexpected_files()
{
	local files

	readarray files < <(git diff-tree -r --diff-filter=3DA --name-only --no-co=
mmit-id "$1" '*.rej' '*.orig')
	if [ "${#files[@]}" -eq 0 ]; then
		return
	fi

	s=3D
	this=3D'this'
	if [ "${#files[@]}" -gt 1 ]; then
		s=3D's'
		this=3D'these'
	fi

	printf 'Commit\n\n'
	git log --no-walk --pretty=3D'format:  %h ("%s")' "$1"
	printf '\nadded %s unexpected file%s:\n\n' "$this" "$s"
	printf '  %s\n' "${files[@]}"
}

for c in $commits; do
	ae=3D$(git log -1 --format=3D'<%ae>%n<%aE>%n %an %n %aN ' "$c" | sort -u)
	ce=3D$(git log -1 --format=3D'<%ce>%n<%cE>%n %cn %n %cN ' "$c" | sort -u)
	sob=3D$(git log -1 --format=3D'%b' "$c" |
		sed -En 's/^\s*Signed-off-by:?\s*/ /ip')

	if ! grep -i -F -q "$ae" <<<"$sob"; then
		author_missing+=3D("$c")
	fi
	if ! grep -i -F -q "$ce" <<<"$sob"; then
		committer_missing+=3D("$c")
	fi

	check_unexpected_files "$c"
done

print_commits 'author' "${author_missing[@]}"
print_commits 'committer' "${committer_missing[@]}"

exec gitk "$@"

--MP_/1UReg_GeVyG6XiAZZeEqkIT
Content-Type: application/x-shellscript
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=check_fixes

#!/bin/bash

if [ "$#" -lt 1 ]; then
        printf 'Usage: %s <commit range>\n', "$0" 1>&2
        exit 1
fi

commits=3D$(git rev-list --no-merges -i --grep=3D'^[[:space:]]*Fixes:' "$@")
if [ -z "$commits" ]; then
        exit 0
fi

# This should be a git tree that contains *only* Linus' tree
Linus_tree=3D"${HOME}/kernels/linus.git"

split_re=3D'^([Cc][Oo][Mm][Mm][Ii][Tt])?[[:space:]]*([[:xdigit:]]{5,})([[:s=
pace:]]*)(.*)$'
nl=3D$'\n'
tab=3D$'\t'

# Strip the leading and training spaces from a string
strip_spaces()
{
	[[ "$1" =3D~ ^[[:space:]]*(.*[^[:space:]])[[:space:]]*$ ]]
	echo "${BASH_REMATCH[1]}"
}

for c in $commits; do

	commit_log=3D$(git log -1 --format=3D'%h ("%s")' "$c")
	commit_msg=3D"In commit

  $commit_log

"

	fixes_lines=3D$(git log -1 --format=3D'%B' "$c" |
			grep -i '^[[:space:]]*Fixes:')

	while read -r fline; do
		[[ "$fline" =3D~ ^[[:space:]]*[Ff][Ii][Xx][Ee][Ss]:[[:space:]]*(.*)$ ]]
		f=3D"${BASH_REMATCH[1]}"
		fixes_msg=3D"Fixes tag

  $fline

has these problem(s):

"
		sha=3D
		subject=3D
		msg=3D
		if [[ "$f" =3D~ $split_re ]]; then
			first=3D"${BASH_REMATCH[1]}"
			sha=3D"${BASH_REMATCH[2]}"
			spaces=3D"${BASH_REMATCH[3]}"
			subject=3D"${BASH_REMATCH[4]}"
			if [ "$first" ]; then
				msg=3D"${msg:+${msg}${nl}}  - leading word '$first' unexpected"
			fi
			if [ -z "$subject" ]; then
				msg=3D"${msg:+${msg}${nl}}  - missing subject"
			elif [ -z "$spaces" ]; then
				msg=3D"${msg:+${msg}${nl}}  - missing space between the SHA1 and the su=
bject"
			fi
		else
			printf '%s%s  - %s\n' "$commit_msg" "$fixes_msg" 'No SHA1 recognised'
			commit_msg=3D''
			continue
		fi
		if ! git rev-parse -q --verify "$sha" >/dev/null; then
			printf '%s%s  - %s\n' "$commit_msg" "$fixes_msg" 'Target SHA1 does not e=
xist'
			commit_msg=3D''
			continue
		fi

		if [ "${#sha}" -lt 12 ]; then
			msg=3D"${msg:+${msg}${nl}}  - SHA1 should be at least 12 digits long${nl=
}    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11$=
{nl}    or later) just making sure it is not set (or set to \"auto\")."
		fi
		# reduce the subject to the part between () if there
		if [[ "$subject" =3D~ ^\((.*)\) ]]; then
			subject=3D"${BASH_REMATCH[1]}"
		elif [[ "$subject" =3D~ ^\((.*) ]]; then
			subject=3D"${BASH_REMATCH[1]}"
			msg=3D"${msg:+${msg}${nl}}  - Subject has leading but no trailing parent=
heses"
		fi

		# strip matching quotes at the start and end of the subject
		# the unicode characters in the classes are
		# U+201C LEFT DOUBLE QUOTATION MARK
		# U+201D RIGHT DOUBLE QUOTATION MARK
		# U+2018 LEFT SINGLE QUOTATION MARK
		# U+2019 RIGHT SINGLE QUOTATION MARK
		re1=3D$'^[\"\u201C](.*)[\"\u201D]$'
		re2=3D$'^[\'\u2018](.*)[\'\u2019]$'
		re3=3D$'^[\"\'\u201C\u2018](.*)$'
		if [[ "$subject" =3D~ $re1 ]]; then
			subject=3D"${BASH_REMATCH[1]}"
		elif [[ "$subject" =3D~ $re2 ]]; then
			subject=3D"${BASH_REMATCH[1]}"
		elif [[ "$subject" =3D~ $re3 ]]; then
			subject=3D"${BASH_REMATCH[1]}"
			msg=3D"${msg:+${msg}${nl}}  - Subject has leading but no trailing quotes"
		fi

		subject=3D$(strip_spaces "$subject")

		target_subject=3D$(git log -1 --format=3D'%s' "$sha")
		target_subject=3D$(strip_spaces "$target_subject")

		# match with ellipses
		case "$subject" in
		*...)	subject=3D"${subject%...}"
			target_subject=3D"${target_subject:0:${#subject}}"
			;;
		...*)	subject=3D"${subject#...}"
			target_subject=3D"${target_subject: -${#subject}}"
			;;
		*\ ...\ *)
			s1=3D"${subject% ... *}"
			s2=3D"${subject#* ... }"
			subject=3D"$s1 $s2"
			t1=3D"${target_subject:0:${#s1}}"
			t2=3D"${target_subject: -${#s2}}"
			target_subject=3D"$t1 $t2"
			;;
		esac
		subject=3D$(strip_spaces "$subject")
		target_subject=3D$(strip_spaces "$target_subject")

		if [ "$subject" !=3D "${target_subject:0:${#subject}}" ]; then
			msg=3D"${msg:+${msg}${nl}}  - Subject does not match target commit subje=
ct${nl}    Just use${nl}${tab}git log -1 --format=3D'Fixes: %h (\"%s\")'"
		fi
		lsha=3D$(cd "$Linus_tree" && git rev-parse -q --verify "$sha")
		if [ -z "$lsha" ]; then
			count=3D$(git rev-list --count "$sha".."$c")
			if [ "$count" -eq 0 ]; then
				msg=3D"${msg:+${msg}${nl}}  - Target is not an ancestor of this commit"
			fi
		fi
		if [ "$msg" ]; then
			printf '%s%s%s\n' "$commit_msg" "$fixes_msg" "$msg"
			commit_msg=3D''
		fi
	done <<< "$fixes_lines"
done

exit 0

--MP_/1UReg_GeVyG6XiAZZeEqkIT--

--Sig_/xAPHW8WNd+cjuv+kKEVsi=t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4bvA0ACgkQAVBC80lX
0Gzf7Af/cFeKP+OQREG73VGV/1X4bi2vfJDJ5fOetieSVjY3vmvkj4fywwWRhUO8
DKE8cOABxHKa6OaDHXJfrpqk8m5s5CV9beleBqXCHPK0OtMzkb7vfTE5aecPaojy
AQVx5dK9nBkO2BsTaPRjpyHeuxvfPUpVti5myBAqPcyYLBy1YMmPhQAH5J4OVCss
wkEZVJ0hFr9DkXGN8k2IOnCKsyvkWzvdLQL8tiTCoHGxWe1oCSK3RVmLI6v1QQQ3
iDuiFPvUoLfLgm6VJqIT4MJrYx3Bcbk+eyzAFA/BBnBtqO1Rmo3uUQhLh3RF0GJj
sHvTY7g8JmVLuCKxHUyXKuJZJPut/Q==
=jQDi
-----END PGP SIGNATURE-----

--Sig_/xAPHW8WNd+cjuv+kKEVsi=t--
