Return-Path: <linux-next+bounces-6005-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25898A70D78
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 00:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B581715C1
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 23:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0951EBFE2;
	Tue, 25 Mar 2025 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fRQz9nRK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11A1B4234;
	Tue, 25 Mar 2025 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742943998; cv=none; b=G921OrDzjoOi60khfY3K1eoTRjHckcX0fgEodrR79b2Lw4PLYv0wpDXQrjRt0ScT5llqqN65po+cVyNpPLBCeTsfU9OPffyIGdRBJarR6Ng2P3WE6qjWUP4BqUOK9USEC9I2M4E1xbmhbOKhmr1mWu3ghzPNWmCIkFMx9rFGgrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742943998; c=relaxed/simple;
	bh=aNyWv1Af9YdsWuYr39CQhpH30ppMLSaGWWpnhxQDCyA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RYcZOecItXJkfGBtYy7MBERtyjwU7AlYx8ObrdC2lNI50KUcdTY0GY3kLcjYOn2lT7oPFheb/R+IMoPWP5ojUE4jAA8z+cn5hxcYOVeubDS8jbNKPB1daUbkx5jf33kdYcI6LzCy70YI+vY6guic/btcjgyW00JNS6SwN2oepRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fRQz9nRK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742943991;
	bh=eeftJNQ1cK7YQJahO3TlWzTVVKrtLgAShQhMWR9h8+0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fRQz9nRK50cJ/0+AQgcZtxCOgu0i0Y1S7+mD/zLlgDJjOw3lehEPErCQmNnbykVJI
	 amw+SYP0L43BgjnDVWxPE7rksAnpzWxIFjRMUqenF/vcCfo8AiTKUV/KwLpBRqQAxT
	 6ATRKarvLVRM2qRxaftiU1tCeikI9KNTYcch6aUuXGlD/uiMrOE0kT7WOyNx/z+0My
	 j5wDEZPdycQ31QAOT3YgrpXS4EOLzKbH2HxUxaUlXtCW+mJMjpcZIFNy2FMH0sBIYD
	 8/rHvmtA0ZEpR9j0+d0V7t7+AEKXX3vjS+DG27ygzUaiPbhdgLPcNGjOLDJQbpBwuT
	 U+ZJoRNDOQeGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMlsd0W42z4x2c;
	Wed, 26 Mar 2025 10:06:28 +1100 (AEDT)
Date: Wed, 26 Mar 2025 10:06:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.cz>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nick Terrell <terrelln@meta.com>
Subject: Re: linux-next: manual merge of the tip tree with the btrfs, zstd
 trees
Message-ID: <20250326100611.551fcf61@canb.auug.org.au>
In-Reply-To: <20250324163417.4b9e84d4@canb.auug.org.au>
References: <20250324163417.4b9e84d4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kRpOnYHlHLLsqiikk1KQfns";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kRpOnYHlHLLsqiikk1KQfns
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Mar 2025 16:34:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   lib/zstd/common/portability_macros.h
>=20
> between commit:
>=20
>   65d1f5507ed2 ("zstd: Import upstream v1.5.7")
>=20
> from the btrfs, zstd trees and commit:
>=20
>   1400c87e6cac ("zstd: Increase DYNAMIC_BMI2 GCC version cutoff from 4.8 =
to 11.0 to work around compiler segfault")
>=20
> from the tip tree.
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
> diff --cc lib/zstd/common/portability_macros.h
> index 05286af72683,0dde8bf56595..000000000000
> --- a/lib/zstd/common/portability_macros.h
> +++ b/lib/zstd/common/portability_macros.h
> @@@ -59,15 -53,15 +59,15 @@@
>    * Enabled for clang & gcc >=3D4.8 on x86 when BMI2 isn't enabled by de=
fault.
>    */
>   #ifndef DYNAMIC_BMI2
>  -  #if ((defined(__clang__) && __has_attribute(__target__)) \
>  +#  if ((defined(__clang__) && __has_attribute(__target__)) \
>         || (defined(__GNUC__) \
> -           && (__GNUC__ >=3D 5 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=
=3D 8)))) \
> +           && (__GNUC__ >=3D 11))) \
>  -      && (defined(__x86_64__) || defined(_M_X64)) \
>  +      && (defined(__i386__) || defined(__x86_64__) || defined(_M_IX86) =
|| defined(_M_X64)) \
>         && !defined(__BMI2__)
>  -  #  define DYNAMIC_BMI2 1
>  -  #else
>  -  #  define DYNAMIC_BMI2 0
>  -  #endif
>  +#    define DYNAMIC_BMI2 1
>  +#  else
>  +#    define DYNAMIC_BMI2 0
>  +#  endif
>   #endif
>  =20
>   /*

The tip tree commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/kRpOnYHlHLLsqiikk1KQfns
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjNuQACgkQAVBC80lX
0Gyn4gf/ak0rcqNxGAifTRvu9KPH+qiC4iSlbJDqEjQU91gC4Z9wP7xDsc61zWCI
Bjag+ZpLchX8JCg/eWA/th3MCknXGwdsvI6oUfwOlgCN8LGmIVdLokfDV2tVC0ly
8OpaFh7Pin9v0LrW4cOVzQTjo/kVXdJIFS3b+bF8dudV3OUFlV0OjS+vpkjB8elR
SkTrmlCRZzV4jrDuKV9BRAr57ILHYF/Q6of6WOtzMISYNlT7eTDhvyyR9MW+IVK+
ccmt0kIEKHwbenwUksiaDBOagt8d35mXBV3FZTxxYwa+LDr1LMTs2lQj3rWJ/NB7
zijuuEXgG0fFS+AL7K/hc/er9M5osg==
=wmkr
-----END PGP SIGNATURE-----

--Sig_/kRpOnYHlHLLsqiikk1KQfns--

