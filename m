Return-Path: <linux-next+bounces-6417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF37A9EFC8
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 13:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35AC816919B
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 11:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F47A263F52;
	Mon, 28 Apr 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ESXWN6YT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC581CD213;
	Mon, 28 Apr 2025 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841348; cv=none; b=iQzsI2xnSsn6hCDW470DS90WQsApQth6rGzOmcqCOQC2J5CCv52Vyxq9w0fSUmpA/pkSGYNbYvqkqy5iElzOXe4fVqP8CqSdY9qVep5nCZ8jL0fcdCJw2lFB6vDmaGMG13EoZ7eSylrgPjcuHkqZbfG4zLdGCMYEBHMIdwspEFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841348; c=relaxed/simple;
	bh=uaEA6pWLd7zO9kB+Ij+W9eNAWss67fvBBpYzFtPxK2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t7pzRN9DGiruw5JTU0w6+hq1CIIK3eZqA21vi6Uv6puB5RfYu0DjYFBkeZoJgjv6R7GcIRiJVD/mOz3xi1cjrfuR+Y9xfIXjGnZNKVmEVF8yqltHa2mIj56NqiVjDosuTxHjfr4ECGfUzrhiaTzqk5MrsmahA9oEIWLOpKCkRBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ESXWN6YT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745841340;
	bh=P0cP1f2bp5b7RDDr9nu9/PvYz1uVlIN7GI4ZTwx8CXk=;
	h=Date:From:To:Cc:Subject:From;
	b=ESXWN6YTZqTvysZNyLN9x2fCO3JilCPV7LnSJ8APJRjb7KLFr61YGPUdAt363AK3p
	 7bzJvZrHNlcGjk0s8Pncbyh9Fhy0eMhZTxu7UtpEvCz6q+gR74OJJ0k1RWqJpIrPYS
	 kxE7F2zTvQBrSfOcFJUC34aySMfAAkKSdTVwJLwUB5Lz82vJJ3Hfk8Q3GW4IYvTDDP
	 keo6eeBSrfvUa/x/PnJs8eWFUNHh3vLOrviJaEGP1zgimQrtpEKyLJ/nro5nir84t/
	 tG4LSmgSf7Y/clRctKBVImcA0rzVk1Llo3Xh4wRfrTV7INIl0xSlgmZyg6beu4GAoa
	 PAcXJyGyXYRsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmMMw2CXZz4wcd;
	Mon, 28 Apr 2025 21:55:39 +1000 (AEST)
Date: Mon, 28 Apr 2025 21:55:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rockchip tree
Message-ID: <20250428215539.0ce8d1a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X61jZK7u+NJ=mW2D5gPtM7Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X61jZK7u+NJ=mW2D5gPtM7Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rockchip tree, today's linux-next build (arm64
defconfig) failed like this:

make[4]: *** No rule to make target 'arch/arm64/boot/dts/rockchip/rk3588-ti=
ger-haikou-video-demo.dtb', needed by 'arch/arm64/boot/dts/rockchip/'.  Sto=
p.

Caused by commit

  14e506dcf3b0 ("arm64: dts: rockchip: add overlay for tiger-haikou video-d=
emo adapter")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/X61jZK7u+NJ=mW2D5gPtM7Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPbLsACgkQAVBC80lX
0GyNkAf+O4Cup5zYUIt07Kd4yJpyP+vkn0jX3DECwL7OAJzvwJX3ebPeZP27c7a+
XcN6iQPuR43NI2EzngLEq9F38WS3iJDCFluShjnn5JxVGsn4KJ2Rn6D7ZqQw9/WV
1OXx9rnnOHc9JYnLUVyEecC72s7GtQdnFypjEH5Mpd6gBBvlg1Rr1q/Jp9/3D8zb
/s317TDfvKL72QSMGY5Yhu9vCOq/QINJzOub8hirYgNgtv2FB8ie+p0mT1dBcMQW
eceTXBRNUyuAfRfO/wxebjiiW7r6sCq8Z53ymCU0TGiEmnDnqe2vm8D2V+RSsYkU
i9uIO4Oh2h5Yw5wC75laaZLxd2SXJg==
=yXL/
-----END PGP SIGNATURE-----

--Sig_/X61jZK7u+NJ=mW2D5gPtM7Y--

