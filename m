Return-Path: <linux-next+bounces-2489-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 800798FF7E0
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 00:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D6DA1F255C2
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 22:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CD013DB92;
	Thu,  6 Jun 2024 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OpnRNVab"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27237347F;
	Thu,  6 Jun 2024 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717714534; cv=none; b=g0FZ7SealwP2EQHGouR8s0RDaw35X0OnDPIe4mnXpWYkxnpjuDgoDpjya6YOp8zeom6B4TOVjGbq1nPy8PhhrunfbMzS9B71HYakoD0EbM29DSDCuw5UiTF8VfZplpXQqppfszZBsWdJC28D8L0ccsDHuLn7V+8QmopV/khpQMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717714534; c=relaxed/simple;
	bh=AaG1uT25yFQaT3dZo4E+gjGQLkYG9e0w2e0SbuTiqBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GmlK33o1MHhSjv1Jy5/GW+6626cm6LeTjFdnYeaVa4YAhj+D3Iny7+6GHYWPp6yQ4SdaMaciihnrPpOa5QrQVak9HUroe7Q9tpXE743KKHGGxpgmxpDolltmTdbVwFK0urUM2OYgwZp6pLXJ1/upFRCXMYba1mo/euC08+xdI5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OpnRNVab; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717714526;
	bh=Jg2qgoV25myPIweUisFCPyT58VMiaTd1lOacloQ48Hg=;
	h=Date:From:To:Cc:Subject:From;
	b=OpnRNVabod59IQ6vOMni3quQHuPtAZCaUlJ0Z9qxa/ZtDRHXLkVwab4F/1DojUhbx
	 H+Metk/kQ06F6RKTQIb+khSASfp1hMJ7EoKmMELxhFOHL0EWDeWTPIwo4kP3pYmjaB
	 8qUhQuXm0s7Szqq789E6wiJolqq1N6VBBVoW3lCEIC+jRp0Dyr6aTSTW2ftZYK4LV1
	 SP4dJejWY6Pd3IijxvbySXRdcUpMS3+hU1zoG5c3CMDSAoOXiwDGsGG+oExRlQtiVW
	 DmbXt7mc8r7GOsA5AZLmk6WAp0n4eEd+TBO4tISIwVoCUAgRgiD7PSdh8Xi374Fpg8
	 ul0iNX/QGdoZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VwKRf5sXQz4wc5;
	Fri,  7 Jun 2024 08:55:26 +1000 (AEST)
Date: Fri, 7 Jun 2024 08:55:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
Message-ID: <20240607085525.30555161@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lZUFP91txiP9OdWiRNXURh4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lZUFP91txiP9OdWiRNXURh4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/extent_io.c

between commit:

  d202776a44d5 ("btrfs: protect folio::private when attaching extent buffer=
 folios")

from the btrfs-fixes tree and commit:

  46cda5a0ef68 ("btrfs: fix a possible race window when allocating new exte=
nt buffers")

from the btrfs tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/lZUFP91txiP9OdWiRNXURh4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZiPl0ACgkQAVBC80lX
0GxNPQgAoNTk6dQst0MpO3VMiePPGjAGR1vgVpldTNMxZQzyyUjXynfqXbBFU2lp
usJaXcGyGN/EvqJKbQysNzXOoe+NOhyRI2V1QOqYtOhQ+i+iE6A09n+BXd5BOmr1
Moz2xcLlyYdrPMFsPch7CrO3FDhQL11izkbwtmDVND3Pt0xvM1uDbCSAUyFvAgeN
+QG29cG0/wPKeHgcaVHjyKNI3Tjkn/WEptHWbxQMR0swuA7zhfKtAYR4mlX0RZ22
B8IW6L1a2n0xh55uPihx/ejqMa/qpaq6F9lU+iBYxDildv00n+gplDrIdP8r3DeH
8jRpBeBVrvYdZ2kPNFogBhSCHpHAIA==
=acE0
-----END PGP SIGNATURE-----

--Sig_/lZUFP91txiP9OdWiRNXURh4--

