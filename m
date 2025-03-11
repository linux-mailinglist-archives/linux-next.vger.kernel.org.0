Return-Path: <linux-next+bounces-5719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49461A5B7F8
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 05:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBD203AE81A
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 04:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472581E47D9;
	Tue, 11 Mar 2025 04:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k5kjrihH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74C211C;
	Tue, 11 Mar 2025 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741667076; cv=none; b=dOHThffO/gvhu1o/VXwCvM+xiqC2jlgaOM7TR+uYNt9TK734a4Akhg0nef/0zideTrBc0Ec0EzFj467a+VEXq9urZW+ZVDJe8klGC8a1N37nvESndTcl//+Yf0xMbpT+brQcI/y6yMr4GuDj1egLC2gPQ2FS2vK26QPVgkFasI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741667076; c=relaxed/simple;
	bh=N/dz40FusKN1fPJKtVtrTGzTJII7BRLTXwZvN9oFI78=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5nAlYGDHm2+QX6v5PqwZFgLlj8sbiza30EZv4f6OHmn7a3JLLFjeCSHlIpq8DkQVp2m5PHDyca51QkoLjSyvNWr4Qy4XZv4yuh/Raycc1xsE8unQhbnIs+xoLoQfH36tPpFTkvkOh61Mfd1pZoehjloe9Av11nlevbaR4j5yW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k5kjrihH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741667070;
	bh=39vmfxyigmhXmG+tSPWqPCcU3OrlS6v+EgO1BTs8zIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k5kjrihHlRFrYpBDCbGjbWMcWJEjvymP2SQxtuHr7zeX30i7+FOmqmYzb4nWwtM+n
	 6b4ib0kLu6FoPdgxD7Yl6D775Kxl7cT/i+/ywa2fmICEQkqngho7IAhgw+R4u/NYNn
	 9qbxHevUeoZP27/u1nmaBrEFhqAN2WQlgCnX3XGFAct2I/vmLQL3ZtJZscgy3u1TY6
	 EsfLupGvVWCAASEu4kiKrDdCMzANoQgZn5DM+w9ufJnyESzm7StqlNGSzqwmFjJwdQ
	 aK4lBGnEKRLuAxHZO3Xe71JrKPYdHQaiwWia5c+7kS68NL2n1lY1ZY9jD/z651PGTU
	 sFLPZyGVDu2IQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBgdV2MV2z4xF1;
	Tue, 11 Mar 2025 15:24:30 +1100 (AEDT)
Date: Tue, 11 Mar 2025 15:24:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250311152429.32d9f824@canb.auug.org.au>
In-Reply-To: <20250306152516.32df7764@canb.auug.org.au>
References: <20250304162402.475eb3bc@canb.auug.org.au>
	<20250306152516.32df7764@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ehviUIGckpzk0DGgo3KRKVR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ehviUIGckpzk0DGgo3KRKVR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Mar 2025 15:25:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 4 Mar 2025 16:25:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the tip tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > In file included from include/asm-generic/percpu.h:7,
> >                  from arch/x86/include/asm/percpu.h:597,
> >                  from arch/x86/include/asm/preempt.h:6,
> >                  from include/linux/preempt.h:79,
> >                  from include/linux/spinlock.h:56,
> >                  from include/linux/wait.h:9,
> >                  from include/linux/wait_bit.h:8,
> >                  from include/linux/fs.h:7,
> >                  from kernel/events/core.c:11:
> > kernel/events/core.c: In function 'this_cpc':
> > include/linux/percpu-defs.h:220:45: error: initialization from pointer =
to non-enclosed address space
> >   220 |         const void __percpu *__vpp_verify =3D (typeof((ptr) + 0=
))NULL;    \
> >       |                                             ^
> > include/linux/percpu-defs.h:251:9: note: in expansion of macro '__verif=
y_pcpu_ptr'
> >   251 |         __verify_pcpu_ptr(ptr);                                =
         \
> >       |         ^~~~~~~~~~~~~~~~~
> > kernel/events/core.c:1222:17: note: in expansion of macro 'this_cpu_ptr'
> >  1222 |         return *this_cpu_ptr(pmu->cpu_pmu_context);
> >       |                 ^~~~~~~~~~~~
> >=20
> > (and many more similar)
> >=20
> > Presumably caused by commit
> >=20
> >   f67d1ffd841f ("perf/core: Detach 'struct perf_cpu_pmu_context' and 's=
truct pmu' lifetimes")
> >=20
> > I have used the tip tree from next-20250303 for today. =20
>=20
> I am still seeing this build failure.

Ditto.  Anything happening with this?

I am still using the tip tree from next-20250303.
--=20
Cheers,
Stephen Rothwell

--Sig_/ehviUIGckpzk0DGgo3KRKVR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPuv0ACgkQAVBC80lX
0GxvDQf/an8wikRuEKrAip4sB8G/5zas154qsuG+LFKZDxCKUp9ZfOSKtSteemYC
5JVF0kcYz7gwqRDpcJCglQjhuSPxexMqLyQne4F4Gy34TUOdqPkUGEDo7sc95ty2
vzmm1bz8S0D1f6QJ2xSjVmLrXWxLgvg3q9JhyagR8UhM7OKEUKuznfqB7fWb6dd3
rsC7WtkRIOnUqaywSXRyYywxBlc2VMDxyHljfHOYjKKLYXhsRi6r4jGH/FWaNhEx
D/Nj991XIpi/50feqpxdJjlcf/lHEZESuIJyXOUM9yP42Yd6wGSQWCD1zIC4k56F
oCOWEr59ivGmICDPaMC123mh2HkpaA==
=NapL
-----END PGP SIGNATURE-----

--Sig_/ehviUIGckpzk0DGgo3KRKVR--

