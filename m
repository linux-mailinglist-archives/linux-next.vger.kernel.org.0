Return-Path: <linux-next+bounces-4575-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F109B90D4
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 12:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6805B1C21089
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 11:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC7719C569;
	Fri,  1 Nov 2024 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A0AdBwlw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020A16F900;
	Fri,  1 Nov 2024 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462368; cv=none; b=ciGAx99xnaw3ncjJ6nCkBLFHlYNMpbezrJ5BtijG9ZzqyQ8Yts5wpMHKFRS/xyHZ5oS0Vt/78D+r2bBJbHiPX8aPk4d5eagRqoBhBKaXnR8eTwqxuSOsw5WobikI5nqytOuokYNex/oKVVHF19kfimsXf3F133I9LMuE2aQEGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462368; c=relaxed/simple;
	bh=Cy17cxS3exMAa5EYxCtbEI6xO583/s41JPE9jXkvWXk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbO99RTYPOdoU5K2SmAjf7LDB4SujwsvhffZkC9AdqMuhP0GcNsatbW6DF+G3Cve15ZKsdMBMhX47sULv3EAyrHN9uWJdmhDH2pJBW1j4yo/5J3fdSzIWCMrFoA6ILIjoIF/cLzR3ps7rn+luTmrBsRm5N/4M2SrfbVI6mNV7h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A0AdBwlw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730462359;
	bh=PxxK//bLD+jeJ2f15a2lFQhb+K2TaOY8DEpUcye4zX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A0AdBwlwSnCruceC5TZQSMYy2U9wtrWwQEt0c2YlPTxqreaVj9FbW9D5JL04jiIqC
	 jlKZB8sUg6cu+p89HdksEe2URJ4SjLgMpLZaRWGHviFqBzP5J93C++HWq69UwQtS+F
	 X8fi4Rt41xbMctUb8AVBUkBpPCQ6JBrPcLO7BILKlc4g+glhFaqGPoua0zakWGHyW0
	 Fq7Q0jEANCp3eiXXbx4+eMM7N8fApkgiiiJ0SMnV6QThAa0nzL5v+Lc64h4brp8/7T
	 I1DHM5+HvWEsAMs8s51wLZJgMWPvXptL4fJ6cKHtPTgqKgt9fEnO6LpUanKct14Rdt
	 PYFDG74pSjJ2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfztG6Jb6z4x3q;
	Fri,  1 Nov 2024 22:59:18 +1100 (AEDT)
Date: Fri, 1 Nov 2024 22:59:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH v2] docs: bug-bisect: add a note about bisecting -next
Message-ID: <20241101225916.075af3aa@canb.auug.org.au>
In-Reply-To: <0b8245f429a3cb162f8f6c0686081700a9c09cc4.1730441728.git.linux@leemhuis.info>
References: <0b8245f429a3cb162f8f6c0686081700a9c09cc4.1730441728.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/thZGsFuOZvPRq2.M2fnAQ.V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/thZGsFuOZvPRq2.M2fnAQ.V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

Thanks for this.  A couple of comments.

On Fri,  1 Nov 2024 07:17:06 +0100 Thorsten Leemhuis <linux@leemhuis.info> =
wrote:
>
> Explicitly mention how to bisect -next, as nothing in the kernel tree
> currently explains that bisects between -next versions won't work well
> and it's better to bisect between mainline and -next.
>=20
> Co-developed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
> v2:
> - slightly change patch descption
> - make the text more how-toish to better match the rest of the document
>=20
> v1: https://lore.kernel.org/all/20241022-doc-bisect-next-v1-1-196c0a60d55=
4@kernel.org/
> - initial release
> ---
>  Documentation/admin-guide/bug-bisect.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/admin-guide/bug-bisect.rst b/Documentation/adm=
in-guide/bug-bisect.rst
> index 585630d14581c7..47264c199247e6 100644
> --- a/Documentation/admin-guide/bug-bisect.rst
> +++ b/Documentation/admin-guide/bug-bisect.rst
> @@ -108,6 +108,27 @@ a fully reliable and straight-forward way to reprodu=
ce the regression, too.*
>  With that the process is complete. Now report the regression as describe=
d by
>  Documentation/admin-guide/reporting-issues.rst.
> =20
> +Bisecting linux-next
> +--------------------
> +
> +If you face a problem only happening in linux-next, bisect between the
> +linux-next branches 'stable' and 'master'. The following commands will s=
tart
> +the process for a linux-next tree you added as a remote called 'next'::
> +
> +  git bisect start
> +  git bisect good next/stable
> +  git bisect bad next/master
> +
> +The 'stable' branch refers to the state of linux-mainline the current
                                                             ^
                                                             that the curre=
nt

> +linux-next release (found in the 'master' branch) is based on -- the for=
mer
> +thus should be free of any problems that show up in -next, but not in Li=
nus'
> +tree.

As you say, 'stable' only works for the current linux-next release.  If
you are trying to bisect a previous release, you can always find the
SHA1 associated with the base of any linux-next release using "grep
origin Next/SHA1s".  Not sure how useful that is.

--=20
Cheers,
Stephen Rothwell

--Sig_/thZGsFuOZvPRq2.M2fnAQ.V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckwpQACgkQAVBC80lX
0GzWJQf8CSBcTxvbMkxJSEKUQQ05RjNIA9X0dt9R5yolLNcg3sr6PVf3pbTMrLOA
LtuhKJ+B39CLehUzMEmMnvVcaG1Bwm6PYMCv0kxHw1XcPOOVVOsSJVcX+WG0aqy2
WXYsDVGGnWffwpBUxsl48wxw6rvu0PZlIatnc76j1S8ckCEV6jlxM0UbK1NCl28l
TrvfEkVt7HhYizwM259pgQy7yUuBDctdqpTj6cUTJjF7OMkvTNjC4OeiiSznrFuo
yU/JfWUNxwEETksSUNvYUWf780LNv8T/7p5krYU8Y/OEOdQ3Ubg9+Inj4JADGQUY
QgdoOaVggPa4jVZCsii3WOFIROyeBg==
=e0eX
-----END PGP SIGNATURE-----

--Sig_/thZGsFuOZvPRq2.M2fnAQ.V--

