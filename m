Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74703AF8F0
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 01:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhFUXIg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 19:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhFUXIg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 19:08:36 -0400
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB79C061574
        for <linux-next@vger.kernel.org>; Mon, 21 Jun 2021 16:06:21 -0700 (PDT)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4G84s14gf4zydf;
        Tue, 22 Jun 2021 09:06:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1624316775;
        bh=nRFFceQC0i4MTlKoc6PHVW7QV/JV9HsjPYqDi/8FhTo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oJx1MqKYUz7F7SVt6V9HS1URqF0CNd1pByuT16U17wq/+LmB3M6VKLwfFzvRXDZ9E
         Y7GRxyi9Qeq9RC6hKfd1VsgccI2S7fBZ3pR9R6KNUEfSAFF5dMomzb78oV6YxQphUl
         GUd9unGOVeXp3y6ncqQRf9qNl3zzrYJcfLr+RjwWRCLQXf42kMNin9cF6FzxrTx6zR
         mSIcLQsg9b8bGBLPaE9xm5r2L9qU44iK8PZxSu9R1int901LM7AyRamAyok40n6lFC
         52ErlkDfB8yAlU5NFDLz9ZHEXg30PuIZUx1qIUmFRrPxeQnC/ockd+xi91SZ1/U7CX
         qjh6nG06X36vQ==
Date:   Tue, 22 Jun 2021 09:06:12 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Allison Henderson <allison.henderson@oracle.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the xfs tree
Message-ID: <20210622090612.15c37586@elm.ozlabs.ibm.com>
In-Reply-To: <20210621215159.GE3619569@locust>
References: <20210621082656.59cae0d8@canb.auug.org.au>
        <20210621171208.GD3619569@locust>
        <20210622072719.1d312bf0@canb.auug.org.au>
        <20210621215159.GE3619569@locust>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zMntSk87GG6YS7u0n9S4R1e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zMntSk87GG6YS7u0n9S4R1e
Content-Type: multipart/mixed; boundary="MP_/qxH8R_N2lsV3VJtwx/JC+J2"

--MP_/qxH8R_N2lsV3VJtwx/JC+J2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Darrick,

On Mon, 21 Jun 2021 14:51:59 -0700 "Darrick J. Wong" <djwong@kernel.org> wr=
ote:
>
> Um... do you know if there's a commit hook or something that all of us
> can add to spot-check all this stuff?  I would really like to spend my
> worry beans on about algorithms and code design, not worrying about how
> many signature rules can be bent before LT starts refusing pull requests.

Attached are the scripts I run over each tree as I fetch them each day.
The check_commits script calls the check_fixes script.

So, I fetch a maintainer's branch into a local branch and then run

check_commits ^origin/master <old head>..<new head>

origin/master is Linus' tree.
--=20
Cheers,
Stephen Rothwell

--MP_/qxH8R_N2lsV3VJtwx/JC+J2
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

--MP_/qxH8R_N2lsV3VJtwx/JC+J2
Content-Type: application/x-shellscript
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=check_fixes

#!/bin/bash

shopt -s extglob

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
	local str=3D"${1##*([[:space:]])}"
	str=3D"${str%%*([[:space:]])}"
	echo "$str"
}

for c in $commits; do

	printf -v commit_msg 'In commit\n\n  %s\n\n' \
		"$(git log -1 --format=3D'%h ("%s")' "$c")"

	readarray -t fixes_lines < <(git log -1 --format=3D'%B' "$c" |
					grep -i '^[[:space:]]*Fixes:')
	fixes_lines=3D( "${fixes_lines[@]##*([[:space:]])}" )
	fixes_lines=3D( "${fixes_lines[@]%%*([[:space:]])}" )

	for fline in "${fixes_lines[@]}"; do
		f=3D"${fline##[Ff][Ii][Xx][Ee][Ss]:*([[:space:]])}"
		printf -v fixes_msg 'Fixes tag\n\n  %s\n\nhas these problem(s):\n\n' "$fl=
ine"
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
	done
done

exit 0

--MP_/qxH8R_N2lsV3VJtwx/JC+J2--

--Sig_/zMntSk87GG6YS7u0n9S4R1e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRG2QACgkQAVBC80lX
0GwyDgf/UOfq6cnh88WLChxTX/qKlZBwPHzGckELMck4CFeVepjl6D6N3z5eJX2k
TZhbk1hDuAVCoPCiXh2WgfZaT5C+yu1URanQiBcEB4cOPU1GPGTYBv0sr3POD2rw
GOfLd+AXR79DwLGDgofRY/b9BaL3/ov04NuRT116YHCIMggI7ArEGWpzIr7EsW2X
d3SvgVtz36QT19QJ7DI0HIHzDoenC+0tZ2Pl4vx6f43HUAWvXhEPETtLQbtVhiNj
NjEhRBtxWzooL/ZQNVlLl2MdNUGrgXdoAlYBC438dkYaxmIGo9jUK3NsXaFiSKDv
DE/nMr1xcp8Zg3wH99TR1DHjPLDHZw==
=4YVo
-----END PGP SIGNATURE-----

--Sig_/zMntSk87GG6YS7u0n9S4R1e--
