Return-Path: <linux-next+bounces-6724-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DAAB4BBD
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 08:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81B833B691B
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 06:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2401EB196;
	Tue, 13 May 2025 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q1HwPYTA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D371B3956;
	Tue, 13 May 2025 06:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116627; cv=none; b=Z/FlquKjubxolam+oCxEAuVhCU2JzB+X57jsyFTU8CIpny4Ozj6pLdQnwQuK/f9jncUyQmn8liLmLbHYZ9kSTidkKN4E0uijqPqHRGD+ZQLY9iDj9+UpfWQOco5rNdXnFQsnh9u3hpZS0TA3HeSKWZWbzcHThf9IVu/NKtsPBuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116627; c=relaxed/simple;
	bh=pp/g36CGeCan1Eh/sxlUoxIv6TI4DTTer5csaOg+IYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jCMzhy/M8yh2fVhN5oiooe1JWVPGtpioDrFXNsc+diWJWHtt/KFtZ2rxD5X+deUCIbvBqjt9LWFG/qIfUjptZwIkf2DtvFDhnngBkFG4pP6mfDXxUSDiikgL4J/jagVjc3mirFh1Ujc2KKbi9PZM7I2ilbxo312UN/rB8V6y3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Q1HwPYTA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747116621;
	bh=zckOA6qotZ8O2PcXu2tqk96ixCz/VZ7YSefpJVgwM5A=;
	h=Date:From:To:Cc:Subject:From;
	b=Q1HwPYTA80nuhbP9rj/wkd0m0RIuON8BNin8uzlr+11XS5UiSUcnAWzILCzHzKPLa
	 0kg6zbR2ghSudm9yAGSVxI2cR4doZWUL2RQ/g9Zwr+MMPOr3Eyns9e0/vJL5XyIkoW
	 oUQMH25zYbssPKH6jgSubDu9ZjqXVepIngwJbczJBl/J8Xl7QhJaeY42UG2Vd311ho
	 zl14EwaJxHPVhqk03tdOn+i76i8/yf7Yx1WNjZNpVMriuV1BWkwWOzmAq5S0fmmmLK
	 /N0dn0QtEuh43fJq4y7fWbA7mY8WsvbcqCYRkSFB4diHCcB2uwO2mmNU2gjhcW4fhh
	 /oeYlIxviD1rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxR0X501Cz4wcx;
	Tue, 13 May 2025 16:10:20 +1000 (AEST)
Date: Tue, 13 May 2025 16:10:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513161020.4e97ddde@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_XF9DEQC5hYZD1=Q_MSsa_N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_XF9DEQC5hYZD1=Q_MSsa_N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/alternative.c

between commits:

  ebebe30794d3 ("x86/ibt: Keep IBT disabled during alternative patching")
  872df34d7c51 ("x86/its: Use dynamic thunks for indirect branches")

from Linus' tree and commit:

  db5c68c88c07 ("x86/alternatives: Simplify the #include section")

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

diff --cc arch/x86/kernel/alternative.c
index 48fd04e90114,ddbc303e41e3..000000000000
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@@ -1,39 -1,14 +1,17 @@@
  // SPDX-License-Identifier: GPL-2.0-only
  #define pr_fmt(fmt) "SMP alternatives: " fmt
 =20
- #include <linux/module.h>
- #include <linux/sched.h>
+ #include <linux/mmu_context.h>
  #include <linux/perf_event.h>
- #include <linux/mutex.h>
- #include <linux/list.h>
- #include <linux/stringify.h>
- #include <linux/highmem.h>
- #include <linux/mm.h>
  #include <linux/vmalloc.h>
  #include <linux/memory.h>
- #include <linux/stop_machine.h>
- #include <linux/slab.h>
- #include <linux/kdebug.h>
- #include <linux/kprobes.h>
- #include <linux/mmu_context.h>
- #include <linux/bsearch.h>
- #include <linux/sync_core.h>
 +#include <linux/execmem.h>
+=20
  #include <asm/text-patching.h>
- #include <asm/alternative.h>
- #include <asm/sections.h>
- #include <asm/mce.h>
- #include <asm/nmi.h>
- #include <asm/cacheflush.h>
- #include <asm/tlbflush.h>
  #include <asm/insn.h>
- #include <asm/io.h>
- #include <asm/fixmap.h>
- #include <asm/paravirt.h>
- #include <asm/asm-prototypes.h>
- #include <asm/cfi.h>
+ #include <asm/nmi.h>
 +#include <asm/ibt.h>
 +#include <asm/set_memory.h>
 =20
  int __read_mostly alternatives_patched;
 =20

--Sig_/_XF9DEQC5hYZD1=Q_MSsa_N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgi4kwACgkQAVBC80lX
0GyBoQf+ODp5g1CBRnf+VzyeC2Y0VzH/MGS5+9VHeerQ4R3iL94bkEAEsz6qhz5t
FGocShFVytJnjfdDDQi9RlF2A6YKXAT1Xw4QVtyu+DUBlw6f+dqzyQ+DRRPsoHPL
v33/dNuECMO9+jpJxJiVYaSbqQCOiTzbV2BsFNWcS7JLSlhQZx4D0d/aavGTYXiP
Oe+bfP+ikh/NDSuIWv5Edzw5B9Rvux+XXPh0MMT1FfOBRwG6mo/21Or1qLiJ6Nca
psUw24Cm91Z8Cjn24Vpya5502+961F2LfetGn88KnkBzZz7UDKWb/O6eZ97YVshO
ktZEOGQv5WojZunjtTAcGt13sDGR2Q==
=xy/+
-----END PGP SIGNATURE-----

--Sig_/_XF9DEQC5hYZD1=Q_MSsa_N--

