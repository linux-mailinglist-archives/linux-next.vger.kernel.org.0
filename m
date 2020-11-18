Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857DE2B746D
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 03:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgKRC4Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 21:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgKRC4Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2020 21:56:25 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F59C0613D4;
        Tue, 17 Nov 2020 18:56:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbSBD33Jtz9sT6;
        Wed, 18 Nov 2020 13:56:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605668181;
        bh=2jx3vQWDi8HWrUIZuQWUfNeUbTc6Akx3AMLtoxMmmEQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tWaJ7NWfG5xWRSgLoEhh0cYNW8N6bAIdRH6XwpQV5VOU/C1cLsCRiaXCJgEJl1v6v
         /edeBABYlpwjNesBPznB0tAkMZYeRd26MuQHCZS1pNuOCwiLVcH7I3Yhodl6WoEqkx
         uqLm+jCWmVy9ame1H6PUYOFLiZw31lEAFBycc2e4nmbSFDHYRkFiR3OMHNtnkK+TNh
         CXXI39RlDqZzEfdpGiKv5aSAmDqVBjTIodo4dq2n7Xas5B11IC0P9SgvTTNTYvI1Vb
         ERpAsWXwJqeWZerraM8P0eJJzDv6G6DcNYuhtgjOWMqYifyWm9D/6G30we/opc8Y8X
         LF5xd2xa3Zm1Q==
Date:   Wed, 18 Nov 2020 13:56:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Yejune Deng <yejune.deng@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the phy-next tree
Message-ID: <20201118135619.4a4bf4c5@canb.auug.org.au>
In-Reply-To: <20201117100056.GF50232@vkoul-mobl>
References: <20201117134046.569d58b8@canb.auug.org.au>
        <20201117100056.GF50232@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_8n_0noY654JHgjeuD7C/Vq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_8n_0noY654JHgjeuD7C/Vq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Tue, 17 Nov 2020 15:30:56 +0530 Vinod Koul <vkoul@kernel.org> wrote:
>
> On 17-11-20, 13:40, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the phy-next tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/soc/amlogic/meson-ee-pwrc.c: In function 'meson_ee_pwrc_init_do=
main':
> > drivers/soc/amlogic/meson-ee-pwrc.c:416:65: error: expected ';' before =
'if'
> >   416 |   dom->rstc =3D devm_reset_control_array_get_exclusive(&pdev->d=
ev)
> >       |                                                                =
 ^
> >       |                                                                =
 ;
> >   417 |   if (IS_ERR(dom->rstc))
> >       |   ~~                                                           =
 =20
> >=20
> > Caused by commit
> >=20
> >   3cc8e86721ad ("phy: amlogic: Replace devm_reset_control_array_get()")
> >=20
> > I have used the phy-next tree from next-20201116 for today. =20
>=20
> I have reverted this commit

Thanks, but forgot to push out?

--=20
Cheers,
Stephen Rothwell

--Sig_/_8n_0noY654JHgjeuD7C/Vq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0jVMACgkQAVBC80lX
0GwBtwf8Cm+mUbsMXzR9lCrXwck3MmbKFFTiwpBL9iFlZEal+7dNuzHGC6oUbHs+
W9ysCXzhyxzf0tPgpY3CAvFxk7hd05jeDylqQfs/BgK952mAnX6UIWA1uo8Nb23O
CYCS/mnsNb/avvAfnVkZUA/AU5+4flvNE1SxhmWWWlMobsLJhRrT0TkZop06i7Xr
7gGBrRJuhFkxWMqH3NqKdwRZFby31rcB8O/rf2gFzm2cUOxf0gMEcWIcXjvLiIMG
PhsgjajYwy0ahxUm2VJA5ODvGgl/VIxCEvdgQq8J7I7J6OzropXhs6Cc0sRblToO
kcaWWHF3DPylyVFJVtpaHG1YVp3gKQ==
=RAek
-----END PGP SIGNATURE-----

--Sig_/_8n_0noY654JHgjeuD7C/Vq--
