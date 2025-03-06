Return-Path: <linux-next+bounces-5666-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE8A541B0
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 05:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4984A18927EF
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 04:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE73768FC;
	Thu,  6 Mar 2025 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X7FlWNfw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1EB2E3386;
	Thu,  6 Mar 2025 04:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741235515; cv=none; b=JFxbuJaZEJshlAjtcHfHK36qAFRojf24tcmhwaOvXkRHW58eSEcrwzdczL5wVcAjsR8RE917dnZ2iZXyskwSgwaey08zaWUdq/HelMq9XRl5aJC2TA5SU4LWvdiGvXP+P/gWaBPxwQxaPSb0QeoFG0s5oLgPESYtT+k9QBE8UhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741235515; c=relaxed/simple;
	bh=0oNrGIUjPE9ycSxoSilyqhxHQyNG/IjdaQQ+7/8Zb68=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iof74JfHAmRnG7e98vG7EYYEAaIXx5ejN7xxYb7ikZKlndlm2bVwS4dOFhzb2nrFHFb4cV85foXu5q/p+5s72GyGaejC4pUnyngACc26zKe/ZKjcRsiru7Dq7BcKa9t10K9rcoL6d1Iv5yZCbWKT6kpYxwSve0iHeM4XkzNjjJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X7FlWNfw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741235118;
	bh=0x4Rl4qRZYcg6rqPxvWsBZaEGKbE9pOvAdECwFlhRLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X7FlWNfwmpgdzxpaBLAcswDmoBgGwjKjoYuin+VCXIWq+d21sPchNKYOMTsiBk2oq
	 nkeKIniGPHClPdeMJu2fD/Q8s+JlzPiWv2njz16iftr8W+mfSVdarV5GwPAI+3jUq8
	 Bo18g5aahIqO0c4PS36qrQ9UJsuwGOa01CkQrM4fAuVTwQzsvKNgXJ24qIn66oPec7
	 8du3iVZk3oeV3++ucP291k9b3l2hObhawm748o4QjaNrujsQjWJq6+OD49IAI8Z9qq
	 MoQQ4EDTKshzjk9McWF6Vl9yL1EHfh6pU98DMyGvx4J6mbeSo+TYk58HjpT4Y3q3D3
	 EbETTKSdaM+gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7btj6lpZz4x2c;
	Thu,  6 Mar 2025 15:25:17 +1100 (AEDT)
Date: Thu, 6 Mar 2025 15:25:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250306152516.32df7764@canb.auug.org.au>
In-Reply-To: <20250304162402.475eb3bc@canb.auug.org.au>
References: <20250304162402.475eb3bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cZTR/H+u24gyodw_f_yLTNv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cZTR/H+u24gyodw_f_yLTNv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Mar 2025 16:25:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from include/asm-generic/percpu.h:7,
>                  from arch/x86/include/asm/percpu.h:597,
>                  from arch/x86/include/asm/preempt.h:6,
>                  from include/linux/preempt.h:79,
>                  from include/linux/spinlock.h:56,
>                  from include/linux/wait.h:9,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:7,
>                  from kernel/events/core.c:11:
> kernel/events/core.c: In function 'this_cpc':
> include/linux/percpu-defs.h:220:45: error: initialization from pointer to=
 non-enclosed address space
>   220 |         const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))=
NULL;    \
>       |                                             ^
> include/linux/percpu-defs.h:251:9: note: in expansion of macro '__verify_=
pcpu_ptr'
>   251 |         __verify_pcpu_ptr(ptr);                                  =
       \
>       |         ^~~~~~~~~~~~~~~~~
> kernel/events/core.c:1222:17: note: in expansion of macro 'this_cpu_ptr'
>  1222 |         return *this_cpu_ptr(pmu->cpu_pmu_context);
>       |                 ^~~~~~~~~~~~
>=20
> (and many more similar)
>=20
> Presumably caused by commit
>=20
>   f67d1ffd841f ("perf/core: Detach 'struct perf_cpu_pmu_context' and 'str=
uct pmu' lifetimes")
>=20
> I have used the tip tree from next-20250303 for today.

I am still seeing this build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/cZTR/H+u24gyodw_f_yLTNv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfJI6wACgkQAVBC80lX
0Gz0Lwf/S5WUZDEN7TT6I6pY7lc2vg9RGkyBjuBdwgBspVhZxHUXhJtfloFXpuUX
2+C5qurTIRbHm9A4h5Z8QOdqzFNIJ6lIQuHces7vi3AlU1D2u7uNHEernLLiionA
0EbJUijp3zmfjZWqtHyTiQLsJTFHFDqKSuRuSu5DA6PVhwn0zQaGt5TmtVIEr+1o
0zbzAEDcSeq8A2pwIxmBe+dbbxyDeW4h82b3OLwfWnStvPmjVWcJS4SvTV1dy7Hs
8IahXvGo/cvqnYJao5r0uktUJ0Dtu3z51jMZm+1bRnYpncFHAMsrV2Gh8V/EG7aW
scFSbacRd9IUnV0lEuAd08OUHU+xHA==
=icqw
-----END PGP SIGNATURE-----

--Sig_/cZTR/H+u24gyodw_f_yLTNv--

