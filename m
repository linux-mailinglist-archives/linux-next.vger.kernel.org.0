Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26861D2B44
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 11:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgENJXu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 05:23:50 -0400
Received: from ozlabs.org ([203.11.71.1]:55557 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgENJXt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 05:23:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49N5h26KMPz9sVB;
        Thu, 14 May 2020 19:23:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589448227;
        bh=1Zo7Diupk/PIVC/QMT49ak19AAoXlnvRE1lK5anTsOc=;
        h=Date:From:To:Cc:Subject:From;
        b=QO5smZSDtp6CV4oIX+Ig1gGG+fgkf8oAsby7EYM0+JWPwEtRELWXmAXfl1pX3KSMq
         zHBk4m4EDMY25qEfY10M1xztxxIfpOPTZovLNXTKVS6m2QDNCx10Ba8Ga1IoDJ5ouT
         oF7Mf/Vl9Lm8VTtmm8u2nu7xFSXAxPuA03nq6QnLCkmuDqHWZabKMw0eNCQ+Crmwxq
         3tqzh5zxAufhxEO3ZMmMIxFiCCv/h8UyM6QFTHuzj969xTbQn6Mkiu2F0P1Pwm36KL
         BYAfBfN+fqC+0ZEbxCcwNjvLRqoqN8gOCDP6YWuvOA44zXEuUOtXiDEtMpXnZSNIXk
         iP10kEOp93dSA==
Date:   Thu, 14 May 2020 19:23:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Jiang Yi <giangyi@amazon.com>
Subject: linux-next: manual merge of the akpm-current tree with the kvm-arm
 tree
Message-ID: <20200514192346.6e53e0a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fpFwL9sMUX+QGe.CjqPl4Yt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fpFwL9sMUX+QGe.CjqPl4Yt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/kvm/mmu.c

between commit:

  70fb2fa12176 ("KVM: arm/arm64: Release kvm->mmu_lock in loop to prevent s=
tarvation")

from the kvm-arm tree and commit:

  72ff958aa971 ("arm64: add support for folded p4d page tables")

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

diff --cc arch/arm64/kvm/mmu.c
index ddf85bf21897,534d9798c3cb..000000000000
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@@ -421,10 -469,7 +469,10 @@@ static void stage2_flush_memslot(struc
  	do {
  		next =3D stage2_pgd_addr_end(kvm, addr, end);
  		if (!stage2_pgd_none(kvm, *pgd))
- 			stage2_flush_puds(kvm, pgd, addr, next);
+ 			stage2_flush_p4ds(kvm, pgd, addr, next);
 +
 +		if (next !=3D end)
 +			cond_resched_lock(&kvm->mmu_lock);
  	} while (pgd++, addr =3D next, addr !=3D end);
  }
 =20

--Sig_/fpFwL9sMUX+QGe.CjqPl4Yt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69DiIACgkQAVBC80lX
0GwCMAf+McdULBYhNNYDv5u4GRbw3RhvqMgN0BPUCKy62XeYXx1YLpbx925Z+wTs
RLbt7tSUlBJDjo963+UivUuxfjG4ysqrSBLNjCeS/BnOfpVzLaDjHHg1zHzh52xR
B35Jhu2Kw9KtNDiGbN3ldMO43J9dQkqf06Oram1BnvReiBAN/MEfcebGGnNzPxB4
8RH5P9w6+hB4IdrYKYKVfBxldVerRVwT94Zh/2GDtUkG5dzw6hJQDqZHmNtfRX8E
oyzg94LVskShTrOEalThXFnZ+OKpdJQJody66UO8vxlSrCvSYfSSrBMUW1VXnlo7
sukFbK+GYdl5vbviUyeqXzhQsbogBw==
=dMJ9
-----END PGP SIGNATURE-----

--Sig_/fpFwL9sMUX+QGe.CjqPl4Yt--
