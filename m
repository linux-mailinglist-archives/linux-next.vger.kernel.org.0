Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E8914D322
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2020 23:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgA2Wh5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jan 2020 17:37:57 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35693 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726222AbgA2Wh5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jan 2020 17:37:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 487JKD69sgz9sPJ;
        Thu, 30 Jan 2020 09:37:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580337473;
        bh=EgmeNMrvCEd3zUS/i/Bc1sWsF9BwQ0AaSWL1ZOK7nBc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VTbqO7q5Ma90gkuWS/1lmCDKNy0BD+muiL2a05HUmB5jMdUa6cuWdkr65H6o75akj
         Y9NGAKtwnLTaNJPUgdhEVwGHr+GNnI2HDGGd5vXmK2imM/jTTTwmunO4FOYLTMlqdF
         +RfI/YEZhSlG8rOO1wR6EStDWWLN5Zcb2QtAWHccETTn90g3EjvlgiBRpbjD/+//Sz
         NtcaT0mdjqhKYX90RmZHeYxlURK17kA60lTHjpaHfE7VAfWrcrGIwSAo5fJatgTupr
         hj7BvvpBARfld1fQeBVjcHpRXippVVMt+gAlHIG9auGGuyY7TeSwJvvyixivDwDNth
         ySDjgQA0czn7Q==
Date:   Thu, 30 Jan 2020 09:37:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "=?UTF-8?B?5ZGo55Cw5p2w?= (Zhou Yanjie)" <zhouyanjie@wanyeetech.com>,
        Paul Burton <paulburton@kernel.org>
Subject: Re: linux-next: manual merge of the gpio tree with the mips tree
Message-ID: <20200130093752.68d23f7c@canb.auug.org.au>
In-Reply-To: <20200110155150.3942c3fc@canb.auug.org.au>
References: <20200110155150.3942c3fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nl+WtKD6Q1WOsaXMICTwUGM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nl+WtKD6Q1WOsaXMICTwUGM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 10 Jan 2020 15:51:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
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
>=20
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
>     "^yones-toptech,.*":
>       description: Yones Toptech Co., Ltd.
>     "^ysoft,.*":

This is now a conflict between the mips tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nl+WtKD6Q1WOsaXMICTwUGM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4yCUAACgkQAVBC80lX
0GwCzQgAoEmjmPDcfqLNSFR85qoWYPk4iwMR1DF20IUhlXZtVVKZrKAMlOuCuxCC
9hUOPNi7Y1LpJdQGD/K4tS1pPXmSQ/LSJ6FNntMbO6ltQEHN7UULpi+/VsBgh3bP
YQu6oZZzakzt4rvB0CYXaJvuGpel9AVevisAcOBn+Q+TtlcHZkwvO5eVFoVchyf0
HUOLgYDTfwNpCgCdgsNIH+LYevWFMLeT7bMP0Azx1ItMdKeknnY6M2I1Mi7nbJwZ
4tCemx7PibaOjW81qO5XVjJRYPXGzxTFCrmW0eUq2U2lwoNJeDLNBHhuziuJ5GML
rlTfR8K6V5XNemqjjEgOuMmJn9k9Kw==
=BtxV
-----END PGP SIGNATURE-----

--Sig_/nl+WtKD6Q1WOsaXMICTwUGM--
