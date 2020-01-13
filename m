Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEEE138D6F
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 10:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgAMJMk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 04:12:40 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54977 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgAMJMk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 04:12:40 -0500
X-Originating-IP: 90.76.211.102
Received: from aptenodytes (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C1E8DFF809;
        Mon, 13 Jan 2020 09:12:37 +0000 (UTC)
Date:   Mon, 13 Jan 2020 10:12:37 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, Paul Burton <paulburton@kernel.org>
Subject: Re: linux-next: manual merge of the gpio tree with the mips tree
Message-ID: <20200113091237.GA1748@aptenodytes>
References: <20200110155150.3942c3fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20200110155150.3942c3fc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 10 Jan 20, 15:51, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the gpio tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/vendor-prefixes.yaml
>=20
> between commit:
>=20
>   9d022be3c192 ("dt-bindings: Document yna vendor-prefix.")
>=20
> from the mips tree and commit:
>=20
>   885503fbea21 ("dt-bindings: Add Xylon vendor prefix")
>=20
> from the gpio tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the fix. We might want to keep the list ordered though, with
"xylon" listed after "xunlong" and before "yna".

> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b44257d0e16e,9cb3bc683db7..000000000000
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@@ -1082,8 -1060,8 +1082,10 @@@ patternProperties
>       description: Xilinx
>     "^xunlong,.*":
>       description: Shenzhen Xunlong Software CO.,Limited
>  +  "^yna,.*":
>  +    description: YSH & ATIL
> +   "^xylon,.*":
> +     description: Xylon

So reversing the two blocks above.

What do you think?

Cheers,

Paul

>     "^yones-toptech,.*":
>       description: Yones Toptech Co., Ltd.
>     "^ysoft,.*":



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl4cNIUACgkQ3cLmz3+f
v9HpRQf/RXlDCHxByYkhdvBNbC1MpOPgndM0X5FmvMfk2ZeYRkD8cpfT9daNo85T
svvT59ow1RgMXUv9l7RxWYV8Q3FVBlAdM3fPaYVdoSe4zgwH+4uyDq+9HKo/qsOf
EtWO7wuhOcLBqcJ6M0AxsEqpgYAeMVYxISd9vg42kd6GMQCIWihHAJ5V7YyD/65o
u6YRlCqJxGmKiVc0Q+m07KSeMReMzfjxtpMHc7QtJ624Pxv/uHsu2bzeo0NuqwO+
biHdwSC3RWJgRbVdaV11HsRNOHqJ5ETb1ABws6KRM5s3Z+iihmVgZqBHAcPNdxMR
y78ObV9/+7LyGIpNwhZWkSKrYjF0JA==
=0lTb
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
