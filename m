Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E443D08EB
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 08:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbhGUFvC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 01:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233851AbhGUFup (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 01:50:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5BBC061574;
        Tue, 20 Jul 2021 23:31:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GV5MC0gKRz9sX1;
        Wed, 21 Jul 2021 16:31:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626849079;
        bh=9CXgsRxzdLqOvZEpaeq9Tx4TZEVqFfOnLCCiX18txCc=;
        h=Date:From:To:Cc:Subject:From;
        b=ch9xZrvtxSS2X1dr26VfRTbXHf3zH+HFoPXqJmMZNwTEsRM3EJi1VWoprvrSPTiAT
         M1mZ1shFF1e5XC7C6/n4XleqsNRvKI8QH26WVcSLGheoWu+m8OnDN0zaLaOyb8NGuT
         GqXFmlztfAqqOqKHWjnrmc9eSoCSAP9mJkT5lnVg56s25ceTm0w8mG7WJ/+O1Xb554
         AMh0k+YQowrRuRiVvCiZ6NeW8VW5F/yR75BxsTyWnbYM/QoC9b4WTROC+KUyeaw1x1
         1tndGGSH/goKFkc/jWS7wuKTXsMUSEaITY1hsvNZYB2K7wFnIUpPHpMyFyXzSC2vaK
         DkST7sCdxuwWQ==
Date:   Wed, 21 Jul 2021 16:31:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: linux-next: manual merge of the akpm-current tree with the folio
 tree
Message-ID: <20210721163118.3ca01b57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UH8cFoai/aIyN3jFpqzQW_Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UH8cFoai/aIyN3jFpqzQW_Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  include/linux/memcontrol.h
  mm/memcontrol.c

between commits:

  05bb7bbab428 ("mm/memcg: Convert mem_cgroup_charge() to take a folio")
  8b2afb6a1c34 ("mm/memcg: Convert mem_cgroup_uncharge() to take a folio")

from the folio tree and commit:

  1f4c6a1cf274 ("mm, memcg: inline mem_cgroup_{charge/uncharge} to improve =
disabled memcg config")

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

diff --cc include/linux/memcontrol.h
index af9c44bb1e42,406058a0c480..000000000000
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@@ -704,15 -691,37 +702,36 @@@ static inline bool mem_cgroup_below_min
  		page_counter_read(&memcg->memory);
  }
 =20
- int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gf=
p);
 -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
 -			gfp_t gfp_mask);
 -static inline int mem_cgroup_charge(struct page *page, struct mm_struct *=
mm,
 -				    gfp_t gfp_mask)
++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t =
gfp);
++static inline int mem_cgroup_charge(struct folio *folio, struct mm_struct=
 *mm,
++				    gfp_t gfp)
+ {
+ 	if (mem_cgroup_disabled())
+ 		return 0;
 -	return __mem_cgroup_charge(page, mm, gfp_mask);
++	return __mem_cgroup_charge(folio, mm, gfp);
+ }
+=20
  int mem_cgroup_swapin_charge_page(struct page *page, struct mm_struct *mm,
  				  gfp_t gfp, swp_entry_t entry);
  void mem_cgroup_swapin_uncharge_swap(swp_entry_t entry);
 =20
- void mem_cgroup_uncharge(struct folio *folio);
- void mem_cgroup_uncharge_list(struct list_head *page_list);
 -void __mem_cgroup_uncharge(struct page *page);
 -static inline void mem_cgroup_uncharge(struct page *page)
++void __mem_cgroup_uncharge(struct folio *folio);
++static inline void mem_cgroup_uncharge(struct folio *folio)
+ {
+ 	if (mem_cgroup_disabled())
+ 		return;
 -	__mem_cgroup_uncharge(page);
++	__mem_cgroup_uncharge(folio);
+ }
+=20
+ void __mem_cgroup_uncharge_list(struct list_head *page_list);
+ static inline void mem_cgroup_uncharge_list(struct list_head *page_list)
+ {
+ 	if (mem_cgroup_disabled())
+ 		return;
+ 	__mem_cgroup_uncharge_list(page_list);
+ }
 =20
 -void mem_cgroup_migrate(struct page *oldpage, struct page *newpage);
 +void mem_cgroup_migrate(struct folio *old, struct folio *new);
 =20
  /**
   * mem_cgroup_lruvec - get the lru list vector for a memcg & node
diff --cc mm/memcontrol.c
index 1d77c873463c,c010164172dd..000000000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -6712,29 -6718,27 +6708,26 @@@ out
  }
 =20
  /**
-  * mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
 - * __mem_cgroup_charge - charge a newly allocated page to a cgroup
 - * @page: page to charge
 - * @mm: mm context of the victim
 - * @gfp_mask: reclaim mode
++ * __mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
 + * @folio: Folio to charge.
 + * @mm: mm context of the allocating task.
 + * @gfp: Reclaim mode.
   *
 - * Try to charge @page to the memcg that @mm belongs to, reclaiming
 - * pages according to @gfp_mask if necessary. if @mm is NULL, try to
 + * Try to charge @folio to the memcg that @mm belongs to, reclaiming
 + * pages according to @gfp if necessary.  If @mm is NULL, try to
   * charge to the active memcg.
   *
 - * Do not use this for pages allocated for swapin.
 + * Do not use this for folios allocated for swapin.
   *
 - * Returns 0 on success. Otherwise, an error code is returned.
 + * Return: 0 on success. Otherwise, an error code is returned.
   */
