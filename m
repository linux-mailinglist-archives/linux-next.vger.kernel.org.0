Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35C533FF72
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 07:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhCRGRt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 02:17:49 -0400
Received: from ozlabs.org ([203.11.71.1]:51189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhCRGRY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Mar 2021 02:17:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1Gyn463hz9sW1;
        Thu, 18 Mar 2021 17:17:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616048242;
        bh=bJtOhdWChdRZdGbSapAIIkLlrGGNEaTWwhZFCtZI6Xw=;
        h=Date:From:To:Cc:Subject:From;
        b=sF9D/tV4aINozT855a4ta3ALX5Rl0hWl7AWDu2RMOgPxU+ppPd4WJ6QNKgzk//CCH
         BE+083wWsGYOJ0QK6OCVmv3PcEmAWF9KuLbr6EXtHm1ZqSa8g831kXtflEVX1piA0V
         HnxcZsO6YamHnsoLkSgY8MMuPidThwYyxX4Nrwj3t6iGCHBy19ai6bZ/7hyJ7PJQo6
         DFiM51qiBO/BlhNPaqvwRaUkI/zQp+qFL+HIM4waUh/lCnu9nfNnOfCd6PSyzZACMF
         IVNMInK7i3s3ih7aMU8lXvm5Qn+3f0U+VLk1Dfzn5T7I5BZ1fzJFFlUwwqykY8/HpL
         YXaEC3EKXORjA==
Date:   Thu, 18 Mar 2021 17:17:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Dan Schatzberg <schatzberg.dan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shakeel Butt <shakeelb@google.com>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Message-ID: <20210318171720.61a3f59c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7oYiED7qRxsmammRAtiuVjG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7oYiED7qRxsmammRAtiuVjG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/memcontrol.c

between commit:

  06d69d4c8669 ("mm: Charge active memcg when no mm is set")

from the block tree and commit:

  674788258a66 ("memcg: charge before adding to swapcache on swapin")

from the akpm-current tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memcontrol.c
index f05501669e29,668d1d7c2645..000000000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -6691,65 -6549,73 +6550,80 @@@ out
   * @gfp_mask: reclaim mode
   *
   * Try to charge @page to the memcg that @mm belongs to, reclaiming
 - * pages according to @gfp_mask if necessary.
 + * pages according to @gfp_mask if necessary. if @mm is NULL, try to
 + * charge to the active memcg.
   *
+  * Do not use this for pages allocated for swapin.
+  *
   * Returns 0 on success. Otherwise, an error code is returned.
   */
  int mem_cgroup_charge(struct page *page, struct mm_struct *mm, gfp_t gfp_=
mask)
  {
- 	unsigned int nr_pages =3D thp_nr_pages(page);
- 	struct mem_cgroup *memcg =3D NULL;
- 	int ret =3D 0;
+ 	struct mem_cgroup *memcg;
+ 	int ret;
 =20
  	if (mem_cgroup_disabled())
- 		goto out;
+ 		return 0;
 =20
- 	if (PageSwapCache(page)) {
- 		swp_entry_t ent =3D { .val =3D page_private(page), };
- 		unsigned short id;
 -	memcg =3D get_mem_cgroup_from_mm(mm);
++	if (!mm) {
++		memcg =3D get_mem_cgroup_from_current();
++		if (!memcg)
++			memcg =3D get_mem_cgroup_from_mm(current->mm);
++	} else {
++		memcg =3D get_mem_cgroup_from_mm(mm);
++	}
+ 	ret =3D __mem_cgroup_charge(page, memcg, gfp_mask);
+ 	css_put(&memcg->css);
 =20
- 		/*
- 		 * Every swap fault against a single page tries to charge the
- 		 * page, bail as early as possible.  shmem_unuse() encounters
- 		 * already charged pages, too.  page and memcg binding is
- 		 * protected by the page lock, which serializes swap cache
- 		 * removal, which in turn serializes uncharging.
- 		 */
- 		VM_BUG_ON_PAGE(!PageLocked(page), page);
- 		if (page_memcg(compound_head(page)))
- 			goto out;
+ 	return ret;
+ }
 =20
- 		id =3D lookup_swap_cgroup_id(ent);
- 		rcu_read_lock();
- 		memcg =3D mem_cgroup_from_id(id);
- 		if (memcg && !css_tryget_online(&memcg->css))
- 			memcg =3D NULL;
- 		rcu_read_unlock();
- 	}
+ /**
+  * mem_cgroup_swapin_charge_page - charge a newly allocated page for swap=
in
+  * @page: page to charge
+  * @mm: mm context of the victim
+  * @gfp: reclaim mode
+  * @entry: swap entry for which the page is allocated
+  *
+  * This function charges a page allocated for swapin. Please call this be=
fore
+  * adding the page to the swapcache.
+  *
+  * Returns 0 on success. Otherwise, an error code is returned.
+  */
+ int mem_cgroup_swapin_charge_page(struct page *page, struct mm_struct *mm,
+ 				  gfp_t gfp, swp_entry_t entry)
+ {
+ 	struct mem_cgroup *memcg;
+ 	unsigned short id;
+ 	int ret;
 =20
- 	if (!memcg) {
- 		if (!mm) {
- 			memcg =3D get_mem_cgroup_from_current();
- 			if (!memcg)
- 				memcg =3D get_mem_cgroup_from_mm(current->mm);
- 		} else {
- 			memcg =3D get_mem_cgroup_from_mm(mm);
- 		}
- 	}
+ 	if (mem_cgroup_disabled())
+ 		return 0;
 =20
- 	ret =3D try_charge(memcg, gfp_mask, nr_pages);
- 	if (ret)
- 		goto out_put;
+ 	id =3D lookup_swap_cgroup_id(entry);
+ 	rcu_read_lock();
+ 	memcg =3D mem_cgroup_from_id(id);
+ 	if (!memcg || !css_tryget_online(&memcg->css))
+ 		memcg =3D get_mem_cgroup_from_mm(mm);
+ 	rcu_read_unlock();
 =20
- 	css_get(&memcg->css);
- 	commit_charge(page, memcg);
+ 	ret =3D __mem_cgroup_charge(page, memcg, gfp);
 =20
- 	local_irq_disable();
- 	mem_cgroup_charge_statistics(memcg, page, nr_pages);
- 	memcg_check_events(memcg, page);
- 	local_irq_enable();
+ 	css_put(&memcg->css);
+ 	return ret;
+ }
 =20
+ /*
+  * mem_cgroup_swapin_uncharge_swap - uncharge swap slot
+  * @entry: swap entry for which the page is charged
+  *
+  * Call this function after successfully adding the charged page to swapc=
ache.
+  *
+  * Note: This function assumes the page for which swap slot is being unch=
arged
+  * is order 0 page.
+  */
+ void mem_cgroup_swapin_uncharge_swap(swp_entry_t entry)
+ {
  	/*
  	 * Cgroup1's unified memory+swap counter has been charged with the
  	 * new swapcache page, finish the transfer by uncharging the swap

--Sig_/7oYiED7qRxsmammRAtiuVjG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBS8HAACgkQAVBC80lX
0GxbIwf+J9EyxNeszjmQVlKOK1cDNO+hloWcVTIXhxeILOqGFWpuXyzl+yKfNuV+
t9weW529fkVUYbBv5kb34z42EmbskpcYwV1Aoq8LedC9A4F8UjTZ6eeIIbPiMD2G
KfOdkXbMwDGi6SWIXsOTvznszlGLrEbBnsWBh/Jax1W1n65dGw01tOLNM+IKt+l1
nf5b++/AuMATCvtXhs30U68G6CNhRQ2Yco1zYKzwdzibqGZO45NLAa2L+S0GJOVR
sFu0xhznTAk4MXlZi8+BkRCheftjMrVLabm9BoFxAQpKwvYYMbI9QfAnpjqzj/di
3waii39WVUn5nnPBe/dqJz6Knp83jw==
=Nks3
-----END PGP SIGNATURE-----

--Sig_/7oYiED7qRxsmammRAtiuVjG--
