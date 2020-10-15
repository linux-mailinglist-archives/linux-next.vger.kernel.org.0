Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D859E28FB7A
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 01:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbgJOXMa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 19:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbgJOXM3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 19:12:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E74BC061755;
        Thu, 15 Oct 2020 16:12:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CC4n427wSz9sTL;
        Fri, 16 Oct 2020 10:12:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602803546;
        bh=dWKPxzoiUcikJnJnxCFQNswn2OsYq0ytMCnia6M3A6w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ca6d69ZCUPRBQyzcnlnYnFSQsyIpU/BVWTCFltvrw7LogUz4SuSC5Bn/J9rns/1WM
         gzjxLhd6BtDmMSKmvvIlGQ2W5KHTG45TvPWQbHEBc8Gi0Nl+znT5JMI6QwpZCBXWPj
         DGKgN3EFC5XK6HfDn5WPmU6FEwj0jMTz2I1AKvU3ApdNoy6sRXH5yCYUXADwEiCCU8
         6qKm9Lbqs7yK255z8FRtF8M2GdhwaI3NQKnPelF0Hd3wUPqY8v3jQUm0QoCu4SuXy0
         OlWNJAwjW/nlXQu6owlzsf2QPV0hp0BN+XuY7Pksk5uLaOBD81nCz/Nsnal0Ukd2Gi
         aYFjz8HDoBFxw==
Date:   Fri, 16 Oct 2020 10:12:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the powerpc
 tree
Message-ID: <20201016101222.6fcf12bf@canb.auug.org.au>
In-Reply-To: <20201006183506.186a3562@canb.auug.org.au>
References: <20201006183506.186a3562@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ks+.aphHl8n1UOgOWU7GiJT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ks+.aphHl8n1UOgOWU7GiJT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Oct 2020 18:35:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the char-misc tree got a conflict in:
>=20
>   drivers/misc/ocxl/Kconfig
>=20
> between commit:
>=20
>   dde6f18a8779 ("ocxl: Don't return trigger page when allocating an inter=
rupt")
>=20
> from the powerpc tree and commit:
>=20
>   4b53a3c72116 ("ocxl: fix kconfig dependency warning for OCXL")
>=20
> from the char-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/misc/ocxl/Kconfig
> index 0d815b2a40b3,947294f6d7f4..000000000000
> --- a/drivers/misc/ocxl/Kconfig
> +++ b/drivers/misc/ocxl/Kconfig
> @@@ -9,9 -9,8 +9,9 @@@ config OCXL_BAS
>  =20
>   config OCXL
>   	tristate "OpenCAPI coherent accelerator support"
>  -	depends on PPC_POWERNV && PCI && EEH && HOTPLUG_PCI_POWERNV
>  +	depends on PPC_POWERNV && PCI && EEH && PPC_XIVE_NATIVE
> ++	depends on HOTPLUG_PCI_POWERNV
>   	select OCXL_BASE
> - 	select HOTPLUG_PCI_POWERNV
>   	default m
>   	help
>   	  Select this option to enable the ocxl driver for Open

This is now a conflict between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ks+.aphHl8n1UOgOWU7GiJT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+I11YACgkQAVBC80lX
0GxY9AgAosHo7vjQgJxRBniiUvTs53IzHJDCkNNL+1j9vfaVihhtYdUOkuJ0/4BE
1inYmjVnPepEmMBNqUWx/0iy+G0Xnv4ST2ecxp1DS9fI62UiazeF3k3pDUZ6Uwgw
o0IcujNgQW902xjB8BWvUhcQowvaNNx6ddYm3glZGtA5DgZyJ0hBG4Zug2yW+H9r
YqTvYpWLAMf4KIMyt3dwNMFB1dacyWmSPmlV83uvmleLSBkKjmX3B9xt4oepQ3QR
xG0MO054RF9xONL0Jprsb7jopalcz5H+9pDO/APyU32ovbeKZ20i/81Ypi+G76BQ
laIosjGVKrhAKUJ4t4BHvLP2qD/mwA==
=6yvo
-----END PGP SIGNATURE-----

--Sig_/Ks+.aphHl8n1UOgOWU7GiJT--
