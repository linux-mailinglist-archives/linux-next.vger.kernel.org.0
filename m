Return-Path: <linux-next+bounces-4817-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093789D3237
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 03:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E0B5B2251C
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 02:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A921B95B;
	Wed, 20 Nov 2024 02:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oJ2Ttww2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47960E545;
	Wed, 20 Nov 2024 02:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732070101; cv=none; b=hZ6oKJIu4sSDup5g7xotiOZ2/r/f50+Q/t6MNIZwjQkqPLNGETY1CmhStpbu+uQC48I8323lGst/9fWQHStGxbMdJndAFf11I/IY/0D1woErGguBdu45ftvk3ZrELUQGpn98iMOlppCLikidX1dEgABZPJPeblzBXJkWEEgTuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732070101; c=relaxed/simple;
	bh=iHVRLGFAKh/PeVcKMn/azh2L9Py/ZSGp9Bad4Dnqa9g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZYic1s4gTUXB1E6jec4Xxh+LsXpgZcnhObx089fBYECPA2mmbknBzpB0mzQMuFHyYrlcmEnf+qq9lChr2M7NUBafwcMBdTFjWBzBdncfg2dwFSjKcYtcUNarkFDleBOCdLgj9wklhJTvZ6oN36R2R2ufMrtX7RfDqWq9X4rQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oJ2Ttww2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732070090;
	bh=v7E20c1qfPaOhIqvypHRa4hnsb9Acllf9o72WjX/5mE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oJ2Ttww2ydfUfWH1yak1BsWsPHq2+mjKFAqk8jYxqkZuTPq2maxcCA3T9EVwMrur4
	 yC1g2BoDh+PjEDfeWLiaxOVW86/AFV8x0WBu3RsBsqASAiQ2JTwegEzoadeeQ9qiaL
	 F/873t1iSdbp9O8Vqp9844Y6BhoUsP7TKh4+5QvywHxhDpCfqaUY4pBtmkMyg5/3N4
	 NNc3A9q2cy3pVv9nLhZkztam3ziN1o+RZmkQo4Scn1cQkAaNq5kJd6MiSk7rHrFgYS
	 Ih0DgesDD2y697wFEeT6xyMqWE208aTAglJReR4M+yew1MwJ/oKkHih1GxQAviYYIy
	 XydIkqBFy4o+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtQS86pHKz4xcw;
	Wed, 20 Nov 2024 13:34:48 +1100 (AEDT)
Date: Wed, 20 Nov 2024 13:34:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>, Uros Bizjak
 <ubizjak@gmail.com>, DRM XE List <intel-xe@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <20241120133451.69ece175@canb.auug.org.au>
In-Reply-To: <20241010153855.588ec772@canb.auug.org.au>
References: <20241001134423.62b12a80@canb.auug.org.au>
	<20241010153855.588ec772@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hhMAZBGHzC+bfx+5XMczUGl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hhMAZBGHzC+bfx+5XMczUGl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 10 Oct 2024 15:38:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 1 Oct 2024 13:44:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the random tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> >=20
> > Caused by commit
> >=20
> >   38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/ran=
dom.h>")
> >=20
> > interacting with commit
> >=20
> >   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
> >=20
> > from the drm-xe tree.
> >=20
> > I have applied the following merge fix patch for today. =20
>=20
> The patch is now:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 1 Oct 2024 13:33:48 +1000
> Subject: [PATCH] fix up for "random: Do not include <linux/prandom.h> in
>  <linux/random.h>"
>=20
> interacting with commit
>=20
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
>=20
> from the drm-xe tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/=
xe_bo.c
> index cd811aa2b227..3e0ae40ebbd2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -8,7 +8,7 @@
> =20
>  #include <linux/iosys-map.h>
>  #include <linux/math64.h>
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>  #include <linux/swap.h>
> =20
>  #include <uapi/linux/sysinfo.h>

This patch is now needed when merging the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hhMAZBGHzC+bfx+5XMczUGl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9SssACgkQAVBC80lX
0Gy2gQgApGEZEiS1QAqXHVlh4J2wwbYkrOffJcGDd0GWplCxiXLIxU5nBBpD588f
lNKweHWPhE+bzQUnujn8rzYkbWuQsLufoFEDxLtRgkNcJYShUllPNpjlVzj56u9W
YoTXJusR7CMdThLOPNJlKNE24EYhKoJU618qu3cVlM47EzolYUsH+ZVOaKWrN6J1
2H5+Qrlw8gGdPq9Wwuwq6Of91rbS40PR+VrtugQu5o44j7i7hDbuhVZbnH5NQS/+
x51MkcldS5MYd+3eKwMPDPQutR3iienGbxCoTVDOgOwMthNNN2Jknov8yjhOCoUi
N2fjEtiOqqXOONiVDUpPw6JPC5hivg==
=WIyO
-----END PGP SIGNATURE-----

--Sig_/hhMAZBGHzC+bfx+5XMczUGl--

