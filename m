Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14BE22FBFD
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 00:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgG0WUC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 18:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgG0WUC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 18:20:02 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B493C061794;
        Mon, 27 Jul 2020 15:20:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFvPX3lYBz9sRN;
        Tue, 28 Jul 2020 08:20:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595888400;
        bh=2siZQ0R3xXUQX1M1uAe4gYn01t+fG41I4zXbILs0lys=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jg8rj+FWB9riRdeIfmv4Kv1YI1CNVF7GL534MuaBC//Y8GK2NLqnfPHegbzapRMx6
         HtfDjq30v9n2cxmXaV/6iGxsH5FMmt1l+HrkRJzv2tkQUjlaI+IxHRpHgc9jZou/XE
         pXRgxnbHnLiH4SXxMnMXQDB0ay/KIAoA/6VZIMceuTfcU4Uadv8hLmdQ6nYPsXo9eF
         5ZJFRfRIeD6+WH3bVGZR1WlXZ+QpVosrl13rD0aPwl+2rh+cfRy5+h4P3leSVahlcH
         zLlC0TUvG7mjabDw6aAcY/5Ge9QESy1nC1X5Orjpr5CdheH/y85bKn/zSvhcEivQZ1
         comrRRfk9/RQQ==
Date:   Tue, 28 Jul 2020 08:19:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the printk tree
Message-ID: <20200728081959.2df754d0@canb.auug.org.au>
In-Reply-To: <87tuxt3sjj.fsf@jogness.linutronix.de>
References: <20200727234612.3037c4a5@canb.auug.org.au>
        <87tuxt3sjj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U76SY5Wxb0hYCWqSA9BFyXc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/U76SY5Wxb0hYCWqSA9BFyXc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi John,

On Mon, 27 Jul 2020 17:13:44 +0206 John Ogness <john.ogness@linutronix.de> =
wrote:
>
> On 2020-07-27, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > In commit
> >
> >   96b917f8e9ec ("printk: ringbuffer: support dataless records")
> >
> > Fixes tag
> >
> >   Fixes: ("printk: use the lockless ringbuffer")
> >
> > has these problem(s):
> >
> >   - No SHA1 recognised
> >
> > Maybe you meant
> >
> > Fixes: 896fbe20b4e2 ("printk: use the lockless ringbuffer") =20
>=20
> Yes, sorry. I did not think linux-next SHA1 hashes were used in commit
> logs.

Well, it makes sense to use them if they are stable (i.e. the tree they
are in does not rebase) which, by this part of the cycle, I would
*hope* would be true (but sometimes isn't :-().

--=20
Cheers,
Stephen Rothwell

--Sig_/U76SY5Wxb0hYCWqSA9BFyXc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fUw8ACgkQAVBC80lX
0GywzwgAii8GIkcMNj7QU7Ws2basrTbqlUTkwCj12MGTty2yh6XWSQhkR9S4kWS5
FK6Rs7qxcPnJu+y6A75a3EoYk5JzflJXM0PiP2pW/hP7pPIpXzqRC8mHwjtdURN0
XAQ+wpvB1kadaONF2y99ME384684Rgigyv3HNG0iW+JN1ldCxTuJspA3B97scuhd
2s+VOnRiEygZb3ib+yhWE8t81rppLeYKVdvnFQktlVW/QixhWK16o5iLHxwDMUgB
ffTd5Q/SesIjYMEW7nWL2f8a2vYx1KpqBFk3/N7aoDaTTSUZygycB2mIANlumMaV
nNOCMc7xGNsY7GzDqyVrsFqhO28xhQ==
=mkR/
-----END PGP SIGNATURE-----

--Sig_/U76SY5Wxb0hYCWqSA9BFyXc--
