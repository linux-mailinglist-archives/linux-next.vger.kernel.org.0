Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBFB723D437
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 01:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgHEXkM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 19:40:12 -0400
Received: from ozlabs.org ([203.11.71.1]:43031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgHEXkJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Aug 2020 19:40:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMSlp0VCMz9sR4;
        Thu,  6 Aug 2020 09:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596670808;
        bh=TdkG1vT9yZEKFN0XCtbZ+7HMVEJsNm9Xzz0nNd1K2eM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qExdT6B7jJf7qQAVSnc05Zqb9z8kkG8nLZI+XL78nxLH9EgiWPOD7X8G1Z4VfkS/s
         9PaxYhEQa/d1lTy6TIc2jMk46g52crWeDa54/4vulMUITBfl19V703/3vMGZP+MTHY
         IZzfnoOObW/iZo6NAtjozmUqzob2rMkoxGgtOQjaRO+FPzddD5rx0O4g1EoiiJw9B7
         m0w6MD/TgSKz5O8MLh6n8gd19tueFxA0A1jrOqnEYfoqIZeJFwTcL+7uI8e8Mp/Gnm
         sapuNnVmqfxsmKRFtyhskq330MlSwHQACVq/pWWOAFfpZZjZf8EkqivZdrzXU5cHUl
         gpTYje0b+FaLA==
Date:   Thu, 6 Aug 2020 09:40:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alastair D'Silva <alastair@d-silva.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the powerpc
 tree
Message-ID: <20200806094005.29296b53@canb.auug.org.au>
In-Reply-To: <20200803165546.6ab5ab6f@canb.auug.org.au>
References: <20200803165546.6ab5ab6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YpRe1X4DL6Z4XGZOpqE8aXS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YpRe1X4DL6Z4XGZOpqE8aXS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Aug 2020 16:55:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>=20
>   drivers/misc/ocxl/config.c
>=20
> between commit:
>=20
>   3591538a31af ("ocxl: Address kernel doc errors & warnings")
>=20
> from the powerpc tree and commit:
>=20
>   28fc491e9be6 ("misc: ocxl: config: Provide correct formatting to functi=
on headers")
>=20
> from the char-misc tree.
>=20
> I fixed it up (as it was just differences in comments, I just arbitrarily
> chose the latter version) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YpRe1X4DL6Z4XGZOpqE8aXS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rQ1UACgkQAVBC80lX
0GxKcAgAh9MsxkEzKH36US4RjkNvMuK3i1Mbivu0awyiu/pTkhV3wXb3PX+4cAX+
odIcjjAMxHtTHiN3OJqmCtywz9vzKdtjKo7d7SLetB7bcNQqgaOtpk8ZMtmOLxOJ
QF6q7rvcFrWGY9OPi2Y+GGLIHhyWr9z+IeC5SAJ1fPnVTn9HYGbSs2cutd2a5K9y
Qm7xcasc5CiYAEdhRmfwllSoBXx0Huq3k8D9ltTtRZLxyQkWh0nT32p6me2sHyOv
yQwnqTx+3CpEujw2I8d5OxTJgbXjdMkSsHds6G+okXBpj3n2xafRiN7NFfltXFjF
RdiGuazkFVmJ9WSwgTCF4cTGE8OftQ==
=Yve7
-----END PGP SIGNATURE-----

--Sig_/YpRe1X4DL6Z4XGZOpqE8aXS--
