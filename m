Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA773EF67F
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 02:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235360AbhHRAJC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 20:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbhHRAJC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 20:09:02 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0B4C061764;
        Tue, 17 Aug 2021 17:08:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gq7XP2H37z9sW8;
        Wed, 18 Aug 2021 10:08:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629245304;
        bh=XVMQS6JAFV88LeSd1MLQZxVAyfJ2wKxPaOhSvniaduA=;
        h=Date:From:To:Cc:Subject:From;
        b=KifRnmE/ZE618ppmFgz3zitzg4kvgfLRzZFOaKBc40bSUcffJvcQYBhUxxwnBtA29
         FpoQX7p6u7KcMGfUn9kraZPn1IVfQP08yoXDy4o5UYF57uAedW2WGsFCnEs+IsA6iO
         1U0pdJKU+Zvuo/jsIMaewVXwrvVvaepm7ASWO29d+CEscPShXe8X1dvR/fEphsnBog
         QzhpXbyNxi9E7uty8L36yWV5xd7+ap5ZKrk90uHlAcgcetN36vzfbwVcjaamt3+beR
         LRUzq+hh9b12C+U7M5jQ0EzrHbQRXyH/OOwCFKXt2WqFPsAFe2tmALOH8GWAXzNem9
         eqnKzn+jOsG2g==
Date:   Wed, 18 Aug 2021 10:08:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wolfram Sang <wsa@the-dreams.de>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Conghui Chen <conghui.chen@intel.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Igor Skalkin <igor.skalkin@opensynergy.com>,
        Jie Deng <jie.deng@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Hilber <peter.hilber@opensynergy.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: linux-next: manual merge of the i2c tree with the arm-soc tree
Message-ID: <20210818100819.10927d37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yTH4nvW=w+RqhVLI2pd=Jau";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yTH4nvW=w+RqhVLI2pd=Jau
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the i2c tree got a conflict in:

  include/uapi/linux/virtio_ids.h

between commit:

  46abe13b5e3d ("firmware: arm_scmi: Add virtio transport")

from the arm-soc tree and commit:

  8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver")

from the i2c tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/virtio_ids.h
index f74155f6882d,99aa27b100bc..000000000000
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@@ -55,7 -55,7 +55,8 @@@
  #define VIRTIO_ID_FS			26 /* virtio filesystem */
  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
 +#define VIRTIO_ID_SCMI			32 /* virtio SCMI */
+ #define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
  #define VIRTIO_ID_BT			40 /* virtio bluetooth */
 =20
  /*

--Sig_/yTH4nvW=w+RqhVLI2pd=Jau
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEcT3MACgkQAVBC80lX
0GwUKAf+MBB5fUWJ7Flin1TBWPmnGv/8XJrs9Gol31FpqrL0pbKn7bg/wDXx9tL4
48VotGA/YqdX/x7yWK5BNbtDeA3Jt4g/UKpp4AMFUKJA50HZCvK86jCfnWBfv1LR
uoN2PKadgYvddhQSHpcfG5XTA41qWV2ykLh5CLQLqyzsa/Df8jY72FdJCjLoZdM3
MMUPlXKJPvCBf0lwsWLyijUpO+nzoMC16fyxbfby/e31XCq3MOoZZFygDvbSvbd+
zm4MTC/0IHMelm6IU3tXntmGoJVIvMerjmc2FEE1Z2wfWgiTm5tGnYMIN3hJpPaD
6ndpcOf2VfW2WTWMCEF8qn9oi+7jqA==
=OGik
-----END PGP SIGNATURE-----

--Sig_/yTH4nvW=w+RqhVLI2pd=Jau--
