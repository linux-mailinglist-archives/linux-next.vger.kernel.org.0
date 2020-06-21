Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22897202CF1
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 23:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbgFUV1M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 17:27:12 -0400
Received: from ozlabs.org ([203.11.71.1]:53873 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgFUV1M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Jun 2020 17:27:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qlxB4w3Dz9sRN;
        Mon, 22 Jun 2020 07:27:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592774830;
        bh=3XD2MhlP1mkKmfonTzi0O/6MbdfZB5AxA0lj2BsC+7k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tIjvHkAfQCXaernYiCaljpIb2QTPW/C5sumSNwAguOynGopbsoBiWtmaqPvlheMFR
         LWLdJRJ2WeQQg6tD2U8l5nkL8NX6/PCcHa1/w7qa4DI01wlPSYBOjA7B6lhGPud5eX
         bCjHbXlq3KTza/b+qKm1qdnkfRG0z6CWQrVKRRnQm3AKddRuzZTbaMQqWVz2kimsWJ
         wPS1bffb0wEtK6lspbxa0IILzJXm8EnLsTPiErQ0VfWpwM3Bb3VH8+cgbNyiZTVc/Z
         xRYoyl/83KRYG9F8j4zoke0Z0Bx6mRJLWyf1hre3eWqxAu+NXaKEXu+yZvWh8x6oqm
         zqOdRoD5UIqtg==
Date:   Mon, 22 Jun 2020 07:27:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: please add for-next/seccomp
Message-ID: <20200622072708.14742b70@canb.auug.org.au>
In-Reply-To: <202006181357.5664DBCD4D@keescook>
References: <202006181357.5664DBCD4D@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tplnXB9NEiVe0orua_WsR4E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tplnXB9NEiVe0orua_WsR4E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Thu, 18 Jun 2020 14:00:44 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> Can you please add my "for-next/seccomp" tree to linux-next? I've been
> including it in the already added "for-next/kspp" tree, but I'd rather
> have it be its own tree for linux-next, as it is ultimately its own topic.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=3Df=
or-next/seccomp

I have added

git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git branch for-nex=
t/seccomp

from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/tplnXB9NEiVe0orua_WsR4E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7v0KwACgkQAVBC80lX
0GxXowf/WybiFgz22Ty3x/EeQEHvfAKbEnsxRRvZwSZev8S00UrliuI2s/6b4V4Y
kIAcAZVYa57dbwz1uuPBglKBFlF8y6uTlSZLOeDgg6cFnlPsAaEfm/HYVmMcEb45
qKWwR12ZgWjKb1voRhZySoGGVT9S8EOjS1g7hEMfP/AlqIwH2QSuvtuVsaPgiDoK
OG7C97vvZWxcKx8iIetn+HoWFocrnUtx8J+uuttqRBhHD3ok+gcJ0o5VxmSTK8FV
hWZClGb5S7ShAfKxx471KQ1D4//Uy9rxP/WolqeU9vaUU7VaoBOGmbjOCv/1b1Eo
9b6Kol9rMQAUvegz/lDXTtg1cHsskg==
=XwmM
-----END PGP SIGNATURE-----

--Sig_/tplnXB9NEiVe0orua_WsR4E--
