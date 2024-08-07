Return-Path: <linux-next+bounces-3250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377C949EA1
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 05:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7ACD28B25F
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 03:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31F31A269;
	Wed,  7 Aug 2024 03:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iGxB4yIa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204118D63E;
	Wed,  7 Aug 2024 03:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723002480; cv=none; b=YC8HJCq8/vnGaEZWIB232nbekbbhcSGq7ruYDvxBsW2STLLEV6SuqBZDZQAmVv4qeiiP+qEP/oEOJLwlYrBKgBbNiugLvTYL+NXIJMGrAI0Rd9fH4FS9qGCD/0G0Nd+pyqIBK3tH/QvNweYeOsHDNZg35Rrt+HkzTxheCGnjr1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723002480; c=relaxed/simple;
	bh=JbzbilaTSgNsQ5Fef54aFQ6JBT/eCsGG3nXHmjCFTF8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpmQ6cLgFlExABNVq0AHskSfxTr1WUuIT9ybfNuUd1zI/ojzBFq7+o32TDCTNQh8Sr2QE5v4hqFF/aAF+rrPg0E4Z4wCF1D8RKq7DcH2fz4PfvSJzAiPRYmi47x7uxUa9hVWa+FVIuXiPkuF/v5xEUqOUPQEbPJQfWzltIYfLrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iGxB4yIa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723002475;
	bh=ecPrlAOTt/SuEzNvaB9lidrUkbWOXZuX3A0HkMCqorg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iGxB4yIaVCIQLWECOV+bncrAXf+rnbZ102CLOwtnrA5JVHD8nRyO2hl8R7hvzX5sV
	 zRLiejR+5OMGbcuLePIQ8D2TntkYhdJ00a8x1YonyFj4VzYbw/+2EGWUG3u6CUQNUA
	 hNtwkReQdpsgtfhrFLrfbEndjP2wT3fKs5oA2vKGHLnKyXtipz5t/SI3/9Aup5Y16H
	 JimLUmuWRDNPRb7s5tZW8axdMyfUWywrWOETy/SMWyy0Ez+GnB7aFKznOlntNgW5tD
	 kTnt1n021doyJkorHEBrrNHG9m6+WUh8+oUSCWWFxt6s4o13vax6iCTpGa/ofpKfGK
	 D4wHc657J9WEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wdx2z5GjQz4w2J;
	Wed,  7 Aug 2024 13:47:55 +1000 (AEST)
Date: Wed, 7 Aug 2024 13:47:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20240807134755.13ee4d45@canb.auug.org.au>
In-Reply-To: <20240801121744.2756e2d5@canb.auug.org.au>
References: <20240801121744.2756e2d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TdzGVNAOCfRXZZ9SophP1Ul";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TdzGVNAOCfRXZZ9SophP1Ul
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Aug 2024 12:17:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> In file included from kernel/sched/build_utility.c:72:
> kernel/sched/debug.c:341:57: warning: integer overflow in expression of t=
ype 'long int' results in '-100663296' [-Woverflow]
>   341 | static unsigned long fair_server_period_max =3D (1 << 22) * NSEC_=
PER_USEC; /* ~4 seconds */
>       |                                                         ^
>=20
> Introduced by commit
>=20
>   d741f297bcea ("sched/fair: Fair server interface")
>=20
> This is a 32 bit build.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/TdzGVNAOCfRXZZ9SophP1Ul
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmay7msACgkQAVBC80lX
0GzOnQf+LE2GE7lPefCktWjNs9xeFT5Ov9mH4niowJ99tzNgAIi5dqatDNWlTdAV
iZw1YdbjjV2HnGB0bhlgDdZssSpa6JMrNMe10xQjd9voGAtlz0uDu3xzhf3JRCRs
OmTE8GkGVkCx2IiTNl8/8O2CWxi0cHC7gQ/MN1ZgSdYcGdwJH6I9tHwpiOarHuVK
p1cBNtTwhkrRnoAgjcbKtHjmyAEx8b322Hx75oo4pb8wBjALqzE50uk3E5ck74GY
cxMjXvuYr9mabvaftqHVwXjxADmhLRqpogmLMYfsMvAA6tafoYlwMjI0B01dcot1
UCs+pGsEi5skuA/W0Q7hcL5Y3UqBdA==
=UTuk
-----END PGP SIGNATURE-----

--Sig_/TdzGVNAOCfRXZZ9SophP1Ul--

