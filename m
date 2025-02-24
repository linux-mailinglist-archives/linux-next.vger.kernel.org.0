Return-Path: <linux-next+bounces-5538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF1A41429
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 04:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5FE61894445
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 03:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AED1A5B9A;
	Mon, 24 Feb 2025 03:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TyYcjRDz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50205F510;
	Mon, 24 Feb 2025 03:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740368571; cv=none; b=SCnbqGqbPwo802mrsQtUI+qR1/J2E5R9kIZneexdNbFH/UF2IhxZR/crbm+jMzLf0sTW8dugW86L0cU3SbStXwe2RCnB+qHS6+J4r9+NLIV46/1D7SjeiBcg2+21/htxdLTp2QH+Qf9lajt0nu1pbW+rcK3oWE9em3XfjI7wVeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740368571; c=relaxed/simple;
	bh=EUEdVg/GLoqBaPwmorcSy8aHuFxU8q15n39wCOvzdJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QUsGQ5zttdnPNVq7qfV2688voUsXn/8yxhI1dwuN5uFTR6j33cSufc547Tz2bvoIclpCE/SL+hKj8ZrSEb9YdChk1xzvN3kO7i+0jW5CE16BxWsEiEn1lTwWdJp1LlAmLRAB4l2zX5o1j+AsxyRWiPG71+Zyvpl6soIV/hRmRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TyYcjRDz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740368564;
	bh=QAw19x3pYgc8aUdHyGEwzMcoYS+ClBS9xWT+KeIEZNE=;
	h=Date:From:To:Cc:Subject:From;
	b=TyYcjRDzlWTkQ5duOsnU/Irvgs98Iaut5tQBgluaGgxKf7L3D/1WCsUVjM4oGrPMD
	 jdGhaBjaTQdWBzin7B6n64jVURHRn+8wbaSdM5pgCCy6snPfp5YhDTTA+Tpeq3HoSk
	 lkiMQafP8tNo3EhxbSDNlB58W9ajnYZtQffyxsdTkop4glvc8X57RAiZs4zsoTYxuv
	 vMPAKh73qPptuvkj2dO4Lth2DdaCOHEyzpDbaOT8BUBXHPd4Leq44Cf0fXxagWKfXu
	 NCGZpxPQ/cND4SPaKYcCAiinGEh7FH6zmBaGx3zWLnxh/OWw02gkoiOlEF8KlBkZ5i
	 DVw3JV8tmcrMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1RQB1vn9z4wbR;
	Mon, 24 Feb 2025 14:42:42 +1100 (AEDT)
Date: Mon, 24 Feb 2025 14:42:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Ingo Molnar
 <mingo@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>
Subject: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20250224144240.7b5bca3f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//o3eI9X5yHzr=7alZc8QveG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//o3eI9X5yHzr=7alZc8QveG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/riscv/include/asm/io.h

between commit:

  85731f537aaf ("mm/ioremap: pass pgprot_t to ioremap_prot() instead of uns=
igned long")

from th mm-unstable breanch of the mm tree and commit:

  a9ebcb88136c ("mm/memremap: Pass down MEMREMAP_* flags to arch_memremap_w=
b()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/io.h
index 0536846db9b6,0257f4aa7ff4..000000000000
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@@ -136,8 -136,8 +136,8 @@@ __io_writes_outs(outs, u64, q, __io_pbr
  #include <asm-generic/io.h>
 =20
  #ifdef CONFIG_MMU
- #define arch_memremap_wb(addr, size)	\
+ #define arch_memremap_wb(addr, size, flags)	\
 -	((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
 +	((__force void *)ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL)))
  #endif
 =20
  #endif /* _ASM_RISCV_IO_H */

--Sig_//o3eI9X5yHzr=7alZc8QveG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme76rAACgkQAVBC80lX
0GwJlQf+PAwgnAQ54ihzuS8tKXxB9IUx6ojp51wPc7zQijCiKvhSiOJcIwuzVMs2
mPYMhC2b2k2XAfq1FQQUDjiisqHaltP6HRM5gYXTnDjplQ7XQCStVDINBz13elqs
GLAZXVnKM/QK0RgS++IvRqatHGtYvq9leSTHP1KfkZFxP7yoWAQvK7QiVKRHK2Tg
dWuPrgRlOBlDRKE2hsU/CWNKg9NneGpzxMzmN1heNltf1o7m/W6t9jFjPZz/KRRY
uSzcKaUrMO3AQyTd4bUxTBUJZ+pgSwVR4r4pxoRNK/6Ce3Jo7ATM5FtvODabdAwB
9QBtODLyy9d/5KfvpN9CpuZhYc9iQQ==
=7Wi9
-----END PGP SIGNATURE-----

--Sig_//o3eI9X5yHzr=7alZc8QveG--

