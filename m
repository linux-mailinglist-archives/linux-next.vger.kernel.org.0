Return-Path: <linux-next+bounces-7481-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBAEB01636
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 10:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3693A229A
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E4C20E328;
	Fri, 11 Jul 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aqbN/LGS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC525202F9C;
	Fri, 11 Jul 2025 08:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222695; cv=none; b=Ks6dh1jbQKLATnrF4onGn1fezn8dcjaNKdrzX6J37JO2avcdMb9w6n0ryO+59GHpFWrtgMla/MXupBDsOA+K+hCBDzLpBgtcgVZg9gXXWfJoAz1QJ13AWidp1ZffgGfxzIk+vkwaweUvFkNh2P+T+PhdbfPXpi5jBM2S7PYRtqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222695; c=relaxed/simple;
	bh=WPmleFdtdKTIKdhULXSgArC2h6usigBTjPtsYch8FdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xzog2Pz53VDuejumF3OCwbGCRqLBHCtmX9i44ePXd6XolM68vdNQwrzhFddZfLsRIbsWTDEAqMGigAIQ9DJL+CJNk5RvLEnvZu3Vxw1ZmPT3JgyTw+W+A2PvWWGDHvsrm3emEx/e0sPx3paDnMFeaU3KFN3JDCtoBCVZ0jcKHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aqbN/LGS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752222611;
	bh=FdRxDMtdQ1wOiEozvAT8/L1xuCJ14lpYgNT8EUKvRJQ=;
	h=Date:From:To:Cc:Subject:From;
	b=aqbN/LGSuJp97Sg87NzDCGEL22r0tMBwCPEXag4OyJYhvT3T/EAM0j26Hb4ymfgY0
	 KpU3yvrNaby4xg4UQ43tud8PKGL7PHvStiKHSxlk2JW+0y7QcEyYUBHhbN1Lfgs6vz
	 T7pSAJfI93hGCBld0cEK60G+48ciQ/wm+vLxBmeeCuOZJr1UAm8p9qDm9bP1j/xPQv
	 fFk6scJJCxloFmBIZNZrTGZ92RHPZbd2qJN8kCB6jMnGaFgAWhzC4x00u8zgAkHbFu
	 09d0bWF5wZjUaXlsoqTQ+AWQNCkQYuHLy78o/y7DCifCgZ0UHIQWUVLJUltxZl5176
	 CPI7xEGjruLQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdlJg0mPjz4wb0;
	Fri, 11 Jul 2025 18:30:09 +1000 (AEST)
Date: Fri, 11 Jul 2025 18:31:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the net-next tree
Message-ID: <20250711183129.2cf66d32@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/le8ANdbD5Tpqv=KFytA4LBp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/le8ANdbD5Tpqv=KFytA4LBp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/virtio.h:172: warning: Excess struct member 'features' descri=
ption in 'virtio_device'
include/linux/virtio.h:172: warning: Excess struct member 'features_array' =
description in 'virtio_device'

Introduced by commit

  e7d4c1c5a546 ("virtio: introduce extended features")

--=20
Cheers,
Stephen Rothwell

--Sig_/le8ANdbD5Tpqv=KFytA4LBp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwy+EACgkQAVBC80lX
0GwhUQf8C+Zm1KZesFZidw/UKyrxc5UxztxHYaIPL1UmRiE6CtxgwVztjORHNR5j
XnGnRiFcEdiH9k4d5WCMXN6nO6OypoSxbau+8ShXVRnpb8Et3OpA+/WcKK0N+Ej0
eK4qEoANZflY/trHdDEDZb1x+PRnp0bwveJn+IPjasc37X6CV3o9ikKMrNyDZUSa
N4FwA5h92WvCpmyf5Y7RFGGyNModwsB2ErokaVopFFnajZEQ72evOP/njvl2/H5M
OvIN4dGpdBgsTSxjSrv5FUCTHPPDcK7uPlyfsJIoGkb93YJ+ITrXETpHXWqrpjsy
oseIke22QKyFQ8JZc4L/DvEwa6XcXA==
=eXTB
-----END PGP SIGNATURE-----

--Sig_/le8ANdbD5Tpqv=KFytA4LBp--

