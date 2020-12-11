Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5D92D6DF0
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 03:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389666AbgLKCDI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 21:03:08 -0500
Received: from ozlabs.org ([203.11.71.1]:56947 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391759AbgLKCC5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 21:02:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CsYv70tpFz9sVs;
        Fri, 11 Dec 2020 13:02:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607652133;
        bh=wjYqlDAkuG8LXNrKeTQCqmsEtgrJXUrgEJ5IEwFWQ5M=;
        h=Date:From:To:Cc:Subject:From;
        b=Z/G2RYJ+raEIxyNt/lAj6hu6dFdTyDuLLBl+4cwruDsQzyEdTjqsIJgRTT3+1LzBy
         mHmouXg5o6/2cHSASYwiQZyd49SxnrJQBnWTTRX/8kvFYVz6cAgri5QLkgb7/BPun0
         KeI0Ecnze7goCjSQQ6Njs1Awbkn4uLMtNdPKZSzsGuZ44vSZJy+duzNdnMJIYBvVdI
         hooz391rx/qpk3NIPHOdQn3qGdg+cyjRVssiSm2zYtVLAHodagkeTgUVw3MN5yzJZ9
         M7ysaHQWJ5H+Hi5NlH/b9Sp1um4+Eatp0NMcXKePvKWPVC7UwL4dp8SRomXFUlJ3Jr
         eJrkZyFJDECVg==
Date:   Fri, 11 Dec 2020 13:02:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc:     Ashish Kalra <ashish.kalra@amd.com>, Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the swiotlb tree
Message-ID: <20201211130208.2cf1e813@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+zBfjzr_7SvHQi3rLsGL0s_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+zBfjzr_7SvHQi3rLsGL0s_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the swiotlb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from arch/arm/mm/init.c:24:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/dma-direct.h:13,
                 from arch/arm/mm/dma-mapping.c:17:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/dma-direct.h:13,
                 from kernel/dma/direct.h:10,
                 from kernel/dma/mapping.c:17:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/dma-direct.h:13,
                 from kernel/dma/coherent.c:10:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/dma-direct.h:13,
                 from kernel/dma/direct.h:10,
                 from kernel/dma/direct.c:16:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/dma-direct.h:13,
                 from drivers/of/device.c:8:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/dma-direct.h:13,
                 from drivers/remoteproc/remoteproc_core.c:27:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/dma-direct.h:13,
                 from drivers/of/address.c:16:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from drivers/mmc/host/sdhci.c:23:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/nouveau/nouveau_bo.c:31:
include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but =
not used [-Wunused-function]
  108 | static void swiotlb_adjust_size(unsigned long new_size)
      |             ^~~~~~~~~~~~~~~~~~~

Introduced by commit

  79f748d1bdb6 ("x86,swiotlb: Adjust SWIOTLB bounce buffer size for SEV gue=
sts")

Forgot the "inline" :-(
--=20
Cheers,
Stephen Rothwell

--Sig_/+zBfjzr_7SvHQi3rLsGL0s_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/S0yAACgkQAVBC80lX
0GySkQf/Tu3dLK1kX5hY3AO67nLShwAUnw64WxmKcXcW0G+MGisLk4vddvWQFiN1
WJTySNbf9s1krDuGi6P53IsFEAWdBl2LUubeS32iccf7CBLVx8cNG4/AJcv4Ptu/
mqnV5IaIaEKyojUgG9dkTU/4O2qM0cT8NVPsr5w6NfdxP5N3ziI5OAQsPv9hvZf9
9qRBuE8NTuNWapPfMDCdIeakJpZHFMczATaeDGhMPM6jP363jhjWnpB8pY217eZR
5AKB4Iz94pZ9R4cezeQp/iPdMrH1Iz6rsE8Haqehp46LyEEBRumWPI8/sZA2dQbj
CJCdQ7za14MODh1+NFxEV/6q4NydYA==
=VWhY
-----END PGP SIGNATURE-----

--Sig_/+zBfjzr_7SvHQi3rLsGL0s_--
