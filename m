Return-Path: <linux-next+bounces-7286-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBAAAEEDFF
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 07:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E98617B68E
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 05:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45411B87F2;
	Tue,  1 Jul 2025 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r7s0YU7L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB2E101EE;
	Tue,  1 Jul 2025 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751349128; cv=none; b=UkEOVDJgAsiQpuCq4eEDB42f5rqeQObvobiYCxVWJxQZn7e5YivJ812FCNC1CyB0nDjqf/oKPipys/YikJD5HiWprZaUtswfqibh0RxmuDLsdC5W4ukSdLyUA8GCGmIDYvwk5Tk3ni904gQ0Y4vrrIemF8gUi0Xv9bcUgHCH8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751349128; c=relaxed/simple;
	bh=c+Bs51v6BY8M3F4LIDgARocKFyOx0CJ5TtPxp6vxO2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m8mtLw/DSssZoWHKloY+t+jjYWeDPbw259pSJVfBDSDXc12ef362TqMxvnWVCOWgwV5U610O6iPoC0wVovg4BuX+rfPe65n5md6ZRNkx57z7Tp6BwLoFCI829CoDdsWgfVzpaO8E+bwxCyjo2WYG4Ysyhcm3Ut4qqAGecl7RvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r7s0YU7L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751349114;
	bh=B7dGru63meARCwbCfMksm21+MtXwQVk2JJTZY2pLUik=;
	h=Date:From:To:Cc:Subject:From;
	b=r7s0YU7LZ0kt4yL+DOQx2Jo4X8AtERtEt7XLiux5xtFJRu2an61r9fTu11hqZNg5D
	 KSn3jGcj+r+MUJq4FA7HabARbCnQ2JKSyLngdZLG/K6QjBMBA2dKehqvFju+2M72Cs
	 AbTGjm/TzSaVJYu8UVrmmePA7mnAnmWZEt7wKmyLhToW+yiVpJR0D2bR/kKjMJr46q
	 L5QndJyM7whtvdtjl5Wixfdbuaw2UlenqY3Dmo0+VLNQ1oclqCbZzlm/UaQPEKb5yH
	 idReBOcnTfNoeshjBBBF16LR4R2n2KwURptUpRcXRzQ5r3TRVwEf6KQFV+YS6ST9vE
	 piHWthfwkjYIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWXGf0zJ6z4wvb;
	Tue,  1 Jul 2025 15:51:53 +1000 (AEST)
Date: Tue, 1 Jul 2025 15:51:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the drm-nova
 tree
Message-ID: <20250701155159.47b914a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=XZn/T3/uR1MctfHtfb6v/w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=XZn/T3/uR1MctfHtfb6v/w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/gpu/nova-core/driver.rs

between commit:

  94a08721435c ("gpu: nova-core: increase BAR0 size to 16MB")

from the drm-nova tree and commit:

  f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/nova-core/driver.rs
index 518ef8739550,110f2b355db4..000000000000
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@@ -1,6 -1,6 +1,6 @@@
  // SPDX-License-Identifier: GPL-2.0
 =20
- use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, s=
izes::SZ_16M};
 -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, s=
ync::Arc};
++use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, s=
izes::SZ_16M, sync::Arc};
 =20
  use crate::gpu::Gpu;
 =20

--Sig_/=XZn/T3/uR1MctfHtfb6v/w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjd38ACgkQAVBC80lX
0GxDiwf+NEB8A2RcyS6hyrX/3oo5M9OojGNW7M3hwexL6GDC127Wr9/ZiVksuhmB
qpqx/7/O/8CZHE3EvP95l61Mj0W9up+6tWWZVVAQ1MIwsOi93VBf9spPRrhTUoSv
FMg64v4RKuRnDUjlZ17HGseGQv3ydsm6vRVAYQAkJLzhXNfDEoslNRtWmjlBKJk8
mFM3drbNkOLOw8URl+qWfi/VFEhgA/uTOhvxIx4X0FWlbrcsDaF9FBlK7QiGtZhK
1F3WuWkUqlmwYZfwPeP56cIzG3iyTC0hSNhx+2DiqFf8B4hLVJHx/Ysv/va2q/lP
Ct3nJjff3y+zCq3iTfg60w+lSSRGcw==
=Hvkm
-----END PGP SIGNATURE-----

--Sig_/=XZn/T3/uR1MctfHtfb6v/w--

