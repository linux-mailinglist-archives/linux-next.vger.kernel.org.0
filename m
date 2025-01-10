Return-Path: <linux-next+bounces-5124-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB3A08422
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 01:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAA537A30C0
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 00:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B433D18027;
	Fri, 10 Jan 2025 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Fj4BJLv8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E81B59A;
	Fri, 10 Jan 2025 00:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736469882; cv=none; b=rh0IACun7d+tCMTZgsSuyg3moJN0kUmabgr+eGBpSrQgNJKEmK449V/biIsJPtnWHpqqITChwuu8Xc/Vx+5BLJ3dM3pKUmmBrfXv69/2a6jcUvhSdebN1lqqPXqZeIOT5a+PWG5Tmsm/bSlz9KN74uu/dauu4aMv/2pmnWNhPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736469882; c=relaxed/simple;
	bh=v6Ic596ASoGWZRgTRpJL4GCcfWOYMrauwnPGKbcanLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c1hTSqxreaY/G5k0cZB61j6CGKrcV75Yjkl2VAGDEVATdCamSluXROPEEbQ4TVB7+6m6SGLU33ARjxX8s7LLmGils/y2K3AqLvkR7WMLYz5nS9/HHJhyoDXPl9BFRI6tTBoMy2N7opnAUzDf2LD6sDUV7FEwivKEUS1/21tN9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Fj4BJLv8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736469871;
	bh=VAIM6A4Bqpxvsetr2R4A9iIq4Cp5mfGutMn471zS1eM=;
	h=Date:From:To:Cc:Subject:From;
	b=Fj4BJLv89f/HscMD4RZSMQqIjCaioy68F8qqv5bTiECSFvkEGsgs6EWZ7hQBLQUN6
	 Gc9rrd0Drwhq2p5VM4sTUQz71lDFsjTBSGX/Pb0gydyGY7iUgQyi+gFYsOp9fBK8SM
	 A2yTSmBYho7iuFQ+/xLRLqFsisiBlgmKeyufOAEhgOFUSaLy4bgAP4DXWB0sIoar//
	 5pURQzJxvOSkBhnEdWEZQQZaFdgd3OMYd9kmzlfZHgttlXPdWKOl9+6+UiyhwVmrZL
	 IMXS5PKK8RlOtkDfSdFKWrrZsyoS4yU53Qs2mUsXGEW+CtxRUkbleIxV2pUJLHsAUV
	 ZNr3mqgttvdbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTjbM5nBmz4wcZ;
	Fri, 10 Jan 2025 11:44:31 +1100 (AEDT)
Date: Fri, 10 Jan 2025 11:44:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250110114437.6cab3acc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UXCr4qYjcnwH2e4fOxldImY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UXCr4qYjcnwH2e4fOxldImY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  0eb19b741e48 ("Bluetooth: btmtk: Fix failed to send func ctrl for MediaTe=
k devices.")
  fb966c19be55 ("Bluetooth: btnxpuart: Fix driver sending truncated data")
  fcd17fe2deb9 ("Bluetooth: MGMT: Fix Add Device to responding before compl=
eting")
  e8e5b0502559 ("Bluetooth: hci_sync: Fix not setting Random Address when r=
equired")

These are commits

  67dba2c28fe0 ("Bluetooth: btmtk: Fix failed to send func ctrl for MediaTe=
k devices.")
  8023dd220425 ("Bluetooth: btnxpuart: Fix driver sending truncated data")
  a182d9c84f9c ("Bluetooth: MGMT: Fix Add Device to responding before compl=
eting")
  c2994b008492 ("Bluetooth: hci_sync: Fix not setting Random Address when r=
equired")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UXCr4qYjcnwH2e4fOxldImY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAbXUACgkQAVBC80lX
0GxjTAf9HwnRO131p5ZEwdsWaWm8lkf/ynv/SoC3lbza9NYAC09OoApRfkrU/n+z
9pdAiTHmK0q+HxXWxdF5jL7YmmxAvSuexoxL3kD0Cl8skPpqc61X3nStO6X13q/N
JOEkfRJwdi6Hq3WHP1xyNmMxPB3dj3YL3hhgZPF5EFFVr5ie0BTN8tSFx2Og4yLi
QNH5BvSzUHCEaiYlPMUebnvtkChrB+sCJl4zscxVHPcfHbWHAdQlitketE5szkWG
RxLjvIRwyrCdkbSdANfO5svzOECfH/58p3Zw1b1RIbWuH7Ji6vJws2/lV9TsRTL3
bvQ6aGOuHtuOtHw6eLk3+hSGeIVVXQ==
=S9Nf
-----END PGP SIGNATURE-----

--Sig_/UXCr4qYjcnwH2e4fOxldImY--

