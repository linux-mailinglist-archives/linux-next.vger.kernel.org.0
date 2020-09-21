Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B4E27198B
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 05:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgIUDQ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Sep 2020 23:16:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35227 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgIUDQ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Sep 2020 23:16:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BvqN86r5Mz9sSW;
        Mon, 21 Sep 2020 13:16:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600658185;
        bh=gZmfVspcSV5vDh8b/gIHxcFz5YAXhlLRaN5FnbNjiXY=;
        h=Date:From:To:Cc:Subject:From;
        b=stkYEHMGhpU7VNBKMiePhGHIXTh++HobsBpudCAx5q3w433n6l8ByAmczxYnfct6j
         SbWOVEAj08VnqfwX9OwF4P9aLSQaXpKZ02hg4W9e3C/zraLgJJUJA8vS4FFAP9yJK+
         pGG+8z3FPU4eZkNsjGi+EnKb8tF45VeQ9UGAl+rPypEu9sKRfqJiA9Erc7X94jN3Wi
         Xs4tFRvAXHqwmAebQCP/5xCnDrSt6yTFm+vvy7i3E3aby4BjbMjQCCgaVPJwA9WuTv
         chd9D9EfVt7falhxXgdBY/aPNRIQl94L7TjRaHC0P6C6MEBso8heXdE7TF/KKwf6XF
         FXrWRj6v/aNYA==
Date:   Mon, 21 Sep 2020 13:16:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-msm tree
Message-ID: <20200921131624.5e88d031@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8+R6R2G+7A0FPV4+tm_jgty";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8+R6R2G+7A0FPV4+tm_jgty
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/bitops.h:5,
                 from include/linux/kernel.h:12,
                 from include/linux/ascii85.h:11,
                 from drivers/gpu/drm/msm/adreno/adreno_gpu.c:9:
drivers/gpu/drm/msm/adreno/adreno_gpu.c: In function 'adreno_iommu_create_a=
ddress_space':
include/linux/bits.h:36:11: warning: right shift count is negative [-Wshift=
-count-negative]
   36 |   (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
      |           ^~
include/linux/bits.h:38:31: note: in expansion of macro '__GENMASK'
   38 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
      |                               ^~~~~~~~~
drivers/gpu/drm/msm/adreno/adreno_gpu.c:212:11: note: in expansion of macro=
 'GENMASK'
  212 |   start & GENMASK(48, 0), size);
      |           ^~~~~~~

Introduced by commit

  e3c64c7221f6 ("drm/msm: Set the global virtual address range from the IOM=
MU domain")

--=20
Cheers,
Stephen Rothwell

--Sig_/8+R6R2G+7A0FPV4+tm_jgty
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oGwgACgkQAVBC80lX
0Gz6bAf/VcOz0utmanyqnSf2f4Qv0o7QHz36L1gxYmx3MgATYWP+PX4zYDSwiTz0
4enRypx8S70QKV/g6WYbrK3nthf2HPUXtJMeePMCKQptW6BSZ8Zy3G9cvJrony5y
4Y4NN935BRW9Jv91kIeWsHREnCAc/whKPUkNTM6ZEp1PbGD/bdCWgLDZesOHu0OC
d9VAkqU64eKf1oFOKr4uT0EZzc0AAoYGHvjPUj39aWi7KcoYKwvRFV9/lAtMZuCf
MRQmrZ0uw4Ioczy1SekdWcWna9NPThVQcibRKWtYlbOAd6Ww1GI+KGnJRBUV+TVC
U6MxPvC5c5odH0fa8t4kgISX8Mdobw==
=X9rz
-----END PGP SIGNATURE-----

--Sig_/8+R6R2G+7A0FPV4+tm_jgty--
