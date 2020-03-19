Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD71418ACED
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 07:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgCSGmO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 02:42:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgCSGmO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Mar 2020 02:42:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48jclP2sYNz9sPF;
        Thu, 19 Mar 2020 17:42:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584600131;
        bh=+5lhggxbhdVnZoEt9bh3nTvCzaNh8yLI+gywBcqpyeg=;
        h=Date:From:To:Cc:Subject:From;
        b=C34cn+c8smSAz3FD5hCNqtKaEzumXF27309hy2ImDCd+dEZlZj9zepDeJ//FpNS9s
         JeDTbAn+mQNAL+nEVeDbBY5rI973NQxA8wFC+1mc+PBxN2QWVQj/JmY0VQPrRDs6F3
         IbrM4+rIwh5o7qD8d/kpMHAVoqKKeeFPAJtsDc2kp3eVbJynrK66zpPhINNvO9ZHoO
         M8l1EcYikamZWohmPg9NcPyjqL1I8QiRgSY8ArIAZcX+/uhCarLRV6NDaJ8LoLIf24
         uhgv7E/27IKzxF6O9xuHzaXpKX7WX790hk0ujGfPEqlNMGq32Yyj6g+HT6kRQGlX7M
         12p5tC9z6VNGQ==
Date:   Thu, 19 Mar 2020 17:42:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Borislav Petkov <bp@suse.de>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200319174207.5ab1c990@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hoCZsQRqtvSChcwHQqNA/eE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hoCZsQRqtvSChcwHQqNA/eE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/include/asm/pgtable_types.h

between commit:

  6db73f17c5f1 ("x86: Don't let pgprot_modify() change the page encryption =
bit")

from the tip tree and commit:

  faaa52178603 ("userfaultfd: wp: add WP pagetable tracking to x86")

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

diff --cc arch/x86/include/asm/pgtable_types.h
index 65c2ecd730c5,e24a2ecf9475..000000000000
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@@ -118,7 -127,7 +127,8 @@@
   */
  #define _PAGE_CHG_MASK	(PTE_PFN_MASK | _PAGE_PCD | _PAGE_PWT |		\
  			 _PAGE_SPECIAL | _PAGE_ACCESSED | _PAGE_DIRTY |	\
- 			 _PAGE_SOFT_DIRTY | _PAGE_DEVMAP | _PAGE_ENC)
 -			 _PAGE_SOFT_DIRTY | _PAGE_DEVMAP | _PAGE_UFFD_WP)
++			 _PAGE_SOFT_DIRTY | _PAGE_DEVMAP | _PAGE_ENC |	\
++			 _PAGE_UFFD_WP)
  #define _HPAGE_CHG_MASK (_PAGE_CHG_MASK | _PAGE_PSE)
 =20
  /*

--Sig_/hoCZsQRqtvSChcwHQqNA/eE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5zFD8ACgkQAVBC80lX
0GwIfAf/dyYf/0/q6p12k3DnYU9XnkSKIMv2u31K8+2lt73koGkhP+rKbqJGoou7
e8tGFOUkVYgPS9CLguSGhG2TxvJM5PkdphVR440e67e0zocKnxoN0QGTal3ufoJ3
7qGkpL7JaGuc7Bnvy2WAIbFUaVECStA3imfeSd+zq+X5RJcXzkuCJxwPSvOfuDxz
RkGmTfe1t+66lk8J7dcaQ/b+fjIh8XnF8IhP0vLZLFyKHhlum1cXSRmUkp7Imx7q
XrizbQ545xUXVg6m72Nt+d7bjxVqP7v160/x1kXzdoGWA+tyJFvOX6vvFKY6mdlp
Np5zeFTtg5/tjxptDibKbCJcnhY0+Q==
=4kiG
-----END PGP SIGNATURE-----

--Sig_/hoCZsQRqtvSChcwHQqNA/eE--
