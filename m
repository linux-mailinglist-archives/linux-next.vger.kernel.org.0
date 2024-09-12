Return-Path: <linux-next+bounces-3806-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B78B97749E
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 00:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73271F2549E
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 22:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365FD1C2DBD;
	Thu, 12 Sep 2024 22:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pW3Fbfmx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2276D1C0DFD;
	Thu, 12 Sep 2024 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726181991; cv=none; b=trTn8baYTwMMEYhkN33JTxil2uL+iK8iGyDcKmqHVEBJDSY674KmbOtPZG7aDR3EaASaKwUP7XrtwGs5A2Kk8gI95UAl2zuBt0YxUZf/1mouZWJx31WJUWdBm2fwUeeLmGz99I3hytEX4HpkeUR58jxbIemk89QWosAEw3IA5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726181991; c=relaxed/simple;
	bh=4siqtKFDz4uzhWubXK426efMpBSn/FJEyytEbnsUcLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d6jYn9oH9jeW0WXspi4ILppr+Uqa9A8Pnj2GRvZ+3yPDCmEZJ0P9CJELZaAwxiFNpq3fPvqvom5Zecjre9Imgp/cq9PybVh6ZrMlrqg8lcjv+s8qh6aTWBlPal8dsF/J8A5t4w794G+EDJS5fWLLb9MZawmlrUmTFPcJ7OKAcAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pW3Fbfmx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726181986;
	bh=6AMhea1tG+hxCPWgiWf5i/rSNORvMqktHk50U4TqoLc=;
	h=Date:From:To:Cc:Subject:From;
	b=pW3Fbfmxkxs0A15AFTjCgFw6AcV52feNaT5gtYvN+WgbLnVpDqemcrEQ3geQJg6+m
	 t/KWyjwkKXUstofmJMlYz790rwAUqPx2WH9IeeISj3I5+9FS8oXl9o8abfFd+esFtI
	 iW7k7KxxmksWT+af9dqKblQOdQp6Kfr7PQJZ0RBaI7GyEePGpH//rlw2rXjvIBRRvb
	 Pqtpuqp7/KJRg1FZJEEljlr3/Oivuy3YTiKyF1zLNwFNqwDn81t/9UTZsip1nEcATd
	 Dza9DMXSdJUsaUD6e3nQZN8QI8xojW2N91wX9e+sa0kGU9pWynBw4dP28UdU/viKB6
	 9An9Wuq5o2Yfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4XvQ0RTBz4xD9;
	Fri, 13 Sep 2024 08:59:46 +1000 (AEST)
Date: Fri, 13 Sep 2024 08:59:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Steve French
 <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>, CIFS <linux-cifs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Steve French
 <stfrench@microsoft.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the cifs tree
Message-ID: <20240913085945.40e7accf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.1u85ch.izUR01El6xnk4/3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.1u85ch.izUR01El6xnk4/3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/smb/client/cifsencrypt.c

between commit:

  192bbbf2bd41 ("cifs: Fix signature miscalculation")

from the cifs tree and commits:

  4aa571d67e81 ("cifs: Don't support ITER_XARRAY")

from the vfs-brauner tree.

I fixed it up (the latter removed the line update by the former, so I just
use latter version) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/.1u85ch.izUR01El6xnk4/3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbjcmEACgkQAVBC80lX
0GxT1ggAjcas1R4hrpyPah6NiWOL9zVddi5c2hV9X8RYkQULRzdRpcCUbZPvPFKw
ort05W7GlCY0yR4+eEIgW2DfY6hH/dO1Gy2Y+Gio9FP5DUfM9BfXR74/Ni3NGXiT
/nIgNA98bBnLhfkdG/ZbMFDWwNQJWiAk+nT9d3l3e+VX42647KJn1d4tuk5yI+j1
l2P61vNzR6TNNQQLoZZHpTrFFk+rQNt+spIaJeQL5jAYYuEfXl83QjS5eBoXiAuS
N8Os/37yeYWaXD7eznGqhziJUZNqN82JUfeUN6HIflNNA8C54LaC78SGDhjEDG/K
mVTcRsbqjEsvTY0a7FvGy1727ZoVfw==
=kV7v
-----END PGP SIGNATURE-----

--Sig_/.1u85ch.izUR01El6xnk4/3--

