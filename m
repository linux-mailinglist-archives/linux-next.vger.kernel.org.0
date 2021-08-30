Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E877A3FB1F3
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 09:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234037AbhH3HeI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 03:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbhH3HeH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 03:34:07 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54665C061575;
        Mon, 30 Aug 2021 00:33:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gyhr6723mz9s1l;
        Mon, 30 Aug 2021 17:33:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630308792;
        bh=vvvvWwEqVwC/zTt4GhY4AnhOeWgO2HtAJ5rX9mhSkXc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k5VweYNtxuJjfzOc7jqp9/U/fcfh15zryDuxAWZVjumm4MnFPUIXx3FrwQUi4qNGS
         dFQl+kYk8M2El4f0Q5lmn5qXIeu2Xcu+Ri3aXFAvX1nSgDRH+BaoWYbJTemY2SLN1L
         tZQsZTO191zM/qVYD3ZOrCx0iGeU6V1SlfrGw8RhisEyXxRiXj8SKH9CkZv3Ox01k6
         i7Z6F88iCNZanTjVimf89Ljfa33jGMYED6IE5ijqlkBdSeABCL+4CPsuBYOhPgdBQy
         Ka+MKEftkHfVfPeArNnzVM/DgHAHw44cV2+t44HLPm3NypxlbYafQKyP9oBVBR0Z9U
         in76XZL0fzPXg==
Date:   Mon, 30 Aug 2021 17:33:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>
Cc:     Greg KH <greg@kroah.com>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Jiri Slaby <jslaby@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tty tree with the parisc-hd
 tree
Message-ID: <20210830173309.630f47c0@canb.auug.org.au>
In-Reply-To: <17384403-c428-70a9-4930-390869a45405@gmx.de>
References: <20210830154605.2abe717e@canb.auug.org.au>
        <17384403-c428-70a9-4930-390869a45405@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G+e.bDQV3ugnX/WxKMfs2+X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/G+e.bDQV3ugnX/WxKMfs2+X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On Mon, 30 Aug 2021 09:14:33 +0200 Helge Deller <deller@gmx.de> wrote:
>
> On 8/30/21 7:46 AM, Stephen Rothwell wrote:
> > Today's linux-next merge of the tty tree got a conflict in:
> >
> >    arch/parisc/kernel/pdc_cons.c
> >
> > between commit:
> >
> >    9613b0cb3eb4 ("tty: pdc_cons, free tty_driver upon failure")
> >
> > from the parisc-hd tree and commits:
> >
> >    0524513afe45 ("tty: don't store semi-state into tty drivers")
> >    72fdb403008c ("tty: pdc_cons, free tty_driver upon failure")
> >
> > from the tty tree.
> >
> > I fixed it up (I just used the latter version) ... =20
>=20
> The latter version triggers build errors.
> Jiri's patch needs fixing. Instead of:
> +               tty_driver_kref_put(driver);
> it needs to be:
> +               tty_driver_kref_put(pdc_console_tty_driver);
>=20
> Jiri, maybe you can fix it in your tree?
> I'm happy to drop the patch from my tree.

The tty tree commits first create a "driver" variable that is used
until it is clear everything works and then it is assigned to
pdc_console_tty_driver.

Just remember to tell Linus about the conflict, he will figure it out.
--=20
Cheers,
Stephen Rothwell

--Sig_/G+e.bDQV3ugnX/WxKMfs2+X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEsibUACgkQAVBC80lX
0Gy1qQf/Sp0w3zQuA7jbqODJSEjgwtjCOIZXSYhEbW0PK6EYDRM85LEveXLJMMHo
6xjYDF718q+8IAjdPvI9y/Y62FTI8o4Q3r0LIJEsilW03DXS+Kj0HNscBr5vZrRL
r/vLWHQ5bAvCP36Wy3Ft7XMVP89zWQaQw6PB9zq2HBLnhRGTYptrBgjEwKxEDPXs
bX/X2CoqJPtsjQ3CPNqh7NUxv1feRkqhjE1C8LK6an/socJpckbZeUAX2VI8qK9E
KPCffJ96ZqOpPBOfEHW+ejTMUJUS3JQt2Zy4btTK3n1xkHENOSNp4iBW4A/0xxkn
T7DDsP2z86hSC1kMg7Udf1dkGQyXwQ==
=3llU
-----END PGP SIGNATURE-----

--Sig_/G+e.bDQV3ugnX/WxKMfs2+X--
