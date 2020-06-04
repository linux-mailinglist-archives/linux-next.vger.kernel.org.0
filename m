Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD261EDFB6
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 10:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgFDIYk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 04:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgFDIYk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 04:24:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2C0C05BD1E;
        Thu,  4 Jun 2020 01:24:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49czN505RNz9sSf;
        Thu,  4 Jun 2020 18:24:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591259077;
        bh=9zDAoR8ptxp4KD7+uEd43pqApDpbDt86eJ9jKZIT9UM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HUTmsVktEn0OwAE/VmnDinss5EY5AFNMs0gjrKMmSk7GpiEl5w69Kgy78l08REa9Z
         JYYU39t0b63rTsq2pM/sjsj/4plP/42uKSFRtUuIOFVgxsG+hhoiKeCA3lILwdRW8x
         Xsorl/74X5wBmGvEDcpA1CYEQl3WlAIk2pV3Sn8OUsj1+tdsZmgBUpTnPzkxOs4I7y
         9Dl5g0NwcgoiwXE4exTqHscVvFFkaEVpJGG8HPu8b+qK2LDHevr3TfJXyv8nzv6H6y
         0jlar1F52q9ksQ/WGFqu7sMhcRHhKNKcGYAS00YB8F/OgWawpQJy2+CE7BE7t3yrjv
         UkKiNRkcJOwJg==
Date:   Thu, 4 Jun 2020 18:24:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200604182436.5c8fe72b@canb.auug.org.au>
In-Reply-To: <20200604164442.5101cf27@canb.auug.org.au>
References: <20200604164442.5101cf27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9GBF595DCEP7TWu_0KDlzbm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9GBF595DCEP7TWu_0KDlzbm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Jun 2020 16:44:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the akpm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> arch/powerpc/mm/ptdump/ptdump.c: In function 'walk_pagetables':
> arch/powerpc/mm/ptdump/ptdump.c:337:25: error: implicit declaration of fu=
nction 'pgd_is_leaf'; did you mean 'p4d_is_leaf'? [-Werror=3Dimplicit-funct=
ion-declaration]
>   337 |   if (pgd_none(*pgd) || pgd_is_leaf(*pgd))
>       |                         ^~~~~~~~~~~
>       |                         p4d_is_leaf
>=20
> Caused by commit
>=20
>    "powerpc: add support for folded p4d page tables"
>=20
> I applied the following fix up patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 4 Jun 2020 16:33:01 +1000
> Subject: [PATCH] fixup for powerpc ptdump.c
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/mm/ptdump/ptdump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptd=
ump.c
> index 9b1c89b05622..de6e05ef871c 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -334,12 +334,12 @@ static void walk_pagetables(struct pg_state *st)
>  	for (i =3D pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr +=3D PGD=
IR_SIZE) {
>  		p4d_t *p4d =3D p4d_offset(pgd, 0);
> =20
> -		if (pgd_none(*pgd) || pgd_is_leaf(*pgd))
> +		if (p4d_none(*p4d) || p4d_is_leaf(*p4d))
>  			note_page(st, addr, 1, p4d_val(*p4d), PGDIR_SIZE);
>  		else if (is_hugepd(__hugepd(p4d_val(*p4d))))
> -			walk_hugepd(st, (hugepd_t *)pgd, addr, PGDIR_SHIFT, 1);
> +			walk_hugepd(st, (hugepd_t *)p4d, addr, PGDIR_SHIFT, 1);
>  		else
> -			/* pgd exists */
> +			/* p4d exists */
>  			walk_pud(st, p4d, addr);
>  	}
>  }
>

I have put that in linux-next (for tomorrow) as a fix up for
powerpc-add-support-for-folded-p4d-page-tables.

--=20
Cheers,
Stephen Rothwell

--Sig_/9GBF595DCEP7TWu_0KDlzbm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Yr8QACgkQAVBC80lX
0GwX6Qf8DuCMnioAOVgkvBD6oYTA+iAICkgnQ4MKxBsj07ufgAnufIgpO12beI9B
x2QRbAOuEP0vjKdxsIlNFgdVqtZtYGkVqm5UxKKvXaYIfU+zCwJcRrJ4cFEiOLnA
6cGRtmYVLhkgjK1zSy9DVW1YOcxisvLUnQsJQU2axbF0on6oL0zGocFdZuex6nLe
kNc6ZD30U9w7sXZvB8SSAZxPgsdvR4oMQK95yvLnIapKbxoWFqt8piBtU/eDnrEz
xJBjs/hwxcQc1CsCrO5aslRYm5Ip9n+w3d52IGV0fZ3Jsk/7X4051KUYUn7+IAS7
iEt2gNhqJjks4NfwoXNNipH18LBVaQ==
=s26x
-----END PGP SIGNATURE-----

--Sig_/9GBF595DCEP7TWu_0KDlzbm--
