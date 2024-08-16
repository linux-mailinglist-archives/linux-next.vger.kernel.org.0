Return-Path: <linux-next+bounces-3339-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5211E953FD6
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 04:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE6DEB24FF4
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 02:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6AD2C6BB;
	Fri, 16 Aug 2024 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qPCgdl7W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9C817;
	Fri, 16 Aug 2024 02:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723776876; cv=none; b=Tpged0Zc36DOAI1COX+OcDbfCrL+2kv9hTNiMLGNoFvR8EkN0vBzXN7dfQTqxcrRF/l4BBJSH9Ad+9wHefoZLkM5gB2Aghm5XX3lIZYrLYjMyjt+ygWY045ZTnNjTwwjCIhgAVpwFWqm/DyKmzpreJm7e6cdml5kTKHmzbJio78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723776876; c=relaxed/simple;
	bh=Zs3u0oyS3mt1vnTc5YcmFPub5HPTH7kXBhoezRudiTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fLQOcLqePKcLknX6G6G2BJuKQAYWuDhON3C2xC0TmHDHTXRp5ZkCH/gTKHv2lqdwssePeBklFM1q/HUweXiS8GeHL9qsMFHcHz3eK4HWb1o+kkb3KR7WwdGYkY6ePPav4nIsALK2/k9ECUyRp3luM+DPC00YNdccDwlTPKtwwFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qPCgdl7W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723776870;
	bh=IqJkJwA9YfA9CV2VJCDYf2i/9ofuGusasEQEzOD4KMQ=;
	h=Date:From:To:Cc:Subject:From;
	b=qPCgdl7WTxJf9fYn7fjMW38KwBoiEBD0jZE5L/bRlfBCpeGi0WDK/9TiaUfIJ3+q/
	 iHTc3VfQlCui8sBBU9cLw/EIqoGpoF9zVdc+jN/8VWN4eHsM+/eNbyzSG4YKq703oD
	 IL9cYX2PYqQNBvY5yXM2XO0PvD/WtJ4r0VOQmL7mYQ42pB7CbFyRythvP/vXTWD16i
	 wJziKQn0X1G2AksjtXzj5LcI4ZTqUSZy2n7QC7JI3htJRgprlgDJK9cyWyWXQWI48F
	 eY00j5epvhic+9ISRlzsIktnTDgeaidarNth/MxZVjWPqkedPymies6JYZfo8TvDoz
	 OTQkh5pIjW4xw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlRR95PJrz4wx5;
	Fri, 16 Aug 2024 12:54:29 +1000 (AEST)
Date: Fri, 16 Aug 2024 12:54:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nicolin Chen <nicolinc@nvidia.com>
Subject: linux-next: manual merge of the iommufd tree with the mm tree
Message-ID: <20240816125429.7a55b08c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bQb=ZrF_wJng025A0PMbM_C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bQb=ZrF_wJng025A0PMbM_C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommufd tree got a conflict in:

  drivers/iommu/iommufd/selftest.c

between commit:

  e843cce9dd23 ("fault-inject-improve-build-for-config_fault_injection=3Dn-=
fix")

from the mm-nonmm-unstable branch of the mm tree and commit:

  4be8b00b2b0f ("iommufd: Reorder include files")

from the iommufd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/iommu/iommufd/selftest.c
index 6bfb7fa5da7d,b60687f57bef..000000000000
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@@ -3,14 -3,13 +3,14 @@@
   *
   * Kernel side components to support tools/testing/selftests/iommu
   */
- #include <linux/slab.h>
- #include <linux/iommu.h>
- #include <linux/xarray.h>
- #include <linux/file.h>
- #include <linux/debugfs.h>
  #include <linux/anon_inodes.h>
++#include <linux/debugfs.h>
  #include <linux/fault-inject.h>
+ #include <linux/file.h>
+ #include <linux/iommu.h>
  #include <linux/platform_device.h>
+ #include <linux/slab.h>
+ #include <linux/xarray.h>
  #include <uapi/linux/iommufd.h>
 =20
  #include "../iommu-priv.h"

--Sig_/bQb=ZrF_wJng025A0PMbM_C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma+v2UACgkQAVBC80lX
0GwivQf9GrAQCqnh2IQG4GIQujjVVO+Cz7U/pvWILZBZixl8TY+vB+Sf7Of2nVJl
OZTIlLgAeI1N79PyxDaAk3Xk86MyHyaBtxBD2pJm+s41FICgqX+vel19uZZJAKkV
Mfj6CqaGqRMRkpS3nlKWglacsNuwq4TlRENjqEgA9HlFSWk+NpQ+2wP72Pp4k0k4
OOiEckjQ5TU72tn2W9L4smUD5/4q6JP0WpN7eSP76ZJc62ZF+3K4KEvVbs7fVkVh
YlYiuYeWQbqUFw0rwivHjFuEsfXuZQj7gwwBFvr6PXrFP9Y9BPIDG4+VUK8Lhkji
4EagL34vj+o4BMaEtjvvVWQF5HwGMA==
=0hKt
-----END PGP SIGNATURE-----

--Sig_/bQb=ZrF_wJng025A0PMbM_C--

