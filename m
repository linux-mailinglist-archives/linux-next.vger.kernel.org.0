Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A83A5F3B64
	for <lists+linux-next@lfdr.de>; Tue,  4 Oct 2022 04:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiJDC2J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Oct 2022 22:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiJDC2H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Oct 2022 22:28:07 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500E813F70;
        Mon,  3 Oct 2022 19:27:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhM6j3fsFz4xGR;
        Tue,  4 Oct 2022 13:27:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1664850446;
        bh=P/VIAOmJpO1XZIvYY8IRtSNZ6UnGWvqi6+0IQ8E6Ix8=;
        h=Date:From:To:Cc:Subject:From;
        b=u+ICfgjRDSrmsM8WykUAdauyQdUyeScc2DAmwSfGzNJdYfhZoBViAv/j4PZyyh5wL
         ke7UlyT+jdvi4Rw54fxCLrJVDa3jS18MHUxdC0qUKGcibMAOUpt8wdJRgd1qzPbarx
         ydRn/GI9Gs3+A/gpKU91vEqUIUQ519YuujgQrX/+xcBjqkt/lg7YrHkwukukdEFPgU
         anHn37YS6qOiEKl8j2pfNkHMvHQN20fRmEMlw1giIXdrLVbc87Id3SkQD7Tgzpms6f
         TNTi4CtZzwpUMoGZA2uew5DXOWplGPbEmqLUzqtb4AhbA8tkx8RiNYFxOJTSKXEOiZ
         gvUWrawfc/AKA==
Date:   Tue, 4 Oct 2022 13:27:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>, Dave Airlie <airlied@redhat.com>
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        ruanjinjie <ruanjinjie@huawei.com>
Subject: linux-next: manual merge of the fbdev tree with the drm tree
Message-ID: <20221004132723.7b4b03ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VgRbDH8A3MIwgyQlb3jQMV2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VgRbDH8A3MIwgyQlb3jQMV2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/tridentfb.c

between commit:

  145eed48de27 ("fbdev: Remove conflicting devices on PCI bus")

from the drm tree and commit:

  d738bf0123d6 ("fbdev: tridentfb: Fix missing pci_disable_device() in prob=
e and remove")

from the fbdev tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/tridentfb.c
index f9c3b1d38fc2,4d08f4489a0a..000000000000
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@@ -1471,11 -1465,7 +1466,11 @@@ static int trident_pci_probe(struct pci
  	int chip_id;
  	bool found =3D false;
 =20
 +	err =3D aperture_remove_conflicting_pci_devices(dev, "tridentfb");
 +	if (err)
 +		return err;
 +
- 	err =3D pci_enable_device(dev);
+ 	err =3D pcim_enable_device(dev);
  	if (err)
  		return err;
 =20

--Sig_/VgRbDH8A3MIwgyQlb3jQMV2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM7mgsACgkQAVBC80lX
0Gy6ugf/Ra0OpZea4BrirYbeQMKVFj6mXAHmqwPdQKYSR090tudEKLpUtOuGOoRY
/GLZpXfRSdycbLe1fIBVr79/XYO6rKUgGMzhEcL+4IX8GXkC4J1Mlbmg+adY6JtZ
sNwUq9Ytt98cGcJtDYk/VfdGwHxBPOj/PNjzp4/dFzHZVBHHentk66AqRUTu+7Vn
nPgqBsDK+NZ7N4/R154KMmp0R8bmA24p0I+2qzBlt4xZrWFQlsnk7Jp2ovowCh0/
1SwEkjQtdXGnB6J8aMOAkPwYoMSMTQtTdjan5C8i8jMOI+jhsgqjm8by5iyP11ZH
LHSnaSmGhln4a3tOYkOzochLJ94CBQ==
=wRzP
-----END PGP SIGNATURE-----

--Sig_/VgRbDH8A3MIwgyQlb3jQMV2--
