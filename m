Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBE414AC5D
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 00:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgA0XBx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 18:01:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726164AbgA0XBx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 18:01:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4864xm1tKcz9sPJ;
        Tue, 28 Jan 2020 10:01:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580166109;
        bh=78sdNMb+RLhT6XH34jtbdrHO6Tz/8ZmBy31ugbsYgQw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SdxY97OZmSb/QjbaudWj5loLFeBqo6Fw7wlH6HD+/MqiIBdWDZyUeyGK2r8/fgfix
         vxRzshwvNI/2e2dqeecxd0E7oAorXIs1FCilvC/kBJQuICd2K4Tgv1HnLtkXqMddv4
         4c15sUeoRy8hEHJ7ka8l/i5dOjt5hJIWG12gtqSpBkfGKZV4D4S9FxzQtkgR4p4iys
         aW6HH+GFp9zOTLYvYk32LT41UGb++zdOvrI8H7ydw7yb2KfIez00Fvj6gotrCFVpb8
         Q49mdVtks+7ZpCz1OUGdufS+qaZmbrFpKI+IbxeL2ard2XP2iHUBUj75dYfF9toXth
         FAl/Kl7soYTWA==
Date:   Tue, 28 Jan 2020 10:01:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@lst.de>, Colin Cross <ccross@android.com>,
        Thierry Reding <treding@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 tegra tree
Message-ID: <20200128100147.38b868f2@canb.auug.org.au>
In-Reply-To: <20200113162748.698470fc@canb.auug.org.au>
References: <20200113162748.698470fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T4SNtqPH4nx86JBf/cX43MB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T4SNtqPH4nx86JBf/cX43MB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jan 2020 16:27:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the generic-ioremap tree got a conflict in:
>=20
>   drivers/soc/tegra/fuse/tegra-apbmisc.c
>=20
> between commit:
>=20
>   02676345e9b3 ("soc/tegra: fuse: Unmap registers once they are not neede=
d anymore")
>=20
> from the tegra tree and commit:
>=20
>   4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")
>=20
> from the generic-ioremap tree.
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
> diff --cc drivers/soc/tegra/fuse/tegra-apbmisc.c
> index 4a737f15e401,a2fd6ccd48f9..000000000000
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@@ -157,21 -159,13 +157,21 @@@ void __init tegra_init_apbmisc(void
>   		}
>   	}
>  =20
> - 	apbmisc_base =3D ioremap_nocache(apbmisc.start, resource_size(&apbmisc=
));
> + 	apbmisc_base =3D ioremap(apbmisc.start, resource_size(&apbmisc));
>  -	if (!apbmisc_base)
>  +	if (!apbmisc_base) {
>   		pr_err("failed to map APBMISC registers\n");
>  +	} else {
>  +		chipid =3D readl_relaxed(apbmisc_base + 4);
>  +		iounmap(apbmisc_base);
>  +	}
>  =20
> - 	strapping_base =3D ioremap_nocache(straps.start, resource_size(&straps=
));
> + 	strapping_base =3D ioremap(straps.start, resource_size(&straps));
>  -	if (!strapping_base)
>  +	if (!strapping_base) {
>   		pr_err("failed to map strapping options registers\n");
>  +	} else {
>  +		strapping =3D readl_relaxed(strapping_base);
>  +		iounmap(strapping_base);
>  +	}
>  =20
>   	long_ram_code =3D of_property_read_bool(np, "nvidia,long-ram-code");
>   }

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/T4SNtqPH4nx86JBf/cX43MB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4va9sACgkQAVBC80lX
0Gzpkwf/Y3cS+4tdwI4W3ADy/ezYjTMGdmurHl4vFJ8VX+50j3jVWfFxBupi8RLX
fvwVtbyv0zPn50RpsdP6y4JzHQg0N0RmFH8t3ygGWbxWYHQlDi+m3qlyjhL/qaJ7
kbgnrcmM6/Vl7tTbaEIEBR76rIkEACJDAW1x2CFZu/Amr2ILOn6VbpiASu6QUlG6
YuQkxZt0HLVF7lAPf5Mj/40Ku7xspz7ocEBE0+dwORW79oZuPxuafVuMu8oyuvOT
RoxrJM5ve5sD8BlHhtjKSDh0t9X4MY8WmN1NKhxRmVASbs5NEuvD9keXs95qy7cf
NjFqPrD0g0wyCI6yNfV8Ak+Aimjt/g==
=IEkV
-----END PGP SIGNATURE-----

--Sig_/T4SNtqPH4nx86JBf/cX43MB--
