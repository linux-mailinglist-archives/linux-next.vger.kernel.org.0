Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9A62497F8
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 10:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgHSIJt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 04:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgHSIJj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 04:09:39 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2FBC061389;
        Wed, 19 Aug 2020 01:09:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BWgRh0ZZYz9sPB;
        Wed, 19 Aug 2020 18:09:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597824576;
        bh=pAWeDRwT9hKXPHGT6p8XLRrRA6EsfdJJ6/7WJw1MaOs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BC6UDR8hw4uqCI0MIIsutM0tH5vfZxJo3AiNlLKYaCuvrGvZKYA9Rl/pSoePvIfLn
         EyZOoFrMT+LZ/JQe0dTEfruFRngAmWBEWK+EjcjQ1w7WcB9I2IfCt5KA190Tnirooz
         2xjGD8Vo6mIJNjbkp2ekc+AShTdS9BXrtLkEizskllri4pEB7TR6dtlOWRk4e0uMMj
         BRheqqkX3RHI2W+p2WpB28BuxVk8KmkVQyiS3L/1WVCKOf1uM+TNQ0t+RqYt2DvhWX
         Kcl5ky6fwsVQxxI4oSL/rxgeM8WGa/BNTzwf2o87eW5Fkjz0//9zjD9dgZtIOIqunr
         KWQeOXRpdma0Q==
Date:   Wed, 19 Aug 2020 18:09:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: linux-next: Tree for Aug 19 (scsi/libsas/)
Message-ID: <20200819180934.37712cd4@canb.auug.org.au>
In-Reply-To: <dbbf8037-1e6c-5e66-39e1-3a5f4b0f3249@infradead.org>
References: <20200819155742.1793a180@canb.auug.org.au>
        <dbbf8037-1e6c-5e66-39e1-3a5f4b0f3249@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Ggt0MhBk3RqSATfnR+cXxn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Ggt0MhBk3RqSATfnR+cXxn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Tue, 18 Aug 2020 23:30:36 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> Is this some kind of mis-merge?
>=20
> In sas_discover.c:
>=20
> 	case SAS_SATA_DEV:
> 	case SAS_SATA_PM:
> #ifdef CONFIG_SCSI_SAS_ATA
> 		error =3D sas_discover_sata(dev);
> 		break;
> #else
> 		pr_notice("ATA device seen but CONFIG_SCSI_SAS_ATA=3DN so cannot attach=
\n");
> 		fallthrough;
> #endif
> 		fallthrough;	/* only for the #else condition above */

No, that comes from commit

  58e813cceabd ("treewide: Use fallthrough pseudo-keyword")

from the kspp-gustavo tree.

>   CC [M]  drivers/scsi/libsas/sas_discover.o
> In file included from ./../include/linux/compiler_types.h:65:0,
>                  from <command-line>:0:
> ../drivers/scsi/libsas/sas_discover.c: In function 'sas_discover_domain':
> ../include/linux/compiler_attributes.h:214:41: warning: attribute 'fallth=
rough' not preceding a case label or default label
>  # define fallthrough                    __attribute__((__fallthrough__))
>                                          ^
> ../drivers/scsi/libsas/sas_discover.c:469:3: note: in expansion of macro =
'fallthrough'
>    fallthrough;
>    ^~~~~~~~~~~
>   CC      drivers/ide/ide-eh.o
> ../include/linux/compiler_attributes.h:214:41: error: invalid use of attr=
ibute 'fallthrough'
>  # define fallthrough                    __attribute__((__fallthrough__))
>                                          ^
> ../drivers/scsi/libsas/sas_discover.c:471:3: note: in expansion of macro =
'fallthrough'
>    fallthrough; /* only for the #else condition above */
>    ^~~~~~~~~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/1Ggt0MhBk3RqSATfnR+cXxn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl883j4ACgkQAVBC80lX
0GyCuwgAmv5nsA69kN05BdLbSOJPy3eHMjqSPlBwgfh8QvaZMybz+BuH3TnDa5u4
B5VMfmPpt9xICg1XITTgz2CgDg1BEb1wVgy0cEOUqM+gFsLHfErnVVMuVzEqV616
iWZ7q9cethr0os8bKNfzo8vfLrPeL2/5Kk4ntVfniFZ03b7SkUkFer83Bw9k4QFv
f9vM86qPqLOG6VAWFXJriy81PclDZr+duYltgd172MT91fjuzUV10skVsujbyuhS
0WogyDOKA7I64FBlEsi/giOOHRo2AYh1p0GdY0KYOvf9XYIjFGAb3nimPr0fn5Y3
Pk21+Jryx0S8kizvFRgjEg6lBIIEBg==
=cAq1
-----END PGP SIGNATURE-----

--Sig_/1Ggt0MhBk3RqSATfnR+cXxn--
