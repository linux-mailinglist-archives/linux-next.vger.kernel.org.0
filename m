Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1E5B9419
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 17:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389095AbfITPfj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 11:35:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:39154 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388863AbfITPfj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 11:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jv6jwZLjeneciY2Go2v67af3R12NQ37nUpqtm2+kHRM=; b=dmaT+BytqE1t23KxTkYNziZ/Y
        3xjHWp/RdLqFG11O/LTqk54oLdHl1uGUY9p3q5X5jXMvcqJSDDbwVtK9YRyN/cJ3A7zLpWVdADvfF
        9pzkIpbaqqldFhtglrfAVgHPyjMA7vf2+i4Yc/OiydVfmniS5Rtbuh6uEGGtBhVb5FHqc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iBKwZ-0002mq-TN; Fri, 20 Sep 2019 15:35:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 205AB274293F; Fri, 20 Sep 2019 16:35:35 +0100 (BST)
Date:   Fri, 20 Sep 2019 16:35:35 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the
 risc-v-fixes tree
Message-ID: <20190920153535.GG3822@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/riscv/include/asm/pgtable.h

between commit:

  b6f2b2e600a27b798 ("RISC-V: Fix building error when CONFIG_SPARSEMEM_MANU=
AL=3Dy")

=66rom the risc-v-fixes tree and commit:

   e10b0ff68eee9f59 ("mm: consolidate pgtable_cache_init() and pgd_cache_in=
it()")

=66rom the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/include/asm/pgtable.h
index 1be4f70ab2660,f45f6fbd2a50d..0000000000000
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@@ -439,13 -411,12 +439,8 @@@ extern void *dtb_early_va
  extern void setup_bootmem(void);
  extern void paging_init(void);
 =20
- static inline void pgtable_cache_init(void)
- {
- 	/* No page table caches to initialize */
- }
 -#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
 -#define VMALLOC_END      (PAGE_OFFSET - 1)
 -#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
--
  /*
 - * Task size is 0x4000000000 for RV64 or 0xb800000 for RV32.
 + * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
   * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
   */
  #ifdef CONFIG_64BIT

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2E8cYACgkQJNaLcl1U
h9DwIgf/Yk/LkPBeRdpiRkluEKMxHCUj7c3Yr2rXQ6eqPFnLMKhUx6ljfSgc7pHZ
1AD7RXPDvJO3Yq291egkMnWM+MgxTz1fkQCQRSaCduxRogfXXrxEPAC8zwRQoaHC
WfpUgPDVctUf/W4+QIC4fwGLwdnyFbfMgoaLUwQ+PAw+l5A8utf+6qMKKMtwdgmi
1sDKE9V/K3cPxI2vv1psFCLjXYagUhSX8PE8So+VAs61w3j531zjfDY0Z3KageHt
tsFibX58ZWUWfxkXaAZsyggEsafErf2y1CLU+vUHT0KnMldsFrdVdy0DuPXP75f/
JixbyJTuVwYj4FQPFFShMrIxsaGKMw==
=Gg5i
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
