Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AFF1CF6AC
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 16:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgELOOQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 10:14:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60201 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729756AbgELOOQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 10:14:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49M0D64dCtz9sSg;
        Wed, 13 May 2020 00:14:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589292854;
        bh=1cWnbL5AnU1SFC0c6TK6Gmn0CFWs8l55Kduttq/IPBc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=H6BELK16xMJ2pPpr+UvXaiBbKGmOhUn7bxK76Gg57Dkar9kEWyLwnyW/P1b2MQAqh
         yNkxrWhpzf3ryB5QqKNp0h3xLHb0PT9A1xbi79LQ6HQCjJ04doU9MZH/dyrTx7v729
         FOJsspgpTqgCvUud/mLNhM0leHidjocdVxqTrssRI4ERTOVlYi+0lf3nJbE+TPt72w
         /VEVe+wgNKvMDeHJ020KnVEOtDX+uMu7hxmm5h5UhyHZh6D2G8Z4nLBhDdYVvmGnyw
         kOOkvLnF9QJiOwym262pZMHjGHCH1SXjaejvx2Q4Zd8j0DdU1ZDnhk2VapNsF0V0uA
         rudi+ySeklhZQ==
Date:   Wed, 13 May 2020 00:14:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the fsinfo tree
Message-ID: <20200513001412.12598111@canb.auug.org.au>
In-Reply-To: <CAK7LNAQ-=A0nDZK0FTzgJ6oJ-VbV33F1rVjvBAWgybSsUXaPVA@mail.gmail.com>
References: <20200512195712.690f02bb@canb.auug.org.au>
        <CAK7LNAQ-=A0nDZK0FTzgJ6oJ-VbV33F1rVjvBAWgybSsUXaPVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_l.XWYgKS2wyJTKroYQkitq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_l.XWYgKS2wyJTKroYQkitq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Tue, 12 May 2020 23:00:13 +0900 Masahiro Yamada <masahiroy@kernel.org> w=
rote:
>
> I also failed to build it, but the error message
> was different.
>=20
> The following worked for me at least.
> (Ubuntu 20.04).
>=20
> diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
> index 97e54c8be358..539fb3a56af3 100644
> --- a/samples/vfs/Makefile
> +++ b/samples/vfs/Makefile
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -userprogs :=3D test-fsmount test-mntinfo test-statx
> +userprogs :=3D test-fsinfo test-fsmount test-mntinfo test-statx
>  always-y :=3D $(userprogs)
>=20
>  userccflags +=3D -I usr/include
>=20
> -test-fsinfo-userldflags +=3D -static -lm
> +test-fsinfo-userldflags :=3D -static
> +test-fsinfo-userldlibs :=3D -lm

Thanks, I will change the merge resolution to that.
--=20
Cheers,
Stephen Rothwell

--Sig_/_l.XWYgKS2wyJTKroYQkitq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66rzQACgkQAVBC80lX
0GzpAwf8CjORtl+idsPwU7zqDqXLTgf4EKM4io4mY2wFnrtp3L7Xvg8ZqI5K2HkK
J3WUhxRvEwWHnSjBf1UW5rM45oNBsBzA848Ju8Ei0kv/GM1jWtsYrAvK0vPh8gI9
zo6M/ACAq+rDvyb8ZCSherYUkbtgwV9jBhNp2xb3iTNQkto1WiEc3NcOPI9ojysd
a+01MC2QeYLhmVbcMQwXC98D9iGgtwWEjJtCGSAKR9+I/iIFJvoORlG77azABIZv
EHWtgosIsp4OhmWujsFlpJHm+cd9TL0A+imgu+wazPpLrdNIBUuAes5141LOXKbd
aZAwLQk+kQtExSy8z1dkfi50hDoDHg==
=5fez
-----END PGP SIGNATURE-----

--Sig_/_l.XWYgKS2wyJTKroYQkitq--
