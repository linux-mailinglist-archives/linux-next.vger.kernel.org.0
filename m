Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412542F9948
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 06:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbhARFaE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 00:30:04 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33265 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbhARFaD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 00:30:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DK0hc63rPz9sW0;
        Mon, 18 Jan 2021 16:29:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610947761;
        bh=3MS6saTof63YUUk9qgRAG/TGCLAihp885ihoC9lMxqU=;
        h=Date:From:To:Cc:Subject:From;
        b=eHZLHsVjfzF4X30UukVGlbDWvyJFQeGJ8cSYOzb3d4D0COQRz0HLZ+y1O36YJn6M7
         q9Zva/Ur3akQDmlzxGUXzF0rqeNwrP4IZdqhiB8qumoFKVNHi3SA332QxxgCzZTeXB
         efYOZiZ721XeWJBCzNq65148R2q6fL2Qb35ZR24nk6uD6Z5LLeB+lD1GVI3wBcz+p8
         hv65tjrc9KAE6up3DOURfJDlspPgNUoj/+AiJh0DouTbIbW6TuDVo/NItr+beQjg/I
         71zC3/S3syqD1ENM3pmjmWk6slA2TsMaiW1smFXPCMztBnCWTI/fFVbVG5YP5/qH8V
         N8w5AKYqMJong==
Date:   Mon, 18 Jan 2021 16:29:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Huang Rui <ray.huang@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210118162919.51f2dd3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TCH=uEu946f5k6yvaWa/C52";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TCH=uEu946f5k6yvaWa/C52
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
allyesconfig) gave this warning:

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'va=
ngogh_init_smc_tables':
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:338:5: warning: =
"CONFIG_X86" is not defined, evaluates to 0 [-Wundef]
  338 | #if CONFIG_X86
      |     ^~~~~~~~~~

Caused by commit

  9dd19d5232a6 ("drm/amdgpu: fix build error without x86 kconfig")

--=20
Cheers,
Stephen Rothwell

--Sig_/TCH=uEu946f5k6yvaWa/C52
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAFHK8ACgkQAVBC80lX
0Gzrowf+MfsT3l4zdB+4vywetZw5XNAlo7/NxDGt9Sua8OiSunA1ZGypMO78e1Vq
JH9DxE0Odv/WaCX/SVzLloqeVIVmXDCBXcMYvmYz26mzPmxTpCi1c35KPlAQP3Is
HIaRU9IVOU/CAt+1VumGZ2bVGtZmLcPd7atJthv4nxrUHvnpkA/RQZX81FTtGz3B
GbaVyoi3C72qN5zo0LBjbr6mmPH9vxEDBsevZ8xKD/201zJ6IYX3lARAwQk/qWpg
G+p+0HV8tzQ7bXPlMnAbO2spDxbpzxVhpUNlKRIb2D44x7cpmoYbYeTJyaPb5jjA
JQ2DAw1+IIPmkXcM2wU7A9wbPDFLWw==
=WzUs
-----END PGP SIGNATURE-----

--Sig_/TCH=uEu946f5k6yvaWa/C52--
