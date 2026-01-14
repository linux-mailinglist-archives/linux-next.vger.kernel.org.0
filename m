Return-Path: <linux-next+bounces-9656-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5FD1C8DF
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 06:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4198A3011A6D
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 05:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D3A34F48F;
	Wed, 14 Jan 2026 05:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hWaz5h2C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31323308F26;
	Wed, 14 Jan 2026 05:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768367452; cv=none; b=Xr0ZMAMjtBwgz16557jcxJ7mjtmEUgWZak/JIFZ15LBnT/tc1YllL27e/c1XiofIeUGdRmUSh40889ySEf4wILrOxsq6+1JDoe9/jfUAvanuX3icVNXoiYjjJ2X5Cdx3lNW1/KbChPwD4LZ1ZANOOgbhMqC/Kg7uHv7iU/WJ0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768367452; c=relaxed/simple;
	bh=pkFca7LyBMjVhlMqTQQbZ4vc84yoDKYBIDAHBd0e70U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H0sSoPyinZxq/gnqacteFj+z8MV9hWLShyxnyzGKO8zNuIa85RJ4jm9kAhEHjxboiqJWdI4QSJ4Q9epo2wRZ7r8Rs+6qHZ+EOIOlg4vy+S7h17uDUEq+1eQHp2dU+X0neoujBmzL1C+v7SNphw2rWBK/oKHo9cqV0QCfv80e8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hWaz5h2C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768367431;
	bh=p3bUwFoTaIRbaWTCsnjHlnZQw8957QfeMA/clmAzN4o=;
	h=Date:From:To:Cc:Subject:From;
	b=hWaz5h2C6kLK8rFvTa7mTqvPcdvTPRFTzljs/DZt1alWKdgJyLxDp1SPiWJT3CtJ9
	 7YTX2E94AUEcJlSZbM0jcnK8t9GeYDa7NvfGFSSaaGb9qGU37drNhJj5EKS3M5INRN
	 1KUlDAL/u9LZVX8t+Em3ks3XBRePAE21aWuOhAr0fd+Pk2akB6E20qXF3pmhWqCuap
	 oqjbWb+BDVW8y5bAWbRxREIGq8U9JRAymg43vwHz20Soi0XnsBxolAMNmVmPKQwhKU
	 9S/Fu1tHUBTbr6q5LJGpRDmRlC8iuwY1TmOs/H3Ee9BLiWKaS2xjgaZTmju10QYWf2
	 opRBK3odZFPPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drZ1z2Vgmz4wGs;
	Wed, 14 Jan 2026 16:10:31 +1100 (AEDT)
Date: Wed, 14 Jan 2026 16:10:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Peter Zijlstra
 <peterz@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the
 mm-nonmm-unstable tree
Message-ID: <20260114161030.45b932bb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5n0BvNgvRQlwdYmNdtdbHH0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5n0BvNgvRQlwdYmNdtdbHH0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  34244446320b ("atomic: add alignment check to instrumented atomic operati=
ons")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/5n0BvNgvRQlwdYmNdtdbHH0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlnJUYACgkQAVBC80lX
0GyxGwf+IwJKNNL5Xx3xNfUdRQNioiFNmLlRS5DpTIo8s5kj8Kx1fTdeX4HMpCvK
QCJO+gAbmG47PqbKhxb+I9zoQw/sgiJncGioWERYtQPZ/hCvLqPh1WkEC6iXhr6K
CMJRPH11sMHCeSMDlqS2E7JF8Qts8PmlAUXH2GqcmnsA5kzGoe7HNI5se478+B8N
7ritdbKlWoCROg8/owsyvvUTmwXhRNLfYKyiiIz7h1mQnX6UhXYs+lZFjNuI44o7
3iLwMmW597hIPqQM5ZxO54DROeTZQiZe4Rc/2t4koNZt241h+dENI3gDALWYL0X/
kz3qGqt9NzgZZUrUjbZ0rGdBRHdIEg==
=9oHe
-----END PGP SIGNATURE-----

--Sig_/5n0BvNgvRQlwdYmNdtdbHH0--

