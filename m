Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081A141A445
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 02:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238377AbhI1ApZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 20:45:25 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42817 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238236AbhI1ApY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 20:45:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJLNG3n5Yz4xVP;
        Tue, 28 Sep 2021 10:43:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632789822;
        bh=RNP7cGHoZcEQnkXOoIeMMadb5dCDhtDBdSSRUGAbJHU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PtzWOQvOa1COM4YUCCwxPNM6aafFRy4qG6RwKE8NueC2j4rWUG3Vd+DtWn/qmE6v7
         XVzwk7hYuI2B4ext9FiqkcUyY34edxuxHCBeycunORFGcQ6u+iDinEyBcZFB/kCBse
         VeomdPYAwlBSg71vCj1TVLSnvkc9j5HlwV/Fkc/Mfu89pe5vi0yBYAjydZ1EiUV+Tp
         yUuBiDl8dSNZbaLXjWKh4o3bB6f84g6dyyFMAGiAHmIPATg9K1pPWfV7PjsY5uinT3
         mvMKvV2CB9y3xmRvOs4g8D0FDNU7Mxg2oMdAi3Bnjt+wLyzYWZmwF3MvqOdj2uiSKC
         tB1/UefQZLVpw==
Date:   Tue, 28 Sep 2021 10:43:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rpmsg tree
Message-ID: <20210928104341.31521fb0@canb.auug.org.au>
In-Reply-To: <YVJXpBwfdMYKaE0R@ripper>
References: <20210928084011.3f2318fc@canb.auug.org.au>
        <YVJXpBwfdMYKaE0R@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z8byQECu=.D4FCKxbhwRBs7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z8byQECu=.D4FCKxbhwRBs7
Content-Type: multipart/mixed; boundary="MP_/3Q.ocK.EKlr006rTlhpFs7X"

--MP_/3Q.ocK.EKlr006rTlhpFs7X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Bjorn,

On Mon, 27 Sep 2021 16:45:40 -0700 Bjorn Andersson <bjorn.andersson@linaro.=
org> wrote:
>
> On Mon 27 Sep 15:40 PDT 2021, Stephen Rothwell wrote:
> May I ask what tool you use to detect this? Given that checkpatch
> doesn't care about the committer (afaict)...

After I fetch each tree, I give the new commit range to the attached
script (check_commits) which calls the other script as well
(check_fixes).
--=20
Cheers,
Stephen Rothwell

--MP_/3Q.ocK.EKlr006rTlhpFs7X
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

--MP_/3Q.ocK.EKlr006rTlhpFs7X
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

--MP_/3Q.ocK.EKlr006rTlhpFs7X--

--Sig_/z8byQECu=.D4FCKxbhwRBs7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSZT0ACgkQAVBC80lX
0GxJqAf/eJv4D2mbOXUT5QCPGjocJq71P5WYkrJmi8Z+X6ue8YhWf5CUN6PLhFNc
LDN+h+JerG5vmlzQW5WL51nGEbp8GvtXjwtDHJB5juiWq+lAZ6tTE2KhYg7rqGjx
DyLP+O9KVQKMad1bs8SOpzAKvRnXTqQVVY4N8Yn1owaBNQdYStfQm2jmILztLWvq
fDcwVg/LrOLsZ/s6BTKOz6X9gHUzbRBaivTCnjhBKnik3hV5dhzW4LUUMXByUjNe
/FiWifT0fEYLIydAD+/f6IMV+uAwIPxauyPp1rt70iwF4h94TVLm+fDrxc99KQef
0BYEuff0iQeS/wQ/yHtuG8drfPdsUA==
=vOg8
-----END PGP SIGNATURE-----

--Sig_/z8byQECu=.D4FCKxbhwRBs7--
