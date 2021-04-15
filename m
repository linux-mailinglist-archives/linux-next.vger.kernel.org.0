Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08793604DD
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 10:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhDOIwn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 04:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbhDOIwn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Apr 2021 04:52:43 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F7AC061574;
        Thu, 15 Apr 2021 01:52:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLY4c6r5tz9sV5;
        Thu, 15 Apr 2021 18:52:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618476737;
        bh=QB4BCrjpgU5KIJI4AkeD+l2HmZyaeGojTt9+DV9zCLo=;
        h=Date:From:To:Cc:Subject:From;
        b=sPz/Rn+h//t1rbqV0p7oPnMtgSi30MbEu9LFkiVRK1KgD+aYNJaEMc1C2aN+M3fye
         fes31BRejNNvBZKZUu62VGkuA/CLovh65QZhFnCgxsr42AFUug1K/AzlTUqWMh3kVg
         BPBf5/NaTkuXlwDYbceTPisTBHOVuKRwCXg5V8YF4ETTCXrkfPSQkcXn1oPSNhiXu6
         wJ33Vwqw3Q8CB/m0/2BhAueZl7DD0avibnZvzg7dFX6y4szTuhjd4yske9TQg6BlPW
         aWwZaYs7AhZE6wgSdlsxi9j4K3nTA1al9L0Gqn9j1lgxA0uw0dH568UVvuKpHq9te0
         UP0cX6fCV7U8g==
Date:   Thu, 15 Apr 2021 18:52:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210415185214.01e1e64f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S2nGF_z4WmlMfPGsNq_GhQO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S2nGF_z4WmlMfPGsNq_GhQO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

In file included from include/linux/device.h:15,
                 from arch/powerpc/include/asm/io.h:27,
                 from include/linux/io.h:13,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:11,
                 from include/linux/highmem.h:10,
                 from include/linux/bio.h:8,
                 from include/linux/libnvdimm.h:14,
                 from arch/powerpc/platforms/pseries/papr_scm.c:12:
arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_pmem_flush=
':
arch/powerpc/platforms/pseries/papr_scm.c:144:26: warning: format '%lld' ex=
pects argument of type 'long long int', but argument 3 has type 'long int' =
[-Wformat=3D]
  144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
      |                          ^~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
arch/powerpc/platforms/pseries/papr_scm.c:144:3: note: in expansion of macr=
o 'dev_err'
  144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
      |   ^~~~~~~
arch/powerpc/platforms/pseries/papr_scm.c:144:43: note: format string is de=
fined here
  144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
      |                                        ~~~^
      |                                           |
      |                                           long long int
      |                                        %ld

Introduced by commit

  75b7c05ebf90 ("powerpc/papr_scm: Implement support for H_SCM_FLUSH hcall")

--=20
Cheers,
Stephen Rothwell

--Sig_/S2nGF_z4WmlMfPGsNq_GhQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB3/r4ACgkQAVBC80lX
0GzHTQf/fKx+jXRlPW1AX2OiUn+d7JMj6eTElM/cuCdqNjO8RMmqrbh/MVl7UJ7G
WKy22wVfJp+d8gaJMmosAoNjCC8CPwYBgbjGrzQ8ipBRp9kguHl/er1jMusYAyvQ
dJ3DcV8BDhltacPQ8AFBChzw0tm7WfOQsfdMo00k+OMnQSrYIefEeaxSilpCgL6s
Af2mli1J1MjfnR6uqUpLgQyY6WM/9s+LFKhzrvWkdJhqVR9BUEwPA51XzU+RleLZ
KsrWHQW5mgaoLxzdr0zols3KvT8Rq3rzIZ2u7MsqCLKrng8lC4xDMRPz1wohfVBL
/WjL2J1eG9vys5Ts5vj8pVMmNpyj6g==
=KZQ0
-----END PGP SIGNATURE-----

--Sig_/S2nGF_z4WmlMfPGsNq_GhQO--
