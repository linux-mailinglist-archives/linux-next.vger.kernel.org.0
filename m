Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753F0392708
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 07:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhE0F7q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 01:59:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232773AbhE0F7q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 May 2021 01:59:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FrHDN3PS5z9sT6;
        Thu, 27 May 2021 15:58:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622095092;
        bh=IJpF8tXQBgiO8NOQhHK3UOJgOGaHp/5RGo1D9tl/Axs=;
        h=Date:From:To:Cc:Subject:From;
        b=Ra4gGYdGKLDla4avUuRpzRIBfysyajVefYLpcu7oNkIBM4uZyWezQTa8ixfYLn4BW
         sTS7ZKROaV/TbsHIcpYoLIkbWFcYHrMuuYMFe5FWT9cywE1P3zWH+ODEkG2inh7K+U
         0C81UF3+UCpB+5zt+ddHaJdc/AXPVlMpogFQKZEcx1LRgYdW98K0uIDr3znjqfM5UU
         RwrJ/X0ZIuEwCTgPoTOoU0mDrLRfITzDZYCJv5qKGV5IhiOQUub08sjqESTzoGPr7f
         vkCE3UYzf4jwSX4c3NdM9yAybfKaM5PGQFzMehzooQHOGigTaOOic4FRSuUL+BMt8d
         ac8SahcBc+T+w==
Date:   Thu, 27 May 2021 15:58:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210527155811.708f269d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rmbLdaB+vABcRp5HfwBSG4U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rmbLdaB+vABcRp5HfwBSG4U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: drivers/gpu/drm/amd/amdgpu/amdgpu_device.o:(.opd+0x408): multiple defin=
ition of `amdgpu_acpi_detect'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.op=
d+0x1c8): first defined here
ld: drivers/gpu/drm/amd/amdgpu/amdgpu_device.o: in function `.amdgpu_acpi_d=
etect':
amdgpu_device.c:(.text.amdgpu_acpi_detect+0x0): multiple definition of `.am=
dgpu_acpi_detect'; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:amdgpu_drv.c:(.t=
ext.amdgpu_acpi_detect+0x0): first defined here

and many, many more.

Caused by commit

  753c7d6d85f5 ("drm/amdgpu/acpi: make ATPX/ATCS structures global")

The !defined(CONFIG_ACPI) version of amdgpu_acpi_detect() is missing
"static inline" ...

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/rmbLdaB+vABcRp5HfwBSG4U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCvNPMACgkQAVBC80lX
0GzDtwf8CgT1mmZQzF79FpyOlsOTmktTJiFOgUuRjlDzihYVWZ5dfjq3YUWvKfrJ
8vpbeNAp/xhOBGmzocIMTYFd9HQyI0jpufM42cgSrrtpzpvxXwey798NZDU8l13o
yVxcDh9FTnamZ3a4s5BNuSGr8guTfWe4QdVVsh5sx0T5BjNv4KHkXiP/ckQhsgE5
nX41aUvC0bAm2IG5yZoBMZ3sLE7uoQJz/ByUcKIKJCFlcRRDETCtATVUPXSyJDM9
tUzWtY+bBLnCHCm/+jICI0xinRfmjW81dpn5AbcoX/xpfnI6Q0/vNa7PPJm3P817
xtDtW72fZF/0smWpm6/yOKTjrdnRyA==
=XVSJ
-----END PGP SIGNATURE-----

--Sig_/rmbLdaB+vABcRp5HfwBSG4U--
