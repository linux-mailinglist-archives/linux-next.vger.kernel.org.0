Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45AD58701C
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 05:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbfHIDQU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 23:16:20 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729307AbfHIDQU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 23:16:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464Vkn2z53z9sNF;
        Fri,  9 Aug 2019 13:16:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565320577;
        bh=j620e+LUIbCLV8iTUjI4kEqH6+/8f678kfhUrESWVT4=;
        h=Date:From:To:Cc:Subject:From;
        b=D8/MqC/oXJ/8wJxtMtYn66kU8aHXgKLIp+Bg8yYMi3ThX2qx0XfOuXN7PUdNVZHit
         bIjIrY+0ro6RXYjemXmnivnE3ykDjUX9oMqth5goMFMLaUDlO9bixdOnRkcm1Lsp1V
         Zt6YIR5kMpOnP6Xm1++yCip/IXXg2mr0FBe8gtwL3FRoR6UkdoTH2kDJ0/UBQLAeX+
         d9hWtzhQ31G1fVgyRvx+zhqxFl/f0eFaXaf12MT9nogPqOr0S8RFmtl5lURQ3sye8C
         w5tb3Wi9DGpW4VyXsKXulxucC2PgxcSoo4Ga0RQekphRAAcVzm6Z1CULv6e7poz6mq
         ynpbSpAoaHmwg==
Date:   Fri, 9 Aug 2019 13:16:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Message-ID: <20190809131616.629cc15c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M1DZ5ohMWwKGImFhgO6nF7Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M1DZ5ohMWwKGImFhgO6nF7Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree (yesterday' version)
got a conflict in:

  sound/soc/intel/skylake/skl.c

between commit:

  19abfefd4c76 ("ALSA: hda: Direct MMIO accesses")

from the sound tree and commit:

  bcc2a2dc3ba8 ("ASoC: Intel: Skylake: Merge skl_sst and skl into skl_dev s=
truct")

from the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc sound/soc/intel/skylake/skl.c
index 239348b0596b,6be25e617c21..000000000000
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@@ -858,10 -854,11 +858,10 @@@ out_err
   * constructor
   */
  static int skl_create(struct pci_dev *pci,
- 		      struct skl **rskl)
 -		      const struct hdac_io_ops *io_ops,
+ 		      struct skl_dev **rskl)
  {
  	struct hdac_ext_bus_ops *ext_ops =3D NULL;
- 	struct skl *skl;
+ 	struct skl_dev *skl;
  	struct hdac_bus *bus;
  	struct hda_bus *hbus;
  	int err;

--Sig_/M1DZ5ohMWwKGImFhgO6nF7Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1M5YAACgkQAVBC80lX
0GxnoAf/VgNtlVtvtHULWWeW4uCZy1eON68np/HDTEUIS5Fgi/Uf5tdmG8dNsjcr
REdphwIwdictk8P6h2k4BDKBrf7moQbdrmWl5bZR+peS9Y1a07NjtBMrcnA+AsGW
lu2RzzPP4rMJQqTdKl+VnEMjQr0A4D8Ueuath0T93C2JREHZvP7WXUcSjl6WQLZS
YuBkvmSKb51iGJ3hY7canznUu3GFvAjyJfHHh1EdNhn3OMwMMSUU0laE2RFeUK0y
5IZlW/PnU1fz9Gd71OZx4t1OawKEMjioEL3d+m8KfGtHFK7F36j3l20yPUxfpSUx
a8MXLfVrs+tm5a2YAPWQjJLHWwVv6g==
=4x22
-----END PGP SIGNATURE-----

--Sig_/M1DZ5ohMWwKGImFhgO6nF7Z--
