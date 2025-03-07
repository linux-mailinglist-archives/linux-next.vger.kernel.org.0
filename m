Return-Path: <linux-next+bounces-5682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 052A0A55D1C
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 02:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 386921890DB6
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 01:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333891531E9;
	Fri,  7 Mar 2025 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tQFymny8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A329408;
	Fri,  7 Mar 2025 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741311002; cv=none; b=W4ObWdvPXlZ1PnNvSr3B63L5Fhv4KXz1ablF90QdsBHiAlzYl4O04OulzsrZbRxy5wF1y4HVSw6jjW3fN9QwgtXSJVkPNWTqNwu8Z1sBe4hObTk20xujUsZwSGpXDjG3Mk6mn9x2bO3lb8aY8VQL2RJN8Rm1dx6kOQhC309KAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741311002; c=relaxed/simple;
	bh=nIzILwBI/efRnEwRJEOpz5FhNWiACoYb5HPyYf5oDL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P6+oeRGyNF9G8Hr1Hi3Bu9SE3DM1D8R5swsQj7O/HBln5ea497QpZIot4H6RhjTy5Ek2kuXA0+4zzXSs0tLFfDI+ShQ7a6hTzbX5s7/TLxNnYaPmPzR+g6ZMu8vnd17KMxHEY6ySpFCE+dALUkbzLniIxh3FYTBMVbIru6XEfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tQFymny8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741310996;
	bh=5cpQP0hzTZtWeA8C7im5cMACSxvJjY3jAmD/qE1TD94=;
	h=Date:From:To:Cc:Subject:From;
	b=tQFymny8vzXAhaB0lvfY56YP1R55MPd2x4Qa7tkXocWnEMgafn/RszcU0bgitrCFD
	 9kijNNBVJCztmET7ZPJaYCV80E05/uMy+1quBGR0kYOlxDfReGR0PptEhwvjBGv/vx
	 r4NduCuWGSSZlnJnz97T1qaezGx9C31rzYZymSUBreTPvtnA76a05RZLvDiAb/4qIy
	 J7+kcXQDDMrgSi1yTFV2nppDHZCxjbG+fDB5g7mxb2r7b+lCMd5QOu2AIxNcE1SJPf
	 gqp/cAwaVpbJgr+BfSWtzvRMZF/g2JG4TNthyi59w56GZdfyjNJzWA1otumyEp8h09
	 mJuOMmuhcRLhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z87xv4qyhz4wcj;
	Fri,  7 Mar 2025 12:29:55 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:29:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the mm tree
Message-ID: <20250307122954.1ab65809@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A/UwyxC=0gWjqbYU.HO=+Ty";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A/UwyxC=0gWjqbYU.HO=+Ty
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  mm/memory.c

between commit:

  089b22f60a0f ("mm: allow compound zone device pages")

from the mm-unstable branch of the mm tree and commit:

  1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memory.c
index d21f6cded7e3,59b804f4bf3f..000000000000
--- a/mm/memory.c
+++ b/mm/memory.c
@@@ -4473,11 -4348,15 +4473,16 @@@ vm_fault_t do_swap_page(struct vm_faul
  			 * Get a page reference while we know the page can't be
  			 * freed.
  			 */
- 			get_page(vmf->page);
- 			pte_unmap_unlock(vmf->pte, vmf->ptl);
- 			pgmap =3D page_pgmap(vmf->page);
- 			ret =3D pgmap->ops->migrate_to_ram(vmf);
- 			put_page(vmf->page);
+ 			if (trylock_page(vmf->page)) {
+ 				get_page(vmf->page);
+ 				pte_unmap_unlock(vmf->pte, vmf->ptl);
 -				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
++				pgmap =3D page_pgmap(vmf->page);
++				ret =3D pgmap->ops->migrate_to_ram(vmf);
+ 				unlock_page(vmf->page);
+ 				put_page(vmf->page);
+ 			} else {
+ 				pte_unmap_unlock(vmf->pte, vmf->ptl);
+ 			}
  		} else if (is_hwpoison_entry(entry)) {
  			ret =3D VM_FAULT_HWPOISON;
  		} else if (is_pte_marker_entry(entry)) {

--Sig_/A/UwyxC=0gWjqbYU.HO=+Ty
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKTBMACgkQAVBC80lX
0GwClgf/Q9BEVvi4igkfRfnzd88WJnP0/H1ZUBjUBg1JbqnhBVkVq7jC0M2uSkH1
pqBP0dIZCLLz15is+6hsCvXnY9eHfwfz4J+zR8/UbIi4M2H4heU7VbePjXya7dnX
gGdSkib3/aII3f7Q+ApSvhYthtaVCX6sVgM3uz9qXSXlIkNI4XHUCFAGYXWHmPFV
342UUykdLzbXIlT3KPqNpU9ug66ZlF1utnRJDJhN9trCNdX706DsVKBm9tujGPaR
cD+G/3lRZd1NwIfHye+kc1rmamZtw2kdz38BbP4oAcWnVZ6gU9ijwygvb8ZERx8L
OF230OP5BYu2rsQPIQ26zj2kGvRqlw==
=0lSR
-----END PGP SIGNATURE-----

--Sig_/A/UwyxC=0gWjqbYU.HO=+Ty--

