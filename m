Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 563F310A57C
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2019 21:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfKZUbP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 15:31:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44021 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbfKZUbP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Nov 2019 15:31:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47MwXc3rcyz9sRH;
        Wed, 27 Nov 2019 07:31:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574800272;
        bh=meWx5F/MJ+f6H+PdYStpmFZ+bThpRReoZfzBHDXeF7k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qsnvYyyju+tOs1oH6kk906PO17pleZ+AAtYJfUhpEDDPgdNTfoKjnB33bEsIiffZX
         O1KN/phI7ZvlRx2/k/fhXIOH2WmCmM/vUeX/PX9XxyZu5psDG8wz2a1OJcez2vA+IC
         IYpQO0d4wFOZgo9CBuFinV/ADHwk3tLw4Sl4SJ+pVgXSU+NSB4WIsskz+CYIgtj53v
         YEi64/ZcPp9PjikRvBx2l58gbHbB4ZLaK6bBGFwsBMXHvxoQGWxkmn7hcc8+8VZUT6
         yF+FpEgjrGzmG1tS/UEw0SuiTj/zhbNOJb3PeqeG7ct/nasADTYfeRnJo7K1tKqFSD
         b//FJuxnm9BnA==
Date:   Wed, 27 Nov 2019 07:31:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitrii Dolgov <9erthalion6@gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the kbuild tree
Message-ID: <20191127073111.1e3e2c75@canb.auug.org.au>
In-Reply-To: <20191118115309.10b3b8de@canb.auug.org.au>
References: <20191118115309.10b3b8de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xj12HpDBc7MooUms=JXl=_6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Xj12HpDBc7MooUms=JXl=_6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Nov 2019 11:53:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   include/Kbuild
>=20
> between commit:
>=20
>   fcbb8461fd23 ("kbuild: remove header compile test")
>=20
> from the kbuild tree and commit:
>=20
>   c826bd7a743f ("io_uring: add set of tracing events")
>=20
> from the block tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xj12HpDBc7MooUms=JXl=_6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3di48ACgkQAVBC80lX
0GwWpgf9FL1yyu35XpRbP1OAA/QirjXGsVQMrB67FcAkDmX8H0xvzK6BZVaRS1+W
BEDzkUV8JpaN/F78WnFtgiKaXzOxGoNcmD2SB35/IIKUlzOBwHY8CQ9u3efFwl1o
nrfwj++BWklgTe831gDm8MSSHgLEa6SYubyJUtsGnNJv9B+BTvdd1QiBC+lmAZ9b
ARcZugM1ed2WQCdwrUEsxQwMwyKwT9I+fTrrwVFEPdE5tuLFKzxVZ6dYOh6M07fS
PVZb/U7oGVPyEPAigQhiB1C6oTsT1XFHSS+7cWWlu0QU38/ZdeS6QUUWiACVxqvH
yu+9ku9937i41I5KqXxKUWSOwRJ9+w==
=A3ZM
-----END PGP SIGNATURE-----

--Sig_/Xj12HpDBc7MooUms=JXl=_6--
