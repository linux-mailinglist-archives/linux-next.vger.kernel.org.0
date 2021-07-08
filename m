Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B8A3C1B21
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 23:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhGHVoZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jul 2021 17:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhGHVoY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jul 2021 17:44:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D665C061574;
        Thu,  8 Jul 2021 14:41:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GLV9c2Hmpz9s5R;
        Fri,  9 Jul 2021 07:41:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625780500;
        bh=iMjLue84MtL4u1QyHyLXTcIHUE91RKo/s7Pdxsd3pKc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UW7Nw0zSCCbJbgbRYE7KIX3pfSYgx9xu6pvWdsqwGWFdIbzQfZMys0+NbJWOqKbxr
         sCYnWLIo7ict0jUUc2jzgJUNJVq+uybGRSz/Sc9E67VdrnQvjkK8HGgre7f1AtYSuJ
         MKQtcgNfcTniI+vCj3sAVglGxrvAHQEQYqoTorEzLpJZueP/A3hv7Ha4vTJ6QSfilf
         u5aiij7W2Zp0sID4eYXPJsqQeV7yInfVoSyBL0IOgUslLLHwAw77z5HrjgWVlwGxxq
         Ef6nIqMHjDsL3oQeJjJaWro+ZA/DcBkbibkyt3Rkdc1YtxWMQKP5JUS39UnRrsRtLi
         5QACbPMAqr1WA==
Date:   Fri, 9 Jul 2021 07:41:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the irqchip tree
Message-ID: <20210709074139.6e5a5689@canb.auug.org.au>
In-Reply-To: <87fswo3gxq.wl-maz@kernel.org>
References: <20210615210143.2e00d851@canb.auug.org.au>
        <20210708121855.69b5a5f8@canb.auug.org.au>
        <87im1l2plp.wl-maz@kernel.org>
        <20210708225037.4980f159@canb.auug.org.au>
        <87fswo3gxq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oT.rqm2DlpQ5BoDyA9CsDxu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oT.rqm2DlpQ5BoDyA9CsDxu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Thu, 08 Jul 2021 17:32:01 +0100 Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 08 Jul 2021 13:50:37 +0100,
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >=20
> > On Thu, 08 Jul 2021 09:10:10 +0100 Marc Zyngier <maz@kernel.org> wrote:=
 =20
> > >
> > > Hmmm... I've had a fix for this sitting in irqchip-fixes for some
> > > time. But I now realise that this branch is not included in -next
> > > while tip tracks it.
> > >=20
> > > Any chance you could add [1] to -next in the future?
> > >=20
> > >=20
> > > [1] git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it irq/irqchip-fixes =20
> >=20
> > So I assume this a branch of bug fixes for the current release, right? =
=20
>=20
> Yes, that's exactly what this is.
>=20
> > In which case I will add it tomorrow. =20

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

--=20
Cheers,
Stephen Rothwell

--Sig_/oT.rqm2DlpQ5BoDyA9CsDxu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDncRMACgkQAVBC80lX
0GxFWQgAh2+VPDc1iUycA8NbZO9BAToojcD8dS0NqMNEam6q7OynIU6TEA8G25mB
4dnzzyb4SJLAcHdUim087vCf5FTzCt3+m1hAC8Wt/igzGzbboBqVddOZfkX64mNI
4P4tL/IHPEQlAAbtOWJZD0CVsAvChf/fO/HL05zF8+0zDJTCvpJhxRaaBemvJBNn
suMr1z1+p4kQqBIb6U9JjbY2wHIqXfkvWhc8ZJM4Im5KafdVOmp/90zd8KONvUlB
at/EvpyUm9WDw2ZS/oPWWYyybDGm0+aTp/Tp+Mfm/pcZfjro6BtL6x7/b+/O2Gec
KElrTRL13B6xqoS3dezboFDXLz5jbw==
=PMsz
-----END PGP SIGNATURE-----

--Sig_/oT.rqm2DlpQ5BoDyA9CsDxu--
