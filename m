Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89BA921641D
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 04:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgGGCof (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 22:44:35 -0400
Received: from ozlabs.org ([203.11.71.1]:56395 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbgGGCof (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 22:44:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B16GS4VjSz9sRR;
        Tue,  7 Jul 2020 12:44:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594089872;
        bh=HP+pO41oFoQSlyD8UWUtPdpmn6fAVCYBd6fmrUXd82w=;
        h=Date:From:To:Cc:Subject:From;
        b=O3TpP6f74YD9R7g4wzVkCIS8RlyRL9sIyduZ0yGmckRI0YatglZCuXuT9PDpUBE/X
         p75HQ03zlwBAMlDrclX9gDEg4SV4/Z8IMx4wAiOG3Nalbw0ASyj4gDFpYtf6dbSj7D
         NtZi86nOUmzw0S4fKi3/D3XqT65hQekPO9DpUKz7A1CyDNN44vZhm9Rr7fjaCUZ8Ao
         RULer9aFav8cCgbvJETlwyivea+bEwKwSUkW2w3CcTWW0FE/qb8HzItaBP8A9Rgbd4
         804QpSPZ3uT02+A8InbAr360fMOEkErFMCkdocfNeE4t4x+3akWDVSkvubehZworsL
         eHUcXXU1Se3JQ==
Date:   Tue, 7 Jul 2020 12:44:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the mfd tree
Message-ID: <20200707124431.450bb0da@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TvkVtWjdCBZFDArLLAFpwQZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TvkVtWjdCBZFDArLLAFpwQZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/mfd/axp20x-i2c.c:82:5: warning: "CONFIG_ACPI" is not defined, evalu=
ates to 0 [-Wundef]
   82 | #if CONFIG_ACPI
      |     ^~~~~~~~~~~

Introduced by commit

  20f359cb236b ("mfd: axp20x-i2c: Do not define 'struct acpi_device_id' whe=
n !CONFIG_ACPI")

--=20
Cheers,
Stephen Rothwell

--Sig_/TvkVtWjdCBZFDArLLAFpwQZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8D4Y8ACgkQAVBC80lX
0GyvrQf+K+Qjf4neIlMo2JtfdDGyKKNJR6RpAcC/JWhC4IF3BrotP2cSbpZHkE2B
yLXyrnsIM5O/DLXUTfJFUPQxC4laW2k0hszr36hTxBAiZipMOCqeBmwN+atJkZ5D
UoYc0SzWQ6zZ/X/BT4ydLJ2g6uJyhnePn4tUlSwJUfd06oOCO2nGTCnH7YtKiAbJ
Eu/t4VDZcmYyPzpsY3FUavJSfWVBYsoJUf1hPWLogeh7DP0wjHJ775+nVR3mEj6Y
yIafruTIJzILqaUXMwdaVo4vqSOn/MPqqgvz5vLdTqrVd9RwTKKEISKZ0h6p2oAf
3A7Q3FrZoeed477buZSeIPVZql7YiA==
=/lgx
-----END PGP SIGNATURE-----

--Sig_/TvkVtWjdCBZFDArLLAFpwQZ--
