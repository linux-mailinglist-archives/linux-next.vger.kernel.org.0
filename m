Return-Path: <linux-next+bounces-5583-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9EA473B4
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 04:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B8293A6B3E
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 03:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748191D61A1;
	Thu, 27 Feb 2025 03:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="E0AB/uBn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5BA1581E5;
	Thu, 27 Feb 2025 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740627860; cv=none; b=Ck4fzxudAJlP/n60mkdhaUmMsdobC9HIIwUa1pTuX1Xmeab4MxzGzI25/o3SX+h1rRl+VONrcVqD9ecn+d2JcOP6thHXjx6oY2Vgt1gzONVPNx7pasfk6yZ2DgJDOborKi5M1ZoLA6Vtn8WGfB/nfw39zhjXGMjyBwpv182BAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740627860; c=relaxed/simple;
	bh=itIz0yWzY/4jfnNu7ubEYYnCjKI5K3Z0M8l6cQpH0AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MDhqgK3V0Tffdyw2RxWzw/+xth3sox//wqDyqWm1x0sQzS2CvrMTnmixZFwmNn8/HXw6Czif7EuwulYzNigcJ+0wCUjUwwibG1GbJjscwwy5zqJ7Sse4WF48nO86uplufnH9c6xa3R+TaDoakJXQ1IUuabHr58tmYOxl7qXGZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=E0AB/uBn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740627852;
	bh=r1JtnbgL72/VPVHaKjy1KV+t6vos+4+p+g9qM8BMhsY=;
	h=Date:From:To:Cc:Subject:From;
	b=E0AB/uBn4I2yRfDl+mU21CXbX+mYnxB0ajVM8mCbEr8g78gFh6lXs3a0OSXwR1dXZ
	 bjz0EUVq7a6jL1xwqsdrZxK1HABDCZcIcbOUcZy/GTAHvwtyWAly/DXSBPBkRQPg0V
	 2n2SWb/LJFR74kV5R8UoBFOGedT7DtpemMPyI6skA1quNWARrOW0Vb5Q1izbDaQc7I
	 tfAVW165k5NZbzIFASboof+lP0DOVFKYNnM3uDm0ioCQhPQuV8I0T+T9afoBbxkyCb
	 LR0txN88rcZ0LvVKpXUFJIjiWsJwRZPf3dOBNLheYpY8uJy+uLm1ZypW3bcewmns/8
	 3egRvAAzOiVeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3HJW60y7z4w2H;
	Thu, 27 Feb 2025 14:44:11 +1100 (AEDT)
Date: Thu, 27 Feb 2025 14:44:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20250227144410.275469fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cg2QjYASmZSNx7RPOWufiVT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cg2QjYASmZSNx7RPOWufiVT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  a37259732a7d ("x86/mm: Make MMU_GATHER_RCU_TABLE_FREE unconditional")

This is commit

  a30104ede395 ("x86/mm: make MMU_GATHER_RCU_TABLE_FREE unconditional")

in the mm-unstable branch of the mm tree.

This is already causing a conflct in arch/x86/kernel/paravirt.c due commit

  f2c5c2105827 ("x86/mm: Remove pv_ops.mmu.tlb_remove_table call")

in the tip tree (where I just used the tip tree version).

--=20
Cheers,
Stephen Rothwell

--Sig_/cg2QjYASmZSNx7RPOWufiVT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme/34oACgkQAVBC80lX
0Gwe2wgAnAmWWYpCn0kp1joSbPighB9ieSnKDQr7SOAJIFR6sEjZQ989SM+Uj+Yc
uwx6tZqYkOKWa+/55nnFql5ovg4zMpm6tHxH4v/wF1fHO/a+hIIs3DSL1cixuV3K
4CZYs7k362W3rLpzaVEPhgDfa1BYIVFsKIG6x9aTEsl9Avg7GONC08YD3BnINvQ1
42INQydW/uioRlw8teZzLMsW37gurgIWKNE54b6divDaTWi36dn4CVWAoHGdZpTz
xXWKuqeSO4pOPf3PxFc6RPkboSCBcgWRf67w46AV7Wwom6JyO3qsKYp0ryYcL+y9
R384SAVFqEArvMRz5BOERkoORIT++Q==
=8ebq
-----END PGP SIGNATURE-----

--Sig_/cg2QjYASmZSNx7RPOWufiVT--

