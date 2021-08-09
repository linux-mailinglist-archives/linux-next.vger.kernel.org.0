Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72B53E412C
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 09:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbhHIHzc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 03:55:32 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:38301 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbhHIHzc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 03:55:32 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4GjpK46W8xzyXZ;
        Mon,  9 Aug 2021 17:55:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
        s=201702; t=1628495706;
        bh=Ax7yStg3wWAtuh2tZBdEAtQJchvZ6pdPo94W58ORdIY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FWPgSATxjInAWqoMSEq7J5Jj/y64wp2eAHlw64ch+LJiz1l5aejqnAT566lNvjpPR
         xROf5KSJJb8ygt0lmDlHPN8/SwusqC2FS1jfnoKsj3s56D73X/MO+WzmIR4axIOi2i
         e3oJoobMFXYg+Ir7vNwLyHLHDXBILburbDN3uGI5CoULKDuq6EOvL73HZTx/K7pLuj
         dZ+fu/Ac4G6uhCKFIwAC9gFPA2GvayEYeY7hllXbsd5NSyik5gmnDt0rppw8bgMwIq
         FJP1GZHrQFLxQ5nzCxh2cp9RGT/48IYDTYi962zV4XkuvUuBowd1aFg0CdOa/VzHXG
         VdYB9nxAKWRew==
Date:   Mon, 9 Aug 2021 17:55:02 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the net-next
 tree
Message-ID: <20210809175502.226ce4cd@elm.ozlabs.ibm.com>
In-Reply-To: <CAK8P3a0HWO1tPwCkhasRE1iXt+-rC72nAzsUuO6jb4XasGAAPg@mail.gmail.com>
References: <20210802233339.25285-1-broonie@kernel.org>
        <CAA=Fs0k95E3FN-9rwzSQcK4JmejHDKBbvk-yhRynJBTbqBNVxQ@mail.gmail.com>
        <CAK8P3a0HWO1tPwCkhasRE1iXt+-rC72nAzsUuO6jb4XasGAAPg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2.RNl=5PYs033Lo8A0nkNzX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2.RNl=5PYs033Lo8A0nkNzX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 3 Aug 2021 11:23:29 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Aug 3, 2021 at 10:57 AM Phillip Potter <phil@philpotter.co.uk> wr=
ote:
> > On Tue, 3 Aug 2021 at 00:33, Mark Brown <broonie@kernel.org> wrote:
> >
> > Thank you for your e-mail - not sure what is going on here as the
> > r8188eu files are totally new - the net-next commit is touching files
> > from a different directory (rtl8188eu) so perhaps it is getting
> > confused and considering it a rename or similar? Regardless, all
> > commits for r8188eu subdirectory should come from staging, as it is a
> > different driver. =20
>=20
> In net-next, the .ndo_do_ioctl() callback behaves differently, as it no
> longer gets called from user space. If you have any
> SIOCDEVPRIVATE ioctls in the driver, those need to be
> moved over to the new .ndo_siocdevprivate callback, while any
> nonstandard ioctl commands outside of that range can just be
> removed.

So, can that be done in the staging tree as it is, or does Greg need to
merge (part of) the net-next tree?  Or will someone just supply me with
a reasonable merge resolution patch?  Or does Greg reset the staging
tree to 5c872e1d2595 and try again next time?  Or similar for Dave
(revert Arnd's work)?

Currently it is a mess in linux-next and probably will not work even
though it does build.

--=20
Cheers,
Stephen Rothwell

--Sig_/2.RNl=5PYs033Lo8A0nkNzX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEQ31YACgkQAVBC80lX
0GxbZwf/WZEoB2hfI0N7PW8yTIZDQh2G06KzRBebc6GQGX5hRJCReF7XwXVfs8sD
sKoL231BaSOQKn1+HJ5b6oqwyiU1pLUEsQ2qIryQ3Bh3ZMBs+/AyRArvztU0id8D
UZ1jqcnd/g29OhmuCzsZR2TfvvW1A1EiQOfHU7hnDyOnmLVIcFmREWyMLDuiVhhK
Pkg3+LMtcqZnGksqzVv1M5VYzGjMVgMz/mT7Lyuqik/wg8N6O+E1n79K+LA3JATh
823R6tYX/uhH2JILrztYQz+YkqM5uWa0kbfR01HWbqeaAPcnmPQ72gM7gHX6yDZd
QLSWIGqPB41OenIkYbTf4Q41k31/hA==
=MvfM
-----END PGP SIGNATURE-----

--Sig_/2.RNl=5PYs033Lo8A0nkNzX--
