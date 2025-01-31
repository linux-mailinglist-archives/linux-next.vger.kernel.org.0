Return-Path: <linux-next+bounces-5349-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E937A23851
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 01:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE6A1886C8F
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 00:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DD0A933;
	Fri, 31 Jan 2025 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uGTQOUXR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6C2F36;
	Fri, 31 Jan 2025 00:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738284165; cv=none; b=p/hhpvWRuKpRCK5P8nfQgCkj8Q0Dd4gQ5S/n6ATlPMsTTDh5NaCWKdry1h9UgE5JWbuHiZsrNMoYiSR+PyKrhQ3T+4l8IOOSK78vvSrpMrzDwXt0tv+F4UwadtzJUaQJAxDrnXKRvMdGhg+8aq3dH7AC0RlfnTKreP0Bnz6QOhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738284165; c=relaxed/simple;
	bh=BgKDfUO/vM1I1wx09yerNTXYxGqiZSG5+x6ZKBpRNvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A2GsE6niib8ihJrEkogxup4qVbXfvxOHf7W6CIxcJsPsfutx50d62Sbl1dIHKAMx2fFqV3zqOtdJWi06FeqSDGidYMG9xXXXD+/n4qRzvxEgnUUWDBLiikpEQ8zra10xuHpxNKVWEUPBT7aiQt/WYMMHy4MobFraP9km76KD9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uGTQOUXR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738284151;
	bh=1+UCL/Pff+aWTsIdXx7PWQTvBm1DARowJgf14aUeCc0=;
	h=Date:From:To:Cc:Subject:From;
	b=uGTQOUXR1DHqxiC9GYzeenG0zmAzyI+4o3EDaCAzVc++YeRhQEtfIjhhEkM90rod+
	 RQ5E84RaTKCYE2XkhZmGA3T3GrS5bEGLOUFFQq/M2P4OoSd2QFRHMd272+5Yf41plZ
	 yJ+EQlnRFp3jdYQFqEa32Eh4y2/F61apR+uwHXHEbMEgYYIeifPiSnhWs+Q7GLWfRK
	 nIfaSB0Z74T5+GJAsfitiaSVWZI8QKgE8LpnGFOHveCuoNl8L1+TL/sFYvF/Zwx0ve
	 3IrDKVUBey464ExUpqAwG787Pkw0yL4ftDUOwddqh0UepUq0nCn/wmj/EghNh9mTD2
	 xpRsS8oSaZU6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YkcYL6mPmz4x5k;
	Fri, 31 Jan 2025 11:42:30 +1100 (AEDT)
Date: Fri, 31 Jan 2025 11:42:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20250131114239.12bd7221@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7CRoYpoJ95Ft9nr+hKlg/5l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7CRoYpoJ95Ft9nr+hKlg/5l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  tools/testing/selftests/riscv/vector/v_initval_nolibc.c

between commit:

  503465d4dc40 ("tools: selftests: riscv: Add pass message for v_initval_no=
libc")

from Linus' tree and commit:

  57d7713af93e ("selftests: riscv: Fix vector tests")

from the risc-v tree.

I fixed it up (I deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/7CRoYpoJ95Ft9nr+hKlg/5l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmecHH8ACgkQAVBC80lX
0GwVSggAoWlUk/tz/ZiwoUa3Qwuf9pgxigqDpsgNxU7uDWN8U7+Muk7ELv9H9pYW
RUiEBcXWiyWP//V2V954T/Kin5SpG0ye75X0G2IlQodUe4XjG5UAaEWnoDsrpg7f
DJlz7QZAdPmEYfV/iN66CGOz5ntUv9PbUobI4L/oYpYn0o7hEG8L3pu2OhiQOxjQ
bhS7dL+LssFDEgcMBxE0v6oNMbO2V6YLMUMt4C+IweMj7dKT9YiNQLtalhCXej7U
FYcHXdRpUHqkcsbn2OmfzpXr0M0JwdaU3SsmcDYhe0LmV2qzjxdv3C8D2RnGioti
hg+NVFf8ehUUhD9N/NJUPLsp+PHU9A==
=RCIj
-----END PGP SIGNATURE-----

--Sig_/7CRoYpoJ95Ft9nr+hKlg/5l--

