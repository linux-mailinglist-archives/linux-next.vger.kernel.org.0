Return-Path: <linux-next+bounces-5101-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A9A069AB
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 00:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70CF1641FE
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 23:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02DD202C56;
	Wed,  8 Jan 2025 23:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VeqBWMwv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B7120013E;
	Wed,  8 Jan 2025 23:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379978; cv=none; b=Q//3e+dnOa5aQgMYOr7wHToaiYM/HeJFO/lo3vbs5EJvGug7zBt3XHv64+U/lblB9vhsZONWTixBOy47S9Z0gKJhhDvhH+7lxHfLfKO00tuqVpgK5hrcs1DMMfW7/LqsvBMoiVuHBHxRJM+f5kLEnHySpuaG9PpHzCM4i0rKvaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379978; c=relaxed/simple;
	bh=kCeWJRZ9Ld/9U3I6YWpyPXfjcmW1C1raDIvNqGkEXIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jluOCK8sf046afqT34pEmS8l70Qap+sNe/+xvAGkgFL9IO/BwAHmo6t5DHPVgD3Pov6BTpJMFk5IyWJCaj+hqb7XandE1/a47dxabjMJjUocQNhW1hkwns2uJahnad10sOS3ONtXwstR7M/w1OZ5coKq2o2VRXR0pwq5ZENg5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VeqBWMwv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736379965;
	bh=Ly9fn1T4zx4H8wNaz3hsD2gBcjX7dDKW3DZGhWNHt+c=;
	h=Date:From:To:Cc:Subject:From;
	b=VeqBWMwv3dGs6P8EIcVZXj/Ac88f8sttRMqilZ0PZszEvvpGpzX0/MMwcrvdqsZTe
	 TxWfcnrx0wUF/O2ia0U0x07AHoRsbuIUw2mJG6V0Itgtahn5G5HLsTWCki5fEGdZGr
	 wqGolE/43MlMlYK4HE56ewLEGajluuKQs/QzYRDyPpjp1x8h06aTx6Ivjj47cC7RTa
	 4SMRpUsExEocqh+TBrdUFMVsN9gd5Y75Fc6d/PH73TX8cH5cdXdnBD+lbEJ2MPPTwA
	 EtU73O+BThPUs5xbyTJ7x5nfvjO9b1NCwkDBuWgv5rVXlZwlx/1F+9HEgP+17SqnrB
	 Va9Gv4z3SRFDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YT4LP1xQJz4wbR;
	Thu,  9 Jan 2025 10:46:05 +1100 (AEDT)
Date: Thu, 9 Jan 2025 10:46:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: linux-next: manual merge of the powerpc tree with the mm tree
Message-ID: <20250109104611.2491cc3b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m9da.KuDx9fnbdx1dYJFT7v";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m9da.KuDx9fnbdx1dYJFT7v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  c0c3319917db ("mm: remove devmap related functions and page table bits")

from the mm-unstable branch of the mm tree and commit:

  00199ed6f2ca ("powerpc: Add preempt lazy support")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Kconfig
index 85409ec1fd83,db9f7b2d07bf..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -145,6 -145,8 +145,7 @@@ config PP
  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
  	select ARCH_HAS_PHYS_TO_DMA
  	select ARCH_HAS_PMEM_API
+ 	select ARCH_HAS_PREEMPT_LAZY
 -	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
  	select ARCH_HAS_PTE_SPECIAL
  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOO=
K3S_64
  	select ARCH_HAS_SET_MEMORY

--Sig_/m9da.KuDx9fnbdx1dYJFT7v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/DkMACgkQAVBC80lX
0Gx9vAgAiLlgHrrzPA8JJSrN0rllQimHcOttT+WgXoKP9UYTViqfcr3Q8n5THMDu
sYljjJ+HsPhQCFXoIOqMfwyVV2rFY1gqV3GbEUyj1JA9WO5/S5BTESX1lK61JmZU
ZaCY0oTciiyqV2nnFIt/lYpZ+x8a6OVaANTSHLYWUckUzddL3uzX/ztAqNCicY6C
xJGiyEt9l8BtH3P0ny123M/ZBa39LkghE8CA7DO4mCZmHpMyh2i+bKJBtf/Yno9t
fYCA/nXvF6J1p706rjourhGzKWZwd4zGW8MZvAsgcQVxb0vhjAlmEgkLqB6FsY3j
gjoW3E9tvHcW7CupRdiN/gTv2aT/Sw==
=xeh6
-----END PGP SIGNATURE-----

--Sig_/m9da.KuDx9fnbdx1dYJFT7v--

