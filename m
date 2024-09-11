Return-Path: <linux-next+bounces-3754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC7974FDD
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 12:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D611C229BC
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4E0186604;
	Wed, 11 Sep 2024 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AeKw8kmq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B81865EA;
	Wed, 11 Sep 2024 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051222; cv=none; b=sd/8bJ+ZQCW5F2DjX8FGrANDVPFw1ZUib9rgtFkpYRAT9tbM26rnDrw3dkCnsG6oX23No315AU7RbSy8S0W/ZhVhLwK7TOG5KhQ3bume4FLcwNkScHdSSPLKt6GHHW4yrmU883H4LH97dEEL5r3DvqsCot3ecNOPRX2G1X4J340=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051222; c=relaxed/simple;
	bh=hfQglHT1wIXo6wzXRF0BnFyZVbJeGWanky90jgYWSIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f5KuucRxsCHPHbkUX8WbJizldcY0n2wt1Tzoa82vhQq0vCOBW854C0whmTJpoHS6kepTNdQEJLxvNitKHlardq2rR1T8QzqkEUv7Pf0qLe80ngU1IvI+CK3QvEQVM7LoqYpJE6vqCT3TO7QvFcOYfVkOncU7+s/5jqD5RGH+BR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AeKw8kmq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726051216;
	bh=EhbBqKqQu9GESOyoqO0D7ZH6mmBRI+YZ6BATIeUU22M=;
	h=Date:From:To:Cc:Subject:From;
	b=AeKw8kmq0Ldr5xYEIbk6AMMoXI2007wa/ySEa4QmxNpeJ/ctL7rLV/w+6KXqNrcQI
	 F/tbYZaKvch9g2OJvMyTzd0+xFjGK5We53XmG7SYtCKW3JyZnqt3VobhmIZb6lYLR2
	 V6U7U2F2+ozRaC6jNP9bCwxvVnO704yVTqe+eT4NC5OCV5kH8mCLupoo0Ip6kgHhh4
	 q57RKx24Hn6HkzuKnKbtPsjIpVqOulj/4H7GsLUWBfOibY2+CD85hE7NGD5WYjvDeE
	 DRJs+4AOfQW2XG9PwaS4XACoMUOdqS5+NwTvcO9hohIDB0Yu4tfkTnWdzoiutyJ7UW
	 yPjAeFARGTGlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3cXb4hQ0z4x8D;
	Wed, 11 Sep 2024 20:40:15 +1000 (AEST)
Date: Wed, 11 Sep 2024 20:40:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Christian Loehle <christian.loehle@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20240911204015.6c5cd861@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//+ETOTVYcEo_iK8rct6mSju";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//+ETOTVYcEo_iK8rct6mSju
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm64 defconfig)
failed like this:

drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_freq_invariance_init':
drivers/cpufreq/cppc_cpufreq.c:227:35: error: 'NSER_PER_MSEC' undeclared (f=
irst use in this function); did you mean 'NSEC_PER_MSEC'?
  227 |                 .sched_runtime  =3D NSER_PER_MSEC,
      |                                   ^~~~~~~~~~~~~
      |                                   NSEC_PER_MSEC
drivers/cpufreq/cppc_cpufreq.c:227:35: note: each undeclared identifier is =
reported only once for each function it appears in
drivers/cpufreq/cppc_cpufreq.c:229:17: error: request for member 'sched_per=
iod' in something not a structure or union
  229 |                 .sched_period   =3D 10 * NSEC_PER_MSEC,
      |                 ^

Caused by commit

  b3a47ff09554 ("cpufreq/cppc: Use NSEC_PER_MSEC for deadline task")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//+ETOTVYcEo_iK8rct6mSju
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhc48ACgkQAVBC80lX
0GxCVQgAoDoNjYrvwveXygpvzt3jWhsuTlIxN8QnQwJmK0e+Dadis7PTjLEPkdad
xJuxLw83fs4UzUBgxcCX+nESJyiI5C8iQBi2ge17e5ydPtXP6UTMcgZffr0yLx7G
nb714Cudjsf8TZe+IgkgH58eHYpiOn0dRdZNrPiGDjUoU9IHjTopBmOgK9ddHxMv
3TYj9sPc6Sj0WRxdRu0cb8LnaMIbYoWL7BBNzQdiXozTuiLdGq+8aYdv1s77oHsP
e/PAQYI+zoqAEo+N5MpuK7S3CEb/X9hZIhdinaJBvZljD5ysNhP5mqrKtdVHfRxy
dxp3tU+U4p10vLPoVlMvslEILy9B0w==
=vXWb
-----END PGP SIGNATURE-----

--Sig_//+ETOTVYcEo_iK8rct6mSju--

