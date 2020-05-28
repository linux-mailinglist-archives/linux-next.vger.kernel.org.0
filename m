Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D86A1E5BDC
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 11:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgE1J3t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 05:29:49 -0400
Received: from ozlabs.org ([203.11.71.1]:41017 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728199AbgE1J3s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 05:29:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xj8S6LGmz9sSJ;
        Thu, 28 May 2020 19:29:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590658186;
        bh=Hm1dO1cPTdJZYVkD5OlDDQ+hwEwXPztlPqzWrJHSMSQ=;
        h=Date:From:To:Cc:Subject:From;
        b=RCsIIFlZ0uY7IRaONqWrayCCvTzy5rkBNQbBUHLR6I46emGRa5THDET/n7RpLCOI+
         UBtGJ624tGJmrtWvFW3lQGi/RO6KlDJ0vLKP99yNMUgEpZCOad2mEFYk2Uxm8tkYaX
         Ge6zpInsSXbPinFKSMTR+XrevDyQKUperd+Yhv9GLdipJm1oE6PdVcuscIqw97edVM
         zuA61J/hdD6bXllEFP1TTmoLO/iokBfbrNiq0b3VvTFjiBkYlviYG/MqhxPyPqeBFu
         gdIOJUhmvJLVemUJAuyX82ZkKGHFFB6J+FASLZ2intrqw7XtUdVElnz9wMDzqnRI47
         +qDnR/qtMkDhg==
Date:   Thu, 28 May 2020 19:29:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: linux-next: manual merge of the akpm-current tree with the mips
 tree
Message-ID: <20200528192943.2bb04a5e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Th_9w2q58xkXjVAQ40B74Kq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Th_9w2q58xkXjVAQ40B74Kq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/memory.c

between commit:

  7df676974359 ("mm/memory.c: Update local TLB if PTE entry exists")

from the mips tree and commit:

  e325f89fdd69 ("mm: memcontrol: convert anon and file-thp to new mem_cgrou=
p_charge() API")

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

diff --cc mm/memory.c
index c7c8960bdd1e,8d52a91d707b..000000000000
--- a/mm/memory.c
+++ b/mm/memory.c
@@@ -2752,9 -2748,6 +2749,8 @@@ static vm_fault_t wp_page_copy(struct v
  		/* Free the old page.. */
  		new_page =3D old_page;
  		page_copied =3D 1;
 +	} else {
 +		update_mmu_tlb(vma, vmf->address, vmf->pte);
- 		mem_cgroup_cancel_charge(new_page, memcg, false);
  	}
 =20
  	if (new_page)

--Sig_/Th_9w2q58xkXjVAQ40B74Kq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PhIcACgkQAVBC80lX
0GzIyQgAoY+qgOgWFnh17epMnYpZvbwX4zScEAMKS/yAvnYxX8Actezu5fdcH4NR
EXQ99RI9bbaFdytCCIE1KPK3VVXAdMId37EOq4FIB1FotnDbUh7PsiDgkLSO7rje
o1A6na6wteKoPI4Iqmqs0b4p3rPXvqO5QLPvL6Xzag2Co6UnjAraohxNWsMJT0eh
dkwY8eHJnMMcbkf3vgOeszk5m+9usSI38AN88WVWogEcciK9f4n/PU7YWnQDcWl9
5M0sGhKO5s3YMuXp8CLS8gVePJDjl/AihtDTH7PWomV0RmDcbxhhyU0/Tp95zgPD
5SyJppf+oMacrCTE504qRxKno63SXA==
=lsVd
-----END PGP SIGNATURE-----

--Sig_/Th_9w2q58xkXjVAQ40B74Kq--
