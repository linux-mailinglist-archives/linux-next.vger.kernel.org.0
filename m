Return-Path: <linux-next+bounces-4831-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABFC9D58B2
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 04:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE1CB283434
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 03:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB1F13D509;
	Fri, 22 Nov 2024 03:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jspgr0Ix"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243D2582;
	Fri, 22 Nov 2024 03:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732247628; cv=none; b=c7/aExKpz6dO/3RfopcLz0bNsYjphruG2LZo2p12SCPLDZN/PYTp6fq3PA4eDZNlD4JTsCdGdMlCMew6FwGN9FgyegklPOUBPU9bSRTGF5ho0Lo8mEZ7b6vWoY0Rhv6FNY+hWJXSBZM8+AfaYbkfl0Boojj6uqGv51iu2khWp5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732247628; c=relaxed/simple;
	bh=KKxpmTSENMLojbIRYsbf00mXWHibsW3iESJ3Z2PUmVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gbf0h5+wW47wWfdNJw+HYhFUyqmt4RQTSPkF9fzGqiw/dubTUi9/xUOyFWCCyb65pckCg5ckHOgFkJ03Hp/2L53FcM+fGHtuMu25IZ8w7TyXTdoTYyd9TO9uWEDMdDLgh8MnQi1rpSuIqcUzeJRKrZ6cXxdlMFH/CMueUHDB0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jspgr0Ix; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732247617;
	bh=GmK0952nkxePa9X6O10AnSirfWam4yJ3JlYagaHf1qo=;
	h=Date:From:To:Cc:Subject:From;
	b=jspgr0IxzobqXfeuBCz7CN7SAAYRcrdmTrtMxohj3f0UtkX+tmVnnXFL+04z7UQD4
	 QyFwpZvyBx1YU8zVssD4EbhEV83cQaDqO0fG32tb1k6JyV8I7MANP+uz07cd/Ih9ss
	 SQZ2vgu2VcW76oo8LHDzfTHmmX/d4cQGxwH82I3NmwRz1ncf3onLQlmDXqDbdKpojb
	 FaHG+a41xMd8tr6frBsKhJ421eCfliL147nXXX3fmeVqZvq8wE29rPDKkJxF2ceXza
	 JxMbtT+3f7uJwqWcquACsxPxeKCCk1HkJ0GeXJaqUBhT1ud7zGA50GRM8IJytmoxku
	 xQpVOonDsCGgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xvh654GMTz4wy6;
	Fri, 22 Nov 2024 14:53:33 +1100 (AEDT)
Date: Fri, 22 Nov 2024 14:53:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul@pwsan.com>
Cc: Jinyu Tang <tjytimi@163.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Samuel
 Holland <samuel.holland@sifive.com>, Yong-Xuan Wang
 <yongxuan.wang@sifive.com>
Subject: linux-next: manual merge of the kvm-riscv tree with the risc-v tree
Message-ID: <20241122145335.70e05554@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cnCpeEuDMST71kLL/9wj9V+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cnCpeEuDMST71kLL/9wj9V+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-riscv tree got a conflict in:

  arch/riscv/include/asm/csr.h

between commit:

  29eedc7d1587 ("riscv: Add CSR definitions for pointer masking")

from the risc-v tree and commit:

  94a7734d0967 ("RISC-V: Add Svade and Svadu Extensions Support")

from the kvm-riscv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/csr.h
index fe5d4eb9adea,524cd4131c71..000000000000
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@@ -199,10 -195,7 +199,11 @@@
  /* xENVCFG flags */
  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+ #define ENVCFG_ADUE			(_AC(1, ULL) << 61)
 +#define ENVCFG_PMM			(_AC(0x3, ULL) << 32)
 +#define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
 +#define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
 +#define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
  #define ENVCFG_CBIE_SHIFT		4

--Sig_/cnCpeEuDMST71kLL/9wj9V+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdAAD8ACgkQAVBC80lX
0Gyi4ggAjhYNR+rTIia6A7Hhl/RczqV4v5n/fUrAvV8V3PR9cJZn2GKq3XB5A3v1
8ywplWQsH2y1c02o01NRnAM+Hyl7lAGUuXp/DDf6vs9v3D4ffouMgUnkfQGtfl8E
ldZ6it9kZD+AeS6RJHrbefyTLZmOb28mx5Mp3jIpnXLxU72otnfd5xbmh8kP+qXL
VPFXsrZKOlRS+JSYCDRAbsjYNVwG4vzmu+9HwXNZrmsKHQuKzKu7DCI8Bp7URECN
tbSLcY3hMQMDlHfq4jMu7eiUsO0ku9kTUI3JcBpZzpI7UREhFcxeR31SGpZFfMci
9VAxReYHqQ3gDjJthCtY/wnMU6pfuw==
=KFWI
-----END PGP SIGNATURE-----

--Sig_/cnCpeEuDMST71kLL/9wj9V+--

