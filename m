Return-Path: <linux-next+bounces-5300-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B27A19B8B
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 00:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED57188A9EC
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 23:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D40E1CB9E2;
	Wed, 22 Jan 2025 23:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A4u/KmzZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A5185B62;
	Wed, 22 Jan 2025 23:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737589071; cv=none; b=TGZ+j4BAHITkuSJ+tEVC5v+538+Gig1w8ZBbKpex24+L0XbZJeS5T7ATO63J9UY4PM0rx33SeDUU4dcDqAhDJ8PkGU6p1eRuUxsI6kTGieeIPk0kUlPvZXRg/8EA5lv3TY3J6kTN7VcNAnwibnYpTknajGkuoGhwxyZUEFwltRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737589071; c=relaxed/simple;
	bh=1eonZrazNIBogHC7rGPfNalCJ0dKXt/W0xuFG9YRx+4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vdw1CvDqvh9QuAI71D6B0Qjm92omE1MuWXdOXP2k5avoAvFB5mki+n0nCR9sTvtJZiTwpWRLK0Wy7JGDHD8bRWnC/KlcJYI04klLnmOWDz5s7TCwl1wIllB3XFiGTh1wnWfSWh9lLmx5WVdgYiA3tru9o80xoGoRUbLcbS1Y95M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A4u/KmzZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737589057;
	bh=yyvHoDRDqSAAjgkPRt8WQGVrywm8zKvmbHYYIgb+bKQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A4u/KmzZH7z55fnPG/TbkmhTLhhsqkp7xcqWoiZEtORile7Kn2OuTWAOLcENGQXZb
	 CEUfZy5zjOzAAl1+/id3Rp+lhL63H0Pb8NyXUH0Y9M5noTwMHqQHguIrqYEyXWuUc4
	 Ev7fpJxxXq0SctZoGmnMs0FubTswPYxzvzl+kFnKIfDA/hygfMUZ6tDx+oB0Uge5ll
	 a2vG0c3lRyPZCAVC7GtoD0eREQmwKpVz77O/bDPYtZrbSirYQrB8ZFiXwwESDYS/kh
	 7VY+FUnzJgIqO79iSTsRbbyxy/yS35vc6BKX6Fp8yqHU1fuX43cid5+oz2o6rAwUM9
	 KbA2Bcn5QxBKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YdgV84pyfz4x4t;
	Thu, 23 Jan 2025 10:37:33 +1100 (AEDT)
Date: Thu, 23 Jan 2025 10:37:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the mm tree
Message-ID: <20250123103741.02f94108@canb.auug.org.au>
In-Reply-To: <20250106095826.140c01cb@canb.auug.org.au>
References: <20250106095826.140c01cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w91s2lZWP/=tvqd/tKi6=Ya";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w91s2lZWP/=tvqd/tKi6=Ya
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 09:58:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the jc_docs tree got a conflict in:
>=20
>   scripts/checkpatch.pl
>=20
> between commit:
>=20
>   253f01394dc0 ("checkpatch: check return of `git_commit_info`")
>=20
> from the mm-nonmm-unstable branch of the mm tree and commit:
>=20
>   6356f18f09dc ("Align git commit ID abbreviation guidelines and checks")
>=20
> from the jc_docs tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc scripts/checkpatch.pl
> index 744328d21eb8,f7087dda9ac9..000000000000
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@@ -3237,12 -3237,12 +3237,12 @@@ sub process=20
>   			my ($cid, $ctitle) =3D git_commit_info($orig_commit, $id,
>   							     $title);
>  =20
>  -			if ($ctitle ne $title || $tag_case || $tag_space ||
>  -			    $id_length || $id_case || !$title_has_quotes) {
>  +			if (defined($cid) && ($ctitle ne $title || $tag_case || $tag_space |=
| $id_length || $id_case || !$title_has_quotes)) {
>  +				my $fixed =3D "Fixes: $cid (\"$ctitle\")";
>   				if (WARN("BAD_FIXES_TAG",
> - 				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\=
"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
>  -				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (=
\"<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
> ++				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (=
\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
>   				    $fix) {
>  -					$fixed[$fixlinenr] =3D "Fixes: $cid (\"$ctitle\")";
>  +					$fixed[$fixlinenr] =3D $fixed;
>   				}
>   			}
>   		}

This is now a conflict between Linus' tree and the nn-nonmm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/w91s2lZWP/=tvqd/tKi6=Ya
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRgUUACgkQAVBC80lX
0Gz4/Af+NKey7gDuFawC3oNsgdMLHrc6OGj9+C7CnnkKx0UdzZHPPd/2vprcMmo3
1Iioz2mqF7epMBDbqBtLcwsxk8khDq0P16L0PWo3Je9yliIjbL7otaM8MwOm6ns6
xaJXao1yGObsv35hFqDUl0fWZzfLedGHmrnxO8dfM29VGhnsHkqa3wQEkJMEVRuw
duGbI4YvWY6Zw2gAysgPcJoiF+jOcivWi9OLE4r9iq4PyAVm+8VIpT2V2CHS6HEM
Ja5vBjM5iEQLFs3gUSthdP0pCUUF+g3q7YTw+FpwKVUd2c6CAG9XZrTr3mS+anQv
+naqes254LQ/yUsxHKa2xPf67+3mXw==
=hYWJ
-----END PGP SIGNATURE-----

--Sig_/w91s2lZWP/=tvqd/tKi6=Ya--

