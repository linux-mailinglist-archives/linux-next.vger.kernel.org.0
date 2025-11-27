Return-Path: <linux-next+bounces-9235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48067C8C824
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 02:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B0E84E1516
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 01:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F609299943;
	Thu, 27 Nov 2025 01:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iEhpYPBj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F621E86E;
	Thu, 27 Nov 2025 01:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764206028; cv=none; b=guJEl28Be/vCj1G0TV1CRRfXTXNrAhIUhoOzyIl5bQ+lD4MWoryOD/WC7YWQTEtbdJ2mtdTMGIT7wh/8ee5qEsvZhVViTv7zLKlb2kcv1T0nBoICCHRqexPomMBkokEXdWQODUcQXMPtqISWKoY2ugDo7/6JfqUwotHesGVYsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764206028; c=relaxed/simple;
	bh=3Go8W+FRpagvnbPKGhZiuzWmGfy3P7LGXs4hMHdUvJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=npKKO9GrrEK+sdlZVC3nUmoY4amQmfwMNnqn5x0PEXsh5odDz7fC/KModiCxfuPr0Rbi0H3L4gHG9wmBTe8pvRFwo5WKhwGySECJ84qVlAkkHOn9ttHar3J2+msVS54SCiivPf+EzoN3pXHU3Mv10/grW4eRHUz5NCpMM6LVEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iEhpYPBj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764206024;
	bh=nX2o9BF4YyzFWt7O8RdA4AmRi3oSOFOhjU9ybn4SBls=;
	h=Date:From:To:Cc:Subject:From;
	b=iEhpYPBjDoo4T/d8PnHqG5LiZaOmOb6XPi1NmmG8F/xUdbl+1GPvKFjozvzW+q+ya
	 tOoy+cbBL2Dmuuwu6oUOLK99c9OHorsrzWGztFEB7VJNlHqT75fsSK3Y1eLr7EXF7B
	 8AkMeWhAhpH3RNydIq53OvE6BHas+FFIMiIKPS2ZizPtY/iuj5Ko70THyg6os1Rfqk
	 Wzh0shGE43iLOxPZhqSQ/wYeNdtCzzM0Xe6hMxb/bjvUcbvHmdyL2ADAGEQMu7hqaa
	 RZ5AvFSziOidKVi2agnfUMC8Rj/+BIHlRkqlwK/ySKD5MSJrleSAKeI2oUtaiiE7k3
	 mnph9nPgqsfmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGz2v55Xrz4w0H;
	Thu, 27 Nov 2025 12:13:43 +1100 (AEDT)
Date: Thu, 27 Nov 2025 12:13:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Pranjal Shrivastava
 <praan@google.com>
Subject: linux-next: manual merge of the vfio tree with the
 dma-mapping-fixes tree
Message-ID: <20251127121342.73a2fa9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I6+gQfYH8qLkMw5xmPvUeR9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I6+gQfYH8qLkMw5xmPvUeR9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  kernel/dma/direct.c

between commit:

  d0d08f4bd7f6 ("dma-direct: Fix missing sg_dma_len assignment in P2PDMA bu=
s mappings")

from the dma-mapping-fixes tree and commit:

  d4504262f745 ("PCI/P2PDMA: Simplify bus address mapping API")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/dma/direct.c
index f973e7e73c90,d8b3dfc598b2..000000000000
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@@ -479,9 -479,8 +479,9 @@@ int dma_direct_map_sg(struct device *de
  			}
  			break;
  		case PCI_P2PDMA_MAP_BUS_ADDR:
- 			sg->dma_address =3D pci_p2pdma_bus_addr_map(&p2pdma_state,
- 					sg_phys(sg));
+ 			sg->dma_address =3D pci_p2pdma_bus_addr_map(
+ 				p2pdma_state.mem, sg_phys(sg));
 +			sg_dma_len(sg) =3D sg->length;
  			sg_dma_mark_bus_address(sg);
  			continue;
  		default:

--Sig_/I6+gQfYH8qLkMw5xmPvUeR9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknpcYACgkQAVBC80lX
0Gw32wgAiCf8L6wPSQwUSXg/PUQonhuvTqWFi7BZ8UZJ6K1xP8Xf19bhqhm+6Gg6
v7jv1PQq8UxjtQzvExng85uzuon2iay3Yx+YEDtHoIA1gMEZIGVP4t/IkaPyKWpZ
4eR9fTlow0rnb0zQOIOMKpJjSZmW9jCJFMs/v2gwNzeH7TjOJJfp5FgK+cIlBQVa
RI+CNjbjGgHmpeWctBFd/jC886icOzrniNNSsWnpENmKbUxXwJgRK/Zv0iPORAmQ
iOwJzW8lkg7tzP2Ba/TT/9dbDCRj8NoC+AEMi04IQYbgNgduFuGLk99f9Paqdvg6
Bpa4AYVt7MrPrdZZ7xP/JX9Cd/QWyg==
=oOwi
-----END PGP SIGNATURE-----

--Sig_/I6+gQfYH8qLkMw5xmPvUeR9--

