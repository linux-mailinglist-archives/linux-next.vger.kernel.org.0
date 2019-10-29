Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4E64E8035
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 07:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732446AbfJ2GXz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 02:23:55 -0400
Received: from ozlabs.org ([203.11.71.1]:46147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbfJ2GXz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Oct 2019 02:23:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 472M3r2QhFz9sCJ;
        Tue, 29 Oct 2019 17:23:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572330232;
        bh=bQmP0oYqm2JUAMrasr7tFm8e6N9YuOuUSSSj0U6bU+s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u8h7MBtNEDnobpNOgy8R7afVdFefRXNHPN5DQUvg6kSSokUUfFlOQaQOIUJIMcVEG
         w4eQpAn+0z6HnxJeBG2+jg9SMhCBCce6oPiMTLnO906PB3AgSAOmJdpoZY5EU/GUKH
         rNjDKZcOt/9t7QpUy06f6LAOBQVQ4mE5oc+r0sseqwI/zbRcuRSZo4+QsNPsHUEh4+
         tXCTt8ZSXuzdb5NdaNDY9gQr7l1OUF2Duy6phCieJ0Xp1sej2dz+l4Neoe3H1Yxosc
         sUsT2kglrkT/nyiAYKrnceMXKEQRw32zN9hMzjnK+kKy96AZ5k3T0fqlQfkvOHJb/h
         BYIaWP1/1pJqw==
Date:   Tue, 29 Oct 2019 17:23:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <20191029172351.40eae30d@canb.auug.org.au>
In-Reply-To: <20191029055605.GA16630@lst.de>
References: <20191029101151.54807d2f@canb.auug.org.au>
        <20191028231806.GA15222@magnolia>
        <20191029055605.GA16630@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I5_hVUJdNYLMqGeIgGr7i3W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I5_hVUJdNYLMqGeIgGr7i3W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Tue, 29 Oct 2019 06:56:05 +0100 Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Oct 28, 2019 at 04:18:06PM -0700, Darrick J. Wong wrote:
> > On Tue, Oct 29, 2019 at 10:11:51AM +1100, Stephen Rothwell wrote: =20
> > > Hi all,
> > >=20
> > > After merging the xfs tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this: =20
> >=20
> > <groan> Yeah, that's the same thing reported by the kbuild robot an hour
> > ago.  FWIW I pushed a fixed branch but I guess it's too late for today,
> > oh well....
> >=20
> > ...the root cause of course was the stray '}' in one of the commits,
> > that I didn't catch because compat ioctls are hard. :( =20
>=20
> Weird.  My usual builds have compat ioclts enabled, and I never got
> any report like this.

It only fails for !(defined(CONFIG_IA64) || defined(CONFIG_X86_64))
I reported it failing in my powerpc build.

--=20
Cheers,
Stephen Rothwell

--Sig_/I5_hVUJdNYLMqGeIgGr7i3W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl232vcACgkQAVBC80lX
0Gy6vgf2NKHgDYG08pgsFDRGKcq4sXaNS0WnFvm8LFkOxrVNKNNzaKSN+MhnBe5l
EdZf57JGLsNhI9JGxvLb7wUussnA3AV9Lnoop9jcrxlOHdkv7R/qUfFgUiBxiR+C
an6qtYiMiJXPsehKUMhv00bOST8gKzC3Aj3kRfxWEXpSdvtr58VxnhoKsjBchO+K
15gHj9fJjRtJ/XA/4TErK03VWJ3VvGGZUXzqnFx0FIsMLZIIFZk5idXhHcHBKwKr
nKdXy1aEWD9ChLkNa1MbXXUase30oefW6K0WMl10ts38RQ2zvfbEXLh8ZPxR3HZv
PBqP6f6iryHnM2ZhWbqNO8xs/Pqy
=RdZB
-----END PGP SIGNATURE-----

--Sig_/I5_hVUJdNYLMqGeIgGr7i3W--
