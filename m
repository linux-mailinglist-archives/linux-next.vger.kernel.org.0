Return-Path: <linux-next+bounces-3024-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC1931FF0
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 07:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332081C20FEE
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 05:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BEBB67F;
	Tue, 16 Jul 2024 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JX7dQIvO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE4FED8;
	Tue, 16 Jul 2024 05:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721106856; cv=none; b=I3qBRoDC1ZsAJSxifcD3aGausL4avQ33yBJHZ2T54zR22+w9TixkOcH/4vHt9wWksfgL3JzdQUSSnpg+y1TE12Vn1+WphtlstcetU1gg6qXRPXItlB9uPHXIB1KjB0tscCXa+7AppvRrwqohGJmsmV8HULn8hbFGXp5M2OGlraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721106856; c=relaxed/simple;
	bh=E0uGJr1GJyYHRZDeAVDzESZcTorIPE2GuP+RBsOrvHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WLb/s2QFXfSCLl2K5FxQOi/N0VLc/R+WQwzEmWV0rq+D0FGhG5prc0gIbYGxoVwLXgfXTUVIviDyJnqBBtESMsqpx0X0a0Q2rFIe77gHMyRbYYijRhVEvtr6ikmU81NAnYXQuOU6gewq1GgI3LGlp4yDXK4QOaFHaLorx6rl2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JX7dQIvO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721106847;
	bh=8z2NjZaMWrdUKAK+x23oxFYuLmkEQZAzElVQNtlc5o4=;
	h=Date:From:To:Cc:Subject:From;
	b=JX7dQIvOIlQyldOI/SsQyJ8QoQ1zpt7famkIVKNwD62/Dwp7YgM9buTcALJHn/C7Q
	 Elgm7Vyl+FtcLsG8tF9HvR9B/4WAn4hVK9UpqLo56wmYbJedizVnWSWPqgPPFmhUDD
	 goyLw+uKkxiUYaDZT93OX/MrDp8qn8QEuksufwQgs9Xdxs2KxHaxHilaLftHAGz4mS
	 EOWs9SxTsIiQuf46c+lGjW0TQ9+uHtGn9PKhhvmCDlPhJXGQ2zp3xo9wrH1r6DiodU
	 2ZFMDBjch9/2wFQ/Vr1/O9Yys8yxGBCm7fbOwt61iqilgqDHcj0ALNgl1xjVBBaIZh
	 9QiraOdDgTXXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNS0Z4h1Pz4w2Q;
	Tue, 16 Jul 2024 15:14:06 +1000 (AEST)
Date: Tue, 16 Jul 2024 15:14:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the clockevents tree
Message-ID: <20240716151404.0383b72a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A2aoU+2Z4glLKiiKkjJXRYs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A2aoU+2Z4glLKiiKkjJXRYs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the tip tree as different commits
(but the same patches):

  0d8d1bd925c8 ("dt-bindings: timer: renesas,tmu: Add R-Car Gen2 support")
  4f2fd59b7d26 ("dt-bindings: timer: Add SOPHGO SG2002 clint")
  8b77f4b8dc81 ("clocksource/drivers/realtek: Add timer driver for rtl-otto=
 platforms")
  9957722a200c ("dt-bindings: timer: renesas,tmu: Add RZ/G1 support")
  b24868b81231 ("dt-bindings: timer: renesas,tmu: Add R-Mobile APE6 support=
")
  ba39e42e9acd ("clocksource/driver/arm_global_timer: Remove unnecessary =
=E2=80=980=E2=80=99 values from err")
  cd6d60a0faa6 ("clocksource/drivers/mips-gic-timer: Correct sched_clock wi=
dth")
  d9a7f85412a9 ("clocksource/drivers/arm_arch_timer: Remove unnecessary =E2=
=80=980=E2=80=99 values from irq")
  e207ae12f08e ("dt-bindings: timer: Add schema for realtek,otto-timer")
  ec601554e3eb ("clocksource/drivers/sh_cmt: Address race condition for clo=
ck events")
  fa957fbdf44c ("clocksource/drivers/mips-gic-timer: Refine rating computat=
ion")

--=20
Cheers,
Stephen Rothwell

--Sig_/A2aoU+2Z4glLKiiKkjJXRYs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaWAZwACgkQAVBC80lX
0Gzqcwf9F6ht97hiPixcvQppZ92wRgThxGrcqz4fMY3rWZb+7vBwJE8ogT0t9l3L
hVcV5KCkmTbL8zdGKC8W0ItSg2urePnEyXbYcNmJtubsk68A6BwSpr1SR3HhKaYb
quazpUJudp3MfAc8kTYx06eTl+hvjPPc75VNoYdotaCYNscwnYRNDNY3VTjL7kmo
+96YON1va40m845uIpvv3q/Hm4lkbs3wriY8QX+KRpmPWw1esooT7zgch6uX5tRf
YZZoqWzpXdD4bLY7q+RfObFHQ6m2zD181m0jy8zmx5YG4KzPTU1UlKQbz3Kl/z90
JpetwwKO78TbEbrClKVQ8nUlbBeqEw==
=moi8
-----END PGP SIGNATURE-----

--Sig_/A2aoU+2Z4glLKiiKkjJXRYs--

