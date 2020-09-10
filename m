Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529B7263BC3
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 06:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgIJEM6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 00:12:58 -0400
Received: from ozlabs.org ([203.11.71.1]:42721 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgIJEM4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Sep 2020 00:12:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bn58Q1snXz9sTd;
        Thu, 10 Sep 2020 14:12:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599711174;
        bh=4ltxO111LE35W5E4RaTCXePtHQYMsqoOtEB8QPsHnDM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ktu3iz5TjaBpXxe2DsXWN6CqnU3FSCTx06Ytdg+6+1F/JUHZogn+YRg4JsmdvWexC
         rwzcFqK2/hHMZulCYEySvnD+t/4r7DQccZqvxtlECzKDoUPZnLbbqv1+rrdjcjv3+C
         a2AdupBU6PX4KaGKfult9HSidbNqJmpfnQCKYm0cgL/V8h3Pvv+PUcdnHpe7dT53Bc
         2bmBCAiGmnNswzRK13jGR5cvYWgUdffg6uvY3LTdL0jBb5/QQHQeuNLs4OmUYfwdHg
         uZ2V6OdsLO2e6qdjyQzCupHOn9lIZIxrnhqJw+0qaFRM7DwQ3hKjQuV2kwjxTXS3vE
         RNPsGk9yzJUWQ==
Date:   Thu, 10 Sep 2020 14:12:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20200910141252.3faeb89b@canb.auug.org.au>
In-Reply-To: <20200908133536.6ab7a7f0@canb.auug.org.au>
References: <20200908133536.6ab7a7f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kTYfaBCHu05B6JkAaFZA.yZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kTYfaBCHu05B6JkAaFZA.yZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Sep 2020 13:35:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the nand tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set_g=
eometry':
> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:513:33: error: 'chip' undeclar=
ed (first use in this function)
>   513 |   nanddev_get_ecc_requirements(&chip->base);
>       |                                 ^~~~
> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:513:33: note: each undeclared =
identifier is reported only once for each function it appears in
>=20
> Caused by commit
>=20
>   aa5faaa5f95c ("mtd: rawnand: Use nanddev_get/set_ecc_requirements() whe=
n relevant")
>=20
> I have used the nand tree from next-20200903 for today.

I am still getting this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/kTYfaBCHu05B6JkAaFZA.yZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9Zp8QACgkQAVBC80lX
0GwG9wgAk7IBZ1kQi6ivSUhUgqxyg5jcqLuxgYb0YW8tBIdE4JeEDBEBqYi+Fgyq
auMDparHasUQD1V6wBnD+gT65+qg59XlrYNq74OHp+wBfxnXed9OVFbQapxWxgyX
EuopoHXSthvzPi0r6PR9UafiAChfOOG1oVFVBRECpM5PLsu/b8FoRe42c6IepjF1
E+RBQAvHFkMeqRW8T6QgRW4XxcKTBZfcGUwjWfLWCHagjr3dF2T3BC8QABm1M9Hs
nWOdGEjSWqGjQIOSmy1yQVv6eL/xb7VlGTE+x58bJxxSUHZ1//9AGECWHqWiRkHP
uAKh3BxoSzt+7vmpC8gYivep4Us1Bw==
=WFpK
-----END PGP SIGNATURE-----

--Sig_/kTYfaBCHu05B6JkAaFZA.yZ--
