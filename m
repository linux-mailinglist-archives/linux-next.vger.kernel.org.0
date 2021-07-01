Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D22F3B8C99
	for <lists+linux-next@lfdr.de>; Thu,  1 Jul 2021 05:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhGADZx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Jun 2021 23:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhGADZx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Jun 2021 23:25:53 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B99FC061756;
        Wed, 30 Jun 2021 20:23:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GFk7V0CjTz9sRK;
        Thu,  1 Jul 2021 13:23:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625109799;
        bh=JfJheQznAwbjEVJFj5Id8o+IlYlKC2x50Ms4SlbJAZw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=doX+4TpSboPe6JVfoNYMTaUkBJ6X1v1Zf58sQFSxKgrqQcREZs1NaEbPb4nbIyqeA
         uN4kEho2wmxaXrhrHSOMcjia5/ZbmQ6U345LHDX0VfGqxTWnID1GDXe7Y6AvvDnykw
         IevzTK93My4hjRZYHtTvoRd2pTQWoh23lkWVj/4HSrXnbybs5jb/TOisfoLsi9VvYP
         3X5MCphyl+50jVXHqW1K41EQMxer7CRA2WB/0HJTMZMooKqY5zQdMIYQvOTcW7ryi7
         5GQtluMMjmcm2Zd04m+oPjvaASeZWjAKt/cFkvrZgJJV0bcdZzfqs8wJ48v/bkYcoq
         ldgEUBTIHP8bg==
Date:   Thu, 1 Jul 2021 13:23:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux-foundation.org>,
        Ingo Molnar <mingo@elte.hu>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        Waiman Long <longman@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 percpu tree
Message-ID: <20210701132316.01b6252a@canb.auug.org.au>
In-Reply-To: <20210607183312.7dec0330@canb.auug.org.au>
References: <20210607183312.7dec0330@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UY9N/8oDMBuv42iMOHyw++6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UY9N/8oDMBuv42iMOHyw++6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 7 Jun 2021 18:33:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   mm/memcontrol.c
>=20
> between commit:
>=20
>   0f0cace35fa6 ("mm, memcg: mark cgroup_memory_nosocket, nokmem and noswa=
p as __ro_after_init")
>=20
> from the percpu tree and commits:
>=20
>   dfe14954c6e4 ("mm: memcg/slab: don't create kmalloc-cg caches with cgro=
up.memory=3Dnokmem")
>   3fd971b13287 ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5=
")
>   53270d6d0c1f ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5=
-fix")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> Andrew, you may want to look at commit
>=20
>   4d5c8aedc8aa ("mm, memcg: introduce mem_cgroup_kmem_disabled()")
>=20
> from the percpu tree.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc mm/memcontrol.c
> index 3c1641c67122,b9a6db6a7d4f..000000000000
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@@ -80,10 -80,10 +80,10 @@@ struct mem_cgroup *root_mem_cgroup __re
>   DEFINE_PER_CPU(struct mem_cgroup *, int_active_memcg);
>  =20
>   /* Socket memory accounting disabled? */
>  -static bool cgroup_memory_nosocket;
>  +static bool cgroup_memory_nosocket __ro_after_init;
>  =20
>   /* Kernel memory accounting disabled? */
> - static bool cgroup_memory_nokmem __ro_after_init;
>  -bool cgroup_memory_nokmem;
> ++bool cgroup_memory_nokmem __ro_after_init;
>  =20
>   /* Whether the swap controller is active */
>   #ifdef CONFIG_MEMCG_SWAP

This is now a conflict between the percpu tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UY9N/8oDMBuv42iMOHyw++6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDdNSQACgkQAVBC80lX
0GwYuAgAoOujqeR2EFIu74yGcDD8/B886ucbaxJU/sQIMBKXl/PZAIXuxKDinkHU
mr24fMVgj6znz1qfdpEI8+vwOAHDYlFVSv3XNZhCSKQ508ClI9zDnnSGLsov27zQ
8qdBeXIUWyE6r43kcNjU2a4ZIG1pmKeLBTtbn9R8g7VEg3fFgujsQeOZzHZTofoX
dkFXeBOv8HeQKxTZbTxlZJc1Q0hOFLAien88UrT0Z3vH/ht1aizqg9YuUSwT11oI
kFDAMnIs1BoyQ9Wb4ozP1dzcT0JEBYVH9enxhLNB3yWHCaV3Aem5mkXm0CkyngR4
tlyJ72xEj2tL5sEe4oVKDNciVXBf9w==
=pdg3
-----END PGP SIGNATURE-----

--Sig_/UY9N/8oDMBuv42iMOHyw++6--
