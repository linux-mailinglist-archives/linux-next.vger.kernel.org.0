Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB379606A7C
	for <lists+linux-next@lfdr.de>; Thu, 20 Oct 2022 23:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJTVvc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Oct 2022 17:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiJTVvc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Oct 2022 17:51:32 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4132A1A6528
        for <linux-next@vger.kernel.org>; Thu, 20 Oct 2022 14:51:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MthBP1VMCz4x1V;
        Fri, 21 Oct 2022 08:51:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1666302685;
        bh=YkPxM52sbJ2VSVHqJuxM7yYx6+8gl3nBrw7tBms1AcI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mEduMK1UVNbEHCOwNV4r+y5RnVHooMuibCGselcirNycc+f0CGCKAflriLMVZxiy5
         7lmjC3zPYRX0h35DXYRbx54nYNvDbuenoHrlmUgtB0ip0zCogOBCOxo+bHE5kG/2i+
         Qk7aq+6zbZ+7ZJFOgZ/lept8el+951KSiJhn4u/bE6QI0mVtbAHeqB0vOhYbX6/p1a
         4l08hJp5yWmr1nk0RwFcvITY2nPtV5v2gRbb3pcMfJCCePSKZDWUbUSbVCMxRDfo5U
         gwQYKs3FLzjvwIYNSY3wneszHC7qXJhWE3GMNgtzChorMz6XDZXOnSgdShQ3AD26N+
         Df8+WS5x0wbKg==
Date:   Fri, 21 Oct 2022 08:51:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: request to add branch/tag to linux-next
Message-ID: <20221021085105.0e3cfa74@canb.auug.org.au>
In-Reply-To: <CAHmME9r4PTAOKJDHbVTDnrTA5vNy9Y-9pLCAxSUZJVpkihbXWA@mail.gmail.com>
References: <CAHmME9r4PTAOKJDHbVTDnrTA5vNy9Y-9pLCAxSUZJVpkihbXWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T55dLhFlZSK3VV2Tg7DjsMQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T55dLhFlZSK3VV2Tg7DjsMQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Thu, 20 Oct 2022 15:01:14 -0600 "Jason A. Donenfeld" <Jason@zx2c4.com> w=
rote:
>
> I'm working on some potentially disruptive changes that could really
> benefit from being in -next. Linus suggested I accumulate these
> changes in a separate branch for that. Currently that's here:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git branch
> unsigned-char
>=20
> I'm not sure how automated your setup is. Would it make sense to add
> that branch explicitly, or to add a "for-next" branch/tag, which you
> can grab if it exists and skip if it's gone?

Added form today.  Just keep that branch updated and I will refetch it
periodically (at least daily during the week).  If it is not there I
will keep using whatever was there last time I fetched until you tell
me to remove it from -next.

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

--Sig_/T55dLhFlZSK3VV2Tg7DjsMQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNRwskACgkQAVBC80lX
0Gy2+ggAllnqOKvc6Z77gshbEqHvzspliDhtk8TVea0g1MK4ERy1aM7iYEO8aiet
CleYuZVqSTei83rlXJfNmhJK81ERY8kQR7OCw8xwe+vM7JTJMUARJiFEHAAAW7bF
qwJc1gURPsH3TWeXiAaLsjAfGOGv2EAbKN7hLK93mG2bxwsQiPv5NB2OLySgZfIj
m351SnLCtR2hb+kiuh6b23MyN7GxdqLcWD90BX7/xtiYAbz57HyxegC30ItcH1b9
MGmKzYDtUsVOWlvBKVkz65VnG3A6A/5CmwgVsy53uD7Mxo+V2FXmfX/tsiIxD6GD
iA4nVjIiMB9gwA/7+WomDnpseR0iLQ==
=guHH
-----END PGP SIGNATURE-----

--Sig_/T55dLhFlZSK3VV2Tg7DjsMQ--
