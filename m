Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F472BC4ED
	for <lists+linux-next@lfdr.de>; Sun, 22 Nov 2020 11:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgKVKJR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Nov 2020 05:09:17 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44285 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbgKVKJQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Nov 2020 05:09:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cf5bt2vQDz9sTR;
        Sun, 22 Nov 2020 21:09:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606039754;
        bh=6rM1MtHjB0tPuMutoeznLd6jCXOo6LpuAAPiiXVP82M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cN7aNIPoblaW5AD3n2OFRpx+xaeIe/4HXw7bmFEFsZo31meZVgCDhJXRxAmjD6cHM
         mrJWK9WDavJwGzvQ97vTYQ/1fzc/Ds3wD5z1ulifn15L6rIvkbPApElVCPaKhmk0SC
         YSMM5qVf67XzqJR3RbkwF4jbkr2xgZFocZFmEFxKcVi2/BlRje29jYEEYvA8FUUPdA
         VY56qhB33RwsLwc+NvViCL1RGhAyjeOIxfpCleeuzGgwjRYoonPpWlcRjBS7TCKbrC
         raAh7yaN0MAvWnHUVeF8o1ONm1bx8GRO0lDolTiEYsRooRFU+hBYOV3Vhg7uEG3XRJ
         ljPVDNJR9PW4Q==
Date:   Sun, 22 Nov 2020 21:09:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20201122210913.078ccc61@canb.auug.org.au>
In-Reply-To: <20201122210810.7024172e@canb.auug.org.au>
References: <20201122210810.7024172e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mSWJjJsNm5.uEF5Up7a/aYM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mSWJjJsNm5.uEF5Up7a/aYM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 22 Nov 2020 21:08:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Commit
>=20
>   ca3bd09a3a49 ("rcu: Allow rcu_irq_enter_check_tick() from NMI")
>=20
> is missing a Signed-off-by from its author.

Please ignore this bit.
dd

--=20
Cheers,
Stephen Rothwell

--Sig_/mSWJjJsNm5.uEF5Up7a/aYM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+6OMkACgkQAVBC80lX
0GzdVQf9ELPFuE44c0QpwM9mUNcjUtevtOCejo6M/yIew2bY4oRrfHDz3Sapinee
wKyv0vujrDAXlol29eeZmnZiGUGd7mT7VsgT491tquleUIyICrE91p9yx4S5YNPy
XzaBYaBzm64T/24oJYY6P0cst0lUSKDtmQZJ672qclGy3L9RBx8uogLKeaNtFDwa
a2qvf0g+zY5hKSGWdNsTKfthwG/rtm6cAQgX5RHEBnSYFVJY1o/6AdDlziZz1aDZ
OZibQnfg+h7jerGFoRnaZOWbP5tJevTr7/aq6rTcWdriWujbSvlPxUVdP/DJ9ZWl
/gkRBu6ilTWZToYrUeL7R2RjQCQqEQ==
=HcHE
-----END PGP SIGNATURE-----

--Sig_/mSWJjJsNm5.uEF5Up7a/aYM--
