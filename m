Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060B613D13B
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 01:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgAPAoq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 19:44:46 -0500
Received: from ozlabs.org ([203.11.71.1]:59639 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729112AbgAPAoq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 19:44:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ylp35zL9z9sR0;
        Thu, 16 Jan 2020 11:44:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579135484;
        bh=dUlakAG2oj4Ne+CetOc/NYSD+LSGl7+j4iia8eJ4MOo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IF71lh7O4S/stbdQujOr2Kq6WhyrFVf9oKfL70IZyw0MVpiMzR05GCoC9VQATxJh6
         92834NwjRW3VB/KbHeLfnzxXueCUKcPtbk9yjfoZ7HD1RSLbqHxLuBP4dH9BB7lHeE
         WifBi9eTyCcm56WvdB2VXrQQKYpcF0WJg/NhPZDeALKjvEsbMwyvM96HbsiQqqHs6L
         CHwlz3tbe439hrsb7OJktaiL81pzPL2Vh3uPQ84m9YaKSvR6EEz7rwpwIOshXBcB05
         ya7iGPgrHgghzr68ysUblNxiJfx0u+9wGzL74sBRjQEEn2GcafzSIG3qV46cm3BRqd
         XKhKGIZLJVevg==
Date:   Thu, 16 Jan 2020 11:44:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     linux-next <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: New zonefs file system
Message-ID: <20200116114441.5e8a899b@canb.auug.org.au>
In-Reply-To: <BYAPR04MB5816E1F6B9479874B6B78A37E7370@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <BYAPR04MB5816E1F6B9479874B6B78A37E7370@BYAPR04MB5816.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eJ55Jpm0KVwj3IiMEZldAqJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eJ55Jpm0KVwj3IiMEZldAqJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Damien,

On Wed, 15 Jan 2020 23:21:49 +0000 Damien Le Moal <Damien.LeMoal@wdc.com> w=
rote:
>
> Would it be possible to have zonefs being picked-up for inclusion with
> linux-next ? This is per Linus instructions as a condition for getting
> zonefs initial pull request accepted. The code is now in good shape and
> reviewed by several people.
>=20
> The tree is here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git
>=20
> I prepared a for-next branch based off rc5.
>=20
> Please let me know if there are additional things I need to do for
> getting zonefs into linux-next, e.g. tags ?

I will add it from today.  It all looks good to me.

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

--Sig_/eJ55Jpm0KVwj3IiMEZldAqJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fsfkACgkQAVBC80lX
0GyZyAf+L7HBwSSCapQ6Qycce+ZSZuVM8bY6naPFbvJ596F/DDcAONt555JeA7kd
984pxyrVRfOE/+udvJsaHEAsHXxXS/Sq0ddIYH+gawY4MKPLFOgbi5QIt7Eu11oC
bjwCQ+eGOH8JVErw6n8bEzIkDXJtRqZoialVUnSb3/aAPLJE1h16qh1FYzrDRaS7
GuI8xrz55xKYuF4UTB1B5Z/Nx3pcvfe8Zdoqgv3DmGkX2Ry4kj+QsMxddux+SWT6
7e+YJOCLABlFQKjRfHoGaU6/2d+8PpDdbwqbfRJBWaVjxdLGbKcpvk4LRT3RbMb7
QQT+1MBwOpuAVqvLHJFomDqL8oXALw==
=bQkf
-----END PGP SIGNATURE-----

--Sig_/eJ55Jpm0KVwj3IiMEZldAqJ--
