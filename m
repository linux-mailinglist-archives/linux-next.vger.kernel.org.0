Return-Path: <linux-next+bounces-5916-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B074A6B3BA
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 05:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2897B3B6218
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 04:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0911E5B66;
	Fri, 21 Mar 2025 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BC4jotlI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267531F949;
	Fri, 21 Mar 2025 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742531886; cv=none; b=PMVsItIUdmWOneDcj+UdiV35iRwtSBgCw0gTNBBGi9SixxGLD9vn/NMBbQenw/mnMYq3y1XZqH1XEQ9KtfM8wEcKA3tNLJQ8OjnzpVfhVrnQ3kF2qGdaIswko9AyfrtVQmj/td+oYRIDxIRdknwaXUZluYl0Uopw9Fr3lClOelc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742531886; c=relaxed/simple;
	bh=FiFy77IiouWgU4gE3Md5Voltq9T8uDOEaOiK5fxhg+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IQXOgA+Tyx6B30SsNLgf5iwERyVigpsQQHaA7s5J0tJIlO0+I2GLOnh5qYwfCnvFirPH0tzfW2PsytvK9quzRtncqOHr1ZWN87PtwCb5xSNdkocB7yR8pL/Zr2+j7e3zG1OnYQO1Co/laQInaT1trVWALUw/XUbNvDXutHiUf/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BC4jotlI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742531882;
	bh=ushL5W+VeHvW4BffGSspWfbl4+aCB66l1rd0jJFbSAg=;
	h=Date:From:To:Cc:Subject:From;
	b=BC4jotlI53A7NS14StTl6SLRHwIcKEe4Oo1kCmpeqAtPU6YBI5mAczFFDdShEa/+d
	 9Ydez6XWQeM7gUWECn+7I2e5Ghqy3ZH+qCs1HIvdT6+qT+oq1Ysq+RQvo6ewiNlFL2
	 lPjN+Aw9ef8Jlp9Gr4KNFTxU/9R9v56RFWdjkRfP4rKVZfVIA1NFhWscTcvv2LztX+
	 bEBtcmumfyvlYCKgbFYRgZ/gYXuBLytJPkXCl7o0vw446H6hFFu4gqvZWVeq46aXr4
	 XcDmWR8TRj9qu0AFeabrnI0dPsoZVFjtfvWH6j0eAm8PNj2Z1ASNHUqFkLaEsm6TZ5
	 kG9LcIg7tQ6OA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJqST473Qz4x04;
	Fri, 21 Mar 2025 15:38:01 +1100 (AEDT)
Date: Fri, 21 Mar 2025 15:38:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the devicetree tree
Message-ID: <20250321153800.639f03c5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SM+fZV1Wy.iWC/c2l=TYZY0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SM+fZV1Wy.iWC/c2l=TYZY0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  a78f7a337bc7 ("docs: process: maintainer-soc-clean-dts: linux-next is dec=
isive")
  b31cc6af1bb1 ("docs: dt: submitting-patches: Document sending DTS patches=
")

These are commits

  a42d2d53a6d7 ("docs: process: maintainer-soc-clean-dts: linux-next is dec=
isive")
  d98d35d99e0f ("docs: dt: submitting-patches: Document sending DTS patches=
")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SM+fZV1Wy.iWC/c2l=TYZY0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfc7SkACgkQAVBC80lX
0GyiQQf+IEdK4lJz2x2U4ccIULDxBpj9EIJ0JvscfHrHhDKMzKh6hiANn2dfbDYU
xsIZL4OLqtU4dZ0Y6iVhiLAIPHNT2B9MPom338G1Hih0VQC8/DXV+7FjpdGh5Ac2
ZVTz2joJRPT258mZQvi1HSCWX6Vy1JAcp/JpKJtOGQxiQbpGoH5ZCw9uZi5T3Jbj
uD1l7+8dMcLfgYYz4+IaBc1LvriDKAvs4XP65mvkRP04d+k0L/ghhYI3DqbGyvFD
a7vF/LpmY45mLRSiW6uhkpylb6edalSs3TuFM/TV9xcBnksiqrrKZQFZA8C16PV/
Xd5d4kTH4u+yLAb7iOP/VlsVT7axqQ==
=LoLb
-----END PGP SIGNATURE-----

--Sig_/SM+fZV1Wy.iWC/c2l=TYZY0--

