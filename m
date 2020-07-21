Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514702278DF
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 08:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgGUGas (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 02:30:48 -0400
Received: from ozlabs.org ([203.11.71.1]:32813 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgGUGas (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 02:30:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9pd222Qlz9sQt;
        Tue, 21 Jul 2020 16:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595313046;
        bh=Ski7uvVE6HCOcCrUZSaPFCYyuGvb4x7b/TTuVA+A3sg=;
        h=Date:From:To:Cc:Subject:From;
        b=EqjkVxMIOc469vracsxL61urPM4YSMaLF1euHNynPfMlX0UA7uL+J6wOI/IYQl+cM
         /Pz9EmG4miq9VcA7db8DWjXGGcivM0XFhZ21h03HZ2ao46a1pSNOV1TTmLsl9HPFXJ
         8cMaNYjk0dvixjXEONEJ+u4W3B0tDoroQhsCCaxJvD7j4Od9XGPEsFmEJ/Tt0wXeeN
         7CvsyxZN6AIi9467Y5HwhG+FAcYx+rAaP7kIfuZOGyVHGaHMwPhGKhIPL++MMSFPOa
         OtmZqlNyAKVfIps5OKPUwYFYYCYUBWiSkvsljLNwhkmeGYj8shz+aAfB2FuwEyJ0m/
         HcPQcUHqDnp1w==
Date:   Tue, 21 Jul 2020 16:30:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20200721163045.50c205a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZZoqgnmJ5s9kV/F0STSQU=i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZZoqgnmJ5s9kV/F0STSQU=i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "exynos_ufs_dump_info" [drivers/scsi/ufs/ufs-exynos.ko] und=
efined!
ERROR: modpost: "exynos_ufs_init_dbg" [drivers/scsi/ufs/ufs-exynos.ko] unde=
fined!
ERROR: modpost: "exynos_ufs_cmd_log_start" [drivers/scsi/ufs/ufs-exynos.ko]=
 undefined!

Caused by commits

  c3b5e96ef515 ("scsi: ufs: exynos: Introduce command history")
  957ee40d413b ("scsi: ufs: exynos: Implement dbg_register_dump")

I applied the following patch for now.

=46rom 6535b25fb253c7f25bf924655edb2b22fdaeb545 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Jul 2020 16:26:05 +1000
Subject: [PATCH] scsi: ufs: exynos: mark debugging as broken

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/ufs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 2c31b33f0adc..925f8de62f6d 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -178,6 +178,7 @@ config SCSI_UFS_EXYNOS_DBG
 	bool "EXYNOS specific debug functions"
 	default n
 	depends on SCSI_UFS_EXYNOS
+	depends on BROKEN
 	help
 	  This selects EXYNOS specific functions to get and even print
 	  debug information to see what's happening at both command
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/ZZoqgnmJ5s9kV/F0STSQU=i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Wi5UACgkQAVBC80lX
0GwB0Qf/TvUUtrSxXwKpGJGAxsk2LBni0oVRd8u/WObwL3V1E11lFeI3ddN+eNRM
xXVDkc3xRpm1RES46Pl/AMLETFQlY+Zq1Re719v0sKxThEoUgHTJRaNQMmaTQuhN
7dqZx0d8yeY8dfIrhatI/OQ27l9fcZoIZ/RCJea7IucYVHdJIJGsrXGU4yxZ7f2X
2WJP7S6aZN2QFcIRB+7OLLtnpPiD2oLOGkrKMzZ3IKYqKkCf+uymiLQ7JrdvPrGB
8s1gHkIHmQ+F6cKcKbUF9io1pnn4czSS4kW9nX+k6IPU0FbqlRlJojceWLr+iXpX
h6mhAcM15bqn/JbM7irs3eoYquYypA==
=eVyE
-----END PGP SIGNATURE-----

--Sig_/ZZoqgnmJ5s9kV/F0STSQU=i--
