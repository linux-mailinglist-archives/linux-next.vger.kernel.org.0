Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759A32DA1E5
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503067AbgLNUoz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502980AbgLNUoz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:44:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EF7C0613D3;
        Mon, 14 Dec 2020 12:44:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtfL6kwqz9sS8;
        Tue, 15 Dec 2020 07:44:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607978652;
        bh=ljhtdvCD/AIx7f6wVXxij9Zvl9nrP4BdyDGBE6oeE8E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SG5XVgadS6beI8SEUbBiAETScLh/fzOsl90/5OUbNSxfEYW0dpSKb+jkwUHi64q3S
         vZUHnF3xx0KDcIcuv7HjRt/CTw8LcJ6+v3bfmRX9AqMxrjXZX2SU7a49shCT86Jd88
         4ISHzlgK1UYfgKW15nvQbAL4ncLhxteFNZIU1i71xfCSnsDFFYwabx3c/2LsLemPut
         jRiZnpEz7vHGiMRHQGcmGQDfwCsIqp1XB/EAjJMTV0XDkFFKoUL+CMm5kxXVjHSxay
         t4JtDFX+B8kDMB/gBCxaFJ/U9KWBppOjgtnn1fR/etImjvqr/hSR9COiSyKf238dTS
         AQSYicXVuJHYg==
Date:   Tue, 15 Dec 2020 07:44:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Dominique Martinet <asmadeus@codewreck.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Message-ID: <20201215074409.0ae087ac@canb.auug.org.au>
In-Reply-To: <20201209203029.7f2a8db2@canb.auug.org.au>
References: <20201209203029.7f2a8db2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g=E7yPY1=zdZ7W=GHuA7yPE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g=E7yPY1=zdZ7W=GHuA7yPE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 9 Dec 2020 20:30:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the kbuild tree, today's linux-next build (x86_64
> modules_install) produced this warning:
>=20
> Warning: 'make modules_install' requires depmod. Please install it.
> This is probably in the kmod package.
>=20
> Introduced by commit
>=20
>   330029209513 ("kbuild: don't hardcode depmod path")
>=20
> Unfortunately for most of us (?), /sbin is not in our PATH ...

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/g=E7yPY1=zdZ7W=GHuA7yPE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XzpkACgkQAVBC80lX
0GxPtwgAk/UuDigJgEX8JBu+FaelEhkf9DLWM2nPxSKUValnUTAnXBCmH6vgq6yN
qnPUefCRHZnigXSFE2wd2e3Stk7EmZv0UWxV0CwlaENR7SQpwO7TgY+YC08Ses63
aaereNko+dBRWDHOiTT3HN2m0tzONqILgNPR/jRGYHO6KX0UV4MWvJwZSQ9gK8Mx
Ic5Do+ibhObb3zUe4J+Mlc8neh5pqaed1Ju1qb1yQFZ8DOpxrHagbHvFWrgDIH7C
HsDF3v04nsdPd5E/s9hnvwVbGQU70BUrUjIvTjGtFgaHRWKdkZd70BfAu/RSTupg
tonDNDAacVvcOpv9xVx5WMbsdhjHcw==
=LwRM
-----END PGP SIGNATURE-----

--Sig_/g=E7yPY1=zdZ7W=GHuA7yPE--
