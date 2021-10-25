Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC71438E62
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 06:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbhJYEcy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 00:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbhJYEcx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 00:32:53 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8CAC061745;
        Sun, 24 Oct 2021 21:30:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd27V49jWz4xZ1;
        Mon, 25 Oct 2021 15:30:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635136230;
        bh=boJpJOrIDsx2VkQvn4L66nVLfU/WyT5eUPV6g+XrZEk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QoHxbAoB/W3FpbCdNYhD19if9behOYaEXv/wJFdFUmV3OlcVpQUyiyN2QQSSjPuU1
         3ZSvNHN2gWIStFge+fB+umim0GJW5PxCn4zQ9u/MCkoSaQByS014DnEE6Xe4BaIXvD
         ftDztMr1NwDfwjsjM90dHb7G0i8jdjDDPRm+DankrSZYbfWou6RbZ9oYnC2Fyv/nHT
         OdurW6aZ32QYts0lHvjOEhQysF0n0Mal8+mzxtuta/AdIKYsMcyJOKdQvlTTmyLnpC
         sEIX0bfSeJNtqWA5a1sjDgOGcApp3T/bJvYNYJrFWfoApdh0RabA60vXKcgRuJUFiR
         /0cdryJaR3Uwg==
Date:   Mon, 25 Oct 2021 15:30:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211025153029.1e307fcf@canb.auug.org.au>
In-Reply-To: <20211024224215.018c36cd@gandalf.local.home>
References: <20211018181559.5d3bcf7e@canb.auug.org.au>
        <20211025125446.51bed661@canb.auug.org.au>
        <20211025021119.GA1424114@embeddedor>
        <20211024224215.018c36cd@gandalf.local.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/64pBUwO781mJbtS62ykBkHJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/64pBUwO781mJbtS62ykBkHJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Sun, 24 Oct 2021 22:42:15 -0400 Steven Rostedt <rostedt@goodmis.org> wro=
te:
>
> On Sun, 24 Oct 2021 21:11:19 -0500
> "Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:
>=20
> > On Mon, Oct 25, 2021 at 12:54:46PM +1100, Stephen Rothwell wrote: =20
> > > > --- a/include/linux/ftrace.h
> > > > +++ b/include/linux/ftrace.h
> > > > @@ -45,6 +45,7 @@ struct ftrace_ops;
> > > >  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long par=
ent_ip);
> > > >  #else
> > > >  # define FTRACE_FORCE_LIST_FUNC 0
> > > > +struct ftrace_regs;
> > > >  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long par=
ent_ip,
> > > >  			       struct ftrace_ops *op, struct ftrace_regs *fregs);
> > > >  #endif
> > > > --=20
> > > > 2.33.0   =20
> > >=20
> > > I am still applying this fix ...   =20
> >=20
> > I will add this fix to the original patch for my tomorrow's -next tree.=
 =20
>=20
> Hmm, I pushed my version to my for-next branch. Do you have this in the
> next tree?
>=20
>   34cdd18b8d245f3e901e5325 ("tracing: Use linker magic instead of recasti=
ng
>   ftrace_ops_list_func()")
>=20
> Which shouldn't need this fix.

Well, that is in your tree today, but (1) doesn't help with the build
failure in Gustavo's tree on its own (i.e. it creates a dependency
between Gustavo's tree and your tree) and (2) now I will get a conflict
between the two trees today.  Oh, well.

--=20
Cheers,
Stephen Rothwell

--Sig_/64pBUwO781mJbtS62ykBkHJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2MuUACgkQAVBC80lX
0GwARQf9FyrRzhWINHETAO6JeUtct5nBOZL8o+LUxEEi9HLdYdYUVPs1d8hOTErn
7YlgNM/22UxiYY9d3UDy8ieDzue991uBp8pY7YL9gCUUFPVCjq8YIO7W1eCOPGY/
yk41Mk5v1ogF1oH/3rGbK8tafBJjzDRYkD/+vikM8qWmEgb3wQyMKNmohDRWsQR7
QimlIJHqh/rUadpSEXIvKvzk7UNLm8C064i5lsd0JtFUBqe0EDMnkI030Vv1RazC
ZySvJh92x38tK/BWhv04q6EN3Q36IYYCQj5BvlQ2EV4D/Wzkr2S4lsP9A5wlRNGc
Uaqe+PubxeA52mMu2k31U4W61FXyXQ==
=G579
-----END PGP SIGNATURE-----

--Sig_/64pBUwO781mJbtS62ykBkHJ--
