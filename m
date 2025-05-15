Return-Path: <linux-next+bounces-6780-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96566AB7CDF
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 07:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 620CC4A8514
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 05:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98A12853E3;
	Thu, 15 May 2025 05:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wbbx+Yhl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C14B1E49;
	Thu, 15 May 2025 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747285880; cv=none; b=QsGWW7ymTkjO0InW0YGob4/sHqMfxFZhJckpJMFXHRANvsAXBNq1kZtyXiVVBgeznJe4znQfnE6twnRbJB9Fitl9g+7YOvrixLiy1Zkiv8atVrUgycNi0J5yiWK0acc/ztirTk7zV/qY9EhcgrMJmDBTFXmOW0rx9zmqIb1opD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747285880; c=relaxed/simple;
	bh=UyCByibD79o8AQFvGvbDJw48A+QFK+7qUwqe8Kih4/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gP6BebVi4t/xRfu36vLakbmR9dw7Us8v4+nCrVeazB/PYq35fjXcMgRnRRqnWQlB2EuGZONXz22af/CHI2IKtEphTgagJj/ECufto75g0WSENRcCA/+zPWvnBRraA+wtqMAD6szqCZ3Lssb3iRmLFtjUnftesFwPu7bfYf691ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wbbx+Yhl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747285865;
	bh=naIQdwB5C3q1qo6nZ1pcQoxrLu8WIjiBO/sXTkCZcF0=;
	h=Date:From:To:Cc:Subject:From;
	b=Wbbx+Yhl7jhzwtKyLLD4pjIO+r5orcP1Hr2XJdvPCVyPAmWaqdmgATNzZrYbUKa1I
	 rrt2RWhUC7n+cBrzIYMngKzUqAlkOokkbGyQBSwZto5YhcqvMEY3qtSuTLEA2z/qmg
	 kZoV5OR5hZQN9/h2EBc16T3giTYvoaW2/igrRWwA3lgTLV/bMNLuzu4dBu0II/Skr4
	 XyORn7rwKgInc6sQdR4rp3OjXyQ9UXZItK0UUeh/wEgDVtGFb/j9oV2jDvLOw9tA0O
	 CxAP9P8DdchWC+bhxPSZw3q3IRJqbzqJSwnlHMIJc8TsG9pBKgpPnEvr2qm9S0el+u
	 sW2EFMiif7lfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZydbD56kpz4x1w;
	Thu, 15 May 2025 15:11:04 +1000 (AEST)
Date: Thu, 15 May 2025 15:11:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the mm-unstable tree
Message-ID: <20250515151102.5b0f9e4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MpjZ0GK=/qz8kDBP6jN=9h6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MpjZ0GK=/qz8kDBP6jN=9h6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/mm/pat/memtype.c

between commit:

  f387f960a89a ("x86/mm/pat: factor out setting cachemode into pgprot_set_c=
achemode()")

from the mm-unstable tree and commit:

  1b3f2bd04d90 ("x86/devmem: Remove duplicate range_is_allowed() definition=
")

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

diff --cc arch/x86/mm/pat/memtype.c
index ccc55c00b4c8,c97b527c66fe..000000000000
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@@ -773,39 -775,6 +775,12 @@@ pgprot_t phys_mem_access_prot(struct fi
  	return vma_prot;
  }
 =20
- #ifdef CONFIG_STRICT_DEVMEM
- /* This check is done in drivers/char/mem.c in case of STRICT_DEVMEM */
- static inline int range_is_allowed(unsigned long pfn, unsigned long size)
- {
- 	return 1;
- }
- #else
- /* This check is needed to avoid cache aliasing when PAT is enabled */
- static inline int range_is_allowed(unsigned long pfn, unsigned long size)
- {
- 	u64 from =3D ((u64)pfn) << PAGE_SHIFT;
- 	u64 to =3D from + size;
- 	u64 cursor =3D from;
-=20
- 	if (!pat_enabled())
- 		return 1;
-=20
- 	while (cursor < to) {
- 		if (!devmem_is_allowed(pfn))
- 			return 0;
- 		cursor +=3D PAGE_SIZE;
- 		pfn++;
- 	}
- 	return 1;
- }
- #endif /* CONFIG_STRICT_DEVMEM */
-=20
 +static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_m=
ode pcm)
 +{
 +	*prot =3D __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
 +			 cachemode2protval(pcm));
 +}
 +
  int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
  				unsigned long size, pgprot_t *vma_prot)
  {

--Sig_/MpjZ0GK=/qz8kDBP6jN=9h6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgld2YACgkQAVBC80lX
0Gzm/gf/YlSM92R6fMKVBw8E8RIh8F9sKnEiUOwUyTujRmdsVWr5bdXcRIUFKqNG
nsvRmN5lXJZD2BGs9Z60hQkUOqDiDP0E1AVPFQP74RM4OY+UVu6TpZl9/IPeUsql
TkLukgCivKC3NRs2FbMXPlNEduqFLFKvH9vD73gGxu9EdwdC6hal6T09VWZnMW/J
/4ver3QbAtprWwn9BodMWjqsyo+SKGX97RmOLAhu5duKoPhtVPZ8cHNJbgLGoE+q
ZKUIW2MrKg7fQIqNlMF36ih+EcpzLqz89a8U8rJ+yVYywrkNXK7iPPu4qIK5wJnQ
0AGojISLYPBUYgqE5U8KP17j9Vx1iA==
=s5zr
-----END PGP SIGNATURE-----

--Sig_/MpjZ0GK=/qz8kDBP6jN=9h6--

