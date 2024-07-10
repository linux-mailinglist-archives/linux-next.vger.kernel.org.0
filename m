Return-Path: <linux-next+bounces-2917-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D192C9B2
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 06:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40FA82863BE
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 04:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3184B376E6;
	Wed, 10 Jul 2024 04:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Lp2kIq4j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80C4F20E;
	Wed, 10 Jul 2024 04:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720584619; cv=none; b=EQXo65Ovhxb7xHx0MEfww6l6bJrRjEkWjoAtpQQhjBhTg2TKrPZ1qC6QV6SortI/SnFq+g0rG9tx5UMHWNAHfeChOUiGghh/SVWuurpLOHHBFtH4Qqm/Qbtu+1bqV763U/uGiQCDlN6V7EK8ickzOVDQVm+kODGmouTZmnz+eIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720584619; c=relaxed/simple;
	bh=Hjg0tZCZoUc/FOi0mxezcVRS6LEqOqDBaFL+nWTd+7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=psx0e+JQIfR94f1aqiZlBF8bhbBHTUTFyrEP/5I90cS5M03tN1l6zsi7GQGgd9kMulyxfruiYHdRPIhsYlM15SM+M/CUgG+1JJ3in4KER1rdFpp3s0A/KRKm8PuGOFJRCu3zfqgqRZ4tb37tV4+cIVmOeNfFz1tm5ZkwLjpBcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Lp2kIq4j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720584613;
	bh=QmwatSe6xDOm1ub+iZk2c8778Yhh2yDKnslgKCXYFhk=;
	h=Date:From:To:Cc:Subject:From;
	b=Lp2kIq4jQBIZTeWoxsl21RJDc/9n9F5oJ4fSIhmG0qvQEe3695KV8CpdYqUExcPBt
	 iYX0kxonkscz4EgNVA2LJS8LpQLZOzT0g0UGXkmPNHFAOMogTjxv985coRUjo8LED4
	 hF8gfYs1m7YLkSRHkb0JvltWfg5JjXT31ud80Zm5jt88iOWXBBmh0J0vmMZ9xb0ngU
	 9/iqFVHrAz/SpMRb80rl20hWPJ0zrCNTte0nycHL8S8id55bQX+ivD5JgBsXHKZyDf
	 3iHrBJ6iyA5lQh551s38kLYfpACeuFX3nFTOGd1IwUKUDKb8frtDtJJe3o9w3SU7RT
	 WNEUp8Ax2jztg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJksb3j3Kz4w2R;
	Wed, 10 Jul 2024 14:10:11 +1000 (AEST)
Date: Wed, 10 Jul 2024 14:10:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the mfd tree with the mmc tree
Message-ID: <20240710141010.4fbd65a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c490n6ucVeH+kRFRvoypLYm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c490n6ucVeH+kRFRvoypLYm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  include/linux/mfd/tmio.h

between commits:

  89f415b99050 ("mfd: tmio: Remove obsolete .set_clk_div() callback")
  f86937afb446 ("mmc: tmio: Remove obsolete .set_pwr() callback()")

from the mmc tree and commit:

  70b46487b155 ("mfd: tmio: Move header to platform_data")

from the mfd tree.

I fixed it up (I removed the file and applied the following patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Jul 2024 14:06:29 +1000
Subject: [PATCH] fixup for "mfd: tmio: Move header to platform_data"

interacting with "mfd: tmio: Remove obsolete .set_clk_div() callback"
and "mmc: tmio: Remove obsolete .set_pwr() callback()" from the mmc tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/platform_data/tmio.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_da=
ta/tmio.h
index 1cf418643da9..b060124ba1ae 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -58,7 +58,5 @@ struct tmio_mmc_data {
 	dma_addr_t			dma_rx_offset;
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
-	void (*set_pwr)(struct platform_device *host, int state);
-	void (*set_clk_div)(struct platform_device *host, int state);
 };
 #endif
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/c490n6ucVeH+kRFRvoypLYm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaOCaIACgkQAVBC80lX
0Gy0eQf/QrPDbRIZf1kFbH0j7SPaEM363P2SsQ+/5zariThhhecZ4u12koRpFcJl
2y5VQ3y/RRtOAsXMkDK27C4ukZbGayftoJFLTW0AboOtfQeUfYNqj/+PRfVTUKRF
S/f2J831bqJtCVzT0NDKTyhrg8lg3zJGGB5p0pBN1Sp3VNsElYLtYeQHi7bREdtG
iq1hs8L3M2WW+WSJezmvoQTesIhcC1hwUGwFgzUgp29ftPRCae6qKkfKLXqy3Fv9
48DIaLF/i+BCiYqEz6wwuY/11C/U4hMjDG1jkLr0jZiaokJ9nXRHE9zQfRNrgT3k
HOOgE1B5UK29y3TA2sRZcqkUuawynQ==
=f/Kj
-----END PGP SIGNATURE-----

--Sig_/c490n6ucVeH+kRFRvoypLYm--

