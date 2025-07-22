Return-Path: <linux-next+bounces-7698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D4B0E753
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9888D1C8737F
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 23:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BC928B7F1;
	Tue, 22 Jul 2025 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cX1LCA9E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74722E371F;
	Tue, 22 Jul 2025 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753228275; cv=none; b=D73I853L0ViwgWavdHU8PXQHcL5oLQeQibcXQEUx4Tja+JrGEleMMPeD5VG+WM9OFYg586P8SqLKqQw2ZD+jwC30gsLpg4REIu1FEE95zxnKIeSu4pw/vNz0sFPzU+30gk9oNdKN6OPgB1E8jXLHfvI0M+4PZzXG26qnNpnr/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753228275; c=relaxed/simple;
	bh=pSjTUTnBigYPoE87KhTvq+guUmZTsTwJYEHzNpQKlao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DrOaSYv5XjWHy1xUCDQjDaYN6XUm7ic1OE9k/8SB0wl8dGhF+J5H2Jz0zpHrhTXWcwGZxE0R/QzK38JW86i+Wr20+v0hLnV1kQAEPq5Fg7DKtJCrrPwKzwEdfN2EsgLBrUopCuAGTrxCNrYH942Yv0g4ORUPBFvnaLr5ILbckFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cX1LCA9E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753228107;
	bh=rFLT+SZL2lnoHRgvDZSzdIXwzoOFqOZM/J0nc7Kd06A=;
	h=Date:From:To:Cc:Subject:From;
	b=cX1LCA9EWTvEukeVI/CIUA9T61cB3vvBhyN3D6GZTaGITpTC5jZQiMP+M0XDJv8sr
	 cIsCZSb8yrkwn+4wVz+dJvjKk45DpqI7RfFu6KfdRHCvdubGRnXTiXus4nBm0sPwb8
	 9MbYjz3mPcSBkcwK5LtFHmJ2EMFzYboSn/WsJ98ZmIhU4TA+ReKZX1doYIdXkn06KF
	 jNby971zU+HN88zoyKmlF1ktxHLUSrneWJVvPApjclJP7Pxx59qbOURLzNFXBG8vHE
	 zIeXwS9xtJtsddyrAQi7UjlYMsZNzD2xLiNMqPjMvX782mPGVdfdRl04N73p80g2na
	 Cv131KXY58RpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmv971KSRz4wbY;
	Wed, 23 Jul 2025 09:48:27 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:51:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the omap tree
Message-ID: <20250723095110.2038c205@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Jjba41b6jUujwXjIUhf+dV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9Jjba41b6jUujwXjIUhf+dV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  0711a8dcea2a ("bus: del unnecessary init var")
  536407b5b87d ("arm: multi_v7_defconfig: Enable TPS65219 regulator")
  299c277aa74c ("arm: omap2plus_defconfig: Enable TPS65219 regulator")

These are commits

  8adc8e1657e1 ("bus: del unnecessary init var")
  acbf491e07ad ("arm: multi_v7_defconfig: Enable TPS65219 regulator")
  d50faff72218 ("arm: omap2plus_defconfig: Enable TPS65219 regulator")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9Jjba41b6jUujwXjIUhf+dV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAI+4ACgkQAVBC80lX
0GxvPQf/a/LXGMlP3GXcKR+2jPIo52PRVCiO3jTFD2NbPtZWPW0ITEw89cPDxvlw
u5lj8RvNnr8ZnBr4onOCR2GCmCIyzKpP6E0eKnc8HElUXpBnj2/iEryc1v947Wq7
s7SgLQWSfHQJl4UEd/Cb2SY4mSyxHNWjl9+ITMsYqQSMbgtq2inWhrJgMahwyulL
/e5GmweKtHzoDRHLD4S+QxLI29byL12U7toysLGQumhpX3ESMPkHd55IZhOu2qtq
nJJZ0hPshcLqN2Lzlr58QC5oLwyEXdI3AbUHeIAUhKKKwtvlY6VxhaG1e8MFFx4E
qDm+WMYh0Rm8Vntfv7PI3b5LDZ72pw==
=Gpci
-----END PGP SIGNATURE-----

--Sig_/9Jjba41b6jUujwXjIUhf+dV--

