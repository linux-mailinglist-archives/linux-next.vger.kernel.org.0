Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B73930E955
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 02:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhBDBSk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 20:18:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44433 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233875AbhBDBSd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 20:18:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWLJW63ZHz9sXb;
        Thu,  4 Feb 2021 12:17:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612401469;
        bh=Thzv1wecPxFW+W92fO1yjrf1Ck6Dqwnm1Zn/XPLdGzQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IE02BOkrHMWmm7fksQHxaGZ4/EAIcH0gawQe6zbNHAoCfgbutCguF+Kcrzs7cRFur
         a1ivqRVW15XZRo6SOtiQSTLvtHZ9n4EWkeEcwERyysDQzgCd5vna96qXZ0ohrMSDBr
         kEzCFlr0yEwsOf0SYftTvFYK342N5hUcT6d1luD8MK+YpLHmT5TFlS5UanQ9SBZMx1
         qwQzqK9F9BPRxZ7hu6SDpBfmRa3RfLA1pFpQBlpMzf4HjwdudvvfoZgWbSise5oQ9t
         drXckoTIJ3FdZ1FNM2E2G5rND8i5IvBCx5a1Ri5sq4yaDaJ3wM4gopiJansAEQ2vzV
         D+aJ7hDGhtLWQ==
Date:   Thu, 4 Feb 2021 12:17:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Pavel Tatashin <pasha.tatashin@soleen.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210204121745.598a0588@canb.auug.org.au>
In-Reply-To: <20210202200324.5179db33@canb.auug.org.au>
References: <20210202200324.5179db33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OWSc.x.P3_aT.GjI8jXE4ni";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OWSc.x.P3_aT.GjI8jXE4ni
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Feb 2021 20:03:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
>=20
> In file included from arch/x86/include/asm/page.h:76,
>                  from arch/x86/include/asm/thread_info.h:12,
>                  from include/linux/thread_info.h:56,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:51,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from include/linux/crypto.h:20,
>                  from arch/x86/kernel/asm-offsets.c:9:
> include/linux/mm.h: In function 'is_pinnable_page':
> include/asm-generic/memory_model.h:64:14: error: implicit declaration of =
function 'page_to_section'; did you mean 'present_section'? [-Werror=3Dimpl=
icit-function-declaration]
>    64 |  int __sec =3D page_to_section(__pg);   \
>       |              ^~~~~~~~~~~~~~~
> include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__=
page_to_pfn'
>    81 | #define page_to_pfn __page_to_pfn
>       |                     ^~~~~~~~~~~~~
> include/linux/mm.h:1134:15: note: in expansion of macro 'page_to_pfn'
>  1134 |   is_zero_pfn(page_to_pfn(page));
>       |               ^~~~~~~~~~~
> In file included from include/linux/kallsyms.h:12,
>                  from include/linux/bpf.h:21,
>                  from include/linux/bpf-cgroup.h:5,
>                  from include/linux/cgroup-defs.h:22,
>                  from include/linux/cgroup.h:28,
>                  from include/linux/memcontrol.h:13,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from arch/x86/kernel/asm-offsets.c:13:
> include/linux/mm.h: At top level:
> include/linux/mm.h:1505:29: error: conflicting types for 'page_to_section'
>  1505 | static inline unsigned long page_to_section(const struct page *pa=
ge)
>       |                             ^~~~~~~~~~~~~~~
> In file included from arch/x86/include/asm/page.h:76,
>                  from arch/x86/include/asm/thread_info.h:12,
>                  from include/linux/thread_info.h:56,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:51,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from include/linux/crypto.h:20,
>                  from arch/x86/kernel/asm-offsets.c:9:
> include/asm-generic/memory_model.h:64:14: note: previous implicit declara=
tion of 'page_to_section' was here
>    64 |  int __sec =3D page_to_section(__pg);   \
>       |              ^~~~~~~~~~~~~~~
> include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__=
page_to_pfn'
>    81 | #define page_to_pfn __page_to_pfn
>       |                     ^~~~~~~~~~~~~
> include/linux/mm.h:1134:15: note: in expansion of macro 'page_to_pfn'
>  1134 |   is_zero_pfn(page_to_pfn(page));
>       |               ^~~~~~~~~~~
>=20
> This build has CONFIG_SPARSEMEM set and CONFIG_SPARSEMEM_VMEMMAP not set.
>=20
> Caused by commit
>=20
>   983cb10d3f90 ("mm/gup: do not migrate zero page")
>=20
> I have applied the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 2 Feb 2021 19:49:00 +1100
> Subject: [PATCH] make is_pinnable_page a macro
>=20
> As it is currently defined before page_to_section() which it needs.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/mm.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 58f250cabea6..a608feb0d42e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1128,11 +1128,9 @@ static inline bool is_zone_movable_page(const stru=
ct page *page)
>  }
> =20
>  /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
> -static inline bool is_pinnable_page(struct page *page)
> -{
> -	return !(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||
> -		is_zero_pfn(page_to_pfn(page));
> -}
> +#define is_pinnable_page(page)		\
> +	(!(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||	\
> +		is_zero_pfn(page_to_pfn(page)))
> =20
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
>  void free_devmap_managed_page(struct page *page);
> --=20
> 2.29.2

OK, so today I will add the following to linux-next as it is still
needed.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Feb 2021 12:05:57 +1100
Subject: [PATCH] make is_pinnable_page a macro

As it is currently defined before page_to_section() which it needs.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/mm.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index baa3d3a9b655..8b1f889c6715 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1123,16 +1123,11 @@ static inline bool is_zone_movable_page(const struc=
t page *page)
=20
 #ifdef CONFIG_MIGRATION
 /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
-static inline bool is_pinnable_page(struct page *page)
-{
-	return !(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||
-		is_zero_pfn(page_to_pfn(page));
-}
+#define is_pinnable_page(page)						\
+	(!(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||	\
+		is_zero_pfn(page_to_pfn(page)))
 #else
-static inline bool is_pinnable_page(struct page *page)
-{
-	return true;
-}
+#define is_pinnable_page(page)	true
 #endif
=20
 #ifdef CONFIG_DEV_PAGEMAP_OPS
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/OWSc.x.P3_aT.GjI8jXE4ni
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAbSzkACgkQAVBC80lX
0Gyi5AgAkRy+x9go9BaasEOBjMh29cR7/Uf9Mas98QhwZNjMw88Pv8NG+CNj7WYW
oSVIsnFYGI4PsE30WsTaq2BojlwpFyp7m+6AAIsdIKP8GM0XE7b3p35J2NpKbNsQ
KN9GZOsC23SNz/8FI7oW5rQc/xbol4KxWM+9bKGsB0c5IT6oNx3XSSaVCD9AjrWI
b5ShP2oF+MwK1MI1YwJKPFcI/shS4vSa/Qg46wAGQ1Si5BWxIz67+giqpymRmO7g
1ysXdQrE52oAet8kiFWOoUVKpToRULiMNb3WS2p01IX9kjYGhZioNsmaTyebkRla
8N0LpX4o5Bbvlj9xElcfz8y2gNUdog==
=JADk
-----END PGP SIGNATURE-----

--Sig_/OWSc.x.P3_aT.GjI8jXE4ni--
