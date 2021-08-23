Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA203F5398
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 01:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbhHWXWf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 19:22:35 -0400
Received: from ozlabs.org ([203.11.71.1]:47553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233093AbhHWXWe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 19:22:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtpCs65Dpz9sW8;
        Tue, 24 Aug 2021 09:21:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629760906;
        bh=b0ZxJuwzSUSBcceBjtdBJjO4eyuakOm7MJUOTiuTHLQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ha7yOGiyl+YIm018VL3Cj0FLpQWyqjqrykNErgA3boJOcicgl3KXJUKpsn8Nnd724
         BaQJN/p6VBYxOApjDv3kvrQZlB4xHhNxV4tiji9keSS1WVJqgwWmGYKBTC8UweD2Rg
         Mx/SBkVwXqAq2EJqcCobi71q0Z6k7WH8BaJfZC9zqx+BvWhdKn51FBfFslJRSq7oZI
         B+VJnzDmdo2wMUrdcnfKV1YzypuIb2ifUxId7tGHaTQXHX1XX1m6tNMoVTbTrmQnjg
         2ImuUh24/HRUCPsQ9sF29zPOn0P0bgzEN4AoQVRVhGnpLx7lZDqoarWHDIVGtjgKpc
         Vo+F0AYE2L6gA==
Date:   Tue, 24 Aug 2021 09:21:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210824092110.3987fde9@elm.ozlabs.ibm.com>
In-Reply-To: <87a6l8p7kd.fsf@meer.lwn.net>
References: <20210823195540.4d7363ed@canb.auug.org.au>
        <20210823204803.7cb76778@canb.auug.org.au>
        <87a6l8p7kd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IaClMUsqOS7XXChrmTxxKyG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IaClMUsqOS7XXChrmTxxKyG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jona,

On Mon, 23 Aug 2021 08:19:30 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > Hi all,
> >
> > [cc'ing Jon in case he can fix the sphix hang - or knows anything about=
 it] =20
>=20
> That's new to me.  Which version of sphinx?

3.4.3-2, its a Debian version.

--=20
Cheers,
Stephen Rothwell

--Sig_/IaClMUsqOS7XXChrmTxxKyG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkLYgACgkQAVBC80lX
0GyRKAf+IhpB8PEvLXX2i9jJFy5IApkuwZ9VzvkhM6zFrwuCGRXuOtAM2sazlN4r
5H05Re09Swyee032TkLJ16z3Zuy2vaSslA6tYabtRhjGkqUAHMk7LjZEUk9DYOSR
l3ktyWJEWgiFY2nKJO0LZzAayeA8mVve8fsW/FASL51KCczxn5t9qOTK0Nlz2fUN
SSa7rw7oDGnBgx+n/51qyRYX38HYXP4x9G9wSFeoKCBNRrdENb/ZjOh+co3SFk/R
MG8fUyJiD79q+GNi4pJI1jk+zLmxm/8ot6ARwKqSBJpSHLf5Afv7id7pRg/a25UV
/NTdLdw4HWfBGJ6sPzebwH0QwrTkOQ==
=vfmb
-----END PGP SIGNATURE-----

--Sig_/IaClMUsqOS7XXChrmTxxKyG--
