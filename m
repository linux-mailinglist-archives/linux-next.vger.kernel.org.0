Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4B819E8C6
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 05:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgDEDKI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Apr 2020 23:10:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44093 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgDEDKH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 4 Apr 2020 23:10:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48vzDq59yJz9sQx;
        Sun,  5 Apr 2020 13:10:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586056204;
        bh=fvgeokAdrUY1ayczSaNBMqbn5f/CloxLvmpQtSnHlLU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ewEjEYXPMb2mDHt4X0Mw2onhTa6hpWdgsEhR4sIYNfkho2VBlTrqziklCkZoBmEsC
         j/Di1FotZwFuFWQrfeFjd8qahVGpvbkwmksFcUfoPn68+fr/bu/1qQMct4lsEdP7eE
         Gn0jhs6j1A0Jg8xcdf1tDGa2a6IMaKQFkFPHLVDe/WpEx7e+MLrl6jM1VTsbQi0jBy
         g2+zM/OWLFWYM2LomAID8XPUbbeTy1J8W9q45Odn4EgFNlYywLKKucSwEFrR01/v/q
         jHi0Z/8zawPwN9joaqV1J2ZO3ZSHronw8rgyGwbGtAPKn4+c+itybhfQDBDn+gZskM
         WFANDdAITUA7w==
Date:   Sun, 5 Apr 2020 13:10:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        "kernelci.org bot" <bot@kernelci.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: linux-next: build failure after merge of the ide tree
Message-ID: <20200405131002.698c35d6@canb.auug.org.au>
In-Reply-To: <20200405111307.6d0ac36e@canb.auug.org.au>
References: <20200405111307.6d0ac36e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8a.d_fZ6IDZzWG0RE++hRC/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8a.d_fZ6IDZzWG0RE++hRC/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 5 Apr 2020 11:13:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the ide tree, yesterday's linux-next build (mips
                              ^^^^^^^^^^^
Actually "today's".

> bigsur_defconfig) failed like this:
>=20
> drivers/ide/ide-scan-pci.c:104:13: error: incompatible type for argument =
1 of =E2=80=98list_del=E2=80=99
>=20
> Caused by commit
>=20
>   6a0033457f23 ("drivers/ide: convert to list_for_each_entry_safe()")
>=20
> list_del() takes a "struct list_head *", struct pci_driver::node is a
> "struct list_head" i.e. there is a missing '&'.
>=20
> Reported by the kernelci.org bot.

I also had it fail my powerpc allyesconfig build, so I added this patch for=
 today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 5 Apr 2020 13:00:22 +1000
Subject: [PATCH] drivers/ide: fix for conversion

Fixes: 6a0033457f23 ("drivers/ide: convert to list_for_each_entry_safe()")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/ide/ide-scan-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ide/ide-scan-pci.c b/drivers/ide/ide-scan-pci.c
index 383f0d813001..b0411a1827a3 100644
--- a/drivers/ide/ide-scan-pci.c
+++ b/drivers/ide/ide-scan-pci.c
@@ -101,7 +101,7 @@ static int __init ide_scan_pcibus(void)
 	 */
=20
 	list_for_each_entry_safe(d, tmp, &ide_pci_drivers, node) {
-		list_del(d->node);
+		list_del(&d->node);
 		if (__pci_register_driver(d, d->driver.owner,
 					  d->driver.mod_name))
 			printk(KERN_ERR "%s: failed to register %s driver\n",
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/8a.d_fZ6IDZzWG0RE++hRC/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6JTAoACgkQAVBC80lX
0GxdMQgAg85JUqaRuECCRcyhDdSAhelsC4RB+HuepGbLpisDWC/i6gNdD+BG6vh+
lEzvj9/fhPGLutOkDbqKTzjaVQfg1yT5A/GwQtD6HnRpCcPoEl2psnIuWJ0cc0AT
LXY/CSh7x2ym80Kxsy53iXw8CDWRSHILKEe1rkKt8obojMQYiS2WowU4VtbogAXd
+idoEbjZLLlAf3FvhVOAwDJ7GXZS4Sk0POlw9OcQydY6PC2E8lOBB8l9yHgagtit
dnvvOiBJbCeIee4o8KtD+G82qOmPt1wzHRFEz8lZn99F2cGzZOs6oysl4iPrh7Ji
h6kHSbccaIkpPU2PReKW4K6OQAODgA==
=v//z
-----END PGP SIGNATURE-----

--Sig_/8a.d_fZ6IDZzWG0RE++hRC/--
