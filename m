Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27BC876A3E4
	for <lists+linux-next@lfdr.de>; Tue,  1 Aug 2023 00:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjGaWGF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 18:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbjGaWGE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 18:06:04 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FDE1723
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 15:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1690841156;
        bh=VB9pSLR/7opwBbim72x7iPGBjBXBksJEmipQkiHBTtE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Wi7smSTUPnx0s51ABE9ZIGEc8+fAeJvAhTyaLhr0UYy5aSv9cARj2tmINHV4clXfN
         zOv8zm13kV/4tUH5JxTIFVFwINufx6fspeLQE6OVR3Vcfp2qUPJI2yd/RbqW8rxmeu
         eOciSLG9Z6oNcbpZeZ7xb1RmZsIYvUYlvji0m3r1A1+VhLG5CeMBdWjmRQuIskMz+d
         cRm21p2T0YoJPl1QHfQLvK7OC0gb+mnTzCzyFKEN/Y7L7CWzaesCIdphiKWSstGRaC
         rwQxiiAasBqi5xWY/VRJWFA+mcgGfD4emv1lGeS/2d54sAoMYM0pEHYbG9IddmzAXO
         BqgyOdzuVmM3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4RFC444Vhqz4wZx;
        Tue,  1 Aug 2023 08:05:56 +1000 (AEST)
Date:   Tue, 1 Aug 2023 08:05:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c inclusion in linux-next
Message-ID: <20230801080541.6f351e4c@canb.auug.org.au>
In-Reply-To: <20230731110403.pxo34g6kodur4ble@intel.intel>
References: <20230730222921.637gy5xbtfekmite@intel.intel>
        <3a347eac-383b-f43b-afdc-039436427a66@kernel.org>
        <20230731110403.pxo34g6kodur4ble@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mbgHqKlz0+dJ3vZ2dIPfA_z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mbgHqKlz0+dJ3vZ2dIPfA_z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Mon, 31 Jul 2023 13:04:03 +0200 Andi Shyti <andi.shyti@kernel.org> wrote:
>
> On Mon, Jul 31, 2023 at 12:29:51PM +0200, Krzysztof Kozlowski wrote:
> > On 31/07/2023 00:29, Andi Shyti wrote: =20
> > > Hi Stephen,
> > >=20
> > > could you please include in the linux-next i2c related branches
> > > from my repository:
> > >=20
> > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/l=
inux.git
> > >=20
> > > the following branches:
> > >=20
> > > for next:	i2c/andi-for-next
> > > fixes:		i2c/andi-for-current =20
> >=20
> > Andi, why you do not use kernel.org repo? I think it is preferred. =20
>=20
> uuhh... yes... I did a blind copy/paste of the link and did not
> realise that this was from googlesource... Stephen, can you
> please take it from:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/mbgHqKlz0+dJ3vZ2dIPfA_z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTIMDUACgkQAVBC80lX
0Gzjrwf+Mro1pPvZukdlNF5YlR2naDLuDfLuXZtZgDx3K2TwspeZd3FtO8nrzOMf
X/YAzQ0BK2qBery3u1nz/yMWDC0IYnBSKv7H+oRiw55ixrdveVE//J658J+Sc/7N
eYUU6QRkfgo3WRDqef8BBlemQeCERrBtBM9RNPGRI/7bWHZ+pI72rE5zb0+8RGuP
svUUz1OWKueNOoTpj8SM25YOaJV++ttW8MuQiYtuKDsChT5GatNOA5UZxbizBKQ6
I2O+8XaCfriLblw01GD8LlOPK/1526af34nvWjryjQv2ZGadfzSyPE4Bif3u4VBA
CryM+0Mv44R63SZqMssKqg8GI4FFeg==
=hk+g
-----END PGP SIGNATURE-----

--Sig_/mbgHqKlz0+dJ3vZ2dIPfA_z--
