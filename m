Return-Path: <linux-next+bounces-6970-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5C4AC73BB
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 00:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D1F1C0353E
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 22:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837A11E0B91;
	Wed, 28 May 2025 22:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VMasHqNG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFAE1E98E3;
	Wed, 28 May 2025 22:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470330; cv=none; b=We1SPuCbnM5HgEY7L/O9oLhbJLFCHVqbCu/irH9lig3NrOMAHxFB8qawVjKaHOpl3FjC64m8+AvJi50DjLkwuC8dAvB6oT1AUgJpfT5nLEh6Lq0NURBkCtU/BDawg4HzRdaXn/Tgrs/Kuiaqom3G7QJmKhMAalQ9dWWD8WVje+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470330; c=relaxed/simple;
	bh=JiseGLwIbj9BNipfB204c8kdBEtpwFWpj2vXB9O98qI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KauSMgI0kxew8cxgxLow/UqnptoLMFOx6UXEqJDwtPKgatnYGSEEJkc6uDwacI8JTNWca81Tm5URSkuRIUkUk6PU5R6AHuGBqyEXc1OwG9nwldOg+LpMej1T6wDuBb3iQ3ufE9zcP5+TJ2lyPH33KSz6W7Iy6xqFFAMHbG7/Wj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VMasHqNG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748470323;
	bh=SGQvhWif3QYPIYX6pawvxuDDLJ9nBo78PsLIaUJuC+4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VMasHqNGh7KnwiqrHbjjKLlnhT7sGDjOWMSw7BwARrnLcIqvHaBoYIT7IA8oklOXa
	 Uc0q7BZFbPZyQgws3Zg+g9l5m0PP0wccC+HYjgsski5Bhs/KovKHevJEa8z+B8aXCg
	 Srt0QzaKq/Vals+yRQQD7gTazNt1viQ+43kg33mXGdLOm1wDQtUrlB5kao8ZHmHXFW
	 +icVUwYF/l9R209I/OQ4I5gwB29qfvKrggjrwRof1aPf9DyL3pJjRE5q+9Gh4EqZCA
	 UrDXWk48IfX7SNEsF1LSL4uSkCoBiQu5nkt8DB44mJyksbnq+UIx1Lxxzy9twmrGl2
	 2V+URghR/qDLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b73dG0Gkmz4wxh;
	Thu, 29 May 2025 08:12:01 +1000 (AEST)
Date: Thu, 29 May 2025 08:12:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, "Ugwekar, Dhananjay"
 <Dhananjay.Ugwekar@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250529081200.280bb922@canb.auug.org.au>
In-Reply-To: <45b82a09-07a4-4bbd-a71c-d86010542dfe@amd.com>
References: <20250512145517.6e0666e3@canb.auug.org.au>
	<20250512152326.3f2f0226@canb.auug.org.au>
	<20250528135020.79fec9ca@canb.auug.org.au>
	<45b82a09-07a4-4bbd-a71c-d86010542dfe@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_LFh1+GkUx18LD7UR+Q/bY3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_LFh1+GkUx18LD7UR+Q/bY3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mario,

