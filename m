Return-Path: <linux-next+bounces-5031-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A6A01CD1
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 01:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 931587A16B1
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 00:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCFB2111;
	Mon,  6 Jan 2025 00:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BSgyjSE8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C517C;
	Mon,  6 Jan 2025 00:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736122395; cv=none; b=Vb1bd6zsbIYHXAlH31MgQzeHoT+eAqvmMh38MjipSk7hJiHE/fLKPSZdTD/qx8MDgRBXyV/Zj2FkNvXRUSSmLEZ6hy1oRNck+TwPFQoZw/ePBHZYJLEaKGuqz4riiyGLifi5n7QJY2cV1SRBj7E/I4g+kxQqUa2muWCbkNB9n+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736122395; c=relaxed/simple;
	bh=HgevIgHKLkUsgCSJDyGopPShGtVml3/z5gTeIHlvyWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UE2oLy6nEotGO+C6WQfc0tLEz3ACTZhX70pNdEZulC5YBEaH9rZQCkxydEFcsJuSP002RhvcnqCQpCHyllXLLFrrHFzGxrIEdvtCX5oTIJZyq4vLKvxYbd5UlSEDWcrAt2yks2THvO3Txh5xZp02ghWHIGyt/lCbWSZdVPH+qKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BSgyjSE8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736122382;
	bh=/J+hDkZwT3I7i60qBAhSFVSy1aPPUcPHFYteyXAm0wI=;
	h=Date:From:To:Cc:Subject:From;
	b=BSgyjSE8bCVGaL0t50eG4Fs1Cemw3BJRVoR4P2E7byYnSWezSspF3TkDO07wWXcxx
	 lSE1X5GBxzfu8OermsdY2tGCYSrSXGteZskBAbECOadvY27f9KCKs1TTHiOVkNrNPo
	 3BBwQxy0RDCWrb3t9tzLWi0gBjGCMmykyAxffRXpaMyLrQHfVF0LeL6FfdqJPgjviV
	 9OQSRQ8mR8YpmEEO53vWV/M9mK2VdQj9g1k//9qhIm5KJ2ewVZG5jW/SIOIiHHTwBo
	 TBLSrok//v6xTukydb5PBkGIuhEmtNbNscgNyWhOi1Ro8ivGTD3AUEFnxLepYlVBnS
	 PX+p+EPssSZBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRF4s1jBbz4wxx;
	Mon,  6 Jan 2025 11:13:01 +1100 (AEDT)
Date: Mon, 6 Jan 2025 11:13:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Bernard Metzler <bmt@zurich.ibm.com>, Junxian Huang
 <huangjunxian6@hisilicon.com>, Leon Romanovsky <leon@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yuyu Li <liyuyu6@huawei.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250106111307.7d0f55ba@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fYUqfZAaqLI_qRNIzmQZwli";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fYUqfZAaqLI_qRNIzmQZwli
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/infiniband/sw/siw/siw_main.c
  drivers/infiniband/sw/siw/siw_verbs.c

between commit:

  16b87037b488 ("RDMA/siw: Remove direct link to net_device")

from Linus' tree and commit:

  62f5d59d1a3d ("RDMA/siw: Remove deliver net device event")

from the rdma tree.

I fixed it up (I used the former version of siw_verbs.c and the
superset parts of siw_main.c) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/fYUqfZAaqLI_qRNIzmQZwli
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7IBMACgkQAVBC80lX
0Gx0YAf+JiUzwiLq2zMV5aV4Z187GQxZw3aQno6Sw2O4+mP97A2k4C0DLAyBtHFN
auEOmnYJwtC39RC7aamftvF5i6sY341N+QK+WGcFazq1I/Qj81E7AYLZ0bGlB/5i
A9A9uEzXwQWOuBk2BfMR2lAjCLv1dsu2SYxXYpzI2jhgI3pTeqz4IWUYTtWbn242
HM6kbudolkeaFSor+Zgx9AdTKyBcHO+Q0GPHa6zWSo8zjjyxP0k16xtdkKFdHnlb
rdAXE8lDCzUPBCUzA/iB7+H/H5mYQzoHK0LS/dH0K0aLDV9zwNSXYtvhRivZmIoj
gOAvEDLn7gYR97uv9RbF+81X0WsFWw==
=rGpo
-----END PGP SIGNATURE-----

--Sig_/fYUqfZAaqLI_qRNIzmQZwli--