- int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gf=
p)
 -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
 -			gfp_t gfp_mask)
++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t =
gfp)
  {
  	struct mem_cgroup *memcg;
  	int ret;
 =20
- 	if (mem_cgroup_disabled())
- 		return 0;
-=20
  	memcg =3D get_mem_cgroup_from_mm(mm);
 -	ret =3D charge_memcg(page, memcg, gfp_mask);
 +	ret =3D charge_memcg(folio, memcg, gfp);
  	css_put(&memcg->css);
 =20
  	return ret;
@@@ -6906,20 -6909,17 +6899,17 @@@ static void uncharge_folio(struct foli
  }
 =20
  /**
-  * mem_cgroup_uncharge - Uncharge a folio.
 - * __mem_cgroup_uncharge - uncharge a page
 - * @page: page to uncharge
++ * __mem_cgroup_uncharge - Uncharge a folio.
 + * @folio: Folio to uncharge.
   *
 - * Uncharge a page previously charged with __mem_cgroup_charge().
 + * Uncharge a folio previously charged with mem_cgroup_charge().
   */
- void mem_cgroup_uncharge(struct folio *folio)
 -void __mem_cgroup_uncharge(struct page *page)
++void __mem_cgroup_uncharge(struct folio *folio)
  {
  	struct uncharge_gather ug;
 =20
- 	if (mem_cgroup_disabled())
- 		return;
-=20
 -	/* Don't touch page->lru of any random page, pre-check: */
 -	if (!page_memcg(page))
 +	/* Don't touch folio->lru of any random page, pre-check: */
 +	if (!folio_memcg(folio))
  		return;
 =20
  	uncharge_gather_clear(&ug);
@@@ -6932,19 -6932,16 +6922,16 @@@
   * @page_list: list of pages to uncharge
   *
   * Uncharge a list of pages previously charged with
-  * mem_cgroup_charge().
+  * __mem_cgroup_charge().
   */
- void mem_cgroup_uncharge_list(struct list_head *page_list)
+ void __mem_cgroup_uncharge_list(struct list_head *page_list)
  {
  	struct uncharge_gather ug;
 -	struct page *page;
 +	struct folio *folio;
 =20
- 	if (mem_cgroup_disabled())
- 		return;
-=20
  	uncharge_gather_clear(&ug);
 -	list_for_each_entry(page, page_list, lru)
 -		uncharge_page(page, &ug);
 +	list_for_each_entry(folio, page_list, lru)
 +		uncharge_folio(folio, &ug);
  	if (ug.memcg)
  		uncharge_batch(&ug);
  }

--Sig_/UH8cFoai/aIyN3jFpqzQW_Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD3vzYACgkQAVBC80lX
0GyY+gf+NYEO4SN3x9DdyFNhphVWn72VZYYkfDmsBIeTblc6Lbn1I5DNP8+JuLp2
KTR9MLkDzmvUxSGmcOO3HYLgUxnMXWOx3n0muZJOIPncOqkfuhF0dHxu8E0C/LrK
dUMMbK9vBFErRx3QM77lJLp2lku7xaY4vRwybpHiVDcbGMpsFdx7QxAbDS1FyBai
s3pqbvXJJMDE6ecSUhspIISjjlW9f/J6DrB/RAx93H7Tru9wjgKTYs9PC/SRD5/O
Bmkm1ibdrRoTdNRgKlEjlPheKNaa+UKSR+6FYCJIhplkPKE4WJ825DgyluO3SWR0
iaMifmvv2ChsWDrfGiHh+LkLwgxDTQ==
=X7nd
-----END PGP SIGNATURE-----

--Sig_/UH8cFoai/aIyN3jFpqzQW_Z--
