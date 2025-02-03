Return-Path: <linux-next+bounces-5360-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3AA25470
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 09:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C3C3A2E25
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 08:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF451E9905;
	Mon,  3 Feb 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dy2cmCaw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937DE1F94D;
	Mon,  3 Feb 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571605; cv=none; b=Rbf01seaGLsaUBC9GvtSZ97w5bfEi/XNmH+eN2wX7fCakznDsRtOmmmW+F7hpq9HJlEx2YZHCvsnLaRjb1GmmckePgVDuxkzoBIsQkC8Fmodt08lEO6pxsC+40mttaoVPv7f6dQ/WSAyEM2c4w6VUGk/6n1NAFRZcLjJIfyHFKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571605; c=relaxed/simple;
	bh=98XXFPM8YPp/DPk0iJcAojUtbOFkuq/mlwCE1SIf3go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dai3gw/7TS61iuf0JostnvAGdUQw1Yviwpydxr8QtS0xcz8F6zlpQ0d04vB5IF+m0LsIqF4DC/BVR4kSi+D3vXbKCB8yu9sjehjrjPcU4pb3qfiabrrbhiyCpG+tkJ2kDhEpucT8M7rfgZthHHfW7qbl3cDDy3cCmYmaNYKtjh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dy2cmCaw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738571585;
	bh=wkdI5GAXC2qOnDlzbHkLmXPUzvtg6ojOBQWXTHsYJDM=;
	h=Date:From:To:Cc:Subject:From;
	b=dy2cmCaw/m91CBxXN+czB8o74Vr7puE2/xW/hRnX3A88FeXSbh+0LotsPc/ZjGs9N
	 TMHgTIFS1XFpHzH6BmGDLAaOJ8U79E21usPGTbmcIDVtJsohIDZkfg/Gy/KxQQO3e0
	 i6uftKvXskvwSCmKRUtUZ4SIcwdSdfCzS5YAygfhtXNnv+1WPqmCMxE9+1oEOK4+II
	 SSITZIZwZ/Lotnim1j1VG4F9XJjYInbDTm+m0x7HPKiHE/ePTZ1rl4m6HpoRBb2NDE
	 Pdzhj8TL3uvJdDwacLrtFWmv+4elSrgjyEbb7dCCWvWSzqBx6COzJb9IZDuC+CmNTT
	 x7VBGDCUOztIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ymfrx1K1Rz4wcD;
	Mon,  3 Feb 2025 19:33:05 +1100 (AEDT)
Date: Mon, 3 Feb 2025 19:33:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rockchip tree
Message-ID: <20250203193313.0740304d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xVFimAYshL4gaFsj4bM.sIN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xVFimAYshL4gaFsj4bM.sIN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  11534d3c53d5 ("arm64: dts: rockchip: Disable DMA for uart5 on px30-ringne=
ck")

Fixes tag

  Fixes: <commit hash>

has these problem(s):

  - No SHA1 recognised

--=20
Cheers,
Stephen Rothwell

--Sig_/xVFimAYshL4gaFsj4bM.sIN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmegf0kACgkQAVBC80lX
0GyPogf/UWZJcmvpZfezaa4/IJPfw3gNr49Ut1zPCMzL7EaDka1gFxXQYlvhPL8a
S33XOaxgc5WKe4Y38SxY9mbC8kxdUv/6v577Jwo1dSo4lAnmXjL9rPPkqlnLj83h
HlOmJo/9wu5tzE+SO/mOnIgB/J7HLbbvY9v3x+s6ekZSv04+NlbKJqwZFWTgk16t
E7+5F/QM3/T5VDH7QEIzN36VIxVLZtDwU5UbMDFpiEQMbbH1w0ECGjEOQlQGez/i
npjj4NIoM8qDy2HAL7QZ+TW4TEnPL5R9ZTVhbLO3a+bkPL0DT7VH/LxAb1oxfWwi
82zJawexI14mJfWEp/pghUQ5bGGMog==
=QrVL
-----END PGP SIGNATURE-----

--Sig_/xVFimAYshL4gaFsj4bM.sIN--

