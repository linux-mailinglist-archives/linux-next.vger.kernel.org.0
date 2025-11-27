Return-Path: <linux-next+bounces-9251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E3C9053C
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 00:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 617074E1D6D
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 23:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A7E311C10;
	Thu, 27 Nov 2025 23:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hk/f4jQQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B91CD15;
	Thu, 27 Nov 2025 23:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764285015; cv=none; b=vBCojXhMRtYVAawocQ2xSBGalrwF1VWn4gLH58Fi0qhZvd2XGiLwLA9BxSMTwLCnrOuubkjohnSgwYeAmYpZ7fWPG50+azLJURzPoc04q8vZXlUj+L1PO1214AIjkh34wGFSxcPK0XqqTTDgBmsevF4Me68y5AMbyamQoq3MpAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764285015; c=relaxed/simple;
	bh=iUNWDG6/QZjtJEx3OJ0Dr8c2vu3vMGIwoCCfSz6x21o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SkgQR4fKmXHSTWZ6y3q4aSI9pDwLgLHLYragMJvOM/yfCYaQK6xRQOoL08fJY5ObgD1W2LLTESpG5ghPI98OIA4UfoBmTCQwtiwYiCJr8gHuFq6Vxuym/++6Jz0i8kRhYdDYuZp0GvjDgae32yWlhT6V7mQ8SJIVKX9XGpP2GRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hk/f4jQQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764285005;
	bh=tgHWHunp/n0i1ECb1seqlJ3D+LvQUIC1TIDiEO5zfbM=;
	h=Date:From:To:Cc:Subject:From;
	b=Hk/f4jQQPBUbPFn/9ptsYbUbCKUjQXZew6C8WQAoDPuMIZrAELDqocTWl1gAxvZHE
	 2zaOmm0gcU93hHzF/QnInIUyyqzT7RksEOm+97HIW5vqF2+YdQFQbT64/hJs8aD5Va
	 qWxA2Crx74wUaY/8YNaYK/hi64zle7HhaWxNSRRJqbAkkKZFV9pRzSO0V/hD53/nPu
	 BdQ6O34SyK3q6q8rXfkB9l54KNlg44MxXxH2MsmQS9b6jDlY0rLBy46wbv3hw59p7Z
	 383lkoMJ6sL0y8XrqLmtvjLJG0raSFliAA9GZs6jyx0/FfsFt4uuiR37ai8ZxTRsKb
	 PAlD+qRVDxGDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dHXFk13brz4w9q;
	Fri, 28 Nov 2025 10:10:02 +1100 (AEDT)
Date: Fri, 28 Nov 2025 10:10:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Deepak Gupta
 <debug@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>, Pincheng Wang
 <pincheng.plct@isrc.iscas.ac.cn>, Xu Lu <luxu.kernel@bytedance.com>
Subject: linux-next: manual merge of the risc-v tree with the mm-stable tree
Message-ID: <20251128101000.151a81f7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KYbNb4H4K.1CRokZqBvt9uj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KYbNb4H4K.1CRokZqBvt9uj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/include/asm/hwcap.h

between commit:

  59f6acb4be02 ("riscv: add RISC-V Svrsw60t59b extension support")

from the mm-stable tree and commits:

  c9651fbc6051 ("riscv: Add ISA extension parsing for Zalasr")
  144ed7bda8b9 ("riscv: add ISA extension parsing for Zilsd and Zclsd")
  55a811a7f304 ("riscv: zicfiss / zicfilp enumeration")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/hwcap.h
index f98fcb5c17d5,ce2ed4460c37..000000000000
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@@ -106,7 -106,11 +106,12 @@@
  #define RISCV_ISA_EXT_ZAAMO		97
  #define RISCV_ISA_EXT_ZALRSC		98
  #define RISCV_ISA_EXT_ZICBOP		99
- #define RISCV_ISA_EXT_SVRSW60T59B	100
+ #define RISCV_ISA_EXT_ZALASR		100
+ #define RISCV_ISA_EXT_ZILSD		101
+ #define RISCV_ISA_EXT_ZCLSD		102
+ #define RISCV_ISA_EXT_ZICFILP		103
+ #define RISCV_ISA_EXT_ZICFISS		104
++#define RISCV_ISA_EXT_SVRSW60T59B	105
 =20
  #define RISCV_ISA_EXT_XLINUXENVCFG	127
 =20

--Sig_/KYbNb4H4K.1CRokZqBvt9uj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmko2kgACgkQAVBC80lX
0GzxJQgAh0CCIlcakZ6UIpB7uylBLcwligyAWGp3MHI5W7GLsuGsYQplFGdfq8nu
CCUZg3E/86HUPtrsWrOASiZmQuHofuDprmLh0AJDyt+wvB4knPAPfvtWcXJwEfAn
T6HlFoD30CgIRW9cbrgg7fvCVtq91xYAdBM5s/y3g42mt6vXPwBW/txjG/rGHSRb
ykHuDtPBQpqMasel2P6o2+/zU8cGoDOwroBZsaeNH385R1NxyD9/i4uxnNC5Ohbs
TbDrVUdXMtG0sJNoFMV1plMSlotmZcqwkstxgXARD45Tl3xzDS9av19sqRghxlhZ
jbOLAfjKYw/17aZOASaa4AQ4o51VkQ==
=UGir
-----END PGP SIGNATURE-----

--Sig_/KYbNb4H4K.1CRokZqBvt9uj--

