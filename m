Return-Path: <linux-next+bounces-8443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD82B94FB1
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 10:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D653ACE11
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 08:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDA531A067;
	Tue, 23 Sep 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOZ4B6Sz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862172E92BC;
	Tue, 23 Sep 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615917; cv=none; b=qjlwauoPbcolZ+pzwaQYi3qMClDn1+SIUUld3pOZJFwrm14+Tmp8GMsL6JUQvkXq1BjePvjv2qHJ9MEBHMNDv8BOpk88kNytgJM2U6Vzp29u/rGlnShmicjQ2Aoc/Hh2XKTZCnzTfqMFVgG778dPJcN50ncHH71FTURZVYh2CJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615917; c=relaxed/simple;
	bh=1KxoaW/EcLZS47sGQu5UzHRHBrfWvPMybfW05JDkUpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7eed2Y06BUBTUwJsAdh1IwT43x2MIsGjDwRwv9S5E4DRmBNwqwZg+C4tqa+96LuLXPcH2cIxcLlBErbaUCIQcNNnOtT3OskhUJRJc7QlwO4ZyFquCc7tqckwFysOt7pCOG9BMu27t+Uho0XJZtmTdsqNOwvT/4s0eXNGlVlveM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOZ4B6Sz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE059C4CEF7;
	Tue, 23 Sep 2025 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758615917;
	bh=1KxoaW/EcLZS47sGQu5UzHRHBrfWvPMybfW05JDkUpI=;
	h=Date:From:To:Cc:Subject:From;
	b=TOZ4B6SzMPTNDbv2oRoIbEneZbf7Yrd9S658smlETRy7RuAvGGRjiJWmsUJeRTYsC
	 f2l4skVt2qbssr4rxrwHyujbtqnlUmjssFxmslFlNky+w0bpLNnfuzbbmS/s39LOvw
	 VCzL2cNmd1QmyCKAuVGY+DOk0T2PHJs2aPdPfO/p3vEuXNi64I5krH/jFnbh2sjO+v
	 rtZk69bafdW/2Cf98eiGkCu9oeJUErjCJMA0RBvoU7I86v2SmccjU0pN1RyNsyQp6t
	 aFHCrj4rG+Z1b2B8aH9pDbI0q94bQbBCJqJxPxxVHyNJ4o3wvIdxEVTDl29p4XtpSA
	 fJZkGa28uiImA==
Date: Tue, 23 Sep 2025 10:25:12 +0200
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the arm64 tree with the origin tree
Message-ID: <aNJZaJT9elF0TDqH@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qDGWo0Gy5vL9iDn"
Content-Disposition: inline


--3qDGWo0Gy5vL9iDn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/mmu.c

between commit:

  ceca927c86e6f ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc funct=
ion signature")

=66rom the origin tree and commit:

  fa93b45fd397e ("arm64: Enable vmalloc-huge with ptdump")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/mm/mmu.c
index 980d7745a5499,10c2580995814..0000000000000
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@@ -47,6 -49,15 +49,8 @@@
  #define NO_CONT_MAPPINGS	BIT(1)
  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
 =20
 -enum pgtable_type {
 -	TABLE_PTE,
 -	TABLE_PMD,
 -	TABLE_PUD,
 -	TABLE_P4D,
 -};
 -
+ DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
+=20
  u64 kimage_voffset __ro_after_init;
  EXPORT_SYMBOL(kimage_voffset);
 =20

--3qDGWo0Gy5vL9iDn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSWWcACgkQJNaLcl1U
h9B8Awf+ILotLHxH1AQ2QAUbjrb7+tvHmE0tMk0vyuJSAtSx86LzqN51oBNer8mb
E73rFfjrxcddcuyJ4172Fcj6/QOeqqOcdywg2+NXoCPPQ9MtTpOlBTFeR2ZmiCLb
2YouVwofr4QeNJrIRNFTamHhYxzGGp8UixiRJLhpltnONRY/dbFeb+WYEpEf3qHh
TUWEYty7EVhjayTwmVKBXM4KjA90G389EAxG5E67sRUEUdIFp1AJgGUswfORm/3l
XVR6U2KbVDdC7wJVhe8+mfQ4GCug6Rm+2dzQsZ4QJ0qEH5dTvWVQl7pxqUSQLNfJ
84JJYhRZQKRIXM1vVaNWYj/W0AslAg==
=MSuO
-----END PGP SIGNATURE-----

--3qDGWo0Gy5vL9iDn--

