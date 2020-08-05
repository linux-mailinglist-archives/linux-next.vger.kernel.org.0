Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DB123C444
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 06:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgHEEHb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 00:07:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgHEEHa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Aug 2020 00:07:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLykm6cGPz9sPB;
        Wed,  5 Aug 2020 14:07:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596600449;
        bh=19CZUh/4EolYZVJrU2t0ERZd7fiXwDyl8RGnJ0Gm438=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mGVViYKUCBu397j+sg2jV4e++memNP70bphJq71Do4e5DNnAC4ZYLNkZ4ITpe7nt8
         KwYFvemJX4ZLOjaTpZQ+Y69TvBWmxP+cc4nq4npsn0u+r+xqPoYZEw4u3tYIhYPPxh
         03D7biPXOfLCXwnYZUPl2aUGPW0zfmxSEYyrIXXMSsybQMNUbCGjTG9ZrFXPlLgoFQ
         8+HgrYwNBFLEoHvE5iqmacqO5H89IBQaiB2IUDWFGfoyBQ144+A8W95hPfS2+es+bH
         7VnJ+MnPW20SzRSyQrIRhqtWm+qNINsmsxLEzl/gucLtv2r2Lme8rNCaO/zzluy7GS
         UxWQdDKJWY0mw==
Date:   Wed, 5 Aug 2020 14:07:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: manual merge of the kspp tree with the rdma tree
Message-ID: <20200805140728.61834c32@canb.auug.org.au>
In-Reply-To: <20200728184520.5634a0a0@canb.auug.org.au>
References: <20200728184520.5634a0a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.fTp2_Vi3uPU2TbLo57SuUD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.fTp2_Vi3uPU2TbLo57SuUD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 28 Jul 2020 18:45:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the kspp tree got a conflict in:
>=20
>   drivers/infiniband/core/uverbs_cmd.c
>=20
> between commit:
>=20
>   29f3fe1d6854 ("RDMA/uverbs: Remove redundant assignments")
>=20
> from the rdma tree and commit:
>=20
>   3f649ab728cd ("treewide: Remove uninitialized_var() usage")
>=20
> from the kspp tree.
>=20
> I fixed it up (the former basically did what the latter did, so I used
> the former version) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between the rdma tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.fTp2_Vi3uPU2TbLo57SuUD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8qMIAACgkQAVBC80lX
0Gykngf+MHQ7qLRwHh87wEnXjwznwd8nvBtgo9EF7flXvVxAVxYTyTXau0UhM9ua
rYtPHy/XPDoAgFdRHeJG3bSWmle1SWok0h9rxGFnbalfLP3+Ui0fm6l1TTb45hFq
9uEljXfq0PSrOt1G+fK9BxQ/yYevDVZteMiBRptIzuah2DMIn31iS+IYBKcaZv4/
DzojM6WUgkszFwhGP9O18vrJuRZCo7pWVXIQNoR0Ht/3/QtVy0TdWl0Jk3zvDzzD
sDeyLyQXD67DFL8KHvgRxdmR55/JOiOWn1xTC8fj3jtaGFzn2c+9HsFh3JG9jAQA
BjYiDOMeGLxKa7U1Z4X9clXcdAfwtg==
=UTdf
-----END PGP SIGNATURE-----

--Sig_/.fTp2_Vi3uPU2TbLo57SuUD--
