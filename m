Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF5521697A
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 11:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgGGJru (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 05:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbgGGJrt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 05:47:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C742C061755;
        Tue,  7 Jul 2020 02:47:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1Hfp3KR1z9sDX;
        Tue,  7 Jul 2020 19:47:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594115266;
        bh=YKsHVWxqBB8l5sJnD398yJiZ8PFMtfVazI/na/4CzjU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=agDyytg74DH7zKhv2kmGzowyBcwZ0B3nD89ypnxODJf+QTbyyecneBfDxvTe0uZwZ
         QxhCiAk3c7U8eQXzw4bWBS6yprhxADDNj19XMnXf+uPTBO7Kq2HPCPvsUG2jB94u2c
         az7lJwVFFGFCrkn1dlEqB5Sq2asCneS8Skz7yiLhmlo1fUV+K5XdsVVGaKD3N8BHSM
         CbuRI0GxYZT5wrJKKaSjCsDFTEk06RlFDRGdFFW6AKNLypYdGo+Vv+XzFScAnH4JcA
         q4HzQK+xpG5p53QwBQQ5YdHNsxt9BROlP9HOTyQY/+AI8Y+jhUMqjJlZN3AMu3uLpJ
         YOn35w7s03BQQ==
Date:   Tue, 7 Jul 2020 19:47:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 generic-ioremap tree
Message-ID: <20200707194744.2b8380d0@canb.auug.org.au>
In-Reply-To: <20200707083917.GA26906@lst.de>
References: <20200707183035.56420aaa@canb.auug.org.au>
        <20200707083917.GA26906@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HQhoNQMQLKex=AWG3X0i3kF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HQhoNQMQLKex=AWG3X0i3kF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Tue, 7 Jul 2020 10:39:17 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jul 07, 2020 at 06:30:35PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Commit
> >=20
> >   2ee080ecf668 ("wip")
> >=20
> > is missing a Signed-off-by from its author and comitter.
> >=20
> > Not much of a commit message either :-) =20
>=20
> This commit should have never made it into the for-next tree, sorry.
> Please drop it if you can - I'll fix it up ASAP.

No worries, I often fetch trees after finishing linux-next for the
day (to save time the next day), so the tree I saw will not be used
until tomorrow (plenty of time to be fixed up).

--=20
Cheers,
Stephen Rothwell

--Sig_/HQhoNQMQLKex=AWG3X0i3kF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ERMAACgkQAVBC80lX
0Gxtsgf/YYYLXeD7A+LcX+t09gNU+6J2a9+gQeuMqYeBwXwCnVF2S1zZpHQMkzeH
hkFG+nORbo70GlLViGOqP8t9f7EZxUfdN+rczYi6N9tupn4MVU11PKM1HDKYy6pz
KxXbwy+UDWdaax/pEwBlPdjLNJhAbi40viDGfm1x3p5t5MinaJ8LDM07agkyz9Fr
4w/WiktGOqOdb0Koqt4wHpwZPP+Gfbz6++I+/Uw003fx/w0J4aRhBE4Dwj18q1Uj
XgaSIN9HGzbbXQKdS+icYcwg4ifFq/l7Rc+tQSMJY+SPDHnEOHDGC7Yh84uFNYWd
EY3MrBl5m96AshM+M99Du7AiNY0Y/w==
=ZCJf
-----END PGP SIGNATURE-----

--Sig_/HQhoNQMQLKex=AWG3X0i3kF--
