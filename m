Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64E1EF9B80
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 22:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfKLVKk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 16:10:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57311 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726799AbfKLVKj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 16:10:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47CL4X6ftsz9s7T;
        Wed, 13 Nov 2019 08:10:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573593037;
        bh=GS3qIft1v7dYVvt1kiq+C6/4nrm1m0q9PPdYI84wFi8=;
        h=Date:From:To:Cc:Subject:From;
        b=k5X3xjGMxMKDg+1yAcX7Y6Zli4ckQKkieEffzyvSW3DGatUsNrYeNUjfj3Mwz69xj
         LDX2uUyfKddGhTaaeAEZMU52v6HnpYIShtHn5e8lN20Jjso09nKlArNhkijwv2+CT8
         ti17ihnGga0aXFZEAZxLFpvnEst2WC8XFMLZ4PT/Xz4jAUUoBiyDtak1IVwwrSTe40
         dWwiWa2OWH22ObNp2NDgBCf3/9Q4110PvnVkYkLKNwzQjxGjisGaxf2Yk9pUqO3fz+
         l+deRTepsh+rDsGgkrbhLPwYcCfF/C7SpcUi0defbslzHWtsYWU4IBNX4QxwoUGS/N
         V70zc/PlD+nIA==
Date:   Wed, 13 Nov 2019 08:10:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc-fixes tree
Message-ID: <20191113081035.7e7f9bc2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Pv_kvZtW/M.dP6g.9X5SA0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Pv_kvZtW/M.dP6g.9X5SA0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc-fixes tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

sound/soc/sof/sof-pci-dev.c:116:15: error: 'snd_soc_acpi_intel_cfl_machines=
' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_cnl=
_machines'?
  116 |  .machines  =3D snd_soc_acpi_intel_cfl_machines,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |               snd_soc_acpi_intel_cnl_machines
sound/soc/sof/sof-pci-dev.c:136:15: error: 'snd_soc_acpi_intel_cml_machines=
' undeclared here (not in a function); did you mean 'snd_soc_acpi_intel_cnl=
_machines'?
  136 |  .machines  =3D snd_soc_acpi_intel_cml_machines,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |               snd_soc_acpi_intel_cnl_machines

Caused by commit

  1d3e9077307f ("ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary names.=
")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Pv_kvZtW/M.dP6g.9X5SA0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LH8sACgkQAVBC80lX
0Gzb1AgApXPXaypZpUqWTlaLe2ek17NfCtLdKqtNlTTNcraGpK+bWreP+11wn+bm
bRuFtwbv1WfrL5i9+MGlVKGtLRfzaqIHjhqnLTe2k9YBIaBYlnJKh0+d/3zGrnI0
6joBlvKt/wJM0Q8Axd92D4P3G2VC9LGjoUMCbuV3hceCZwwZVrHTnqg3odWH/gj9
18zi1wwsQxSFgrSvJEDf/8XiZaj1pvjWmNL2EHr4FIjaHHIc17TaW3YhSE+9HWwv
ozG4oZZB3YlHmBepnQryoq4T8kdj3YiE5Giid2ZhzrnxFriQhhQO4gzbVIVgiFmE
HIQat4MbMdU1N5Y/RgKD92FLQweZwQ==
=BbbO
-----END PGP SIGNATURE-----

--Sig_/1Pv_kvZtW/M.dP6g.9X5SA0--
