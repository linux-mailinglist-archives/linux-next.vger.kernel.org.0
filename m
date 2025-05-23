Return-Path: <linux-next+bounces-6904-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF613AC19E0
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 04:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 596B7177C83
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 02:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9402AD2C;
	Fri, 23 May 2025 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jgUGvUNi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0DC2DCBF2;
	Fri, 23 May 2025 02:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747965775; cv=none; b=TZblXZHbMTqnXnv15j4h+GEJnupbTV5i4HcdnJt8httxj4xmbnIgghvJrdpfqP1uFBYaPFfXH5REKzLZ49BWfFJgQb1plMA2IoQVeFqoYGL4LYo3fAw70aV3iYUBjnLMKOnvp8O6S+3uYwCD2/EprORQVN4i17Hq546hfRRRomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747965775; c=relaxed/simple;
	bh=sAPs8eekytATjQiNX4kt8EpnASncF/Bdl5+1rITtTMU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQQKtckZUT3NspWPYBj3kPD2nwWTLOBcWr/+UDgy6fx74amm586vhYHSrALTpSLLxmIkuc+YqHEwIw79/Wq/LaCwSd/hartVOxFrKztuXjMGIH566RtvfxmUrY1c769MnU167rl9KnFlcFfMZey3zi/81bW/yJX0QhnmUIqbwY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jgUGvUNi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747965761;
	bh=MfyXNmVq5Z57W8YqbOLHkYNkAS6y8iTHnUs6IL3dh+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jgUGvUNiVwrgAxApHPiqbinsoHeCx669G/3+GWLNV7+wz4qRywIO4XEVquW1KE1CC
	 2kjhtE4JNgmamzpPV01iM9kFwf30UjOGJKHtu7km83G3rN7gaGdcdBTGyLnIijxFVW
	 7YLPGwppdyOCtdlZrdGTPjWdW90E0UIVUS/aXfBjlSrXQebULqmK+omaqUl9mrHgJZ
	 c2mrzokZ3ddc77SGsGpp1YjPUE1rUGIt+CURJkO3uxdAcnlzOs/DZL0TVJhHu3g9ky
	 baP99Pp6okjOMLrgHC/SBDFozlOkrLpuX6MGv8RBdSg5XU2bwFf1VQeP1AqS4j6tn/
	 cjDg6ILC7jE4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3T292TGNz4x1w;
	Fri, 23 May 2025 12:02:41 +1000 (AEST)
Date: Fri, 23 May 2025 12:02:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the cpufreq-arm tree with the
 configfs tree
Message-ID: <20250523120239.2ab98a68@canb.auug.org.au>
In-Reply-To: <20250521125946.664a79c1@canb.auug.org.au>
References: <20250521125946.664a79c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BMnC+4lP=lyn2d1=wcP=50p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BMnC+4lP=lyn2d1=wcP=50p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 May 2025 12:59:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the cpufreq-arm tree got a conflict in:
>=20
>   rust/kernel/lib.rs
>=20
> between commit:
>=20
>   446cafc295bf ("rust: configfs: introduce rust support for configfs")
>=20
> from the configfs tree and commits:
>=20
>   8961b8cb3099 ("rust: cpumask: Add initial abstractions")
>   d01d70205601 ("rust: clk: Add initial abstractions")
>   3accb57d56a9 ("rust: cpu: Add from_cpu()")
>   2207856ff0bc ("rust: cpufreq: Add initial abstractions for cpufreq fram=
ework")
>=20
> from the cpufreq-arm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc rust/kernel/lib.rs
> index 354eb1605194,133ebee4f9d3..000000000000
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@@ -42,8 -42,11 +42,13 @@@ pub mod alloc
>   pub mod block;
>   #[doc(hidden)]
>   pub mod build_assert;
> + pub mod clk;
>  +#[cfg(CONFIG_CONFIGFS_FS)]
>  +pub mod configfs;
> + pub mod cpu;
> + #[cfg(CONFIG_CPU_FREQ)]
> + pub mod cpufreq;
> + pub mod cpumask;
>   pub mod cred;
>   pub mod device;
>   pub mod device_id;

This is now a conflict between the pm tree and the configfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BMnC+4lP=lyn2d1=wcP=50p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgv1z8ACgkQAVBC80lX
0Gwiqwf+IbEKDSB3xg2N0ASFgP/hV80N38A4hU9qDz5PEkyp63brxTyJeYEeg4rz
7xQgOuWK6FpmsjC0z21gHNi9/f21LUUROPgresq7cmUDg3eX8aF7hSy0/OU7QROZ
nbgd+sR8sDaa0uHbQmM/ISqnBsDkTzoiQnIhcpgN1e5ZzH7On9P26GT7/hUYzKPI
7qSpTB+VYW4lwT11rDJ3u9tROFkc8y0/ZTQm+rR6fI9jOZF4uNMmDfrRDV0HYO+1
09zSzF5pN/DjtVC3dEO8LE70gxVs9nVXwKBPcPqPTG+kNDhCKifybEso6v1kksEx
nHwBxfcHfxyPiUKoquQJqLRfbnNHhg==
=lRUT
-----END PGP SIGNATURE-----

--Sig_/BMnC+4lP=lyn2d1=wcP=50p--

