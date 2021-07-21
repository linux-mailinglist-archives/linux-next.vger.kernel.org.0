Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B423D07D6
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 06:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhGUEB4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 00:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGUEBx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 00:01:53 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49395C061574;
        Tue, 20 Jul 2021 21:42:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GV2xZ5YSfz9sRR;
        Wed, 21 Jul 2021 14:42:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626842547;
        bh=JpKTATQnY5NYZ8VyCYXwd42pU29rmVvbHgE8Dh+5unM=;
        h=Date:From:To:Cc:Subject:From;
        b=fGzcqpEeq078V5Podc4YlRXTHnO1I1cHJNJvnioE7/kCvPGE6tmnZvrLV8A6woNOi
         Vo6O4kHrYFjctmaLng92134FRN+ee9t1Re5r6TFru3wp1mxFAOcXezBtmpABKXTF8e
         NYMfEmkoIUAnQh+fr+OvheUgGPY3VBSohJLDHVR8XobbqVJv1UBZ60ZmHDrfqlp+Er
         2FHWIzWSlCtPoAY8Qz+ryvMQV7/V98J4/Eea7o+3CLz48g6ShHRpYWAH+45J2OuP1M
         sFb94JTfoREjSy9fRLHAbFnHKSD+et1jw6IY0zODdW7vLKsY61yP77vjf9U7E8SN0G
         I8MB+xuos4ROg==
Date:   Wed, 21 Jul 2021 14:42:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the folio tree with the ext3 tree
Message-ID: <20210721144225.12854522@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/im0grWyBTjLbW1p=XsqxUzI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/im0grWyBTjLbW1p=XsqxUzI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the folio tree got a conflict in:

  mm/rmap.c

between commits:

  9608703e488c ("mm: Fix comments mentioning i_mutex")
  730633f0b7f9 ("mm: Protect operations adding pages to page cache with inv=
alidate_lock")

from the ext3 tree and commit:

  a8f645b17cd4 ("mm/memcg: Add folio_lruvec_lock() and similar functions")

from the folio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/rmap.c
index 2d29a57d29e8,b3aae8eeaeaf..000000000000
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@@ -20,29 -20,28 +20,29 @@@
  /*
   * Lock ordering in mm:
   *
 - * inode->i_mutex	(while writing or truncating, not reading or faulting)
 + * inode->i_rwsem	(while writing or truncating, not reading or faulting)
   *   mm->mmap_lock
 - *     page->flags PG_locked (lock_page)   * (see huegtlbfs below)
 - *       hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share)
 - *         mapping->i_mmap_rwsem
 - *           hugetlb_fault_mutex (hugetlbfs specific page fault mutex)
 - *           anon_vma->rwsem
 - *             mm->page_table_lock or pte_lock
 - *               swap_lock (in swap_duplicate, swap_info_get)
 - *                 mmlist_lock (in mmput, drain_mmlist and others)
 - *                 mapping->private_lock (in __set_page_dirty_buffers)
 - *                   lock_page_memcg move_lock (in __set_page_dirty_buffe=
rs)
 - *                     i_pages lock (widely used)
 - *                       lruvec->lru_lock (in folio_lruvec_lock_irq)
 - *                 inode->i_lock (in set_page_dirty's __mark_inode_dirty)
 - *                 bdi.wb->list_lock (in set_page_dirty's __mark_inode_di=
rty)
 - *                   sb_lock (within inode_lock in fs/fs-writeback.c)
 - *                   i_pages lock (widely used, in set_page_dirty,
 - *                             in arch-dependent flush_dcache_mmap_lock,
 - *                             within bdi.wb->list_lock in __sync_single_=
inode)
 + *     mapping->invalidate_lock (in filemap_fault)
 + *       page->flags PG_locked (lock_page)   * (see hugetlbfs below)
 + *         hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share)
 + *           mapping->i_mmap_rwsem
 + *             hugetlb_fault_mutex (hugetlbfs specific page fault mutex)
 + *             anon_vma->rwsem
 + *               mm->page_table_lock or pte_lock
 + *                 swap_lock (in swap_duplicate, swap_info_get)
 + *                   mmlist_lock (in mmput, drain_mmlist and others)
 + *                   mapping->private_lock (in __set_page_dirty_buffers)
 + *                     lock_page_memcg move_lock (in __set_page_dirty_buf=
fers)
 + *                       i_pages lock (widely used)
-  *                         lruvec->lru_lock (in lock_page_lruvec_irq)
++ *                         lruvec->lru_lock (in folio_lruvec_lock_irq)
 + *                   inode->i_lock (in set_page_dirty's __mark_inode_dirt=
y)
 + *                   bdi.wb->list_lock (in set_page_dirty's __mark_inode_=
dirty)
 + *                     sb_lock (within inode_lock in fs/fs-writeback.c)
 + *                     i_pages lock (widely used, in set_page_dirty,
 + *                               in arch-dependent flush_dcache_mmap_lock,
 + *                               within bdi.wb->list_lock in __sync_singl=
e_inode)
   *
 - * anon_vma->rwsem,mapping->i_mutex      (memory_failure, collect_procs_a=
non)
 + * anon_vma->rwsem,mapping->i_mmap_rwsem   (memory_failure, collect_procs=
_anon)
   *   ->tasklist_lock
   *     pte map lock
   *

--Sig_/im0grWyBTjLbW1p=XsqxUzI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD3pbEACgkQAVBC80lX
0GzKkwf/VfeEA4OPXO4aiGoPPalTQN6SIy3epbwSGBNC34scoQw+nAIroZOlju2G
ol7yY4MWNAYi7tQ+hoYtHEyPpK/QJDccK/P6CVaceT5Y1ve8akWlHEqtwoe2o/LJ
aIwJpRJHs/HjDPGUHfSstpqCTPtuBHjO6o+xchLK5+ccVWjWtQKVUPlb51uWFXma
q6U01hovVybuaIONtTO/S+GEGl1GeQ1Ibrfv0g01S/rcLbjVDxKOlHWbdjJHv4yr
Bkty5wCCbLSc1tifof0z3cQDGiqpZNS5WWxBe7TDihGj5q68fgvuYysXFfmlzVIj
IYK2m+GI7bFZGkqZZ8adQC+o1FCZQg==
=COWS
-----END PGP SIGNATURE-----

--Sig_/im0grWyBTjLbW1p=XsqxUzI--
