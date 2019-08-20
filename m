Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1ECA96B10
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 23:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbfHTVFX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 17:05:23 -0400
Received: from ozlabs.org ([203.11.71.1]:42577 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbfHTVFX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 17:05:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CjxD2p6Zz9sBp;
        Wed, 21 Aug 2019 07:05:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566335120;
        bh=X2/YWMnmEW2HpHB4OWWfJPFXcmY6UQCsHcE3vGkUGCk=;
        h=Date:From:To:Cc:Subject:From;
        b=rn6Eheif4V7Mp24WbdgsmDp9kEj1g/26anjlRRSvsCDsXdbo4pcXecbWY2co284q0
         JRs5nvaFWMK/xasXjtQ9D5NmRD0kUGjm0eeETNTtKgMlwISjGpHIhjFSXM9CZ0QrfT
         2rf8SRI/5Jl+lmK080qXuIcLPcsFErorMGEU7DlX2ex2YyBurYA1lKqgBOlf9LGY/K
         R8pLxiO8br3cYLpy7ERrK1+BTw6T/T4MA7LzTNOVfzMzn/jynQho18Y28u2wzXdb3T
         v9Q94J1lbD6DK5AZqprlwfDPhXXIxan9GUI/i9JR1+qKdaRV4D1YJkEXivJxDeXdG3
         FPEXGZLUP8HJw==
Date:   Wed, 21 Aug 2019 07:04:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20190821070452.212c8ea7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wc2G1M0Hps_KVorI5SAqkdU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wc2G1M0Hps_KVorI5SAqkdU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0f6fc97501b7 ("ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only if controller =
is running")

Fixes tag

  Fixes: 7e0cdf545a55 ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Chann=
el Controller")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: b87d37d0231f ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Channel=
 Controller")

In commit

  988b59467b2b ("ASoC: mchp-i2s-mcc: Fix unprepare of GCLK")

Fixes tag

  Fixes: 7e0cdf545a55 ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Chann=
el Controller")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: b87d37d0231f ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Channel=
 Controller")

--=20
Cheers,
Stephen Rothwell

--Sig_/wc2G1M0Hps_KVorI5SAqkdU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cYHQACgkQAVBC80lX
0GxW3QgAkniSxDXP7YFI/7cVU7SeuB+39TThGO6spRJMckWfGG2t+5Xu5zbJBT+g
Hsg2k9aUucN6OedcEnklMsmiltc8jde1awwz84Tzzm2pbRLxLDnzGUtg9oSq2ky1
OQJvRMqhLmbmca2bMQX9LI3lgAuzID7HE7DQ7xT3cMV2jmlxFa4/AfuPj1colyLW
LQQAc57ZXDpy/jP2WcDjDIiQt6WfDL41ENY4yUXUlhD5gUs7trE05frEaHDMZPzW
jIp5Wa0ODptdJW9cpG2k95MbsIMqMEZXSP702i6OIG7fsTDR3yESTqLDKpbu6sWO
gIkxeI25jKYDvN0UsQs72/edPiEFUQ==
=wmOe
-----END PGP SIGNATURE-----

--Sig_/wc2G1M0Hps_KVorI5SAqkdU--
