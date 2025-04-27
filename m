Return-Path: <linux-next+bounces-6392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23408A9E4B3
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 23:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF8E67A4829
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 21:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849411E1E13;
	Sun, 27 Apr 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o68JBbIL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C84C80;
	Sun, 27 Apr 2025 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745789663; cv=none; b=sxFtZVXvZLRH76cpIAGa2y8dbA3zFiq6ivEYujKt43aTDWxZ+yDk6ujyiwi0isGUvO8QxknhVcfHTOhn4ik5QEIyp+b3vA1jHM+yrdCniAEV/2ZO54edsIXI0G5gwVw1QmqfkKlXfFppqd1TecI9nuJaPIOZtucsUbevN3eNoQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745789663; c=relaxed/simple;
	bh=vybUOV69D0D+/9YPWgg2RlgqyiKlj8OI1e4mPDXvKt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tziv2ORI/VMYgDuer5YxrktPBsvgS1ZuY3tP7ipI3FGrpaeLJFsPNayQyl9Kz/+5hemZNw9rpSK3bhbmIBPCKb4xT73+ht4HDCBDAxDtVaMYVB4cS/8AeL/ermTwWv/USbKrruw+PPnwbtgjsHydBEKhkvNW+Ii32fMdVR7Xu3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o68JBbIL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745789656;
	bh=si9RdEUmTzD2SIyHgyxnyGn92LIW7vqZb1PzXqd/j+U=;
	h=Date:From:To:Cc:Subject:From;
	b=o68JBbILV4yaaw9qx9B1sgjhpr9SxLmyUelsYqgjXuTN+xJM1SiK39zz+JY0L6gx7
	 p94hO3Vq8oXyeaKvHUVli5zehj+1S9Wb1n/4rTCTV+KLGo9eeoEAHer0VBZrT10ua1
	 OvqfR8ID5HaMo2XFPLI7i86+L5/XvlqMNMvBWwLMhL55ZDhWNFCOBY9GhPs7/r7p4h
	 eBSrKCns6rfhVpFzKbyA4tQAdgfPefqizHyUCVyziWIpQKmlp6d1RB6gKH5AjRtYqR
	 7shrEwXRJHF4qKKvPg0CM1+l6YP6OhOfgNQw7w9e6A6I72Hr1Yh7mfGV0JDlsjJjTY
	 IJo3FA56g+LdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm0G03Drhz4wcr;
	Mon, 28 Apr 2025 07:34:16 +1000 (AEST)
Date: Mon, 28 Apr 2025 07:34:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20250428073415.2fa22180@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w=VUmsAMhhg.Zk6ivTIt1vD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w=VUmsAMhhg.Zk6ivTIt1vD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  0390370fcd0c ("rcuscale: using kcalloc() to relpace kmalloc()")
  8e40035aab95 ("tools/memory-model/Documentation: Fix SRCU section in expl=
anation.txt")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/w=VUmsAMhhg.Zk6ivTIt1vD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgOotcACgkQAVBC80lX
0Gx94wf+ODnB4xzq1rXc15gt/U9PrYMOJhGGzh5H36OfBhYQ2kpHwnemk40lba2Q
VulNZ3zyDGQl4INGRaA4vWUvtjwirM/4F8g7NH8TroAISaWPHsWAUdTMtx4bSM3s
gbwBQbJEwMFv7vDuFzU2dyql2PTc1PcPA1kxittYtJyWK+WuiYF6RLv7LFoOqs3Z
Z8mXT2wvWOD6GmW7jHfpvP/X+L97aH7cFLPObQ8sKYak6CSOgF2o9o0RqGd10pHH
SrHSMFa/ZqL/bCzQSARp8YoA/K76aNLUAFbhqr6ST3SiV/FKxHkAFLiJ8s9VCEa3
mNGL5ibvE3OeIshY7ZkWMY5V01etig==
=Dw87
-----END PGP SIGNATURE-----

--Sig_/w=VUmsAMhhg.Zk6ivTIt1vD--

