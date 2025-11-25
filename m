Return-Path: <linux-next+bounces-9218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77776C87652
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 23:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96AF63AF714
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 22:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F842F12AE;
	Tue, 25 Nov 2025 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vr5foz0Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8AE2EFD86;
	Tue, 25 Nov 2025 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110917; cv=none; b=M6zllQR4frVu0x6VoYb3vuEHkLMKM4FX8DqiWwJvg2uB4T+82ehbBYg3j5nTp2ooGSXDMfVA4genPst44fELMiXFaDICXWJc5m/3JK2upeZK8jm4c0bmHxjecuPY08YpfSYVodX4M/iFxK1dKlwwHM3C/BxeUrCqYr3QEIYPq4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110917; c=relaxed/simple;
	bh=kXxQDJMUKY/Bckku2mVg8Q8RVdlc3qhUGowQY5/Ai9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mAm3UFUkUP+x86QQ+ofDRoI1zZXsbOZyxJaP9CXxQu/YuzNk4TqaC0a61vftTbB6pxSRDznApYuMRX8SWuhejiQTxffS1i7z9DfGtwCI+KgIhLbUVSCoPCtXeozkxNT76H6Lf+kV+6o3vQSJe6Tfftd/8WAjKS92iMspNOdMpew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vr5foz0Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764110912;
	bh=Yt904VftkSFOBxG3L3lsjF6R/rJLvx4d/gcVYlWPNYc=;
	h=Date:From:To:Cc:Subject:From;
	b=Vr5foz0QFQ9nQCM+NHbVQ0eVcfjmur5VVqVKcQXTOrRLRVs5TQS5Np4o/XL7+VT4x
	 dmaz+07vBGUOeXnVHp19R918hECgWbgZIQaCDwr5ongo+KriLukPL2jAdeByNnGdDP
	 26rUrAaYC2UWDrWK6JXIJAN46KXoMv3q227hr5+Niwk4grESyubYy9ff3xGLOY2UEt
	 B5dyaanLlCQKeYwv8y1mQta0iRXB8LmFMZC+jp6+tm7kqHppWbh9ul4mD/ogT2L3pe
	 QnY0FLBt5Cs2ZIUbD800C0svqVTdS/+3HKZINDpcQ3BmEOYX6phPdXOG7z3fxSyrr7
	 THTMHhGOpBSJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGHsq1wcMz4wCk;
	Wed, 26 Nov 2025 09:48:31 +1100 (AEDT)
Date: Wed, 26 Nov 2025 09:48:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>, Pincheng Wang
 <pincheng.plct@isrc.iscas.ac.cn>, Xu Lu <luxu.kernel@bytedance.com>
Subject: linux-next: manual merge of the risc-v tree with the mm-stable tree
Message-ID: <20251126094830.3b3ed57c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vRJl7SUlmM8U5doxtKQmrTP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vRJl7SUlmM8U5doxtKQmrTP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/include/asm/hwcap.h

between commit:

  59f6acb4be02 ("riscv: add RISC-V Svrsw60t59b extension support")

from the mm-stable tree and commits:

  c9651fbc6051 ("riscv: Add ISA extension parsing for Zalasr")
  ac3b03f8a4eb ("riscv: add ISA extension parsing for Zilsd and Zclsd")

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
index f98fcb5c17d5,bfba183e6290..000000000000
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@@ -106,7 -106,9 +106,10 @@@
  #define RISCV_ISA_EXT_ZAAMO		97
  #define RISCV_ISA_EXT_ZALRSC		98
  #define RISCV_ISA_EXT_ZICBOP		99
- #define RISCV_ISA_EXT_SVRSW60T59B	100
+ #define RISCV_ISA_EXT_ZALASR		100
+ #define RISCV_ISA_EXT_ZILSD		101
+ #define RISCV_ISA_EXT_ZCLSD		102
++#define RISCV_ISA_EXT_SVRSW60T59B	103
 =20
  #define RISCV_ISA_EXT_XLINUXENVCFG	127
 =20

--Sig_/vRJl7SUlmM8U5doxtKQmrTP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkmMj4ACgkQAVBC80lX
0Gxg1wgAh96Ll5vTNg2JG6jDlpZsM31rdZuyk4Kws314BTVyclfyV8xhiiQM5tml
qATmd0CdKFS3eSnV0ZqpKshwBIQ/xPx2tfzBIHFScIFryRMPQGlk4R+hMOkU7lOI
FJ1kMRsU+QguyU4bJ+LLVZTtJeKc9yqagyvl5sCCmOrXQV99U9c6MBn9DwYrsd+g
0AXsoqQYeyBX+FjPnog7raYfGJkJjQcw34NuwfnJ2eUnkWmV8vDiN7BKeuU7SmBN
IH+q4rCH0MUlHSNGrqOMN6r03XSWk4tPwh5fYYfPxprJZMLkxCxOzEU0vVBKWNtR
hTZcRXVXyaVinYkCWEPyYn21CuQJug==
=KzJ5
-----END PGP SIGNATURE-----

--Sig_/vRJl7SUlmM8U5doxtKQmrTP--

