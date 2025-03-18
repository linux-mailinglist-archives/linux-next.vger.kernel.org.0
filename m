Return-Path: <linux-next+bounces-5867-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D8A67E57
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 21:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E2E189FEA3
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 20:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E901CC8B0;
	Tue, 18 Mar 2025 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XACj7A0/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44E2185B4C;
	Tue, 18 Mar 2025 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331444; cv=none; b=Q8MCMGAoEzl1r7PD7kX7ZWW4JopL1K2THN3M8k5m+26vkasSkZ/pl07fFVfqrFaMHfgr07/1g5WxFILpSQzhHA4WCUkn9F8iSBzlSZudgQ9G7UpYCkcHtKsfoThJQKgjdZ6hsbXcwnk6zmjnzQXDqgo4x0RojiogDSH8T4CYtmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331444; c=relaxed/simple;
	bh=TUz32Dx3fjRudci0QwT3uLJuN5Ht/AxsTGs/zDb/kfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BSrLieBrLQdhKbN7xcT9Ja5/jNxdMPaalDpdfxCA8ZVWSiA38BPS/6D0BOIyFiWQpn1GUOSEBqdZN6Gah3d1WeBA0mk3e5npbx10bGmD1oTkMmgB6vtMBfy46aDwOiHm7rDsWsjBaZAF0B7QvbmGEyW+WY/Hajkwl25Cu/i4Bsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XACj7A0/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742331434;
	bh=VskJ3ARrzYbhCuU5IYkfbi1GYo5tb799TDWLlrgWFV8=;
	h=Date:From:To:Cc:Subject:From;
	b=XACj7A0/b3ktjOP9uwqz0fWeNBFwzGRv6kYWMhA6ypUkd/2xM1JKxtfuXG+xrK7NP
	 NxNrsT1cMBSZnsTE1eJFEpJwR8Ji7n1NGTcrulQRGZb0mtMxcvF/gPHGlHeq/V0wpr
	 Dl6GG6Vg0EsIX3K4qCOO4mfwu05EFvzKoewq7EPpF8T0wYHuOWSNLmWUAfUtGgLbIl
	 Y9M+fcAq/cEeewgNJkIq/pdo0VOmMfqBpfocavUnm22owyVNbB2MfqverkPQR3vCMv
	 iTTIUnnqfb+24YSRDBvBgOmphp2Z1p9nhYZRsdrYqABculhU5s8e7gb8mQDNte4tWp
	 ffzaFaZAoTV1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHPKj42Ptz4wbn;
	Wed, 19 Mar 2025 07:57:13 +1100 (AEDT)
Date: Wed, 19 Mar 2025 07:57:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Dorian Cruveiller <doriancruveiller@gmail.com>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20250319075712.19c41ae5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qoXfp+=pVOT_xJ=kinvywc=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qoXfp+=pVOT_xJ=kinvywc=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4bde79a9ef59 ("Bluetooth: btusb: Add new VID/PID for WCN785x")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/qoXfp+=pVOT_xJ=kinvywc=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZ3igACgkQAVBC80lX
0GxMfwgAmxVKwxO2GwEi6HTXk6PLY2TlT42X1L1QrpsGI8wlSaITvHoKPRoCfLQB
B+DsYYN3B6PYGayOzXTqGw2PuzqCHkbwRQ9uPbU10/+esfBMrTP75tlgBKR8SAAA
b7CXVbQSwVqpYAcHTp0Eisqgo2nCgDchEewEB7QUUZKXToGA1OgVjVrddtrP6cGj
1CbMQ6olCP/YOS9JevMyBt/PtijyfupdV5BzfSehsz7sFO0rQp3BEd/iD/ii7b8S
9YUBz1lL7tOSD8WjVPYSdU5R/qxgk0QVji8NWs4Sn3qWxy0hE3/bLiI4Ppj3/8Ai
WsHCNVPRhU+P9WfpOkTQYYnuKdzTRw==
=YILD
-----END PGP SIGNATURE-----

--Sig_/qoXfp+=pVOT_xJ=kinvywc=--

