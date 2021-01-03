Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F53B2E8E66
	for <lists+linux-next@lfdr.de>; Sun,  3 Jan 2021 22:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbhACVVH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 Jan 2021 16:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbhACVVH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2021 16:21:07 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD9AC061573;
        Sun,  3 Jan 2021 13:20:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8BVt2MXSz9sVt;
        Mon,  4 Jan 2021 08:20:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609708823;
        bh=KlM+36PQz4NTdWguPvkM0+JtxdGWYSUUBKeTjm23H4c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r5lSIT7n+y8qhd/V7va4brj1cjqPmrt9gvaam6+9c01kXZXTMqSA6iaLdUqsTAiDg
         BO4VPGOB5z45vW3p82+UMbKbBaMb0tt9/PwlgaMBptkQLBjgWCnOofTsYKTD++1kQU
         CCFC5IaNBBJyatR8oy1N80FaSkHhYKrwdgB6+IYztixbBhEy9te9kV7QehbQU+/Is8
         Uitc4W0xnJdr1HDXVlGGAB9VRVrm0NX86A7je7o2wdAmnviN88edjl4iup1Kdm1a4R
         gD3UTrefKIoEoLlrpSe7pBFSBni5vNRu8TwM6voat6MaaiJzO77GElfTDoKTaMaILY
         vwddszffUyzeA==
Date:   Mon, 4 Jan 2021 08:20:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error while fetching the i3c-fixes tree
Message-ID: <20210104082020.1590f366@canb.auug.org.au>
In-Reply-To: <20210103142343.GC382945@piout.net>
References: <20210103223217.478bc238@canb.auug.org.au>
        <20210103151855.5d25ee80@collabora.com>
        <20210103142343.GC382945@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/65_bztiW=H=TOao_aCGM0Y.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/65_bztiW=H=TOao_aCGM0Y.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 3 Jan 2021 15:23:43 +0100 Alexandre Belloni <alexandre.belloni@boot=
lin.com> wrote:
>
> On 03/01/2021 15:18:55+0100, Boris Brezillon wrote:
> > +Alexandre, the new I3C maintainer. You should probably flag him as the
> > person to contact if you have problem with the I3C tree in the future.
> >=20
> > On Sun, 3 Jan 2021 22:32:17 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >  =20
> > > Fetching the i3c-fixes tree
> > > (git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git#master)
> > > produces this error:
> > >=20
> > > fatal: couldn't find remote ref refs/heads/master
> > >=20
> > > Should I maybe use the i3c/fixes branch instead? =20
> >=20
> > Oops, I thought you were using that branch already. I guess I never
> > noticed because I didn't use the fixes branch much and kept the master
> > one around.
>=20
> Yes, please use the i3c/fixes branch. I did indeed remove the master
> branch as this was not used anyway.

Updated branch and contact from today.

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

--Sig_/65_bztiW=H=TOao_aCGM0Y.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/yNRQACgkQAVBC80lX
0Gw5Wgf8CNQiLSei3Wn5IPz+SMcDCm+cEp2wQErPW48n5YOf26F9NI+5j5xJ3ajC
1vkF3WgX1BL3+iEnm1DQ0C+HgeoXr9kg/kSZ/Lwb7lh/US5wi+SMLAzoQZ7m1kWK
9XYDoLxBt/Uv8cf77VdFSObat385vUy6UOo44E7GLyAZZLApIpHiMxaQHbHMgvAW
89phzon8B1hkXarw0VTMjBsVzD8s6mQl+ARQQhVQZBEe6q7WaVCr9sTO3NeczE4E
UbRCnX7ZpGFTJzllQv9KcDrBuCVscV7GUqBaVy3hCqvGdfOiRgWyrLlcJo2KCJd5
ued5hUzMJ0rqa36BiX4ToQbB2/1egQ==
=aeJc
-----END PGP SIGNATURE-----

--Sig_/65_bztiW=H=TOao_aCGM0Y.--
