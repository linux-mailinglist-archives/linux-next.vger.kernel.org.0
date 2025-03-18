Return-Path: <linux-next+bounces-5870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CEAA680EF
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 00:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E69C63B7D45
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 23:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A3B1E1E0C;
	Tue, 18 Mar 2025 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oAMWXYQG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34420967A;
	Tue, 18 Mar 2025 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742342164; cv=none; b=pgIY+0REFXlHYvBveGAJ3eEdv7qAkLZSsQIkcWpc0wchVlnwVplUQWPol//N5025bZvMEV4zWJueDaWz0y8ctD+kiuPMBlM/Y8nrMj5SHZPPFXCsI85jG+VdRx8fOEGbNnzbg67qjFgknPmOnW1FeV3x1Kqt+UBUBCTYb8ZfE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742342164; c=relaxed/simple;
	bh=M0gI/4yjsvGQVF80+iuvHPQ2LddemwiHvGAalbEGVzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SzfN7Qk33F9AacI0py5EjgxGruCIK+CkVSL2efoOVFlcd5wIukjmnP4qqrGtpiSdv4Dwm6mI5Ip3GNslUAl+oV4plUasVrQkGIqfGUoqHDlfjfY7l7wPO4AtcBfUO5yERHMEroTSdTjFg9+SIAZdxqFKpvz4Y44P809csh9MzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oAMWXYQG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742342156;
	bh=J+V8rL9jz+n7gilDgiJ+rGR+wB5H9KQjnGPL4rL+1jU=;
	h=Date:From:To:Cc:Subject:From;
	b=oAMWXYQGnCQnXK20OJd00XTnWeyhLDdaa2D8RR74drtGUDYgmIFvFtNVbTYUsPay3
	 DaDrlvGGIWpzngm7CYkaJuGXn0nTYOQqLkhsiHu0CcsRL7IE+BRJ394Jfm0dmdONx4
	 CkzrLwDtKbV7xGh2F49rzLVHcXpPdd4/ujnqBgzPKJqwKUJWYJ+x/SUURHJ3+zu4E+
	 88ije4+T/nhugIpZgWku6XVm8mpfqbJBaroxaim9R04RQ/GpWKkoqJN1BwYw2iiQR4
	 7h8+fTG3oXnSrD7w2xSO3wDg99nz2rhh1TzGBHAoNKwodCcOZwEIMCMyAAL+3UpOge
	 KGvBZg2tvsSFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHTHw0c3wz4wcQ;
	Wed, 19 Mar 2025 10:55:55 +1100 (AEDT)
Date: Wed, 19 Mar 2025 10:55:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard@nod.at>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Johannes Berg <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Tiwei Bie <tiwei.btw@antgroup.com>
Subject: linux-next: manual merge of the uml tree with the mm-stable tree
Message-ID: <20250319105554.2e2f3aab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZbAnwmoEY9mjMjheWg_Q+84";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZbAnwmoEY9mjMjheWg_Q+84
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the uml tree got a conflict in:

  arch/um/kernel/mem.c

between commits:

  0d98484ee333 ("arch, mm: introduce arch_mm_preinit")
  8afa901c147a ("arch, mm: make releasing of memory to page allocator more =
explicit")

from the mm-stable tree and commit:

  e82cf3051e61 ("um: Update min_low_pfn to match changes in uml_reserved")

from the uml tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/um/kernel/mem.c
index 379f33a1babf,61b5a5ede01c..000000000000
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@@ -66,11 -68,11 +68,12 @@@ void __init arch_mm_preinit(void
  	map_memory(brk_end, __pa(brk_end), uml_reserved - brk_end, 1, 1, 0);
  	memblock_free((void *)brk_end, uml_reserved - brk_end);
  	uml_reserved =3D brk_end;
+ 	min_low_pfn =3D PFN_UP(__pa(uml_reserved));
 -
 -	/* this will put all low memory onto the freelists */
 -	memblock_free_all();
  	max_pfn =3D max_low_pfn;
 +}
 +
 +void __init mem_init(void)
 +{
  	kmalloc_ok =3D 1;
  }
 =20

--Sig_/ZbAnwmoEY9mjMjheWg_Q+84
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfaCAoACgkQAVBC80lX
0GxyOQf9H+NJWWL+iQJXJt2VQZpnbu+VnCzNDN5IQVVuPdKmRvHHozBNHy+Tc/8R
nZEHDazzyshpBzKl+bB9RibZ0zS3mxyojwG9wByMqLJvdlZgDGJ3zrMGGUocZRTj
ksQlxXRaFt+Pb8yfSWLzdjIzV9uq5G0JnnpW+ctmvvhX474vhfXAnNXSSDF2FjXC
Nf0giahocLujA1uI+amEsMn0svjVC5fpICRSOEBWCac31QgFhte5Rb46fsLr7vZI
1HoIEUJzkqjrG3jiPPBpeXatrKQuyJHsilLxP75gRrhy5bMlXda5mpR3wwejoPAR
yU7o0BWLGWD+HUSMdFL/7cZqwxeicQ==
=iPYZ
-----END PGP SIGNATURE-----

--Sig_/ZbAnwmoEY9mjMjheWg_Q+84--

