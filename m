Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939B139D778
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 10:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFGIfI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 04:35:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36899 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229657AbhFGIfH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Jun 2021 04:35:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fz68922BMz9sWX;
        Mon,  7 Jun 2021 18:33:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623054795;
        bh=9p+Av8F0aPojXCwhbDUXUsk9H/DCl9kIjbUFn6SBCj8=;
        h=Date:From:To:Cc:Subject:From;
        b=UBRqXIb1SdeKPrK/Npkrb2SyBLfhxfQe8wW93N4Bfv1dJvbe8LeUGeB8RG5OKH9SI
         9ucQbENxzhp02DmK+u0y7y3JxrojQjx+sryXENOQ5EYonLB34Gpo16+JpkN/zT10WK
         p1hwilOaRGFfxWsanMNnu/znrkrvAqiuDJ7TbkpXzUKJAmlsvj5Lgx19jzuMQbPgLz
         VWIRi6tItxZdUJUwZb+uw9QjhhxzHgAg+nS8hW3Asf5WcpyS8H9mHNsdyeuAYWan/8
         yt6IUlCYG7IZRy0l44Msf1vRHRJjCkaKZ/D1CulIL62VvS5Pz2aipmmGzj2t6pC3xZ
         SiYnRhxjzyPtA==
Date:   Mon, 7 Jun 2021 18:33:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux-foundation.org>,
        Ingo Molnar <mingo@elte.hu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        Waiman Long <longman@redhat.com>
Subject: linux-next: manual merge of the akpm-current tree with the percpu
 tree
Message-ID: <20210607183312.7dec0330@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pLzONwVgcST6aCrqYSrJ9a4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pLzONwVgcST6aCrqYSrJ9a4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/memcontrol.c

between commit:

  0f0cace35fa6 ("mm, memcg: mark cgroup_memory_nosocket, nokmem and noswap =
as __ro_after_init")

from the percpu tree and commits:

  dfe14954c6e4 ("mm: memcg/slab: don't create kmalloc-cg caches with cgroup=
.memory=3Dnokmem")
  3fd971b13287 ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5")
  53270d6d0c1f ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5-f=
ix")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Andrew, you may want to look at commit

  4d5c8aedc8aa ("mm, memcg: introduce mem_cgroup_kmem_disabled()")

from the percpu tree.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memcontrol.c
index 3c1641c67122,b9a6db6a7d4f..000000000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -80,10 -80,10 +80,10 @@@ struct mem_cgroup *root_mem_cgroup __re
  DEFINE_PER_CPU(struct mem_cgroup *, int_active_memcg);
 =20
  /* Socket memory accounting disabled? */
 -static bool cgroup_memory_nosocket;
 +static bool cgroup_memory_nosocket __ro_after_init;
 =20
  /* Kernel memory accounting disabled? */
- static bool cgroup_memory_nokmem __ro_after_init;
 -bool cgroup_memory_nokmem;
++bool cgroup_memory_nokmem __ro_after_init;
 =20
  /* Whether the swap controller is active */
  #ifdef CONFIG_MEMCG_SWAP

--Sig_/pLzONwVgcST6aCrqYSrJ9a4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC92cgACgkQAVBC80lX
0GyS0wgAo/qg1w5c6lrco4AGFcKz9NsO/GWY9jNptcSQRi0Zk5qHF+TnW9BhcHnu
lWx+0YRkaCoRu7IaNf20LOJDWSSD7AyiForLCYYPmC2WfRTG/B1ebm824WNImS3S
+oD8UT8O/hamRsL/DGX39CRwQPTVLPgggRxGhZXaYmapdGNfWYaS+IL6Tkps4k6q
hTXUiN6R8hN3kOSPJXIMHGl8j+zM6SDSrr7KuTadXMoAvWMSzLoIOk8/2NQzzc0o
05sGrCZkFaZPFTVASj4E2kqpAcr5LiNxiN3crnKNgEgkN7vAV0kYuQwfKs0Lj14Q
itXggMvegJ6qxJdex6JeGOHa8MaGPA==
=cO6c
-----END PGP SIGNATURE-----

--Sig_/pLzONwVgcST6aCrqYSrJ9a4--
