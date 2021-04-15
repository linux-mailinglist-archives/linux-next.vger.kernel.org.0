Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B27360612
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 11:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhDOJon (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 05:44:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44333 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231309AbhDOJon (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Apr 2021 05:44:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLZDd64Wkz9sCD;
        Thu, 15 Apr 2021 19:44:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618479858;
        bh=RArAJTCC/ZsrvJupSUTPB3sBlqWIRoaht0fIS/nB95g=;
        h=Date:From:To:Cc:Subject:From;
        b=BsfLSY40emsL0vivTjnEkhsGnCJs8cEpyKuPyXAP8NMMGbnPBwdvNADn6YKVi14Le
         mN6JzuWvqbonYnHmFsWcc2oCZ5lmSie0bDW9ur8j9A6iDpuFZ1eUZAt0nToLPE8NMs
         P9nT827Znb8aFV/tNMQKOjaxH83mwbXPFmeyW3JmdPhr5IbvlMTV6fikKNig4n3z32
         aGqCFbgnggMvtzBJSsbd+nwCXzoi6C+YJHXV987hszLdT1zVDQlIY2rtJGone+dejB
         9swXIpTDtk4VsdB11GJCSNJK8cE89/huNhwFPDD74iV22E4pWcO1KgggjxvQBMxwEJ
         EZ8fjopNUu9QQ==
Date:   Thu, 15 Apr 2021 19:44:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20210415194417.498e71b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/szb=KuBpGlQVv4KE55mef8A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/szb=KuBpGlQVv4KE55mef8A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/kernel/module.c

between commit:

  2ec13df16704 ("powerpc/modules: Load modules closer to kernel text")

from the powerpc tree and commit:

  4930ba789f8d ("powerpc/64s/radix: enable huge vmalloc mappings")

from the akpm-current tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/module.c
index fab84024650c,cdb2d88c54e7..000000000000
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@@ -88,29 -88,26 +89,42 @@@ int module_finalize(const Elf_Ehdr *hdr
  	return 0;
  }
 =20
- #ifdef MODULES_VADDR
 -void *module_alloc(unsigned long size)
 +static __always_inline void *
 +__module_alloc(unsigned long size, unsigned long start, unsigned long end)
  {
 -	unsigned long start =3D VMALLOC_START;
 -	unsigned long end =3D VMALLOC_END;
 -
 -#ifdef MODULES_VADDR
 -	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
 -	start =3D MODULES_VADDR;
 -	end =3D MODULES_END;
 -#endif
 -
+ 	/*
+ 	 * Don't do huge page allocations for modules yet until more testing
+ 	 * is done. STRICT_MODULE_RWX may require extra work to support this
+ 	 * too.
+ 	 */
+=20
  	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
- 				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+ 				    PAGE_KERNEL_EXEC,
+ 				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
+ 				    NUMA_NO_NODE,
  				    __builtin_return_address(0));
  }
 +
++
 +void *module_alloc(unsigned long size)
 +{
++	unsigned long start =3D VMALLOC_START;
++	unsigned long end =3D VMALLOC_END;
 +	unsigned long limit =3D (unsigned long)_etext - SZ_32M;
 +	void *ptr =3D NULL;
 +
++#ifdef MODULES_VADDR
 +	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
++	start =3D MODULES_VADDR;
++	end =3D MODULES_END;
 +
 +	/* First try within 32M limit from _etext to avoid branch trampolines */
 +	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
- 		ptr =3D __module_alloc(size, limit, MODULES_END);
++		ptr =3D __module_alloc(size, limit, end);
 +
 +	if (!ptr)
- 		ptr =3D __module_alloc(size, MODULES_VADDR, MODULES_END);
++#endif
++		ptr =3D __module_alloc(size, start, end);
 +
 +	return ptr;
 +}
- #endif

--Sig_/szb=KuBpGlQVv4KE55mef8A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB4CvEACgkQAVBC80lX
0GwD/QgAgJkGhiT2ejF09nPIJxN78qxXool7C4G+20Rj1C+FobjN8ZRQM6DfN9rD
wRPUraPTJCOAxgebasRcPzbHQMQkpeMQP2JCvOI//NTm/UxKoAdgEnVJzSvZO34b
FE2mgTAyDK457IiuKu1/JyW77NA8MH33XVHyZdckw3pcivkqgErNCb5bd39VG+de
vzhGH+0U8clZPJwJnCEhaQshsdbtxrGHq+E9YTiwnzjQreIP/Nqf3rnbrGdjFE/X
ly4Ai0VLcj0OBzUFs6AyMIoXs83BuvMj8OgEnoLBfaCpiVX0KiUuOJNrRgxSNaWo
MaKvwQJ00nwZQ9tqNqNhV4flRYFwKA==
=oaik
-----END PGP SIGNATURE-----

--Sig_/szb=KuBpGlQVv4KE55mef8A--
