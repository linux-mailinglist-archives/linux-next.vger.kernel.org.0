Return-Path: <linux-next+bounces-6682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6CAB2EFA
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 07:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10922178999
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 05:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FB725485B;
	Mon, 12 May 2025 05:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ewX9wEjL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01083D76;
	Mon, 12 May 2025 05:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027412; cv=none; b=Trx8zxrx9SdJ0XWny1EJRVZHXPc2I4LxBguRoM6dOK3JzjARgnTd+xg5JhkSfFIoc1560iyxZG8S4B9n3XM6u0Wb7tB9Ub8AcnD7K3WmPGGoBOSqudvhvdiGfFgzHbbs9Hhqag5WwPHbDgHw/ekQRTsqWUCrCHF+pQebyXCK8+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027412; c=relaxed/simple;
	bh=udnN0My/n57iTRoHBTXmg/wWZKP/eI2kpqLTdjffcMY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U6gwymY7hawG/URwshsjdYt7D0qyaSU0wXGJMlTFJ6GLANAcB6gALsS6OIE2TC+7sqROShs4GOtXaPQtja9R4oSI01D634GRwT+RS++I4en55F+cYP6HksI9fGrcYNIgsbk/pumXZzfLY2CDJaDcg12yTJNRpDY0Os2OSxQU2f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ewX9wEjL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747027406;
	bh=jF1dIlvIfgi1b4uOi6zgS+c8Uo/oS2AetOzTauYI8hs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ewX9wEjLJCUSbmmMRPgezhopbu9wgrkZsDaO+T253ddyFLxRokC12FKXAjWffhy7c
	 AGUwTmJSpyqVO12Gsh+Ee3veZ5m4siru3Aay0WQ8bE/rBtPz6Zeh4DCOXyeHPjWa24
	 KuVpXA+WmUHxAXep4Db9gn2Zy02auG97QdtMYzjUS1A0f8vPRvZj47bzEnTN//Dmj2
	 OywZ6UQbvo/zUvPx6L/06tAxF+xwfXvRM36V5iae2m17Ex6G1pi0lWP6ZNQXGG1Vne
	 SoUJWevIyerBB5I6vU5QxL0V/J8b9jcno7a9DOrmCpWZUHyrDSHA855tVCf+yffnE7
	 glkkcMa/HhHtw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwp0t5TTWz4wnp;
	Mon, 12 May 2025 15:23:26 +1000 (AEST)
Date: Mon, 12 May 2025 15:23:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250512152326.3f2f0226@canb.auug.org.au>
In-Reply-To: <20250512145517.6e0666e3@canb.auug.org.au>
References: <20250512145517.6e0666e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dEx+tYqfZCo5uwsjTWLPV2I";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dEx+tYqfZCo5uwsjTWLPV2I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 May 2025 14:55:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/cpufreq/amd-pstate.c
>=20
> between commit:
>=20
>   608a76b65288 ("cpufreq/amd-pstate: Add support for the "Requested CPU M=
in frequency" BIOS option")
>=20
> from the pm tree and commit:
>=20
>   d7484babd2c4 ("x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'")
>=20
> from the tip tree.
>=20
> I fixed it up (the former removed a line updated by the latter) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Actually it needed the fix up below.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/cpufreq/amd-pstate.c
index d96bb3e202ee,66fdc74f13ef..0d4c0de89a00
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@@ -389,10 -389,9 +389,10 @@@ static inline int amd_pstate_cppc_enabl
  static int msr_init_perf(struct amd_cpudata *cpudata)
  {
  	union perf_cached perf =3D READ_ONCE(cpudata->perf);
 -	u64 cap1, numerator;
 +	u64 cap1, numerator, cppc_req;
 +	u8 min_perf;
 =20
- 	int ret =3D rdmsrl_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
+ 	int ret =3D rdmsrq_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
  				     &cap1);
  	if (ret)
  		return ret;
@@@ -401,22 -400,6 +401,22 @@@
  	if (ret)
  		return ret;
 =20
- 	ret =3D rdmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &cppc_req);
++	ret =3D rdmsrq_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &cppc_req);
 +	if (ret)
 +		return ret;
 +
 +	WRITE_ONCE(cpudata->cppc_req_cached, cppc_req);
 +	min_perf =3D FIELD_GET(AMD_CPPC_MIN_PERF_MASK, cppc_req);
 +
 +	/*
 +	 * Clear out the min_perf part to check if the rest of the MSR is 0, if =
yes, this is an
 +	 * indication that the min_perf value is the one specified through the B=
IOS option
 +	 */
 +	cppc_req &=3D ~(AMD_CPPC_MIN_PERF_MASK);
 +
 +	if (!cppc_req)
 +		perf.bios_min_perf =3D min_perf;
 +
  	perf.highest_perf =3D numerator;
  	perf.max_limit_perf =3D numerator;
  	perf.min_limit_perf =3D FIELD_GET(AMD_CPPC_LOWEST_PERF_MASK, cap1);

--Sig_/dEx+tYqfZCo5uwsjTWLPV2I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghhc4ACgkQAVBC80lX
0GxA5QgAlDdKxbk5K1bzVy+FmATFf6I7nksE8BE1Ap9h4k2JmOFWBKTXNYIqWwCs
NWLpGxAAf2Z/MJ7JKuHgrAE8/+K0O1Dozw7H9yJgsLHWDvZnry6H5WuLIGarv/yz
UBp1BRm/5LiGpgDr58/Kr33P+ShXO+zS8NOZfCkK/v5HtzhTVPpePvnYtqEKqwL0
Ix4CX74C/uHEKZKz0/XG6YmqnAHuba/Oub6vpNsk7s/g46vtCo1qU6A08W/sT+VD
dsUaLwOiVHe6Pduv1pkfqtb/wpCEp5hdNznbyaktxtv1ei1HF2kZpMgtmT75tCe7
A51BlUkIIxSQvtWaZd/p+6VldaBs6g==
=SrOu
-----END PGP SIGNATURE-----

--Sig_/dEx+tYqfZCo5uwsjTWLPV2I--

