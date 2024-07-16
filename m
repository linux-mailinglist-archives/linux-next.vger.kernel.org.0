Return-Path: <linux-next+bounces-3031-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D393211D
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 09:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F200F281FA8
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 07:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D605022619;
	Tue, 16 Jul 2024 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qv2P7/ba"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2E22309;
	Tue, 16 Jul 2024 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721114474; cv=none; b=OH+NbZaGjvelc6UDJVxjfdgGYnz8pQ0PSnNCpmvua4O20Q/vXZWAVUUwRpkkd8UmyILsaYz2zrYvK9LMoyrxjYsAQIun3S7dL7Lc0ECLwJYz3Gw/uJPzwtZ7KedLyAB0/3RVgqp4Ha+j0M24VJPWG4qq8fr0ms1VPRwNHWTGXFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721114474; c=relaxed/simple;
	bh=0rj3SFFw11HobcCN6i6yyKr3OQ+QCRHohtu9QlD47Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezVeHzjU5Wz4XC01Cok/vfg3PsFJbQNLc/XPSJhLxigtddVZCZeG6a3HEx28+QguQoVvcc9ONSRi34JTKR0tX8LuBzwjsqyX2w6FXj4JvjTAYDSyZ9P6WVPsQ7WEpxgSEnJVEJ9jkfcae7bQ/C7eS0PYJAv+Pv46E/CVdIyjDEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qv2P7/ba; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721114471;
	bh=gl45pgGGHQDN0Fy/S/1yp97jeC0Sraqos7hiRekWu8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Qv2P7/ba7MW6lUxXLcAmhoU4a7GUW3G8PAlc/RF5rtJRxW51GnVVFsFBNsYL3csd/
	 PFYMJjslB9sC1bTrAfIkSh8t/45k1/3krV7GqRogYCjlEdhSV00P0p4LKFUkvrIzBa
	 Mp68xknncXtmvf/SDAqX3UUzJRDdgQQc6efmyxCcVgcqqBBmuZr1Qbp1W25h3oVMHR
	 h7f+AX5OXdne7yCkkqo5RKSVKmVGA6AbY3LT3uK4dicyC7hgOEuZMzrIkJVbL2ja7R
	 BuM9d+SSu1OcTrZgfpbcvE3ZUWAtyqrki159F333zzeBchxvC3u/3r5cMDVBqVo/3i
	 p1yY99yHTEYJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNVq86Kkzz4wbh;
	Tue, 16 Jul 2024 17:21:08 +1000 (AEST)
Date: Tue, 16 Jul 2024 17:21:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the clockevents tree
Message-ID: <20240716172108.43041186@canb.auug.org.au>
In-Reply-To: <20240716151404.0383b72a@canb.auug.org.au>
References: <20240716151404.0383b72a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZVTH.Xl_qfG0H6nzLazIrxQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZVTH.Xl_qfG0H6nzLazIrxQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 16 Jul 2024 15:14:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commits are also in the tip tree as different commits
> (but the same patches):
>=20
>   0d8d1bd925c8 ("dt-bindings: timer: renesas,tmu: Add R-Car Gen2 support")
>   4f2fd59b7d26 ("dt-bindings: timer: Add SOPHGO SG2002 clint")
>   8b77f4b8dc81 ("clocksource/drivers/realtek: Add timer driver for rtl-ot=
to platforms")
>   9957722a200c ("dt-bindings: timer: renesas,tmu: Add RZ/G1 support")
>   b24868b81231 ("dt-bindings: timer: renesas,tmu: Add R-Mobile APE6 suppo=
rt")
>   ba39e42e9acd ("clocksource/driver/arm_global_timer: Remove unnecessary =
=E2=80=980=E2=80=99 values from err")
>   cd6d60a0faa6 ("clocksource/drivers/mips-gic-timer: Correct sched_clock =
width")
>   d9a7f85412a9 ("clocksource/drivers/arm_arch_timer: Remove unnecessary =
=E2=80=980=E2=80=99 values from irq")
>   e207ae12f08e ("dt-bindings: timer: Add schema for realtek,otto-timer")
>   ec601554e3eb ("clocksource/drivers/sh_cmt: Address race condition for c=
lock events")
>   fa957fbdf44c ("clocksource/drivers/mips-gic-timer: Refine rating comput=
ation")

And now they are in Linus' tree :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/ZVTH.Xl_qfG0H6nzLazIrxQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaWH2QACgkQAVBC80lX
0GwSfggAmqbKSTCtMr1POusvHAxHe6eswMjOmcRTNaKaqa540GsxqK4oflAIJPoQ
EFMnz+lxK/4D8YXb0KIfZa1Kp66pMEzFxZmrJFdP1p2L3+wY8ZMVR4EI1OgBXntO
5zsFk3akBKuTGPyet9fqLYt/+1VZ6qN8ST5s+cPd+V18y9zy+Bi8/DjO1tABmZog
OUNNSZRxXr4as5t3HPUe93IJdiHySZxXfatDqYfFFeCZO2SjofxzLYC3w4lUWcJE
ruzmyMJyJ6dh689W47T0GtqArTfNz8FXyRuGCDwDobq4dY2AQ+bgYPW9c5r8T3rC
DOdOAKXrFaGDw9w5ugttm0PnRAGV1w==
=o7a3
-----END PGP SIGNATURE-----

--Sig_/ZVTH.Xl_qfG0H6nzLazIrxQ--

