Return-Path: <linux-next+bounces-5429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B4AA3327F
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 23:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF7283A4D5E
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 22:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0ECD261587;
	Wed, 12 Feb 2025 22:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QypA/GHe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1316020408E;
	Wed, 12 Feb 2025 22:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739399078; cv=none; b=ROYveRJOXliS6At4JKU4od+Zp3+eqg880gvv+Ra4JF1Tp8+zRUie9gyw/1g1WcubE0RKKsteBYVeuriJmEL+2WO/KC4h9n2wFHA6MhasOKTECQOUQEmKR5mhSvNFyYCitmB12XiaqWqLLvdfPbUx0xk/86qO7yg3nszF3IIsg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739399078; c=relaxed/simple;
	bh=163lsjAwVquRrb/Rtr1NLtXvgf6EKg0dlI8+1GZSYUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mAD6AwtApCNDMfGyQmlN886CyVzlDBVOVg/q1jFrmL2/wLSf/cMdpZMoB0h9q2HObKSsNUAR93Ur/Jda9a3GjteUxuKjbQRBVtpg25g7kSYPZyp+5f8oW4vaq3dzfBmQg54uWV7ehDgnav4dAMCSWp6wasbYhG81OIRIlMm6Uqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QypA/GHe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739399069;
	bh=qRtp/bOgvlhXfFSe/ASWd/c75qMoSgf7NOpYXnInB9w=;
	h=Date:From:To:Cc:Subject:From;
	b=QypA/GHe1JGrpSkZ03saGAoMr7Brb84tcCo7c9+46KFc68KeMAtwDUIFMLdr5WutS
	 lcM7XeYxWhg74PnKYhyasCoTjkIG1ft7lkweVswDoJ9qOXRuzdSat7RPZyIpH+vDHH
	 3NT27jSxIw6PuWKchBttWGP3Eh3EcS4jYllCQma8sODPdglrLEQTnLvCSkXZXa1SZk
	 k6ZkfJMUNA/nBlPJFQpXE0LzaRA+k0ysjqSxIXsCOuAgaY2mlR2X+7d7nv1z2JeIIO
	 7AgrmIhYSXTXa0MkiRJ/g2BHkj0paigJXKC+dpy+E3ZBLHZ9xncZOXvMBan5FUZm8E
	 KAGmOVsfIjvfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YtXt52Tl3z4w2H;
	Thu, 13 Feb 2025 09:24:28 +1100 (AEDT)
Date: Thu, 13 Feb 2025 09:24:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard@nod.at>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the uml-fixes tree
Message-ID: <20250213092427.4f149099@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+i5I.ZviCZs34opd0rUQ7sy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+i5I.ZviCZs34opd0rUQ7sy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  fb4cc5f19d36 ("um: convert irq_lock to raw spinlock")
  4e9b8ce9f58f ("um: virtio_uml: use raw spinlock")
  cafe54dc8e56 ("um: virt-pci: don't use kmalloc()")
  acc4521e845b ("um: fix execve stub execution on old host OSs")
  02fef369f75a ("um: properly align signal stack on x86_64")
  cfaa0ff6e035 ("um: avoid copying FP state from init_task")
  05c322fb75a4 ("um: add back support for FXSAVE registers")

are missing a Signed-off-by from their committer.

They appear to have all been rebased but not had SOB's for the new
commiter added.

--=20
Cheers,
Stephen Rothwell

--Sig_/+i5I.ZviCZs34opd0rUQ7sy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmetH5sACgkQAVBC80lX
0GyaPwf/Y3EBewGM09X7mwUp60zn/iJG9IfhZ7oi5XxTdTx6ktyeODN5HZuJQ59w
qF0rLpZxNiSRBqxNLSlECsinOREDwehZHqkuJ3ffMNdA3PaCCWu4xk37j8ZokqtN
e7AR8Ui15AEPsFKLBN4xPSYnios+ZVL1aP//emZ/wx4/lEaPHEwIJ7PmL7/ELnO7
6GSglqqoiyRWVUoIXBaD2syjthcE3V7gzAArtqbA/iSzsYu92kQLC1lJxBCP6ut+
xWQDferk9UiiUf7b5q8nZKyDUKE2aayYkYT/W/dr3gVpE0muQDDmW4GHdRVhJY7z
857iRvoY9ADBkXeTFq9M5g9oPbFlag==
=xR3L
-----END PGP SIGNATURE-----

--Sig_/+i5I.ZviCZs34opd0rUQ7sy--

