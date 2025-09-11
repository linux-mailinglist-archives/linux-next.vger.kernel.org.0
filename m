Return-Path: <linux-next+bounces-8258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F73B52873
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 08:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00D7E3A4994
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 06:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC64A178372;
	Thu, 11 Sep 2025 06:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="egD6PsJp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFD221FCD;
	Thu, 11 Sep 2025 06:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757570717; cv=none; b=aekZXREa6ZYnFo+RR9sqVBhF9yuHTcSajmyOkIfgDtx/a21A7maAUNpRVPbT/ZbsaqKbBE8GZsCfvTOg4LeVNPVwx8pCWJ4kb9q4M9HZcV0D2Jq9h1dPCYkobrW6ebf3uMdaoIkcT1dRgIdEHxPMXcwZ3+D88fj/scEX4VdxJtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757570717; c=relaxed/simple;
	bh=Z08sFURt9S9mFoc/QRFGDsQa6qWAHAR5uQQeYIf7zMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TENFc+GHUwPUeJ4epj4zjT3/QtnxYiXKtL/POBjMksZR+ouBCRCQ0BCfp5qhhv+iin1Mo6KHtzudJ8mhsRCXCOp3n/XyepxMKSTe4IxtwhGLwx7NqMOurxEtidYxcgYQmFUe3dA/Tt12HNoSho+hBqw6tlb/eSXggvzoIBAj9q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=egD6PsJp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757570712;
	bh=p9s3VeyY2Ow/DIku5b8bUl2n+q/I7NKxVJWyJAeHZrU=;
	h=Date:From:To:Cc:Subject:From;
	b=egD6PsJpf4owJvZtgqS0RcUpfOu8xYAEOpuC3GP3MgsRO6oNE50UMECOu6emv8SNP
	 EYEPOMEeUsQmwy2Wn4x3SqCn4NGFqWeTYBlR7s45TSP+ESyhvHQneXoQTejBh5vLU5
	 lRiCs/c94TGKGRVXej6r8T/GJLUFc/DDqoHXJtYZuzEYnhUqtdvVnf9FUrg52JJVLu
	 SdVZ+2cd1yegezz190Y0SIbP4a7TgaAaiWWUTL1F/1b4EmnEnEb+jXbrhUMfLZ+xwq
	 2RMyNCl5H2XLkpHr2AYl2gJvsMdo8vt/78m3ZSN/eljj/m0Gx9c1DfA6ZRESTovCGq
	 gJ9j4qh2jlfbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMn8l58qjz4w1h;
	Thu, 11 Sep 2025 16:05:10 +1000 (AEST)
Date: Thu, 11 Sep 2025 16:05:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-unstable tree
Message-ID: <20250911160510.07ba9ba1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LebjjDso0PeoVj7E9=r+25/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LebjjDso0PeoVj7E9=r+25/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (x86_64
allnoconfig) failed like this:

In file included from mm/shmem.c:44:
mm/swap.h: In function 'folio_index':
mm/swap.h:462:24: error: implicit declaration of function 'swp_offset'; did=
 you mean 'pud_offset'? [-Wimplicit-function-declaration]
  462 |                 return swp_offset(folio->swap);
      |                        ^~~~~~~~~~
      |                        pud_offset
In file included from mm/shmem.c:69:
include/linux/swapops.h: At top level:
include/linux/swapops.h:107:23: error: conflicting types for 'swp_offset'; =
have 'long unsigned int(swp_entry_t)'
  107 | static inline pgoff_t swp_offset(swp_entry_t entry)
      |                       ^~~~~~~~~~
mm/swap.h:462:24: note: previous implicit declaration of 'swp_offset' with =
type 'int()'
  462 |                 return swp_offset(folio->swap);
      |                        ^~~~~~~~~~

Caused by commit

  c2079bb89a0c ("mm, swap: use the swap table for the swap cache and switch=
 API")

but not fixed by commit

  9b84186b7053 ("mm-swap-use-the-swap-table-for-the-swap-cache-and-switch-a=
pi-fix")

I applied this hack:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 11 Sep 2025 15:51:25 +1000
Subject: [PATCH] hack for "mm, swap: use the swap table for the swap cache =
and
 switch API"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/swap.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swap.h b/mm/swap.h
index ad339547ee8c..8428026aa8d7 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -458,8 +458,10 @@ static inline int non_swapcache_batch(swp_entry_t entr=
y, int max_nr)
 static inline pgoff_t folio_index(struct folio *folio)
 {
 #ifdef CONFIG_MMU
+#ifdef CONFIG_SWAP
 	if (unlikely(folio_test_swapcache(folio)))
 		return swp_offset(folio->swap);
+#endif
 #endif
 	return folio->index;
 }
--=20
2.51.0

--=20
Cheers,
Stephen Rothwell

--Sig_/LebjjDso0PeoVj7E9=r+25/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCZpYACgkQAVBC80lX
0Gy4Xwf/bcbhshM6lDRoqRvRDwp6B62pZZ9I7FZ8zW9vMM/rYFRMulbAQTN50xWM
Wj0Kd2Sg7rhmLxjo1+SSsfpKdP8MRQZPTz+CQ6GcHlXnfzkHjViJs+YySi+FQjmT
PzaJvj2fPLLz3CjYMmJrAwuelhbFVr+nFYHV969zBm1M17tmRTqsm7Ox7q1oRIH/
H/56l0r20b64Pd8Na4BpRsDeVOOK8+2XtpCsvtn8hmXX9fD8GuWReZAjZ3OwOXDT
25prDen1zR9diMRieWi/E9evDhStqIJiGV9NGi3w4oKf0DU2/alRjmm1OblQlzez
6sI0lyHlVvyiAeSzaK4bDaRg0QyqWw==
=OqWk
-----END PGP SIGNATURE-----

--Sig_/LebjjDso0PeoVj7E9=r+25/--

