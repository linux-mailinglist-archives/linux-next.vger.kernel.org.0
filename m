Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3DA65526FE
	for <lists+linux-next@lfdr.de>; Tue, 21 Jun 2022 00:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236325AbiFTWdv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jun 2022 18:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbiFTWdu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2022 18:33:50 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C510140A7
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 15:33:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LRkvX5bXLz4xXj;
        Tue, 21 Jun 2022 08:33:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1655764424;
        bh=0WIdD/kSCKkU6FTL6fOFgj0QzvqWzIsjdCcFrqRjRRU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p5uQXvdt+e/fKrUgWiXeaOqj23lXnNQz9n67gsXA8cKC3H1ZecEGwlSq3yFEnKlnr
         nYR3xQOXbs4ikZ5qfGAT9IAP9dzxDuVHavveRqU+UPpARaOYPyPP0f50FTUX4GV+uj
         vpUTYlULxlni1m9b3iFDUU5czdyA5U0TvtP0QSAULpQbJgIbRfGERIlTol6oRWACNr
         SwvKlcEUwyhhLI4lZJgq86udvDfJ7/HRJyUPm/RuLP47nRMCKwtLVf59xn0uQLcc4Z
         H5COK7CTNIChrXm8nv6f/PyTreltns/tzKNOzDIQGOyyM7H6XfO/mnrr6IObcbmMSR
         Bld6gy9jkJ/6w==
Date:   Tue, 21 Jun 2022 08:33:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Include in next: krzk/linux-dt
Message-ID: <20220621083343.0328bdab@canb.auug.org.au>
In-Reply-To: <b2e86d7a-401d-f48f-2c02-e8253885ab51@kernel.org>
References: <b2e86d7a-401d-f48f-2c02-e8253885ab51@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6zfMYRYWtEOAJrOkIl7u4Fj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6zfMYRYWtEOAJrOkIl7u4Fj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, 20 Jun 2022 21:34:22 +0200 Krzysztof Kozlowski <krzk@kernel.org> wr=
ote:
>
> Please kindly include in linux-next my new tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git
>=20
> branch: for-next
> branch for pending-fixes: fixes
>=20
> I tend to create a lot of cleanup patches for Devicetree bindings and
> DTS files. Since some time I started to pick them up to my Samsung SoC
> tree and send to arm-soc (Arnd, Olof). This way I will split it from
> Samsung SoC work to independent cleanup stuff.
>=20
> The tree will be sent with pull requests to arm-soc (Arnd, Olof) or to
> DT (Rob Herring).

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

--Sig_/6zfMYRYWtEOAJrOkIl7u4Fj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKw9ccACgkQAVBC80lX
0GwS2Af9F7FcCpmrF7DNwO08pENdg8zfhfdXa5K+HMXd/HrY8b4r4hchRBVsrA9v
KTVThQr6UPIWqE5QNogAEwajumZDl1A4dqm01aBfJjT+QYDnBAWkSU7+tej1wl5P
BCKpt5NfhtXDuRbUZPXNsP21LMnm9kfVzFCzSfiKFI5y2jJapBln+ECwWVzi48lE
Z6Ne4dORKagIri6m8Ht7VxLrdVGNtK0DoiX3spPE8rT8FWGN8AsGLILdbcJaUsMB
X+2i17EoYreIoyljG9TQxGNJGaXTa1AQh3F5WB/2ar7NeXp1ggIVN4HdtJ3BjgXR
QguzPQPhF/7zGcG98kQ7oyYpvJzxXw==
=AbyB
-----END PGP SIGNATURE-----

--Sig_/6zfMYRYWtEOAJrOkIl7u4Fj--
