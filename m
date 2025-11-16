Return-Path: <linux-next+bounces-9029-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D6C61E9F
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 23:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C4934E4C67
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 22:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3ED130B519;
	Sun, 16 Nov 2025 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SELfGjwS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9BF2FB62A;
	Sun, 16 Nov 2025 22:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763332581; cv=none; b=lO1+sOqlOkKw8TFjmbS0liuEcgPkCGkzzCFDoCWj2FPW28FX1ho06rCfnH3PnZSsvUOJ1G7P4w9IuxrNNoe+3MgTFXQPlSvTMlJfxF8FV+3y3ZVYi6zaN014manobJ3GDTTfTlHVDTVQ7MYnHFkXOEj6gqr6xqWCWL5UvHYwALg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763332581; c=relaxed/simple;
	bh=Im0LYRejsEhWed1ri23qJJ/IDE5Bd8fKFHvShWSL5gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WXerJoBu9HVnS0GuW8QOHYvyP42Lkj7mIBwTs/vydlPw2gqYwqBmV6FEnc6WTZiKe0gqmenyzuQYvnjj2i4NXEV+BjykceddZ1OWcI90sKiWJw5HU0HXqpvkbW1EF9uQr2Ejxb3D4GQXtj4PRSoGPuFQjYee72h7m1z2/LF2le0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SELfGjwS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763332575;
	bh=yHEPIWaDPdsA9fCxSqL5EKf7SETmx1Dnv8V9ay8bW5c=;
	h=Date:From:To:Cc:Subject:From;
	b=SELfGjwSEr1FZ9cDWK0OtHhOZOgwb2sjVAfm4XIq0aNW7AMmoFzaU6mkYgI94K/Y5
	 WDf48yIsKjs4wbEeLWJZCcvtTIMy0ZF17aWgwYw4v0nrLuv3zMmg6PKpaQYgRSlhNd
	 HGg3aJj0Cm6NHQlC7mIwAzYg2nW9dnyjIUkFUwtuRdN/v+2UZX0OSelTTpSgVYXgfv
	 r5gtFFvd6fwXBNYYy54MjPnnhH/XccQAKPAI0QKDnLovkG3K4ToOWNPsyZ5kqjJ7Nu
	 e0yXLXhhWJmp3JBAdwwhXUJM2AaOJGLxclScVUBmxtISI02ruXcj/dvX0wNX+U5hxi
	 Cp+m4EzUKEoBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8m1q2vpMz4w1j;
	Mon, 17 Nov 2025 09:36:15 +1100 (AEDT)
Date: Mon, 17 Nov 2025 09:36:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <20251117093614.1490d048@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BVxKPWLZbLGaigTWYJoKZKH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BVxKPWLZbLGaigTWYJoKZKH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(powerpc ppc64_defconfig) failed like this:

In file included from drivers/of/fdt.c:28:
include/linux/kexec_handover.h:99:7: warning: no previous prototype for 'kh=
o_alloc_preserve' [-Wmissing-prototypes]
   99 | void *kho_alloc_preserve(size_t size)
      |       ^~~~~~~~~~~~~~~~~~
include/linux/kexec_handover.h:104:6: warning: no previous prototype for 'k=
ho_unpreserve_free' [-Wmissing-prototypes]
  104 | void kho_unpreserve_free(void *mem) { }
      |      ^~~~~~~~~~~~~~~~~~~
include/linux/kexec_handover.h:105:6: warning: no previous prototype for 'k=
ho_restore_free' [-Wmissing-prototypes]
  105 | void kho_restore_free(void *mem) { }
      |      ^~~~~~~~~~~~~~~~
In file included from mm/mm_init.c:34:
include/linux/kexec_handover.h:99:7: warning: no previous prototype for 'kh=
o_alloc_preserve' [-Wmissing-prototypes]
   99 | void *kho_alloc_preserve(size_t size)
      |       ^~~~~~~~~~~~~~~~~~
include/linux/kexec_handover.h:104:6: warning: no previous prototype for 'k=
ho_unpreserve_free' [-Wmissing-prototypes]
  104 | void kho_unpreserve_free(void *mem) { }
      |      ^~~~~~~~~~~~~~~~~~~
include/linux/kexec_handover.h:105:6: warning: no previous prototype for 'k=
ho_restore_free' [-Wmissing-prototypes]
  105 | void kho_restore_free(void *mem) { }
      |      ^~~~~~~~~~~~~~~~
ld: drivers/of/fdt.o: in function `kho_alloc_preserve':
fdt.c:(.text+0x9c0): multiple definition of `kho_alloc_preserve'; mm/mm_ini=
t.o:mm_init.c:(.text+0x230): first defined here
ld: drivers/of/fdt.o: in function `kho_unpreserve_free':
fdt.c:(.text+0x9d0): multiple definition of `kho_unpreserve_free'; mm/mm_in=
it.o:mm_init.c:(.text+0x240): first defined here
ld: drivers/of/fdt.o: in function `kho_restore_free':
fdt.c:(.text+0x9e0): multiple definition of `kho_restore_free'; mm/mm_init.=
o:mm_init.c:(.text+0x250): first defined here

Caused by commit

  722b2ce4a04f ("kho: introduce high-level memory allocation API")

I have applied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Nov 2025 09:29:44 +1100
Subject: [PATCH] fix up for "kho: introduce high-level memory allocation AP=
I"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/kexec_handover.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 6dd0dcdf0ec1..5f7b9de97e8d 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -96,13 +96,13 @@ static inline int kho_preserve_vmalloc(void *ptr,
=20
 static inline void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation=
) { }
=20
-void *kho_alloc_preserve(size_t size)
+static inline void *kho_alloc_preserve(size_t size)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
=20
-void kho_unpreserve_free(void *mem) { }
-void kho_restore_free(void *mem) { }
+static inline void kho_unpreserve_free(void *mem) { }
+static inline void kho_restore_free(void *mem) { }
=20
 static inline struct folio *kho_restore_folio(phys_addr_t phys)
 {
--=20
2.51.1

As a review nitpicks on that commit:  please do not do unrelated
formatting changes.  Also, there was not real reason for moving the
types.h include.
--=20
Cheers,
Stephen Rothwell

--Sig_/BVxKPWLZbLGaigTWYJoKZKH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaUd4ACgkQAVBC80lX
0Gz7oQf9G6sWYKDORhv04We7O4RwQ2+Tq+ge7TOUTEDluW3vc5TH6Di2ot5MjEMF
aFEygLv9GBCPbijxnIrmYgYwUTaxvVz6DaRVbudAIhQBZrz8XSClv8Cdvonl2KRM
OSE8akDOgTKJXV7vVrPH6rjBmvelsCSF69uUiVCJQfcwRrK6anz7tbVz+/9+gK/2
ECkqJuHw+pRTqFoLs8ovDDJHnTPnsxoOUc+JjbbC37N1JwvzzI651hWH11EdkDZp
ustIdI6rJ30uW1KG0JNR4DAgJSxDHZY6Xokr1DKO4bPPzNq2PNla43mpRnaSiVdg
i0zJCemWB96fg1h+4KZ6t/UHnZld2A==
=UVh3
-----END PGP SIGNATURE-----

--Sig_/BVxKPWLZbLGaigTWYJoKZKH--

