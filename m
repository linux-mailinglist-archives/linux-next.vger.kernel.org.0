Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4300C30BAAC
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 10:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbhBBJLq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 04:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbhBBJEO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 04:04:14 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EC1C06174A;
        Tue,  2 Feb 2021 01:03:31 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVJkl6QkKz9vDk;
        Tue,  2 Feb 2021 20:03:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612256608;
        bh=LkGEdn3G9XkFSWbyhWVujX9kFVcDfghIIw0jyqRFbx4=;
        h=Date:From:To:Cc:Subject:From;
        b=OaoSPw87VwEWtXktuwOBvK9HrdMo6qcwT9PIcj3UPkeiIPjOOT26+U9bSR+7Gh+PB
         ZS0MnyPSk/HFsQ9EjndPU20h5pZdDQZZhQ6BAYtk0BefTR7Njk8RbuVvxXsDmtSpXa
         OaBiM7rJpRO+CKUtMgzDz6Uz6UelSUdWqi0Z23lujxCJoQUq3Ovw69eI9IvdkJPb5P
         y9HpxcSjXkz+MWDyoQN+RA3e7eOILeQLhWnSm4kZ7DabXwMDPQUuoEOUBO6S12S5wc
         S6UpO4gGT7rGnMZzxFq10pEG8LvhKx28b4K0f6RPA/sHYZmqeD+NZm0R+ZrmlSNTKK
         hnWukIj93A69A==
Date:   Tue, 2 Feb 2021 20:03:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Pavel Tatashin <pasha.tatashin@soleen.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210202200324.5179db33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m/DNo5z74tWRUFVrSWRD13z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m/DNo5z74tWRUFVrSWRD13z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allnoconfig) failed like this:

In file included from arch/x86/include/asm/page.h:76,
                 from arch/x86/include/asm/thread_info.h:12,
                 from include/linux/thread_info.h:56,
                 from arch/x86/include/asm/preempt.h:7,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:51,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/slab.h:15,
                 from include/linux/crypto.h:20,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/mm.h: In function 'is_pinnable_page':
include/asm-generic/memory_model.h:64:14: error: implicit declaration of fu=
nction 'page_to_section'; did you mean 'present_section'? [-Werror=3Dimplic=
it-function-declaration]
   64 |  int __sec =3D page_to_section(__pg);   \
      |              ^~~~~~~~~~~~~~~
include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__pa=
ge_to_pfn'
   81 | #define page_to_pfn __page_to_pfn
      |                     ^~~~~~~~~~~~~
include/linux/mm.h:1134:15: note: in expansion of macro 'page_to_pfn'
 1134 |   is_zero_pfn(page_to_pfn(page));
      |               ^~~~~~~~~~~
In file included from include/linux/kallsyms.h:12,
                 from include/linux/bpf.h:21,
                 from include/linux/bpf-cgroup.h:5,
                 from include/linux/cgroup-defs.h:22,
                 from include/linux/cgroup.h:28,
                 from include/linux/memcontrol.h:13,
                 from include/linux/swap.h:9,
                 from include/linux/suspend.h:5,
                 from arch/x86/kernel/asm-offsets.c:13:
include/linux/mm.h: At top level:
include/linux/mm.h:1505:29: error: conflicting types for 'page_to_section'
 1505 | static inline unsigned long page_to_section(const struct page *page)
      |                             ^~~~~~~~~~~~~~~
In file included from arch/x86/include/asm/page.h:76,
                 from arch/x86/include/asm/thread_info.h:12,
                 from include/linux/thread_info.h:56,
                 from arch/x86/include/asm/preempt.h:7,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:51,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/slab.h:15,
                 from include/linux/crypto.h:20,
                 from arch/x86/kernel/asm-offsets.c:9:
include/asm-generic/memory_model.h:64:14: note: previous implicit declarati=
on of 'page_to_section' was here
   64 |  int __sec =3D page_to_section(__pg);   \
      |              ^~~~~~~~~~~~~~~
include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__pa=
ge_to_pfn'
   81 | #define page_to_pfn __page_to_pfn
      |                     ^~~~~~~~~~~~~
include/linux/mm.h:1134:15: note: in expansion of macro 'page_to_pfn'
 1134 |   is_zero_pfn(page_to_pfn(page));
      |               ^~~~~~~~~~~

This build has CONFIG_SPARSEMEM set and CONFIG_SPARSEMEM_VMEMMAP not set.

Caused by commit

  983cb10d3f90 ("mm/gup: do not migrate zero page")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Feb 2021 19:49:00 +1100
Subject: [PATCH] make is_pinnable_page a macro

As it is currently defined before page_to_section() which it needs.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/mm.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 58f250cabea6..a608feb0d42e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1128,11 +1128,9 @@ static inline bool is_zone_movable_page(const struct=
 page *page)
 }
=20
 /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
-static inline bool is_pinnable_page(struct page *page)
-{
-	return !(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||
-		is_zero_pfn(page_to_pfn(page));
-}
+#define is_pinnable_page(page)		\
+	(!(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||	\
+		is_zero_pfn(page_to_pfn(page)))
=20
 #ifdef CONFIG_DEV_PAGEMAP_OPS
 void free_devmap_managed_page(struct page *page);
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/m/DNo5z74tWRUFVrSWRD13z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAZFVwACgkQAVBC80lX
0GynIwf+KEHZSn4OrHDfR4Gsm5WEJxPJN2ZoYwu/9WZCPTyeWBc2XqGC3yxTquqN
x141EV4htqifUL1o3mMKVaSZW5xYEKlnyNxAKbZ9SSB8kGVSeDFavd94fLlw4gpd
cAsS3kL/2F8T4BgTy4Y1RzA1PDjIIPHjZ4PQtm1ggrrOnUpvfFFZzlNBySwXMejk
sgpRIXF6mXDl+wFEJ+Wy+jtUTcrqVbGbuFhbkVHXUjdX9qlmbEB5zQuLvbqEVT5q
qT8dQbpfIdI5F3V/HBovJ4SjBZeGYbVflQcnvRGzMBxKk71bmaDW/Ts/qd104oR+
WXo0pAfT+KEHJoOfHEaaHnfUvErz9g==
=99rG
-----END PGP SIGNATURE-----

--Sig_/m/DNo5z74tWRUFVrSWRD13z--
