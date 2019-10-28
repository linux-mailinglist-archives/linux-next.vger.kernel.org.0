Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23561E6C14
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 06:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfJ1Ftf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 01:49:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51029 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbfJ1Ftf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 01:49:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 471kLg1Qqcz9sPK;
        Mon, 28 Oct 2019 16:49:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572241772;
        bh=tstUNT1brLDFJRPvtcAeyQmxp+7U7USa0PXA8ftu9+4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NJD2B3O+sidrtCTnKWj5vvxBtI/NzOK621TAUp2H9PSWcJMCSVF8GwzFTHu//liP5
         aezBR3iX8cuLtrf9B5Lck/SreohkiVK+x3Re7maIiLQ3TQpWHSOb3nr72+dpg/7O0e
         TWTgwxjv8METpLpvJKnTWblefgzgA82vrA/lTFdRpI7aV8okLwheGpbnFJAuxwppil
         D2uxa4NPKJYxnOTDJThlSHscQxV14xxZ0iRZkJhzJi0AP5dDnU7BZIV4NX9VW7WzNL
         xrTQ0Nr4iOok7xJw+JQlMgpPij+j9ENawGQGR5U9I+UO1BlsU7+2x+TZT8rpXF0tw1
         ze7wXaz1WTPyw==
Date:   Mon, 28 Oct 2019 16:49:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Smart <jsmart2021@gmail.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20191028164924.232e32e5@canb.auug.org.au>
In-Reply-To: <20191025140736.0c9e9d64@canb.auug.org.au>
References: <20191025140736.0c9e9d64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G3U/WFfGWlEPv9ohSoD/NlH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/G3U/WFfGWlEPv9ohSoD/NlH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 25 Oct 2019 14:07:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_ras_log_relea=
se':
> drivers/scsi/lpfc/lpfc_debugfs.c:2109:2: error: implicit declaration of f=
unction 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-declar=
ation]
>  2109 |  vfree(debug->buffer);
>       |  ^~~~~
>       |  kvfree
> drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_ras_log_open':
> drivers/scsi/lpfc/lpfc_debugfs.c:2150:18: error: implicit declaration of =
function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=3Dimplicit-function-d=
eclaration]
>  2150 |  debug->buffer =3D vmalloc(size);
>       |                  ^~~~~~~
>       |                  kvmalloc
> drivers/scsi/lpfc/lpfc_debugfs.c:2150:16: warning: assignment to 'char *'=
 from 'int' makes pointer from integer without a cast [-Wint-conversion]
>  2150 |  debug->buffer =3D vmalloc(size);
>       |                ^
>=20
> Caused by commit
>=20
>   95bfc6d8ad86 ("scsi: lpfc: Make FW logging dynamically configurable")
>=20
> I have used the scsi-mkp tree from next-20191024 for today.

This build failure now appears in the scsi tree build.  I have applied the
fix from James Smart for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/G3U/WFfGWlEPv9ohSoD/NlH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl22gWQACgkQAVBC80lX
0Gzx5wf+OuWnhPVqdmOeG9S0LWw9rudHHt4o2sAFEopbPgwkn3i8vrP467Exz+Ho
DdxerHWZUmUDGX7kFw5lAPoCycknLATak3G1ialcyp6A+6iKhFcUu+dhCmMzPxcB
Nm/bcznEI9QdIVFRKajJ2ZU7pwrqh3cBdm6QeUbEivaj0EZyLHY4SYBE553LdmSy
PHBcrpB3cAXYKrC2gWroHRLi5Y1oZaRVgTpPXob1c7BsJNY5ZAMyuTnsfZQI9zqq
5Y23R5k/do2i75wBh9Imzb7jCmwtTn7QJrUTHoUjFBviy3bByavBpHc64XcibCCI
0W1b2gHYa5an3Vvs52mwro/mbZ1auA==
=dCSO
-----END PGP SIGNATURE-----

--Sig_/G3U/WFfGWlEPv9ohSoD/NlH--
