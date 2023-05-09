Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB46E6FD305
	for <lists+linux-next@lfdr.de>; Wed, 10 May 2023 01:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjEIXXZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 May 2023 19:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjEIXXZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 May 2023 19:23:25 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2810C35BB
        for <linux-next@vger.kernel.org>; Tue,  9 May 2023 16:23:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QGDjb2QRwz4x1f;
        Wed, 10 May 2023 09:23:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1683674595;
        bh=xbby5uusjwbjeGGXW9OgZS3THpudxTGDS/4cVjvbpHE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nU0nu+09G5jhG9/jHSdLfRwsIUD6WpWcLs6fTbrpbZNX1+zlNxkS5xzqQOZcAv8bC
         ixHTLjcvePYbvgZT6VlMRPCd0zyiPsqVxWfJHl9dTzc+rtFjl7mxWU0yras+8M01h2
         t4QX62MCR/bjV34bs9jTGjhRwMQNgWZ4EyMygr97PuXfUHUhTNb/o7klQGsx3/UhUe
         meaXHOmD9n97D2b4AeNfEV6r8QN89xEshncxTm0IfogsJckKI8eO/iZuTh80QrKxBW
         q9ziSJIxGIj7Y3OutMv2SkeZIPZv2sEAY7U3eanZmb1gk+ofpegOajtGgA+Clzzo06
         E+2n5YnUoJ6uA==
Date:   Wed, 10 May 2023 09:23:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Include in next: krzk/linux-w1
Message-ID: <20230510092313.16693e4c@canb.auug.org.au>
In-Reply-To: <07db634b-ebc6-666f-eb2e-6bc9c6008040@linaro.org>
References: <07db634b-ebc6-666f-eb2e-6bc9c6008040@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6EjUfTQvdFqVuCc9IUVDh6m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6EjUfTQvdFqVuCc9IUVDh6m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, 24 Apr 2023 16:40:00 +0200 Krzysztof Kozlowski <krzysztof.kozlowski=
@linaro.org> wrote:
>
> Please kindly include in the linux-next my new tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1.git
>=20
> branch: for-next
> branch for pending-fixes: fixes
>=20
> Repo will be collecting patches for W1 subsystem which recently I took ov=
er:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/comm=
it/?h=3Dchar-misc-next&id=3D6f36ff32809aeaa7276d5f663d7adf9298a8bf5c
>=20
> The patches in the tree will be sent to Greg KH.

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

--Sig_/6EjUfTQvdFqVuCc9IUVDh6m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRa1eEACgkQAVBC80lX
0GxvmAf/YMYFSYkglfBEQhVJ3G4S0VgpDzzc1zNvL0AhuSJp/AKd2nIbJfFnhTx9
nbMWhIu2xrdwQh9qXADEGToD8bQmWmBubwOAqVjtvZFMNCyzjAtgLLiLZUvoUC9V
M7RcFAGiUXd8YWzkYYzoXiDidxn4vaqMJuna5DmJK8zCMc2rTHhaK/00ZyMoO9NC
g4FpVc6bAizK0/QF/ze7a07XdH8W6Gbh7dXZun6uHWDVyNxBByvzKiJ1+hnOELjI
9bQuUZx+HcJ0G6leCvpetjxVZiYrMIPCZNG3CRJgUSktqwNXqpB4BxAlXBPVFhC0
SJSIxMYPhLurKGZOa6N/IczvF+aWww==
=Nf4p
-----END PGP SIGNATURE-----

--Sig_/6EjUfTQvdFqVuCc9IUVDh6m--
