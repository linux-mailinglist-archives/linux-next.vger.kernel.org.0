Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C532D0C69
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 10:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgLGI7l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 03:59:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37937 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbgLGI7k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Dec 2020 03:59:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqHKx6G1Tz9sVs;
        Mon,  7 Dec 2020 19:59:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607331542;
        bh=zJ9bgKzNiNQ8is2gn1u34b+OE9z4VlWVwv6UQ0ycU9k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cO/4tN+R5QFe6mJAMiea16ZnjqOfUPGNmAQD9aNbaArJ1rnswltBB4GnBOh/6sTe8
         aXIZheSTxjrwdAr5nFA+YWERp6pgf4sTJenksTDQMyULu6h8IFthnUeveyKjsLrPA8
         EpiuzJ/ICLbHwPKXH/9X77A/EkM23TAn5bCzPsTnhbhSpGa/0fxbZRKsgZcoOUVzy0
         KT4c/lRHDY2oz9Jd8PjpQ00bjc6I4Nsl9ZGGtoCSMA+ERifehgNvWkfkqBA+8ZDww5
         YgYmkxtWJ3A62XDjxhID5nhXLhF9xWpdvhPUtu68fWsWe9lEWfEmyoDNn4SR+cI4uR
         QtZIpe4tTwJQQ==
Date:   Mon, 7 Dec 2020 19:59:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20201207195901.2e16a86a@canb.auug.org.au>
In-Reply-To: <20201207044841.GD2657@paulmck-ThinkPad-P72>
References: <20201204192526.0b38fb02@canb.auug.org.au>
        <20201204192032.GA1437@paulmck-ThinkPad-P72>
        <20201207083920.2f64f4dc@canb.auug.org.au>
        <20201207044841.GD2657@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QP_a8gEFdgkfKzBTQYaTtE/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QP_a8gEFdgkfKzBTQYaTtE/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, 6 Dec 2020 20:48:41 -0800 "Paul E. McKenney" <paulmck@kernel.org> w=
rote:
>
> On Mon, Dec 07, 2020 at 08:39:20AM +1100, Stephen Rothwell wrote:
> > Hi Paul,
> >=20
> > On Fri, 4 Dec 2020 11:20:32 -0800 "Paul E. McKenney" <paulmck@kernel.or=
g> wrote: =20
> > >
> > > Does the following patch fix things?  (Sigh.  It won't apply on the
> > > rcu/next that you used.  Or even on this moment's dev branch.  I will
> > > fold it in with attribution and update.  But just to show you what my
> > > thought is.) =20
> >=20
> > Sorry I didn't get the chance to test your patch, but it seems to make
> > sense.  I notice that you have added this to the rcu tree for today, so
> > I guess we will see :-) =20
>=20
> Fair enough!  ;-)

And it built fine, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/QP_a8gEFdgkfKzBTQYaTtE/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/N7tUACgkQAVBC80lX
0GxsiQgApZ0VruSFeUodEysTdPr+d2CDr/EBruWeN+A/PA7pK5fJ+YjoFGGthSr4
X3EO/tkeQQuRaukReK8P2bvVwY/XhlLBZHuz4Niwt+iFhGJvzI+D9st3AJg2MlCb
Wc6cN/UiFTBXaORxBll0wyJgW4e0obkDH7kaPXk8+oe+KfsKbQT40A9zjCeYiO/T
g80kruAggxf9ww3WLPkpWdqO4QgPw62wM2i8+bpaju8/DC4NJsLryCaPmC6/7+uj
3tVjyPX40oHS9Gk3c1/65d2z88MDj8N7kVOjSiks8vUwHy3Pe7QTrf0DixHhDDeE
TuKlcZlMmrqiJwAfanRbCBXA/NjfPw==
=l9J2
-----END PGP SIGNATURE-----

--Sig_/QP_a8gEFdgkfKzBTQYaTtE/--
