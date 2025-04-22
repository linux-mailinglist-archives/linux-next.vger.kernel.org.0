Return-Path: <linux-next+bounces-6303-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C86FA95C48
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 04:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6868416C48A
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 02:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625FF8634A;
	Tue, 22 Apr 2025 02:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="klMqPDLF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1E6DCE1;
	Tue, 22 Apr 2025 02:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289848; cv=none; b=TUz+NgCM2jII5lVkerSQmFXyNSJuYwVrzAArRKB4YDx2TSyE9Xi2diYZns26qGz0R8rv/oo3wXe+foQcQnXV5e8Sdw5uQhYdMitv5DyRHideuLcoAWAcDFdbul91l+JLIO4nK6NVMJHeUR2pIjsA7Gnbstwxx9OFVDee8p61xpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289848; c=relaxed/simple;
	bh=s44alH5hPjK2Gefh1TQEn8UKPGMiG3Z9tG4G+qwTgfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P+8bnXVtEKp1raSo3EeFUHP48V2gs+fj/Zp5aMjVS8zRBv/ULiKqeOZ7i9nWCOnXMQCiKrkGX7G5Gtvsq7gAN8cZuDKoaxmTIa3MbytZbsJduGRctiZ2mEGy5vnoHS81/rUUg8/l3WMnb3zjtD1xdoqMswiuVn8fsRGW/JGP0As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=klMqPDLF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745289843;
	bh=/RE1MQNTvfKl06CaGtYl0HbZyTjcSdvmmrxQ2kVUrq4=;
	h=Date:From:To:Cc:Subject:From;
	b=klMqPDLFcPjPsJ1u1O8DjTqJOFND61arOa/pOgaEqFbhim3bgVJql97jCdmnfJwgx
	 ChdPzZLvaPSRDSs5VCs/X3xDjTV3xsxMNwtuyjZedQnnHm9zfl+6TZLahtlbTDkT8x
	 vSPFfkByWKf8kcY33veOin9EDk/iTTi3aOco/P8clBIm0V/YDN5002Dl02iW3vL0va
	 uRZGS2Ug4R6KjZjk6xwcV73Udi3iAiCIBng38JBG5RD/e94+kXowJsEqLN4IEywMyh
	 om6xcOzjmsiX7r3V77yXSOR+10lCK2GacjrF4dGpOrPdrLEaIzIiIg+Mpyf1mULwRH
	 tHdbXeilxI5+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhRQC0mMdz4wnp;
	Tue, 22 Apr 2025 12:44:02 +1000 (AEST)
Date: Tue, 22 Apr 2025 12:44:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Graf <graf@amazon.com>, Changyuan Lyu <changyuanl@google.com>,
 Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: linux-next: manual merge of the mm-unstable tree with the tip-fixes
 tree
Message-ID: <20250422124402.4b891d14@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qUc2LQFQGpw/usxMr3jV2Mj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qUc2LQFQGpw/usxMr3jV2Mj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  arch/x86/kernel/e820.c

between commit:

  83b2d345e178 ("x86/e820: Discard high memory that can't be addressed by 3=
2-bit systems")

from the tip-fixes tree and commit:

  5a64fe1a39e7 ("x86: add KHO support")

from the mm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/e820.c
index 9920122018a0,7d1c74681c61..000000000000
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@@ -1299,14 -1299,24 +1299,32 @@@ void __init e820__memblock_setup(void
  		memblock_add(entry->addr, entry->size);
  	}
 =20
 +	/*
 +	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and
 +	 * to even less without it.
 +	 * Discard memory after max_pfn - the actual limit detected at runtime.
 +	 */
 +	if (IS_ENABLED(CONFIG_X86_32))
 +		memblock_remove(PFN_PHYS(max_pfn), -1);
 +
+ 	/*
+ 	 * At this point with KHO we only allocate from scratch memory.
+ 	 * At the same time, we configure memblock to only allow
+ 	 * allocations from memory below ISA_END_ADDRESS which is not
+ 	 * a natural scratch region, because Linux ignores memory below
+ 	 * ISA_END_ADDRESS at runtime. Beside very few (if any) early
+ 	 * allocations, we must allocate real-mode trapoline below
+ 	 * ISA_END_ADDRESS.
+ 	 *
+ 	 * To make sure that we can actually perform allocations during
+ 	 * this phase, let's mark memory below ISA_END_ADDRESS as scratch
+ 	 * so we can allocate from there in a scratch-only world.
+ 	 *
+ 	 * After real mode trampoline is allocated, we clear scratch
+ 	 * marking from the memory below ISA_END_ADDRESS
+ 	 */
+ 	memblock_mark_kho_scratch(0, ISA_END_ADDRESS);
+=20
  	/* Throw away partial pages: */
  	memblock_trim_memory(PAGE_SIZE);
 =20

--Sig_/qUc2LQFQGpw/usxMr3jV2Mj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHAnIACgkQAVBC80lX
0GzNggf/SK32T88vQ/qrbtWbPVWhsvrtJLvLPX4vBBXFiU4LZzVGWKGMuyeIbMKJ
ea1686XIk7VkKH5EC6S+sN/CQHKX9qsKTAIewmOnF6OlTg8qax5RxkKWlaYJMcL9
HeT6ciySSQJk0TLsnGgaJTs/+AA4nn4tqIwtm+ZqHasRRwQTJMbXWHivOlf0JMrg
NETkknV9A745z3qyS+UpC9mMdQ8r0iTTh5c4FLpAFWfc+qWJjM0/Ca9xI8KADqIa
pAwqMJbegJ5TKmIQqHfAQbmSJGv5fUG7QlffFHXdtQABKgGW75D1kTyap516YV7P
fJxvvAvruARuCTF5+rEqz3b4w2c71Q==
=aoOK
-----END PGP SIGNATURE-----

--Sig_/qUc2LQFQGpw/usxMr3jV2Mj--

