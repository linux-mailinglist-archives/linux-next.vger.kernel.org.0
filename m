Return-Path: <linux-next+bounces-5755-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B2A5D3D6
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 02:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0086B17A0F8
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 01:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06086171D2;
	Wed, 12 Mar 2025 01:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EU0/hkaU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E405CB8;
	Wed, 12 Mar 2025 01:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741741661; cv=none; b=b+Sb4QJVO55oTsuBgaUOW9qwbZu4SCqWnM8Ec7kRtOQwIGdangE5Q/2dJxhSI5dZkihNIo9i5AxpYhE8fYxeH8B/moQMzVSa9BW86A0x15CoorWszEV3ekZSopNv8/QulEbh3e8bjfnlvyUS0iHi+dNHxCwewthUTvFsswEdees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741741661; c=relaxed/simple;
	bh=Joh3mnqFYvDlURYYepLFTcvaoKCp/tu48+jZgsGJKWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b8L4i2sX5iMgGOytcW7cP+AmNtI8mzs/NjX43N23ATkDEPtoYXbOZ1tC201Yani6qD3WbodR2372tegGEaQc+0z0NnG6aTp805OSDP38ls6zAqZLL3t+GmyVxvS+9DeP32nyd0C2apzeSb350eOMu2i0KlpVcFB8B5Yivh2/AzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EU0/hkaU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741741655;
	bh=PjXSvNEtn6yf+ZQErdpdfvOTqvcfj0nwEHUqP4Yc6/g=;
	h=Date:From:To:Cc:Subject:From;
	b=EU0/hkaUvXMOokYn4Ez4+SgwEIr6rxKRuf10EwEDE8BmSkjtN8Oijv78ES02rp1ia
	 I+7FUmvz4IKz9rLfneFnYt94oLPm1hcBuiH5qYVlEYSj4oxnSrEzA8CMp+uUmIAXfg
	 l9xk2brQ0b6UK/UWlLBCEvonv05TvW8c6BczSBmWiwrifOYiKKOHKjvldMa127+YRZ
	 3E1oSJyrj4hDTEGjp/COjARtLrQ+EE3snMcqElWXe0pn4+oJx640+PUdRfVdRyWgsc
	 nKH+3qJ80RUGL7GF5vtNogCxDZ9RsiGMe6vsheFZslsAufDH6LpOKIhqG0f/DFHdIk
	 Dn6bUBwsle0qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCCCq1vRdz4wyh;
	Wed, 12 Mar 2025 12:07:35 +1100 (AEDT)
Date: Wed, 12 Mar 2025 12:07:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>
Subject: linux-next: manual merge of the s390 tree with the mm tree
Message-ID: <20250312120734.4a1e4f4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a8G8jVE=yFJrdvXJQEEJ6kk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a8G8jVE=yFJrdvXJQEEJ6kk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/include/asm/io.h

between commit:

  08a7874a8e6f ("mm/ioremap: pass pgprot_t to ioremap_prot() instead of uns=
igned long")

from the mm-unstable branch of the mm tree and commit:

  c94bff63e493 ("s390: Remove ioremap_wt() and pgprot_writethrough()")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/io.h
index 82f1043a4fc3,251e0372ccbd..000000000000
--- a/arch/s390/include/asm/io.h
+++ b/arch/s390/include/asm/io.h
@@@ -33,9 -33,7 +33,7 @@@ void unxlate_dev_mem_ptr(phys_addr_t ph
  #define _PAGE_IOREMAP pgprot_val(PAGE_KERNEL)
 =20
  #define ioremap_wc(addr, size)  \
 -	ioremap_prot((addr), (size), pgprot_val(pgprot_writecombine(PAGE_KERNEL)=
))
 +	ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
- #define ioremap_wt(addr, size)  \
- 	ioremap_prot((addr), (size), pgprot_writethrough(PAGE_KERNEL))
 =20
  static inline void __iomem *ioport_map(unsigned long port, unsigned int n=
r)
  {

--Sig_/a8G8jVE=yFJrdvXJQEEJ6kk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQ3lYACgkQAVBC80lX
0GxnXAf+IyqH34mjr/D4ORD7qi0Yr5eA410Yr6NtpsLQRdA1VMFlmaXF1aayxaeW
IPm+parWr0sfMplKUf8JAhUPCuQCUwL8tdl/gTFftZjt+gPmUDGx77B+AXuCkPKG
K02rYuXZ2xbButC876tBwrMwmux77mJrUCmNM7uBelgu/3pVAIDcSVI0Pu0yzZLx
kgfcF2tv0Q+SMJ/TRBuRREmttYVeoOGaHooMtFof4Q46vAHJejKSOjTxYhNfjh9Y
ys6oDBazIgJ9gfWrDXJiIjjZvJqTnJYGTD/MbGXly3A3rm7kJl6SsffrYijT1g2C
ITZrDjEiyUkS8UY+2FVbxemh+aEy8A==
=4yMT
-----END PGP SIGNATURE-----

--Sig_/a8G8jVE=yFJrdvXJQEEJ6kk--

