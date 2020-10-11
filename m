Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD5E28AAC2
	for <lists+linux-next@lfdr.de>; Sun, 11 Oct 2020 23:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgJKVh0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Oct 2020 17:37:26 -0400
Received: from ozlabs.org ([203.11.71.1]:48485 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729480AbgJKVh0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Oct 2020 17:37:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8ZsJ6hbWz9sT6;
        Mon, 12 Oct 2020 08:37:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602452245;
        bh=qbwvWuTmqCKD8ow5KqpxhjwIeXrODFF+9lyqECmnIGY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VAYxsOy9Jx5wlsVFNoUM3pR1Y7erWuvpF6OCLomhd0r8TGFCcpr975OQnlQUGKH68
         +o9B3tts7pfIgXZn9tl7Pqy/g8ZBFGUHXu2KRWGJVwQayU9XWL6ecvc5kuhY0RXY99
         4EX1TfeZv+uFzq+O8ABR71VX/4obC8v7HwAVQZGGvVx8LKrl6z6mJsQRhRDZP1bO9J
         hM0QOgFX6Aawl4ViOvZJd5+xc0yM0GQ6GR6B1f7XlNEC9S2v0/+I6wUy+aOMnI1bNg
         XQ7258jcW1ztiSDcXOqjzLh/uoX+E5vZeHw0q5T1/2LX3zEwddMO3qsGXdH5QYAYPh
         /n3v60aHnr9zw==
Date:   Mon, 12 Oct 2020 08:37:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Request to add counters branch to linux-next
Message-ID: <20201012083724.342ec45f@canb.auug.org.au>
In-Reply-To: <ed25ab31-0e76-233c-34de-4e227c0b5801@linuxfoundation.org>
References: <ed25ab31-0e76-233c-34de-4e227c0b5801@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pa4d.m9lSBJydGcKKjYhHzj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pa4d.m9lSBJydGcKKjYhHzj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Fri, 9 Oct 2020 18:44:15 -0600 Shuah Khan <skhan@linuxfoundation.org> wr=
ote:
>
> Please add counters branch to linux-next
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=3D=
counters

Added from today.

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

--Sig_/pa4d.m9lSBJydGcKKjYhHzj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+DexQACgkQAVBC80lX
0Gx5vQf/TQsU/tjdYyzFNQzQohjL9bbux52fvc0Y1rAsjY61VvRdtzNwr7nY/JII
WFLfAoqFjeqDx4n7nFmJwukiPQsQEZM106EXxIufZIAQrzONrFCOfJF7VXqZNeNz
VbLfcClDE3mkSkwX9H4BgKv6iKyhtxYZUbJCfv45holGqGjYXKN2w4oxQr5fMSmc
qtwCK4fqb65ZzsL0JPtBtEvdKHpxJ/gO5UylEHJK243jJZCZEBF+nbQTOEvLdoGL
OuOrkpsfHu1Sjcy/SXOhUQYRHiLNDBnk1mxOSq6aXCTXAbUADESukG3SqoNPQOGE
Wxpg3o7q9lqHGQmlQTLfHtfUUrpqCA==
=4WkL
-----END PGP SIGNATURE-----

--Sig_/pa4d.m9lSBJydGcKKjYhHzj--
