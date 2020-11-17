Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919972B56FD
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 03:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgKQCkz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 21:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgKQCky (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 21:40:54 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5679CC0613CF;
        Mon, 16 Nov 2020 18:40:54 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZqtp2Nlzz9sSs;
        Tue, 17 Nov 2020 13:40:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605580850;
        bh=UFTk379P4Mi1MZ7nleIWYdbnBg5oIAOWBwc5alGbHCQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ZXSurYYKqNok2cAEPXNiviF3Sbb1GASvTEOn75poXGEBpdHBz3GXsPKu4tX0okUYS
         JkOa9JVlj9eT+TLaHGTvSLV9ARa+K6UM23Z0q6rI0XbmXbyduM52Tj1QRu1/5ktiIA
         RBsgKvQYriDgyNbp8gG1ZlP5XErid3aFIUzDHPUa4E40rBpWyUSIslDU6YjzvqI2PS
         R+BB8oPOdz1cVoGy/DhnFjxSTjNhAgTVTu3mrNaTiX97mSIbdDS7n7QY6ooDW3Dbtd
         HSB5TSh+f+AJX6A9YnvZbzBdCvHnUgrLrfeL24OtVcR2qmW4L6fcqsqWQq+fJm5ir6
         0dt3MoYQrCHdQ==
Date:   Tue, 17 Nov 2020 13:40:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Yejune Deng <yejune.deng@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the phy-next tree
Message-ID: <20201117134046.569d58b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tyXtqJlZwQ0jKiwOICOwCjB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tyXtqJlZwQ0jKiwOICOwCjB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the phy-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/soc/amlogic/meson-ee-pwrc.c: In function 'meson_ee_pwrc_init_domain=
':
drivers/soc/amlogic/meson-ee-pwrc.c:416:65: error: expected ';' before 'if'
  416 |   dom->rstc =3D devm_reset_control_array_get_exclusive(&pdev->dev)
      |                                                                 ^
      |                                                                 ;
  417 |   if (IS_ERR(dom->rstc))
      |   ~~                                                            =20

Caused by commit

  3cc8e86721ad ("phy: amlogic: Replace devm_reset_control_array_get()")

I have used the phy-next tree from next-20201116 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/tyXtqJlZwQ0jKiwOICOwCjB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+zOC4ACgkQAVBC80lX
0Gx+Agf8DLil+2EVCv/GrotsVrSMXNnYpYfxwu1dOQ1adZSNgAJ0vjCVyTcmmkel
MoFRBmiJYmHpGgoWKHQJxK8OaAoBI4SNRcmsBVPH9IH9/IMXO81k9H6V+L9OVDXn
3SrZTadBsVZdU0vd34szqZy8mQmu9oMhREsNZbLB5w+HcbDTEH+gfi65JDXD9naa
8zf+4NqCaV4ZFxSeVN+gdgr76xhdVBGWqI0tD8MREiHpXn9i92fWEHWeHsHt+XHX
C4+bmPRcMqHsJuv87B50OgU+O9apqeAVqrdL4FvAL/CCSAvi1/Q44CFy2bEfi3RX
7Vx+y+QvXIHQTjKpCvZhTFjO46z54Q==
=cPJ+
-----END PGP SIGNATURE-----

--Sig_/tyXtqJlZwQ0jKiwOICOwCjB--
