Return-Path: <linux-next+bounces-4569-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCEB9B89ED
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 04:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D9951C20FA5
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 03:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD1013FD83;
	Fri,  1 Nov 2024 03:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iFMgu77j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C013C83D;
	Fri,  1 Nov 2024 03:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730431203; cv=none; b=KGH3/ssUG1gptg4cXQQMTEIe5PNsLLmI1j/qA/UdYOQ6z5RUzAzJqKRkT8xFkUPX4EAlb4n9vgtqgptItNPUW6rAZHxuxQGqxG3ArO+/T5LQwgUlwNHDjNLzgDEQNlqKlBMFt9CYp/lfO0ePovSc9N1ablL2mlCYWpCJWvcgkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730431203; c=relaxed/simple;
	bh=I/WVOD/ao9XEiGlYbZkaiBRLzlzONv+rBIwVpxViovU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqGpwYb4LVU4N1RCrDDpBzSJiAfYAUdBiS7c6dSRB1amQZP2XtbV26Li89BjqTrPQnApwMnWCm+FV0Sz8QYmytQoYNYMaobYUPuLgwjKwwtcJpk8TXm1z5tv+qRrbKhr4X+hv62rCGfTpt0G2ow4vkSpsBJm896adqesSFHvBng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iFMgu77j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730431193;
	bh=zqO1oETa34exh1u4rWqcxtQV23OE/uMDS6JNaJCc0qU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iFMgu77jK6dSBaxWm7/leSSFKWN/2+VTfgDQTC9dmCUUaF/kmMUxc0ugRtPZZItXB
	 MaFH5GEPtgfeMKbMYhw77ldXR67r2xL3HAPvCrm/pgxkqXihcYef2t1jn6X1S+f6wz
	 CrSoyl/cDglDKKjPOBjoTkOmdcIVMDfPdCgsnwwoABAqOcvAkDXJtM4sr8UCppCF9T
	 2ZoXHCiWTfNqZw3j/p9A0E7aOyUw1/dHqpjgst05PniDSwgtlEhmjsDeAEJU6Ej8Uc
	 x0mVY4yuHo1V/JoWc9M9gSgtNjymXuCM5i7i1dN3Q1pn4WYj4KBKvbKMNzOmmnmtFC
	 W+IEHYvryTYLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfmLv4zz7z4wbp;
	Fri,  1 Nov 2024 14:19:51 +1100 (AEDT)
Date: Fri, 1 Nov 2024 14:19:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20241101141952.4990f238@canb.auug.org.au>
In-Reply-To: <20241028165336.7b46ce25@canb.auug.org.au>
References: <20241028165336.7b46ce25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/61QwciiXzw+fpITt7uL9dAf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/61QwciiXzw+fpITt7uL9dAf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Oct 2024 16:53:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/iio/magnetometer/af8133j.c: In function 'af8133j_set_scale':
> drivers/iio/magnetometer/af8133j.c:315:12: error: suggest explicit braces=
 to avoid ambiguous 'else' [-Werror=3Ddangling-else]
>   315 |         if (!pm_runtime_status_suspended(dev))
>       |            ^
> cc1: all warnings being treated as errors
>=20
> Probably caused by commit
>=20
>   fcc22ac5baf0 ("cleanup: Adjust scoped_guard() macros to avoid potential=
 warning")
>=20
> I have applied the following for today but I wonder if there may be
> others.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 28 Oct 2024 16:01:15 +1100
> Subject: [PATCH] fix up for "cleanup: Adjust scoped_guard() macros to avo=
id
>  potential warning"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iio/magnetometer/af8133j.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/magnetometer/af8133j.c b/drivers/iio/magnetomete=
r/af8133j.c
> index d81d89af6283..acd291f3e792 100644
> --- a/drivers/iio/magnetometer/af8133j.c
> +++ b/drivers/iio/magnetometer/af8133j.c
> @@ -312,10 +312,11 @@ static int af8133j_set_scale(struct af8133j_data *d=
ata,
>  	 * When suspended, just store the new range to data->range to be
>  	 * applied later during power up.
>  	 */
> -	if (!pm_runtime_status_suspended(dev))
> +	if (!pm_runtime_status_suspended(dev)) {
>  		scoped_guard(mutex, &data->mutex)
>  			ret =3D regmap_write(data->regmap,
>  					   AF8133J_REG_RANGE, range);
> +	}
> =20
>  	pm_runtime_enable(dev);
> =20

I am still applying this patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/61QwciiXzw+fpITt7uL9dAf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckSNgACgkQAVBC80lX
0Gyt4QgAkB68kKBhptrJWzBcir4N3mdELXA4GrhTnh2DIHOogKVtwEWk5fwXibF9
Er1dPdRoN0n+1HNbD8oNXov/8xympT9jVS9HK/q5XBGNzT6tAhl4tKFe/0fJ280g
U+dFKack41B/193aqhy5Cpe5rb6cCvMHx8rTfqNgZYT+ctRD9y6tYYmSq5WwK/Gf
iphxLER04VzqUZ4tOhQY9sc3S2gi7KDAqja7byNuL7IXcVTyl1ps6h+w7C/0bt3p
9ZU1pkZUsGn7nUtWIbivpfZx2u6I9jXvpOgPSwtraQxL8ZcKhNqRsqopaBoFUvs/
7aMs//WfwQFAqhGwsCPkM7iD/WHK9g==
=vjP5
-----END PGP SIGNATURE-----

--Sig_/61QwciiXzw+fpITt7uL9dAf--

