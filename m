Return-Path: <linux-next+bounces-6951-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93397AC607C
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 05:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 662651BC3FC1
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 03:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF94F2206B7;
	Wed, 28 May 2025 03:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ERR4ng0g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229BB21FF28;
	Wed, 28 May 2025 03:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404226; cv=none; b=nJ1SYNWGQBwmq6cozqj7npf2JZHmiq3ZZ5DSg+0kyirk5RPFOGMU+DJH/8rHhJr438V5mUBbMDgbyZ3gOwJ/XQjqh/h9cdRBY5OWiuBe4XExgk+D4OkVDRXhW4lfVDjbpJuYVwbM1jA0GCe31m9N7Pyz3iEqKxBdPStfPeQgDXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404226; c=relaxed/simple;
	bh=Qk4nHCkADnbfTIM4W1CsfM3+08ySxEejIoTE2hirFro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDiGwKD+eOJXqDKGMFq4SjfdFjDUu8RY+YLIuloF9HCzCDMLuuUqP01fvdIJPL7i4sIvXdedZmFGjnfX0PjvZWkfAeqJtSa54Z2ESfwd+MzNaoKgZore1ln4OgVtWv3a5yGaUVRuumpKRoo09hvi/Xk2qGJ2/gc9g9FznDcASCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ERR4ng0g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748404222;
	bh=DwuT4/TbxenjhCKVGWcqy/2GUCPhX9aI91AX7mvwGnw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ERR4ng0ghr90zNyKln+70M9niwRdTUUksuQQEvCmOgRsAV0Ps5Op4+sUtm9i94sTZ
	 wulivgTgzyTGkmWV+7iqO+oyMc2vZBrftEFN6JCcxHFLi8Jnagq86qnTHyj60UlXNj
	 E4uXSofqIaUDtoqYOf86QB075yFKaTcJ1ZP9qs/Tpd/z1E5HAXS7kt79Rh5yAKueSq
	 Hme3t6sHUPx8DXO4TzODRuzuH3HEbAi8w0xVIldjnrvRzl4wFegYMftceVReQ6kurO
	 CVD5jDTC9F6TTnMDz49omfv1EKxkqdVwzfPk/LJwMa+70TU5Z0Pie8DbgQuTNRyyqG
	 nU2oJ9pQJMh9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6bB53kRlz4wbY;
	Wed, 28 May 2025 13:50:21 +1000 (AEST)
Date: Wed, 28 May 2025 13:50:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250528135020.79fec9ca@canb.auug.org.au>
In-Reply-To: <20250512152326.3f2f0226@canb.auug.org.au>
References: <20250512145517.6e0666e3@canb.auug.org.au>
	<20250512152326.3f2f0226@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sZbYF9/Sski6OZaHAn.giTg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sZbYF9/Sski6OZaHAn.giTg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 May 2025 15:23:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 12 May 2025 14:55:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the tip tree got a conflict in:
> >=20
> >   drivers/cpufreq/amd-pstate.c
> >=20
> > between commit:
> >=20
> >   608a76b65288 ("cpufreq/amd-pstate: Add support for the "Requested CPU=
 Min frequency" BIOS option")
> >=20
> > from the pm tree and commit:
> >=20
> >   d7484babd2c4 ("x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'=
")
> >=20
> > from the tip tree.
> >=20
> > I fixed it up (the former removed a line updated by the latter) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts. =20
>=20
> Actually it needed the fix up below.
>=20
>=20
> diff --cc drivers/cpufreq/amd-pstate.c
> index d96bb3e202ee,66fdc74f13ef..0d4c0de89a00
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@@ -389,10 -389,9 +389,10 @@@ static inline int amd_pstate_cppc_enabl
>   static int msr_init_perf(struct amd_cpudata *cpudata)
>   {
>   	union perf_cached perf =3D READ_ONCE(cpudata->perf);
>  -	u64 cap1, numerator;
>  +	u64 cap1, numerator, cppc_req;
>  +	u8 min_perf;
>  =20
> - 	int ret =3D rdmsrl_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
> + 	int ret =3D rdmsrq_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
>   				     &cap1);
>   	if (ret)
>   		return ret;
> @@@ -401,22 -400,6 +401,22 @@@
>   	if (ret)
>   		return ret;
>  =20
> - 	ret =3D rdmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &cppc_req);
> ++	ret =3D rdmsrq_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &cppc_req);
>  +	if (ret)
>  +		return ret;
>  +
>  +	WRITE_ONCE(cpudata->cppc_req_cached, cppc_req);
>  +	min_perf =3D FIELD_GET(AMD_CPPC_MIN_PERF_MASK, cppc_req);
>  +
>  +	/*
>  +	 * Clear out the min_perf part to check if the rest of the MSR is 0, i=
f yes, this is an
>  +	 * indication that the min_perf value is the one specified through the=
 BIOS option
>  +	 */
>  +	cppc_req &=3D ~(AMD_CPPC_MIN_PERF_MASK);
>  +
>  +	if (!cppc_req)
>  +		perf.bios_min_perf =3D min_perf;
>  +
>   	perf.highest_perf =3D numerator;
>   	perf.max_limit_perf =3D numerator;
>   	perf.min_limit_perf =3D FIELD_GET(AMD_CPPC_LOWEST_PERF_MASK, cap1);

This is now a conflict between the pm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sZbYF9/Sski6OZaHAn.giTg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2h/wACgkQAVBC80lX
0GyOngf5Af9kXxfg0zurRt95kanM4WcI6lUjQgpKPYP7mwlXus3/SigHPJw6As61
9oMX8y91PqByfAkADUZMUCBO5gS5M0K/LODoVKx0+C0KpnEeMr2n4xvygrUhMXbE
N0Lvh3ycV7PwmNoAH/tBsdKYjJ1eh1MOx+z25FE/LFR1vXaf1/Vg8m5JzqkY4OO7
qAfterVE8WXJ0E5s3lOQ3kvT0Pa1b5Sm9p9MxJkmfpRSNHsFTLMbGeJ2Se4lLcat
UlowprxDYXeyksU6677O1/VzJXUatcYrvhuqYRjOw54a2kPSWeMVPHbVxyy2pSP8
005LS6JO7xmKH8B+l48pS53LwrKz3g==
=rAWc
-----END PGP SIGNATURE-----

--Sig_/sZbYF9/Sski6OZaHAn.giTg--

