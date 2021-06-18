Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5513AC7EB
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 11:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbhFRJrI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 05:47:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230399AbhFRJrI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Jun 2021 05:47:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5vCs0bdBz9sVp;
        Fri, 18 Jun 2021 19:44:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624009497;
        bh=uXi1N22K4kq4QBq+OXKjx0+1W75j2S5j6clTcEGS40c=;
        h=Date:From:To:Cc:Subject:From;
        b=c4dDPzFMr/46NzUIfpuv6iR3JOW7oMFztc+UavAX9LHPSoo6FRNjlO+I54Zw0fHPk
         opCtGe9dQfPy+YJk9FdwDikgoxJOxwC8bzueuPgHsQHCgPaX6PxI3J3mIoBtamL4ef
         Bi6blF3YWXJ+zyJ/MB85LPQTfboFJsgMohKu/Y9MO8s0b6ykt4NpBQRRxxYLuRwA8O
         jfilsrN583yJ0u9rxdQ+PvdJW2/CqN07hGMQmRZicCItmZ1xGE/TTscZqAJGSxdSwB
         WeUvfpn8qOs3zvraMmjuSOQz+WEt1tIFdSqs/rDUhaZQ5EgA3nyrNF6Q3LfhQNoTyp
         /YQvV0fxchhfQ==
Date:   Fri, 18 Jun 2021 19:44:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20210618194455.0d6c278c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M+Wq.F/4zU0/J14IKaaJLBi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M+Wq.F/4zU0/J14IKaaJLBi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/kernel/smp.c

between commit:

  86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C")

from the powerpc tree and commit:

  103e676c91d0 ("lazy tlb: introduce lazy mm refcount helper functions")

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

diff --cc arch/powerpc/kernel/smp.c
index b83a59ce9beb,b289f1d213f8..000000000000
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@@ -1541,11 -1541,7 +1541,11 @@@ void start_secondary(void *unused
  {
  	unsigned int cpu =3D raw_smp_processor_id();
 =20
 +	/* PPC64 calls setup_kup() in early_setup_secondary() */
 +	if (IS_ENABLED(CONFIG_PPC32))
 +		setup_kup();
 +
- 	mmgrab(&init_mm);
+ 	mmgrab_lazy_tlb(&init_mm);
  	current->active_mm =3D &init_mm;
 =20
  	smp_store_cpu_info(cpu);

--Sig_/M+Wq.F/4zU0/J14IKaaJLBi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDMaxcACgkQAVBC80lX
0GzLXwf8C7WvRhGnluquFmE4QTsgIa5BfVUijJRQokPBLJ36guAvonwimv3k5sIW
0wXj9QKboomPEoK2XAMuAqO4xj3Q0YWrwatlMb1fH11tZB4xJ011gGDVxtJM/Xsn
U114Jh+5ISE5a6zsoaHV4EsCOcDXgdvd+exXFoi2ulKL+YSFTGv9OA7S0iPbdJGk
PUkmAfYxrOLkAvC85J4XBrzhCCwcI4eQPrjtWq2/OP0d5so5uAT6MAkUjFQYT46G
1DGw9U9gGZT4F47uhX8oTrwzpJup2SWbA76WHbUJhdj99SEyN3K0stF4KtZL/BtH
7cOczdtZrkIV+JwdCT90v/gNqhS1PA==
=F/IL
-----END PGP SIGNATURE-----

--Sig_/M+Wq.F/4zU0/J14IKaaJLBi--
