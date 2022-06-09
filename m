Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7C9545776
	for <lists+linux-next@lfdr.de>; Fri, 10 Jun 2022 00:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbiFIWdL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jun 2022 18:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbiFIWdL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2022 18:33:11 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7052122AF
        for <linux-next@vger.kernel.org>; Thu,  9 Jun 2022 15:33:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LJzPq0Wpwz4xD2;
        Fri, 10 Jun 2022 08:33:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1654813983;
        bh=Tqkp9XKLMvo0arKJoaQvo+hcoHmRDfLoAfkORJ68YJ0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P13Tc14hDPaayY12OckuJ9+j+x5vRyCZTCJtes+TtlN7gJ6RciP9G5yCWgg6HLM43
         /seRQzedKCu/e761UvMVs6eySXoydnsTAZcrFoIIZ5jRXUGBG/pYE8jHSLruyPT+tK
         WnuYwX1qHF19bqS8DKiCxTHdBeqCbbQqAyQ1UO/Gq7E+L99eDeu7m0hW+OGA6OK57i
         VesbkHLKRaRnzoprIZtnto741WuMcKHNBDvjapWO54o1dTD2zOkeGAK9WAkgMlPX8P
         nGvn7tMInbBBtEbZTzuQ8PQBgtfqPOlK9fiYMipoNFT0mraPJzuOi493iTu4FXKMW7
         FS8cAGmPfkfuA==
Date:   Fri, 10 Jun 2022 08:33:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Please add battery-fixes tree to linux-next
Message-ID: <20220610083301.7940ce27@canb.auug.org.au>
In-Reply-To: <20220609191958.yh42to7ok5y26jbo@mercury.elektranox.org>
References: <20220609191958.yh42to7ok5y26jbo@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hEr/aGqJE4V8LX6k4d1h7jR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hEr/aGqJE4V8LX6k4d1h7jR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Thu, 9 Jun 2022 21:19:58 +0200 Sebastian Reichel <sre@kernel.org> wrote:
>
> Could you please add my 'fixes' branch with patches for the current
> merge window in addition to the existing 'for-next' branch for the
> power-supply subsystem?
>=20
> battery-fixes git git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux=
-power-supply.git#fixes

Added from today.

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

--Sig_/hEr/aGqJE4V8LX6k4d1h7jR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKidR0ACgkQAVBC80lX
0GxR/gf/Q3k1SMshg4A0JVsLo3ARhCnHYuYLziTM5bmgeu2lOGq+9xBIDTXVQGZM
l/Np5hQTEkddgn49AxtVhooeFkYenPoOT10SNjGsbbcYShFfGICEFpu4xCJyQY/B
iqT0KzrgtJX2UuSWyR6DOfQ7zRhywbTyiE24GPEfDX2O17AVZziIrHkplSrA9YrH
egh3oo9jgHYWWafLCxwHCHRRBIYTUZD3aiXaIbbqiKR/FpGRPPWBnD3Pc8PNgvyH
nsmwgHYT8UbLxyJiBAfGlTLz+tjjie463i2Ow8IhlUavF8mXzU+DY0HZlu3JuW41
k0aQoeOhyRkOXL+8P7tH/H38LW90hg==
=anI3
-----END PGP SIGNATURE-----

--Sig_/hEr/aGqJE4V8LX6k4d1h7jR--
