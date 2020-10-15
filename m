Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D17728ECE1
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 07:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgJOFyL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 01:54:11 -0400
Received: from ozlabs.org ([203.11.71.1]:49477 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbgJOFyL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 01:54:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBdl40lL5z9sTK;
        Thu, 15 Oct 2020 16:54:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602741249;
        bh=U4wxrIqjNmzKVny79ebHzFd0vuBUVARg5NVY/hMxNV0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JNGZHPnIHvyKLLGzzsoHMe8P8qvy+rIe1OwYk4AuYNOUUVVlMpZdx52fxpIplfPaf
         tHK2wUjG0rLjgFkEHLXz6pKlp/4c13dzXBil7I+phFnOpWkI4PnYYBtWT6Qqo7wrll
         s2NRlcXulGgOloAhbU3KxTz6G9gY7V5EWUCV2rHPAD9E5OOi/OYKF71jfh375rzvz8
         0gz1d2RjPOfInIKdKbNB2oXe1pbvvOzwKLfATBoOJrWHKbqbqmJQVTOfAFTy3F4slm
         ohgE8y6jz2iOwMW/mvejrpJeIV75fvh6qpFp6z4pcDTpY8k52fbz2+wag2EI2GiBrb
         tFwR0vc98l/9A==
Date:   Thu, 15 Oct 2020 16:54:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Corey Minyard <cminyard@mvista.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Xianting Tian <tian.xianting@h3c.com>
Subject: Re: linux-next: manual merge of the counters tree with the ipmi
 tree
Message-ID: <20201015165407.779e1cb3@canb.auug.org.au>
In-Reply-To: <20201012191340.78ebbaea@canb.auug.org.au>
References: <20201012191340.78ebbaea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pZKoI1Y/5Bvw/5fMMZpqmjs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pZKoI1Y/5Bvw/5fMMZpqmjs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Oct 2020 19:13:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the counters tree got a conflict in:
>=20
>   drivers/char/ipmi/ipmi_msghandler.c
>=20
> between commit:
>=20
>   f8910ffa81b0 ("ipmi:msghandler: retry to get device id on an error")
>=20
> from the ipmi tree and commit:
>=20
>   dc87264ac991 ("drivers/char/ipmi: convert stats to use counter_atomic32=
")
>=20
> from the counters tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/char/ipmi/ipmi_msghandler.c
> index 8774a3b8ff95,36c0b1be22fb..000000000000
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@@ -34,7 -34,7 +34,8 @@@
>   #include <linux/uuid.h>
>   #include <linux/nospec.h>
>   #include <linux/vmalloc.h>
>  +#include <linux/delay.h>
> + #include <linux/counters.h>
>  =20
>   #define IPMI_DRIVER_VERSION "39.2"
>  =20

This is now a conflict between the counters tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/pZKoI1Y/5Bvw/5fMMZpqmjs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+H4/8ACgkQAVBC80lX
0Gzj8AgAnA39SunQaxVseGOwe7AoZ01vF/dz87rLB9jJoRLuBHRHIp4A3UpmWUwO
rojXEjK9U5jS/MvRaXDSRZ0xjJ85EoEaPJCqxqOlyr3XoawcyCZ6W8oUj65CUr1+
VhFSf47IhS1EYvHxpPXiTKkWrXRisovACClFxegnwzlyNWWuF2WWGM/TxCuTkKoD
5ptUo6EU89AoRf8CYMWfFU/0JwZgIrLKL372tQMwAifxt9KSsh4PlvqqgoRbw0dc
BLPRMGW2SqUNhy1YDWsJxHCW1avpgsJFqa935nQ8qRDFNW2s+TLVU0NXqZgPYkKt
LTHGCjD/0iPum0UjFNejiynRHy40pQ==
=4UB4
-----END PGP SIGNATURE-----

--Sig_/pZKoI1Y/5Bvw/5fMMZpqmjs--
