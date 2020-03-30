Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9435197425
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 07:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgC3F5F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 01:57:05 -0400
Received: from ozlabs.org ([203.11.71.1]:50641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728571AbgC3F5F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 01:57:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rMDH04lWz9sPR;
        Mon, 30 Mar 2020 16:57:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585547823;
        bh=DCB2IE+JNo2rtrGMjNCg0CRfMfpjrzrgEnSWNGyixUI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rT8ZR6Zhhoed8IRfKX1diFaFe1MjWejzNznCRHHIHkai8Y1hCthGJLT24TmJwOn6t
         sMHN26gJVV/IC7nAhQXxxnMfxMD4wYlTeY6B0+tTq8ZAnnfBLEYoLx63xyYJdCHiN4
         xmwB9HgBwrgdHRmJ3/BAPaRxE/0kIAu/2tm6LZt8j1bTml8iVkxFN0v/uuZos7OOax
         KDuF2kHqDjPAUMUZiEPbqMtRjaGs0k0H0dtd4Z0rGI9bu+lstikmN3Gvm9bwudhUVP
         bkA2Z1OSeg14c2t11Sa+GwFiUD1+rRMGu4OayMQLws+KZWrYm31F94xl2ILd/WDPRM
         M+WS+C0AeO7kA==
Date:   Mon, 30 Mar 2020 16:57:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Wang <jasowang@redhat.com>
Subject: Re: linux-next: manual merge of the vhost tree with the kvm-arm
 tree
Message-ID: <20200330165701.4e1b8039@canb.auug.org.au>
In-Reply-To: <20200330165614.4973a4bc@canb.auug.org.au>
References: <20200330165614.4973a4bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4/8LVUud4hp=M6BeY9_/rU_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4/8LVUud4hp=M6BeY9_/rU_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Mar 2020 16:56:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the vhost tree got a conflict in:
>=20
>   arch/arm/kvm/Kconfig
>=20
> between commit:
>=20
>   541ad0150ca4 ("arm: Remove 32bit KVM host support")
>=20
> from the kvm-arm tree and commit:
>=20
>   ec9d8449a99b ("vhost: refine vhost and vringh kconfig")
>=20
> from the vhost tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
                 ^^^^^^^^^
I just removed the file, of course.

--=20
Cheers,
Stephen Rothwell

--Sig_/4/8LVUud4hp=M6BeY9_/rU_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Bii0ACgkQAVBC80lX
0GzXMAf6A7elp/esZdF7VMhsafrLPvwewf6DMNS44LE5XsFccb7iE66xX0LMHDJH
raBX+b5GoGW5Y2KdKwPb7LhTt4t0ekF5KBSNyh8BI9B+bfZnHTHo/zxHOkapGqMY
fCz4w7R+sDcLigA+MwktdxVtsG+85U0rqaEWH5buekogJgiwGsLYuBZL4d3ATm1b
NRTcgqX2hzMt2KO7z0bTi0Ge72mIu3v9ROx8pjo9Fi7ccdlbfu+rZA3FK1xeDav2
/am5BVTn/z0iJzZuk2zI2VNzDDusXep/rcCyMzuuRxZZGfPtEJQHUFe1Szpj4CTi
nrKJqqiOqnniV3Mvaij7X11ooguOcQ==
=WGf1
-----END PGP SIGNATURE-----

--Sig_/4/8LVUud4hp=M6BeY9_/rU_--
