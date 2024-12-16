Return-Path: <linux-next+bounces-4966-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA449F2B00
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 08:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B12A1883F14
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 07:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E236E1F7092;
	Mon, 16 Dec 2024 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kowms/jC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531AA1F4E4F;
	Mon, 16 Dec 2024 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734334691; cv=none; b=F22qTJFTkE76vhzRnltbFIuyxxA5H/o7qbiOOqbkYvshBE3rBbyu1f8eA+IdhO02KRwcg0PkqNjNAxPXUJe7/ruv7pRM5y0Wf/MiULLVLPkvn0Ts4MXhHYJwMb6eTWc6qjTBMNC5T3DQ29uaLA4Vh+jnNsAVUAF+iM3367j8c2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734334691; c=relaxed/simple;
	bh=t5YU/B5nsoNIcgaVTWBRJO1hzKfsW9pqiBXgUFDrcOk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CNpF8Pk/sIpOPrMvxdFasemB3JhlbqzWWFOF1VAMuS0hR1yBVvPQt0uiwr+uEs5LVyHlDcjsD2YHP3MGYxw0NmsVtEXgoiqyN407Z/HLl5Ix9381CtSe1awSEhhn/7ijocqiNssGoGvGRQaP1Khi3ro1oM6LxH6B2GQ2mqNHhTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kowms/jC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734334678;
	bh=PEF23WBTRSX30Go9xsIxa6zHb86us2+G8Fu8OSIamtc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kowms/jCFZab0fainZ/zIAHpRa7jKD99n/kOJYgNRQ2YxKd1DY41S6Drwxzr1Kvs8
	 6M0hmTT8g0HvacMJpZz7d6asqiVGKFdhfHLRK3eyqwt1Yf4hOMSi3cYIn2ojeNyxHT
	 UUM934RsJp+qiKiUiZCXJaCZBoxAKB8NwOfG32A2EVCTM3kRTswQWMqkQqQBDRPu7G
	 df+0e59E0hHaUBhtxnN4OGt804e3GtSqXYF0Uswb8tg0afF1Y5Kc+pz32pK7k5jJ9C
	 WO5jZnPA9zdg0TIypUIfUX4U7YAbm15z6qPgcnHhFniPk+MTR20vzCA5E3TBxfc1d5
	 9flBfLS4iQXRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBWxw6X8qz4wbR;
	Mon, 16 Dec 2024 18:37:56 +1100 (AEDT)
Date: Mon, 16 Dec 2024 18:38:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Matt Atwood
 <matthew.s.atwood@intel.com>, Matt Roper <matthew.d.roper@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with Linus' tree
Message-ID: <20241216183801.0d5c9a5f@canb.auug.org.au>
In-Reply-To: <20241125120921.1bbc1930@canb.auug.org.au>
References: <20241125120921.1bbc1930@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NA/Bjt+4/BxwIyxa..6/nHa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NA/Bjt+4/BxwIyxa..6/nHa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Nov 2024 12:09:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-xe tree got a conflict in:
>=20
>   include/drm/intel/xe_pciids.h
>=20
> between commit:
>=20
>   493454445c95 ("drm/xe: switch to common PCI ID macros")
>=20
> from Linus' tree and commit:
>=20
>   ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")
>=20
> from the drm-xe tree.
>=20
> I fixed it up (I deleted the file and added the following merge fix patch)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 25 Nov 2024 12:05:38 +1100
> Subject: [PATCH] fix up for "drm/xe/ptl: Add another PTL PCI ID"
>=20
> interacting with "drm/xe: switch to common PCI ID macros" from Linus'
> tree.
> ---
>  include/drm/intel/pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index 32480b5563db..7883384acd5e 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -829,6 +829,7 @@
>  	MACRO__(0xB092, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
>  	MACRO__(0xB0A1, ## __VA_ARGS__), \
> -	MACRO__(0xB0A2, ## __VA_ARGS__)
> +	MACRO__(0xB0A2, ## __VA_ARGS__), \
> +	MACRO__(0xB0B0, ## __VA_ARGS__)
> =20
>  #endif /* __PCIIDS_H__ */
> --=20
> 2.45.2

OK, so commits ae78ec0a52c4 and 493454445c95 were merged in commit

  8f109f287fdc ("Merge drm/drm-next into drm-xe-next")

but include/drm/intel/xe_pciids.h was not deleted (it is not longer
referenced anywhere in the tree) and the above patch was not applied :-(

Since then that part of the drm-xe tree has been merged into the drm
tree in commit

  bdecb30d579e ("Merge tag 'drm-xe-next-2024-12-11' of https://gitlab.freed=
esktop.org/drm/xe/kernel into drm-next")

So, include/drm/intel/xe_pciids.h needs to be removed from the drm tree
and the above patch applied there.

--=20
Cheers,
Stephen Rothwell

--Sig_/NA/Bjt+4/BxwIyxa..6/nHa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdf2NkACgkQAVBC80lX
0GzplAgAgw4CMAtlaLzaeAQv3P1EKOnP3bx0Sm1mgZ0IZVU7b82lGj1hpBMwVJoP
WtSLNoE4i7B1GKaTJmvF6FnpO2jd8kcQ+GfccXs4D/JxieaYEqjMtpds62zodZnL
jhwXF1hIqoXiYb3oZc/2SIl9RCDuTF+xnucytUqdE/nI+38DuRHXXHZkVvZR9b18
aoiVXIGFymyPecDupYEhO/VkFuwCT8tscVGbdwhuiDTg3HwwONhR6MEBD4RcYbWh
01kQMTJRbsbuFa1FjP5agLUuMKw+SdM1pJg2YGjltaUz9pmVoMoWknDi8bGgad31
6B8jUJpxF1kUbSgE+no1pbzpGuhOWA==
=d+hl
-----END PGP SIGNATURE-----

--Sig_/NA/Bjt+4/BxwIyxa..6/nHa--

