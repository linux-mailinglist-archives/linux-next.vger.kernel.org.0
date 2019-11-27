Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2630E10C0E3
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 00:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfK0X6x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 18:58:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33727 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727432AbfK0X6x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Nov 2019 18:58:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Nd5j4rS7z9sS9;
        Thu, 28 Nov 2019 10:58:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574899129;
        bh=fvrpu4i44kqNfFB7fJv+NGHEC5CyOYCOzU0/pgx5weE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ka0LuDGdUyp6NAx4FvkAZQ9pInq0EQvNZG+sKu4OIorAniFdHSB1jac+hkdVpgibU
         C4+kW8AjA1H8E5qN0gwbnfq4tj+vBgi9b7e5EZDZFNUCtSk4ji4YTHYpX+S6hs1H1G
         F8HSlug0hp2amzybUopWps3H7HPG5XCnX05JmCO9gC3svoQ6Fi2MNdR2EhR0fMR1qV
         Fvqm0ojzPpB9smL49wy/tBCw2TwBAKKk5NtpL+LTuwOTxY4KXSjM/nVKuhPegwSlvv
         kOsOmXcjJ6wa82xuOE9HPVWzNghaqViM3+6gtNtO91FVRzmS6qFSMIA05XoPUsglkz
         KOQa3ht2mU9aw==
Date:   Thu, 28 Nov 2019 10:58:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Message-ID: <20191128105848.0209e2d5@canb.auug.org.au>
In-Reply-To: <20191125101345.760293f3@canb.auug.org.au>
References: <20191125101345.760293f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fnc+RRpg=GwD1kA3BB2O7AC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Fnc+RRpg=GwD1kA3BB2O7AC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Nov 2019 10:13:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pm tree got a conflict in:
>=20
>   Documentation/power/pci.rst
>=20
> between commits:
>=20
>   b64cf7a1711d ("PCI/PM: Wrap long lines in documentation")
>   89cdbc354635 ("PCI/PM: Remove unused pci_driver.resume_early() hook")
>   1a1daf097e21 ("PCI/PM: Remove unused pci_driver.suspend_late() hook")
>=20
> from the pci tree and commit:
>=20
>   1992b66d2f55 ("PM: Wrap documentation to fit in 80 columns")
>=20
> from the pm tree.
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
> diff --cc Documentation/power/pci.rst
> index 0924d29636ad,51e0a493d284..000000000000
> --- a/Documentation/power/pci.rst
> +++ b/Documentation/power/pci.rst
> @@@ -692,11 -692,11 +692,11 @@@ controlling the runtime power managemen
>   At the time of this writing there are two ways to define power manageme=
nt
>   callbacks for a PCI device driver, the recommended one, based on using a
>   dev_pm_ops structure described in Documentation/driver-api/pm/devices.r=
st, and
> - the "legacy" one, in which the .suspend() and .resume() callbacks from =
struct
> - pci_driver are used.  The legacy approach, however, doesn't allow one t=
o define
> - runtime power management callbacks and is not really suitable for any n=
ew
> - drivers.  Therefore it is not covered by this document (refer to the so=
urce code
> - to learn more about it).
>  -the "legacy" one, in which the .suspend(), .suspend_late(), .resume_ear=
ly(), and
>  -.resume() callbacks from struct pci_driver are used.  The legacy approa=
ch,
>  -however, doesn't allow one to define runtime power management callbacks=
 and is
>  -not really suitable for any new drivers.  Therefore it is not covered b=
y this
>  -document (refer to the source code to learn more about it).
> ++the "legacy" one, in which the .suspend() and .resume() callbacks from
> ++struct pci_driver are used.  The legacy approach, however, doesn't allow
> ++one to define runtime power management callbacks and is not really suit=
able
> ++for any new drivers.  Therefore it is not covered by this document (ref=
er
> ++to the source code to learn more about it).
>  =20
>   It is recommended that all PCI device drivers define a struct dev_pm_op=
s object
>   containing pointers to power management (PM) callbacks that will be exe=
cuted by

This is now a conflict between the pci tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Fnc+RRpg=GwD1kA3BB2O7AC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fDbgACgkQAVBC80lX
0GyxIAf/aTVnXS+RV00Ey9lHSLPDRwQDtWcwq4Fe6pXl0Sr+lnqsmUI97jyWIPWz
xbSY3DQW8hvzyCrdUH69n7nIObxZzV4OsTJgoKzTpCt0jOMxclXC802bJ8IeHEfF
nk6eSJ6bDI3ylUg30Y6JlptZTHcFt4U0WBZxvEqbbkZCdIdENEaNtbpWGu+AX89G
7/XvmpL1eTk4F5y9cOJTzYDntWiGfBejSsCC8ovsTQ8nPhm7pP9XH0+E5WP/RbQZ
SfXjohjwqGDynBTQ+3VGth8/x/KLi56SvwFbkoLPoJtDS1LEskN1vmOLcVKOnIVo
/WY8nM6VXxo4W0aMh8bL/qH1v6EH5Q==
=HPNy
-----END PGP SIGNATURE-----

--Sig_/Fnc+RRpg=GwD1kA3BB2O7AC--
