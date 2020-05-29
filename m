Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263E41E7A5C
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 12:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE2KSI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 06:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2KSI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 06:18:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BDAC03E969;
        Fri, 29 May 2020 03:18:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YL9n3mfxz9sSp;
        Fri, 29 May 2020 20:18:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590747486;
        bh=r4xrWYQ9uB118Q6qzuu2OuN2EaJoU4bcZ6FPSPSq2Lw=;
        h=Date:From:To:Cc:Subject:From;
        b=Y3WqWoEF/hETvXboVklHXeanIyGXSzx8V4dW0tlxff/UPEC+DRLjZdlRAMugCt1Qq
         vWJOwo6vM6SWUIfMy679bG922MqhejOH+eFIAsLIWF36xrQxcpho52bWO/T0z8YSJL
         02ifAcKlXxyQhYqUL4PaSafWotgRmMBvNVapU9HomrBvIzVvqbCCSlgN2Tb3IDcr/j
         e2qgVYISODj4n4CfpVW2Tskl5tAFSjUWk4unE8rZUMwJIWYEYI7a6rR+OcRbw7kgEN
         HrfIHtIjtk/MZjM52oVzRXXiIpwr4JuZ7g4C3FaCXxrJVm3tPdAs6nyFkLfJ0MvZGu
         rlD3liSuaPOHA==
Date:   Fri, 29 May 2020 20:18:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Rik van Riel <riel@surriel.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200529201804.6de23390@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9f.g9e.M9Kvmb2ZpvrviSfC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9f.g9e.M9Kvmb2ZpvrviSfC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/swap.c

between commit:

  b01b21419999 ("mm/swap: Use local_lock for protection")

from the tip tree and commit:

  48c1ce8726a7 ("mm: fold and remove lru_cache_add_anon() and lru_cache_add=
_file()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/swap.c
index 0ac463d44cff,acd88873f076..000000000000
--- a/mm/swap.c
+++ b/mm/swap.c
@@@ -468,10 -435,17 +459,19 @@@ EXPORT_SYMBOL(mark_page_accessed)
   */
  void lru_cache_add(struct page *page)
  {
 -	struct pagevec *pvec =3D &get_cpu_var(lru_add_pvec);
++	struct pagevec *pvec;
+=20
  	VM_BUG_ON_PAGE(PageActive(page) && PageUnevictable(page), page);
  	VM_BUG_ON_PAGE(PageLRU(page), page);
- 	__lru_cache_add(page);
+=20
++	local_lock(&lru_pvecs.lock);
++	pvec =3D this_cpu_ptr(&lru_pvecs.lru_add);
+ 	get_page(page);
+ 	if (!pagevec_add(pvec, page) || PageCompound(page))
+ 		__pagevec_lru_add(pvec);
 -	put_cpu_var(lru_add_pvec);
++	local_unlock(&lru_pvecs.lock);
  }
+ EXPORT_SYMBOL(lru_cache_add);
 =20
  /**
   * lru_cache_add_active_or_unevictable

--Sig_/9f.g9e.M9Kvmb2ZpvrviSfC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q4VwACgkQAVBC80lX
0GxcoQf/U1uQGWIWGbct2aJGLWA6yfqWjDKjECMeyIfE99uUhWv2XuP5UfKAxXn1
fNP9IKGpX3yKRHDMt6x+T5bQYCZHqc9Q4nX6kSfWbAi+6r525+LqCNrL9dtsRPEx
88tlBopla7SUfSvU93hDF3vABglMlnSO4DlYXWufaSaeAbQb0LEQrJgYHSSAjIdZ
tk+HgDTzfrJ106BBBXDjeBny8nI+0m5f6mX5MPvC5wcwPRFa6Ao+z7V7HV87fCW+
v3+xMyZ2/ogceDHGQPG8QW96KRu/gOg0XMb5bH8WfX281wNgdg2LU+JSJQqxbv2B
cVuZ8Y2ZVJC25VqErW0yaTplPZRKDw==
=X5uZ
-----END PGP SIGNATURE-----

--Sig_/9f.g9e.M9Kvmb2ZpvrviSfC--
