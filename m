Return-Path: <linux-next+bounces-8768-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B9C22DA2
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 02:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B745188C096
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 01:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D1515B971;
	Fri, 31 Oct 2025 01:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eAcaz765"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5394C81;
	Fri, 31 Oct 2025 01:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873502; cv=none; b=hM44bkb7miVETdzw3imDeOeIcIS6HL28doLV1LcVCb3Qwz7sPLuVEwbgXQD0YT1HNDGO9G0J04SIVtLBicEFjGM1iQCkQPz6nBVkiQZ6iyxhG7wz21kWXBgOXMEjxwU2G1g2CU0xuDlUfRnG5SfnIgvfGFMzqTxyiGTtlGIi6Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873502; c=relaxed/simple;
	bh=hXMrFcsWoZiW5tMzpdbWSGzUtGF/9ammpOK9a2U3Ow4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sc+eqBpNAV996OQWUMGWnMqkQ0NE93T00I5w/FrWGruF20gAab1CCyo4CIkyFFTMKVnaeqHz7NrRQ6qqN8+aUo62l/4d6BkMeDsmqCO+SoX4wh3KYmuitkjEVZha7GkIzHEgyFgXbUBGAoZp2M4eOFybzdvcz5g2wciCGfiJu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eAcaz765; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761873493;
	bh=EnBz2xZ8wY++5A4DWATyj5lK5khc0mXCazXN4NiHVWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eAcaz765Wj3yx6dGSXxWVQuf3SQabeZcg5q5GAjbaBPl4k0DhFbH9U3AtENTMrtXA
	 RxZmMy44rCOLrjQeoz6gOqfdUBo9jWQB9xFWKMnJsCO7CzddWVoAucaxlyWIcs5E/X
	 eeohw2j9DL5s9gZClN9WrxEbasRJ4MQw2g6Bia7QQEBp3ktJvUS2P7XyUjsrglQONw
	 hio3wl6VfEJP6ZccqOzAVxJ9hT/sLZQSfDIluktxo/KcBe+J8Fad6Okfixl//I+Vc7
	 2bl+Zm2OTHLdLqpOAHd6Jus+3/ASpM1EVrgfw4hkQCAQFYoewUOKRIoBLWxIBQTg21
	 qE4kpKDUJ4/jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cyNQY2PsKz4w9V;
	Fri, 31 Oct 2025 12:18:13 +1100 (AEDT)
Date: Fri, 31 Oct 2025 12:18:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251031121812.1db72425@canb.auug.org.au>
In-Reply-To: <20251031120243.4394e6a8@canb.auug.org.au>
References: <20251031120243.4394e6a8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+uRBJiK6h8/FNj=F3ab9OgG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+uRBJiK6h8/FNj=F3ab9OgG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 Oct 2025 12:02:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (arm64 defconfig)
> failed like this:
>=20
> arch/arm64/kernel/entry-common.c: In function 'arm64_exit_to_user_mode':
> arch/arm64/kernel/entry-common.c:103:9: error: implicit declaration of fu=
nction 'exit_to_user_mode_prepare'; did you mean 'arch_exit_to_user_mode_pr=
epare'? [-Wimplicit-function-declaration]
>   103 |         exit_to_user_mode_prepare(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>       |         arch_exit_to_user_mode_prepare
> In file included from arch/arm64/include/asm/current.h:5,
>                  from include/linux/sched.h:12,
>                  from include/linux/context_tracking.h:5,
>                  from include/linux/irq-entry-common.h:5,
>                  from kernel/entry/common.c:3:
> kernel/entry/common.c: In function 'exit_to_user_mode_loop':
> kernel/entry/common.c:77:29: error: implicit declaration of function 'rse=
q_exit_to_user_mode_restart'; did you mean 'arch_exit_to_user_mode_prepare'=
? [-Wimplicit-function-declaration]
>    77 |                 if (likely(!rseq_exit_to_user_mode_restart(regs, =
ti_work)))
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler.h:76:45: note: in definition of macro 'likely'
>    76 | # define likely(x)      __builtin_expect(!!(x), 1)
>       |                                             ^
>=20
> Caused by commit
>=20
>   d58930640310 ("entry: Split up exit_to_user_mode_prepare()")
>=20
> and maybe following ones.
>=20
> I have reverted these commits for today:
>=20
>   69c8e3d16105 ("rseq: Switch to TIF_RSEQ if supported")
>   1b3dd1c538a8 ("rseq: Split up rseq_exit_to_user_mode()")
>   d58930640310 ("entry: Split up exit_to_user_mode_prepare()")

I also had to revert

  84eeeb002035 ("rseq: Switch to fast path processing on exit to user")

--=20
Cheers,
Stephen Rothwell

--Sig_/+uRBJiK6h8/FNj=F3ab9OgG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkEDlQACgkQAVBC80lX
0Gzh7wf/ZbDgcyXwu5FQYhfZpWwEok9NUa8ezGcQ3p2/WliPo0x2TFcz//yk7JqH
9/TmBqdUo0C90PSEddCNwdBreeOhve+U+j0WhodNTZTw7j843nfI/LEOuLI6qkls
zI6tI0+/VH/a+tSB7sFS+LzKoK9tGkVgUitePwDEj7Ax5l9oU6UUnSbGRz+Hh2cB
RsliRjZquZboPDdayUVQ++Wk4mpn8JkmfvEbRr7iwFRmmrplyjmTCBUgaEN79/Gv
R5rUBX23/fcoBoBsMWSPo6x+QybGzaRYt+1QwGnTMwZJmVkYUcxyA7L9oolApqhG
bI5Fs28idY+JdFAbXf4Ez9eg+k5yCw==
=c2C5
-----END PGP SIGNATURE-----

--Sig_/+uRBJiK6h8/FNj=F3ab9OgG--

