Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE3210C113
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 01:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfK1Ant (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 19:43:49 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727031AbfK1Ant (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Nov 2019 19:43:49 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Nf5Y60nwz9sSJ;
        Thu, 28 Nov 2019 11:43:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574901826;
        bh=fJNZyl8+sIOW4DyiRjQoW8yVs95uN1nyytnbeN58Ct8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IuFrUWiGTsHuJAObPf1L0S8d56HUs3dCa0a1tIZn/Wirp0crD3UAkHmg4aL/pw75p
         JfAQZJBzRnDzYrsCChSpyuMiCRp8RA3Hw1uZ7s69bY4FZ8BmgV5vLiO2EIZhQykvRP
         hsBBtmzeIq51K1PLqrTCDTaBOPJKxjEDEF+cdz66vih6J3lxqSj0WGG2xpiQjmZhjf
         bF/WVtOF6E0NmFSu1zAeHWO03CY6Wnvoja/tPxTkYzZ42pbLni4sKOrwa9wlwG4J5q
         d3LvIdvfb+rZNB3J2HGG7wn12jHBJNYvNuapmgAz9Z+Ww2vypeJ/b6wmJ2MX4Eg4ZV
         nNA8d1kYIxZFA==
Date:   Thu, 28 Nov 2019 11:43:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the keys
 tree
Message-ID: <20191128114345.3d274b7d@canb.auug.org.au>
In-Reply-To: <20191022133804.32ef6f86@canb.auug.org.au>
References: <20191022133804.32ef6f86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kgemz1Fwa6b_otqME0i73V1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kgemz1Fwa6b_otqME0i73V1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Oct 2019 13:38:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the char-misc tree got conflicts in:
>=20
>   samples/Kconfig
>   samples/Makefile
>=20
> between commit:
>=20
>   0b9c31597d81 ("Add sample notification program")
>=20
> from the keys tree and commit:
>=20
>   6859eba4f6fb ("samples: mei: use hostprogs kbuild constructs")
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
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc samples/Kconfig
> index d0761f29ccb0,b663d9d24114..000000000000
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@@ -169,11 -169,11 +169,17 @@@ config SAMPLE_VF
>   	  as mount API and statx().  Note that this is restricted to the x86
>   	  arch whilst it accesses system calls that aren't yet in all arches.
>  =20
>  +config SAMPLE_WATCH_QUEUE
>  +	bool "Build example /dev/watch_queue notification consumer"
>  +	depends on HEADERS_INSTALL
>  +	help
>  +	  Build example userspace program to use the new mount_notify(),
>  +	  sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
>  +
> + config SAMPLE_INTEL_MEI
> + 	bool "Build example program working with intel mei driver"
> + 	depends on INTEL_MEI
> + 	help
> + 	  Build a sample program to work with mei device.
> +=20
>  -
>   endif # SAMPLES
> diff --cc samples/Makefile
> index a61a39047d02,d6062ab25347..000000000000
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@@ -20,4 -20,4 +20,5 @@@ obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+=3D tr
>   obj-$(CONFIG_VIDEO_PCI_SKELETON)	+=3D v4l/
>   obj-y					+=3D vfio-mdev/
>   subdir-$(CONFIG_SAMPLE_VFS)		+=3D vfs
>  +subdir-$(CONFIG_SAMPLE_WATCH_QUEUE)	+=3D watch_queue
> + obj-$(CONFIG_SAMPLE_INTEL_MEI)		+=3D mei/

This is now a conflict between the keys tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/kgemz1Fwa6b_otqME0i73V1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fGEEACgkQAVBC80lX
0GyR3wf/QLB0ePb9su3A1yl+k8Q+nSQX2gteW+L4fV33IfjJryVQrxl17Fk6M5/O
vT2Z3qj5iQLe7IlIAcvxn/dBsfCNOQkD0IDkA2tpsS7eOxOZ/opUkxpPykpd1bD7
2y+1fYXetLj84ND/kULFlgITo3mjvje4goMpTzmr8+XD9JmMHI3PxdBHZnXKajlQ
GrKz0O1rOaDxDJAyLxf0itLXrLWK0hr6vO7uyBtQdnb6/zU7fcztwAMIV4N5pzzu
gRIaCsAjG1e2LL9jc3ivGRT9W2+bILnlRpcWaq0tiq6MZkp9Kua6JNFw77SKsjnY
H6msCLwlA32MT4Scb7MMjWPkfwxSug==
=yL1C
-----END PGP SIGNATURE-----

--Sig_/kgemz1Fwa6b_otqME0i73V1--
