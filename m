Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B48FD3D82
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 12:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfJKKhH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Oct 2019 06:37:07 -0400
Received: from ozlabs.org ([203.11.71.1]:45531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbfJKKhH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Oct 2019 06:37:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46qPXG114zz9sNx;
        Fri, 11 Oct 2019 21:37:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570790223;
        bh=mmnFvz3+OLMxbtvM61F4sakF+nEt3C7jllRIDZGcOOE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ftbuwlbQdi4PQkRslrffdTmpXVegArHshm9LJwmTVH0jzR4T9PqyHstQgFz0e1y3W
         dnVkGxkI1Puy1CbrkxcvuFFWmTunUDokmpvdubsktxo8bEvcSkCH3eh/9Ag8iWiNqo
         AhPveiGfbO55Gs9YDx3uZn8OIDl8LgHaHNJvYUc5u2Dqt6bQxBWUBFomqZKNwwxpmH
         EHBYTR/srP6D/RUuiJwPnjUC4cb4k5L6GABT0nixBEykGIY9mRcnoSYvRtA4mVWCec
         HxWAwW840kudBvdlHL1QgJNarb5RgI6X3+C7YhYQwbFk1mtXo410Pfi9bKYxNYKW5G
         QnNx3hEBxD+bw==
Date:   Fri, 11 Oct 2019 21:36:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <jonathan.cameron@huawei.com>
Cc:     Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the staging.current
 tree
Message-ID: <20191011213610.5943cdea@canb.auug.org.au>
In-Reply-To: <20191011082902.GA1074099@kroah.com>
References: <20191011074242.3d78c336@canb.auug.org.au>
        <53418B0A3A5CEF439F1108674285B0A903FE8CC8@lhreml523-mbs.china.huawei.com>
        <20191011082902.GA1074099@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iOC_WsRrM=mA3RCCF2xloc=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iOC_WsRrM=mA3RCCF2xloc=
Content-Type: multipart/mixed; boundary="MP_/Hz/8KkJCMNEkaM.JTGvZ4I7"

--MP_/Hz/8KkJCMNEkaM.JTGvZ4I7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Jonathan,

On Fri, 11 Oct 2019 10:29:02 +0200 Greg KH <greg@kroah.com> wrote:
>
> On Fri, Oct 11, 2019 at 08:10:23AM +0000, Jonathan Cameron wrote:
> > Hi Stephen
> >=20
> > Sorry, I've clearly let another one of these through.
> >=20
> > Stupid question of the day.  Don't suppose you can share how you check =
these? =20
>=20
> There's a script, that I posted to the workflows mailing list, that
> should check these, based on Stephen's script.
>=20
> But it didn't seem to catch this problem, which is odd, I must have
> messed something up...

Attached is my script.  It takes a range of commits to check.  Usually
after I fetch a tree I pass it "^origin/master <old head of tree>...<new he=
ad of tree>".

--=20
Cheers,
Stephen Rothwell

--MP_/Hz/8KkJCMNEkaM.JTGvZ4I7
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

--MP_/Hz/8KkJCMNEkaM.JTGvZ4I7--

--Sig_/iOC_WsRrM=mA3RCCF2xloc=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2gWxoACgkQAVBC80lX
0GwQEgf+P4EM9MGOL4SvF4ALESz4GHDw9MPBeOG7QfjZC0MYn8NgtkXmc2PSyU4E
DnF5f3+fun5zg1p/VyssZL0T9QCSoV6cvkN6xX7vvKGlk0nKj2awYFsW3TQUPV/I
2Ap9704rW6lI65UtejMCwC8XDa6hjvOxJza+/med+e3hyNo9Mt8IdUY+ymJ7PHyn
LAax4SAnC+z35BAfj6avHtGimdOwAsgRFkqB1AiSQlkB2SM4N4m4J9niWypUVOjm
MM+VxCIc2ZF3h7MWKw4jLVKhFQw7QS019IlC6fl+NoD1u1Q90hCWf++AJcSw6MJw
hCAEqBYwpvP9qBfMim76TUQ4QyoO3Q==
=9H2Z
-----END PGP SIGNATURE-----

--Sig_/iOC_WsRrM=mA3RCCF2xloc=--
