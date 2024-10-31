Return-Path: <linux-next+bounces-4561-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A99B8506
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 22:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA2E2B23AF9
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 21:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDE81CCB27;
	Thu, 31 Oct 2024 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tc1qwKw7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0DE1CCB5E;
	Thu, 31 Oct 2024 21:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730409179; cv=none; b=SVRiSi5h3MVEHgsaQBGTVVwcDY59JPaBPlsiAMalQ8ir0/kveQHnZaGFeqPojfThrymjR9GMPb9RPzvJJIWi50bF4bvJiEfYnVwV4YZ8Apj0t1fC4ILiAD3LO8KDlYT9Nvs0IJ4aRm7dgsHtAoF4X3M6UbM5IPNNZqc3J3MkI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730409179; c=relaxed/simple;
	bh=yXCc2Ap9+plk1nHue40x7LnoJUZVnSvQmboiU+KseyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fMCWBio3HF6SmQ48HWSHlDpSpNpWcrFkTq0EiVNhdhfrkpCGE8RfBn9QBwXEEXUgIOrVpgpVzUj6W1bYWz+qa+nP3rXCZ07+Iu6WWXxObHkpVpBsK78rM3SCd52tlEH4eOay/uIdBgpS2sQMr5KCu/zqMBH/8eElh2knaBjzUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tc1qwKw7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730409166;
	bh=sZUD9sXHhwOKXp9F4qGhfBlYPHNRzmP5sVPKxNH6Qjs=;
	h=Date:From:To:Cc:Subject:From;
	b=Tc1qwKw7i4mPP6Pf2Typmwx2Gpu6pqI0c2/GmofcK8q9mRVYnza1rOBP/iO2KvfBi
	 4IYKWugB5FwkTs585lZ161NN2vqAZ0p+KUDJcRpbg+YmodR1UGAFe/vz+paW2My/sW
	 YfN/iJ9oeR75gVHPC/Ry+xmH2H7G6YxydmnEnREKAp2Mkav8zWS8IxlCawSQH87t2C
	 UOTW3+57E2PQRUkpe7SC0g9x9Q4ThXlt65LF5vzVqFDiO4j7SHNKH6wfZw0DIBZ8+m
	 UtquRCKje9a257dAhYUTB7dVsrc+wImzzaxjXQmy8170XmivqrvxL3ABYbdhi1x/uP
	 3d2rYN2au5spQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfcCL2TDFz4x8g;
	Fri,  1 Nov 2024 08:12:45 +1100 (AEDT)
Date: Fri, 1 Nov 2024 08:12:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kvm-arm tree
Message-ID: <20241101081245.4f49baa9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vBm26hZeNAcPO8kMd5+Hw6=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vBm26hZeNAcPO8kMd5+Hw6=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e571ebcff926 ("KVM: arm64: Get rid of userspace_irqchip_in_use")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/vBm26hZeNAcPO8kMd5+Hw6=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcj8s4ACgkQAVBC80lX
0GwSMggApR+kqEasqVBxlzdJjwtpybFolURzxw4pvY4vAoyJRlXSYTN+3umwdAc/
OdpCqyr7eu6Ab0ohpjaX/FKYPVtHeDS0i4E8NR/74gctraa7dU4SwLryx9+pzXXJ
vch11WlRJ49bPhqFsM308eQnkUZBv6C1aO8l+CitPQdYtB/X3PAEIa7WW/dA0NZ7
Ybwj7Vnt91wzrBtWLr+FxFs796JqLAR0rkt6voPDoXGbbf/iQtt/jMl4qW/495Hf
DIumuwf3AgaV8roZiiJSOGkC0X5VYIuug3NwZoqdxDGwvX2Q9VDVBgbUu/yKr2lN
JfdgtimI+aGx3TAHANB9Kj0eLoTJ2A==
=F4WM
-----END PGP SIGNATURE-----

--Sig_/vBm26hZeNAcPO8kMd5+Hw6=--

