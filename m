Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7E528EB92
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 05:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgJODcq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 23:32:46 -0400
Received: from ozlabs.org ([203.11.71.1]:40351 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbgJODcp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 23:32:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBZbt3XMwz9sT6;
        Thu, 15 Oct 2020 14:32:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602732763;
        bh=FZ8tngOg0tdiOroMlewnRrOMkmr7vTeLLkS64+7jYng=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sn0eCzpXBq8rzjlyh2egyCOEuh1Grq+JIKvSHQuMnhNKuFww1ll992R4eDXQf1LHJ
         ipewsq13dWRrniscmmydzSLkoFkQzfxHaTk5XBu3Syj0lbefCb/Glro8Gj+PLAd1a0
         0dEZ07qLJ8JDNN2N8kEFJ5coLEpDqtdh0rLI5RJGam7DKU8117BjBXb3cXN4YumGyv
         Kx6RXbhzO73yfVBjCIE9wC5+DHwbLpY1l+G1H3w+ep/oRIiRln+Tg7DV72mc+iOi4G
         5/aQEWlDlyVl8WyHmlkj9JLfleJ4OAGSWCLEDbN4Y41OlAkPNMjYp6Cg0izRBSBBXB
         MF2DEYGDrpPaQ==
Date:   Thu, 15 Oct 2020 14:32:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the dma-mapping
 tree
Message-ID: <20201015143241.13d8eea0@canb.auug.org.au>
In-Reply-To: <20201006171135.3cabacbf@canb.auug.org.au>
References: <20201006171135.3cabacbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WNhlUvoF7PPmRwHPClp=2m0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WNhlUvoF7PPmRwHPClp=2m0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Oct 2020 17:11:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/kernel/setup.c
>=20
> between commit:
>=20
>   f47e22d65d08 ("dma-mapping: split <linux/dma-mapping.h>")
>=20
> from the dma-mapping tree and commit:
>=20
>   a945c8345ec0 ("static_call: Allow early init")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/x86/kernel/setup.c
> index 787c5ff1e7c0,fa16b906ea3f..000000000000
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@@ -20,7 -19,7 +20,8 @@@
>   #include <linux/hugetlb.h>
>   #include <linux/tboot.h>
>   #include <linux/usb/xhci-dbgp.h>
> + #include <linux/static_call.h>
>  +#include <linux/swiotlb.h>
>  =20
>   #include <uapi/linux/mount.h>
>  =20

This is now a conflict between the dma-mapping tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WNhlUvoF7PPmRwHPClp=2m0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HwtkACgkQAVBC80lX
0GyC3wgAgW6+JSuj+6euEekH8DIzk6NrNqVxESENRg4qB35UHvX++XhBT2HtrgNH
RmD9bjsKVYzuCGy2BA9qAFyqrBul1VeN+J6X6nxAMP0pkiPNTGmYC6D6InqissY8
9LblZh6hBddOQujFJxHAX3mI0WZJzonVX+uYSwj426jAYFBqrzOQ0LL+6uaoggct
jzY0Vpcomn77IkTUqN+tda4AWjuX35g6HlRxP0RLvg22Qfo6Hr081pgAf0bURKF0
hKZa2W28AEI6Rpf6PJCPHFJRrUzT98Gy2QJrvmIxq4ihlKqVNzylnMOq2SPgCu7Y
iEgNraWRbc/fidXDc5+4ZxMoeyYfNQ==
=9x9x
-----END PGP SIGNATURE-----

--Sig_/WNhlUvoF7PPmRwHPClp=2m0--
