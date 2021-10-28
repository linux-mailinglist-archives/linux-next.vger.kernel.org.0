Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6DA43E112
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhJ1MlO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 08:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhJ1MlO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 08:41:14 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616DAC061570;
        Thu, 28 Oct 2021 05:38:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg4qS6kkHz4xZ1;
        Thu, 28 Oct 2021 23:38:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635424725;
        bh=QnRRNSnTaO6YJsSfPYQRO3q2yMGCeOnG2DOzgPjJso8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lPI67dY7fSZvmXemWqkuTRbpRGieB4+GoV23Xiwu6fIzggMf99ff2nRf1MCC+CY7K
         NRmlqSy5Rt++VwnoX525uhXkcuGy0xMEHe8fdG74o1tzwb6qLaQDD8Fce+S+RGJDmZ
         ipKpxpZ5V6dv5Nm1j/aLS3dgKgFAyOUFTd6nJnLvXbqVJJ18hux/JOvKDygSoiN9/I
         dYgVeNHkdZZPv28vVyka5gbsqhp+SO71f9GCYcscErnVMOFhMApPMqfuVbNpcZdl2X
         Rz3XOVPVrlh7MnlMoRS14IVbVsnvM2te/I9zTPYKGdZS6G1SFlfNQsz9Q2eKt3T/Hl
         Dld3DKvd+GaSA==
Date:   Thu, 28 Oct 2021 23:38:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of almost all the trees
Message-ID: <20211028233844.292e1319@canb.auug.org.au>
In-Reply-To: <20211028212651.57beb05b@canb.auug.org.au>
References: <20211028212651.57beb05b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jnm1pzZ8/GNchqeU=kfC_Di";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Jnm1pzZ8/GNchqeU=kfC_Di
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 28 Oct 2021 21:26:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc allyesconfig) failed like this:
>=20
> fs/ntfs/aops.c: In function 'ntfs_write_mst_block':
> fs/ntfs/aops.c:1311:1: error: the frame size of 2304 bytes is larger than=
 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  1311 | }
>       | ^
> cc1: all warnings being treated as errors
>=20
> I have no idea what has caused this.

With a nudge from Arnd, it seems the immediate case was commit

  f22969a66041 ("powerpc/64s: Default to 64K pages for 64 bit book3s")

from the powerpc tree switching the allyesconfig build from 4k pages to
64k pages which expanded a few arrays on the stack in that function.

--=20
Cheers,
Stephen Rothwell

--Sig_/Jnm1pzZ8/GNchqeU=kfC_Di
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6mdQACgkQAVBC80lX
0GweUQf+JcHkit3ffccvp0vwAM7BGZY5WNLoXfVvw/nyTNmueDJfNxFCCfa9uola
nlGWEXmShl1ruC/nhL4EkTAjhEJ+KxrOExQnlPXCEOfksTzigTsa/vP3vdmqs6ZH
tSf4uHDf/pWhQEwVZUVYmI2DpFvasj8VMvxvOUPIzw+kfpw57g4V5EMw7jwEbdvh
qrfTJLp9a7zz2bQ8k4Mqq/DC6Go7aDjDuKUK3yf2yhUfKfUdfoUpj1asVwRpM88j
UeI8UQUDhwhYh4QSHsUihVOo6dweRMfT1FjVa8F7luVjJWsZZEgM/K16298jMxOT
kaOih47fjbDZxL1JnGc2zu9rwwMNUA==
=Y6q6
-----END PGP SIGNATURE-----

--Sig_/Jnm1pzZ8/GNchqeU=kfC_Di--
