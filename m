Return-Path: <linux-next+bounces-9273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D907EC953DD
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 20:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98D6F3A25F5
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 19:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9113F2BEC5E;
	Sun, 30 Nov 2025 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sJV0w1IJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1059724111D;
	Sun, 30 Nov 2025 19:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764530863; cv=none; b=SnmV1BoFamHwe+g9d8a12Oc2NNu5u5fKwhrOYw5vIWi0KaHWoMPT4GzIbWIw4vx6Z7ULQxrplCcOcR7F4FRDf0oY2Wgqs6CUd37jTO+70nEljjv+7+7nsaoEJIqFlmU6DKQEt/pWpjFlBEQ2zzofKIps8E7O95sbX2oQs/ANHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764530863; c=relaxed/simple;
	bh=TMUkl3F7Rd1CM/RKX6KTXWl35MwGReauPBbboOw4nJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QU5t5bEvEs783xLuQSEkD4E3q7czv6cpROlCPH9DQPNWngPmTsATWOZEMai40f2GaxyN1YdT/t3y99qGWdW7ABgdFHJMwNSd9P3xtG20KY02cIZIkabWul5nOdQIj4JLsvswle5IIYfcQZsjwIuO/yjsa7E3T9gRKSsgLaOv92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sJV0w1IJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764530850;
	bh=4DeV0Kbyk3DqgVhbQjcLwcq53GUOACrUpH3R4aYnS3U=;
	h=Date:From:To:Cc:Subject:From;
	b=sJV0w1IJ3+uOupOhV069Xw7h6sHyCUfMroouM91jRMU3dbzsJ3uOJNfl0c9ebYZLR
	 6QnOCOC5HKgP4KLupQmBeY9dGRO9Tv3Twmvqwl/RJAVOfHapXXBUTYsPcudcBHQGT4
	 KnClMNhn5hc093YkkC2naDICDoR9/rp9mxYgDAh+leIcprh3NSkrGAl+Hvp8LGAmV0
	 aPGn2qaP55/2keTi8zKkKsUkleRxJsnr9Rz0/H+7e3JWzQZ5rLlPKhM/a0GOd+zakt
	 x218tYRUEBJxKRX5b4100fVJ2dp7lRZ/Npm+02j/jl9FY1lBmSUaOgyRYtfJe30aMn
	 rQZIRsKiCsn8w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKH9Y650yz4w1j;
	Mon, 01 Dec 2025 06:27:29 +1100 (AEDT)
Date: Mon, 1 Dec 2025 06:27:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20251201062717.09db0560@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/966lKhuOsMLc/zEVQc18N5W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/966lKhuOsMLc/zEVQc18N5W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  01f38611a451 ("locking/mutex: Redo __mutex_init()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/966lKhuOsMLc/zEVQc18N5W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmksmpUACgkQAVBC80lX
0GxV7Af/dYcQ3QgGTvobCm+eerFaApkgmRkug/5XNXtxhtaYLPTkEwDMDyMCH4BD
5jgrlwC/7fAk8azIEen0tLTizBrwvYrwlnkv2Kd8FdfTwJZ0iUXcJoRQn7W8dDSC
plQgo2qB4wrtXOeqge31KTmDpRwXDcdubIjDmeY/U/4ynJs/xh0ldGgaEjqhciP0
mYuhFV3rgEqgmojuV/YCw9kWdRQwMTpRnhQoN5IxPgpTpYRh9b1BMp5rypRWa/OC
V3/3CfKFzFgBpDJvwKqsAWCykl/3EmZmGnwHu25F0+d6IhRiZg+Aaq4nD4J1DmyA
bOyQ6tAqWtnid++lPxXJa+jfVoXYag==
=CgyT
-----END PGP SIGNATURE-----

--Sig_/966lKhuOsMLc/zEVQc18N5W--

