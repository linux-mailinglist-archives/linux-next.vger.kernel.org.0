Return-Path: <linux-next+bounces-6280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6484A91213
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 05:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FE0B1902F25
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 03:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A106718BC0C;
	Thu, 17 Apr 2025 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H445JwgR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA758366;
	Thu, 17 Apr 2025 03:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744861804; cv=none; b=GyJ6hf8ZfCIuDwKjJPhlINHLJbtsUYscBDujFLLdfsFHL5mq87q4KaAGBa8k3NugrPTShKP1+vu9elK0A4Ir0wfWCpGMT42XsYQg32mHq4gu0X6kBDIU2FjamEncQ84WYmPXE3cQyjQ1vPP3QTwSDo75dZiHqn7KkQ1uCLDqDM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744861804; c=relaxed/simple;
	bh=jeWaCuSZrf7B5bExjA7jriSA1Z+K7m4e2E4LHDGHBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5T1xEPgAQaIDJHUx2uzngkTcFpY5MXBjufItPC6GKgkOOq9XB0A5Zb0jR9jCg7jmKdB5mH/vRurCTZfmSK+EDlk7trxvNsB2xX8MaYG367Ls44GWXs/qRStreZiQ4wq/CeyIF2hVLteu6rI/uUJZOvzG7krKtxLDflnLDLX3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H445JwgR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744861799;
	bh=5rvvzX2BNLO+Z4+daJhz9zFdFJOMaj6dUkwcfxhNqb8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H445JwgRblXZfB0sNBHDP4R2nDiBBNTtIH+zo7ijJ9SC9yiHpR8X7hiht49+2ZZJ+
	 VbBw/KBbgn1P2PB+DqO025VsF2CFkmqOMo7f70zFziso3F8UtjlJYQcovj4KYroqhV
	 esD2h8jiB73Wy2wM7EFZYfi5Z6fTRo2Tj50KQQZwAswBLSu0OAQtUrjHjJnBgHRiXo
	 3VfOy29Ii1xJ8PdXemJDBHB8+ULpoWXBauV6VF8G627lrEuV04oOEw4abq4BSM6tVp
	 dX0D0fe/Xe/7OlW1L0EeLOzHBdVlOvZkWMBpXmIqYVxRlNfiqfpl/LwBohnOuhElVR
	 YT6LoqApdI4CA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdP6b4tV1z4xQv;
	Thu, 17 Apr 2025 13:49:59 +1000 (AEST)
Date: Thu, 17 Apr 2025 13:49:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250417134959.37204d48@canb.auug.org.au>
In-Reply-To: <20250415133518.2c8d4325@canb.auug.org.au>
References: <20250415133518.2c8d4325@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H6MILf.2np5J=BBlQn_0oR8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H6MILf.2np5J=BBlQn_0oR8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Apr 2025 13:35:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (native perf)
> failed like this:
>=20
> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
> In file included from util/amd-sample-raw.c:12:
> tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal error: as=
m/msr-index.h: No such file or directory
>    10 | #include <asm/msr-index.h>
>       |          ^~~~~~~~~~~~~~~~~
> compilation terminated.
>=20
> Maybe caused by commit
>=20
>   3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header to <as=
m/amd/ibs.h>")
> or associated commits?
>=20
> This a native ppc build of perf.
>=20
> I have used the tip tree from next-20250414 for today.

I am still getting is failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/H6MILf.2np5J=BBlQn_0oR8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAemcACgkQAVBC80lX
0GxmCAgAmezco5KsyvIfwvtkuBuYVyy45CrXkWCPUoO4h/NvkIWIOb8Nb4qo8tGl
W++KLTVQ1AH6q0Kg7MRdYoA+iCiuInEWMgUzSB/v9yzRcmbwuZu+ZQLDDmRRZGEK
MDyBVF6y62u/+w/vBf+boJevdDiaH9VnnO8ZgZ0AzJtea0nbBHDnZHogA7HRjw5j
zCAxzrbFy69dBfmhms3u2VDUsyE3MAdePGnNozXqvb7StJB5QH+YBul8UvU4wE7P
yEWEHT6p3x/P+eynEW4Xh9YNTzqOBSjxpg1vvGn578vMVFCvbE5KUMGTRXcEAj7y
hShutFbTxa+lnqoGOCgFx/gYo6Ib5w==
=L+Kj
-----END PGP SIGNATURE-----

--Sig_/H6MILf.2np5J=BBlQn_0oR8--