On Wed, 28 May 2025 14:14:40 +0000 "Limonciello, Mario" <Mario.Limonciello@=
amd.com> wrote:
>
> On 5/27/25 22:50, Stephen Rothwell wrote:
> >=20
> > On Mon, 12 May 2025 15:23:26 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> On Mon, 12 May 2025 14:55:17 +1000 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote: =20
> >>>
> >>> Today's linux-next merge of the tip tree got a conflict in:
> >>>
> >>>    drivers/cpufreq/amd-pstate.c
> >>>
> >>> between commit:
> >>>
> >>>    608a76b65288 ("cpufreq/amd-pstate: Add support for the "Requested =
CPU Min frequency" BIOS option")
> >>>
> >>> from the pm tree and commit:
> >>>
> >>>    d7484babd2c4 ("x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu=
()'")
> >>>
> >>> from the tip tree.
> >>>
> >>> I fixed it up (the former removed a line updated by the latter) and c=
an
> >>> carry the fix as necessary. This is now fixed as far as linux-next is
> >>> concerned, but any non trivial conflicts should be mentioned to your
> >>> upstream maintainer when your tree is submitted for merging.  You may
> >>> also want to consider cooperating with the maintainer of the conflict=
ing
> >>> tree to minimise any particularly complex conflicts. =20
> >>
> >> Actually it needed the fix up below.
> >>
> >>
> >> diff --cc drivers/cpufreq/amd-pstate.c
> >> index d96bb3e202ee,66fdc74f13ef..0d4c0de89a00
> >> --- a/drivers/cpufreq/amd-pstate.c
> >> +++ b/drivers/cpufreq/amd-pstate.c
> >> @@@ -389,10 -389,9 +389,10 @@@ static inline int amd_pstate_cppc_enabl
> >>    static int msr_init_perf(struct amd_cpudata *cpudata)
> >>    {
> >>    	union perf_cached perf =3D READ_ONCE(cpudata->perf);
> >>   -	u64 cap1, numerator;
> >>   +	u64 cap1, numerator, cppc_req;
> >>   +	u8 min_perf;
> >>   =20
> >> - 	int ret =3D rdmsrl_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
> >> + 	int ret =3D rdmsrq_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
> >>    				     &cap1);
> >>    	if (ret)
> >>    		return ret;
> >> @@@ -401,22 -400,6 +401,22 @@@
> >>    	if (ret)
> >>    		return ret;
> >>   =20
> >> - 	ret =3D rdmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &cppc_req);
> >> ++	ret =3D rdmsrq_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &cppc_req);
> >>   +	if (ret)
> >>   +		return ret;
> >>   +
> >>   +	WRITE_ONCE(cpudata->cppc_req_cached, cppc_req);
> >>   +	min_perf =3D FIELD_GET(AMD_CPPC_MIN_PERF_MASK, cppc_req);
> >>   +
> >>   +	/*
> >>   +	 * Clear out the min_perf part to check if the rest of the MSR is =
0, if yes, this is an
> >>   +	 * indication that the min_perf value is the one specified through=
 the BIOS option
> >>   +	 */
> >>   +	cppc_req &=3D ~(AMD_CPPC_MIN_PERF_MASK);
> >>   +
> >>   +	if (!cppc_req)
> >>   +		perf.bios_min_perf =3D min_perf;
> >>   +
> >>    	perf.highest_perf =3D numerator;
> >>    	perf.max_limit_perf =3D numerator;
> >>    	perf.min_limit_perf =3D FIELD_GET(AMD_CPPC_LOWEST_PERF_MASK, cap1)=
; =20
> >=20
> > This is now a conflict between the pm tree and Linus' tree.
> >  =20
>=20
> I thought that Ingo added an extra #define for compatibility?

Having that define does not change the above conflict at all.  It just
means that further additions of calls to rdmsrl_safe_on_cpu() will not
cause build failures.

--=20
Cheers,
Stephen Rothwell

--Sig_/_LFh1+GkUx18LD7UR+Q/bY3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3ijAACgkQAVBC80lX
0Gzvlwf3VG5iu/KkhuBpYt85nxQftsDbAJBj7EHsCa/ilw9lWHTBYjdoNtySRlLq
AXZp9+luNnIbRVFSXDWZ3MgEggjes96JgIhs3sPjfPNNXcT2dOx0GbQFeV9xR/2n
MWAwt9tFIv/1tSV91sJMhGDNw/gd4IlmbIaUYmUgwue7rMLgeDPhkwDR9WdHKSvA
gDsxPowrzvrxCTrHDXKkvXMd0KbX7h8+wd82hfdk84xKjIfDFALwTxchD1SFGuPH
E6ki+90olVTLPfzhYVOv1nUaStVYheUol76bOl1C1gqBYyICpTMeVJBOjC93YOio
IYrr7XrkN+ihqtNAV7ovFL7EcMRQ
=XcqE
-----END PGP SIGNATURE-----

--Sig_/_LFh1+GkUx18LD7UR+Q/bY3--

