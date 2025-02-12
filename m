Return-Path: <linux-next+bounces-5419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39581A31D86
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 05:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A7F67A3C1E
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 04:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B591E7C2D;
	Wed, 12 Feb 2025 04:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LWVnEqwo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DF27183B;
	Wed, 12 Feb 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739335443; cv=none; b=c9gE9fnDTWWBEmCtM6JtVgEtzE7bmUgL5HnIE78Lf6PMdekZ0FkpbcikwiFzUM5vu26vs9sA57fGzTdlLusx6mLTnCS2pE87Wfkufxs1j1w9oMgPzw61DhRK6ee9edZE3GcTS/bDYRw++av1tA9cT2h5K9pWYQX6xRizqljrCCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739335443; c=relaxed/simple;
	bh=BgoSch9Hepl37C5GgURFAgjVTwxUVws+gghW3QPi780=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hmDRsG1OS4nRFHsCx9XngIBOFD2yXcAYu7QTRiBvSUfkHyQDXGRFXeAvUN/IKtIyNiRDMGj3C1vcTCVN4lsXmOHrlmdFKClT5C6u2+kKNl+Mpo5TCssVts8C10iCtvmpH+pXXwR5xVc0dK7KWI6c23nVuI3eFcD+lm5LXfWgmC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LWVnEqwo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739335438;
	bh=pMpj68LlcsPqo56bGKJxkEr9AZlsomxcwoL1H91n8Q0=;
	h=Date:From:To:Cc:Subject:From;
	b=LWVnEqwouILpMJALZaTM4v0e4S3qA9LNO2qEik0+AsU7vCPx9AmvQb6UZi8zkbHxs
	 hKB2f0MLijneperGkjh1ydG7Y/aA3LqcDxN3XEYEVBZy5Cf/xRZbUSe+Hyyi8XieUa
	 jf6JcvBG0IcwhOZNsCg2grkRCry8lFRyppCE52HkeWYnpI3LLGZl5BLpldKYXI0/zZ
	 0BNNduVrsgLBl1qEzZmXeHpsNO1wWT01nqyq53UeojQqGEfcblJpwVxWOtgKy8sjUA
	 rLrEUP3vYLJMaWTFd3XRR6QQCOPg1LlKaBjUfrgKtZJ6WsHUY+zYTzvmO8m473SK7r
	 gwRGp2aea7JiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yt5LN6MQWz4wcQ;
	Wed, 12 Feb 2025 15:43:56 +1100 (AEDT)
Date: Wed, 12 Feb 2025 15:43:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20250212154356.784944ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e=+31OjIBaS112vzdNYBw1p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e=+31OjIBaS112vzdNYBw1p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/spi/spi.h:1105: warning: Function parameter or struct member =
'offload_flags' not described in 'spi_transfer'

Introduced by commit

  700a281905f2 ("spi: add offload TX/RX streaming APIs")

--=20
Cheers,
Stephen Rothwell

--Sig_/e=+31OjIBaS112vzdNYBw1p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmesJwwACgkQAVBC80lX
0GzwAgf/Qa+0uFs7Tb1S8/x/jxMvzcrjd05S/gchnCailtV9NX4Q78nuWmVXNOX1
tYjbIfZnALp0lL+fjon1N2vEz0WvpkodNEMNXusZ1QjLjv962xfGwuEHtCVVw3Mz
ZkH/8I9D+syTwsoVpml/74ctpcJIaiLeYPvmjMEN4eHhTg4J8gYtPnE+hAIX70gy
ANByFeGjyegrcrd+7l2R/JlfxFrOIkbMx0OTi8++/UPWSGlCgzJCmEi+19b5qcKW
T1UtLT19pMwHOnB/zFoZ56SMqpj9RDAB1CIcMdDF9SOOAkOSK4LyLm7tQtLOFRgF
cKAc1gudFps4HiiRF2CYoGekf2ECgQ==
=g+ET
-----END PGP SIGNATURE-----

--Sig_/e=+31OjIBaS112vzdNYBw1p--

