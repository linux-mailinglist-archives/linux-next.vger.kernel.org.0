Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685125190BB
	for <lists+linux-next@lfdr.de>; Tue,  3 May 2022 23:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243105AbiECVtt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 May 2022 17:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243086AbiECVtr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2022 17:49:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9F9205DE
        for <linux-next@vger.kernel.org>; Tue,  3 May 2022 14:46:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtD6n2SsXz4xXk;
        Wed,  4 May 2022 07:46:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1651614369;
        bh=pdEtVERhrzQwtlNhiUxoOuddpZbXNyUsbU4ICDk15oU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Hb97MB4YUuHZAtaYRuzhkgDVvfaZg648wYeTKEnPgwUcB7sy0EV0BEua40wbBxqUh
         Qb8Y9pQ1Agqr+BcE1W2CTLV2r82xrgJpQkmqAnJVVWc85pCaqCCJ0RMzzlG0D/P8HR
         kTsujBXLJx6QBnGjp39GusBeWjtUHBk7KaPO2pCfJxiSMRoaO6WqU8voY80iuRd5Pf
         JEf1x8nka+H7kLY4jG/bYxCfusfFZ6aUU/V9pXVU6KZcRJ4jK0xGLPQtXrxoEUGZI2
         oGQFmqfEq7HI9jXbpYVD2sEC600mb+Wf086kSQk0uLGqZdfAdoX6wY7YYriV3jfiqy
         lXxaUp7f16p/Q==
Date:   Wed, 4 May 2022 07:46:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dipen Patel <dipenp@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-next@vger.kernel.org
Subject: Re: HTE tree for linux-next
Message-ID: <20220504074608.1ebe2061@canb.auug.org.au>
In-Reply-To: <YnEmqsfZu7uWsm8s@orome>
References: <YnEmqsfZu7uWsm8s@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YAgoULOZQAxRWvCW6r1ryM7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YAgoULOZQAxRWvCW6r1ryM7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Tue, 3 May 2022 14:57:14 +0200 Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>
> Dipen has been working on a new subsystem for hardware timestamping and
> Linus Walleij suggested to put it in linux-next to give it a bit of soak
> time before we propose it for inclusion in mainline.
>=20
> To simplify things, I've pushed a branch with the patches to the Tegra
> repository for now, but longer term the plan is to get Dipen set up with
> the necessary keys to maintain this in a separate tree.
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git#hte/for-ne=
xt
>=20
> Can you add this to the list of trees for linux-next?

Added from today with you and Dipen as contacts.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/YAgoULOZQAxRWvCW6r1ryM7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJxoqAACgkQAVBC80lX
0GweJgf+PAfWFLx0UDxjWndf+GDMqu57HSAQ+HUSolW5lHrzxfAoVptklYOhuNVS
zrrtXTSp96VcUGNwW3k9XAnh2rVLm/4iexjqpFI0pi5/1YQwZqRF2IYT8s5qBKvB
oqX/+bUlTY4LWn4X01W0LFld9ilflrD1ozQBsqdmhmc1Hpb2KWCIx6X2cc8gnByB
tjdS1JrPwUJ0R/WDn/+vbrC5j6c6CVaM1uSwhRvj8COK7R3DerXX8JDqZwDJ1tyG
t8XHqy2eqC+wsPe9mJDNbZdjLcqRbk/yq6EUCL7DqeoG5o+GYevrDpX+mIVeBCIQ
fqAHKwg2M8M6p/3zb+eCzxpWkTOgiw==
=QoEW
-----END PGP SIGNATURE-----

--Sig_/YAgoULOZQAxRWvCW6r1ryM7--
