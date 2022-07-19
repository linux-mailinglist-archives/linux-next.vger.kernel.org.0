Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADD357A9C4
	for <lists+linux-next@lfdr.de>; Wed, 20 Jul 2022 00:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbiGSWXB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jul 2022 18:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbiGSWXA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jul 2022 18:23:00 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB785727F;
        Tue, 19 Jul 2022 15:22:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LnYHb1lhmz4x1h;
        Wed, 20 Jul 2022 08:22:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1658269372;
        bh=5x/Ow/Q1tORmsT3ZmKsfl6Q/OYoKRZ7oeOiiiJhr/WM=;
        h=Date:From:To:Cc:Subject:From;
        b=S7h0p6milj2RHnVwH4FCV8TF+TTrRneoKCyuwYV6LXd0VIisM/eZe1K8AeQKKaXDt
         KrbE/zk2gFJw91i40kjw/Q7kNV6agSD7js7eVPYQwycWksW/6ngEq1MjBRVhIrZLNb
         sS60mRFhW0WYPsgE66KP9J/zmV153zodU7ANPe47YYmCh6rmo2ZcEjpw2Ql1Vq2EjW
         +NDaL1sLcRXSnGH+g6UsGkP9ADa1DUmCoy+Qix2ea9K/ZlRWa+1hvhbxwW74fPuazC
         JiQzJ4Xxr5i0kpWMei85VR88fxD4wYukDahKLN6swPagfw3fpYhK0LrrcgSy77exNZ
         jhxjL5JqVQ/Eg==
Date:   Wed, 20 Jul 2022 08:22:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     YC Hung <yc.hung@mediatek.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20220720082250.46bf3fdf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V+5qRwzMqUCfb/3u66/B3z.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V+5qRwzMqUCfb/3u66/B3z.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  99bad468846f ("ASoC: SOF: mediatek: fix mt8195 StatvectorSel wrong settin=
g")

Fixes tag

  Fixes: b7f6503830 ("ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops=
 to load firmware")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/V+5qRwzMqUCfb/3u66/B3z.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLXLroACgkQAVBC80lX
0GyeIgf/ZoH0ppQ39pdShGwbGqTRFJa1a2D/tLgkQT6TGuNqG1jsSq4J/HPXHCC3
qpxgP0kwm5gw80JgD3b5flQGIz07CIN83UbCalQ1QEdcP0fDBMz8vLClYG085hIA
wwDlVO68TqE3p8kg3sayKLog5GljegyHA1uDTaECgiN12Qm2J/nqKuG92O5K66RP
C8OvMclrmQ63pF7PQZOAZMsMWbX4MN0UFO7kRAeiqOPM/X39YQEXoBPCBb8iH279
RWm9CVXTQkUchDCb837wAmfHSQKPxWKpgtTgdUgNfJNGRZyT1bSJTyK4/Q6f3o+h
PZymKF6w0cT0dy+9wWx1e0qlPJcwqg==
=xa5f
-----END PGP SIGNATURE-----

--Sig_/V+5qRwzMqUCfb/3u66/B3z.--
