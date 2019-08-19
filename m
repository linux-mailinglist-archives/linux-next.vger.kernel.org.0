Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F83391B71
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 05:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfHSDVY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Aug 2019 23:21:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50421 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbfHSDVY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Aug 2019 23:21:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BfN00b4gz9sMr;
        Mon, 19 Aug 2019 13:21:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566184881;
        bh=29QgzEZSr1ZVVElKbqiPhqR6S7ICFbOtUWXb56Okqdw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N3NR8+Bfu1nIJlREKsukzK5YOXdVW4Qm6um9N/BUUu984cVKxFr0O0LDLilV3gsar
         ft4G2lEyF9cqoODdQcyACwGQLOlEl0VrY6H5Liumel0Yug3A2Ao60EziTlGgR/QXYS
         cmNsKKnmsS5ufrF02lohtIteP0DefPciUzZ4APX5323H7OJGAijvq84YjqgPwMa+Mh
         21qYJvSAtzq95yxV582t5CNa0zjJ0CEaYnEQwkbTnr0drCsllMCnbC+6Y81E6wwWCa
         ua9xHUsFMNlbnuXXHyCrJ3gsuzh3SsJ4CicQ44dQvw6wPtPtfj7MyOls35KnGCI8Ul
         3s5Gub+ESZjKw==
Date:   Mon, 19 Aug 2019 13:21:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mjg59@google.com>,
        Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <20190819132119.7349e881@canb.auug.org.au>
In-Reply-To: <201908121033.BFBE9516AC@keescook>
References: <20190812145823.63d77573@canb.auug.org.au>
        <201908121033.BFBE9516AC@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pedn2mWvzzileLDoR70LWZt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pedn2mWvzzileLDoR70LWZt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Aug 2019 10:34:17 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Aug 12, 2019 at 02:58:23PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the security tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like below.
> >=20
> > Caused by commit
> >=20
> >   45d29f9e9b8b ("security: Support early LSMs")
> >=20
> > I have added the following fix for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 12 Aug 2019 14:54:20 +1000
> > Subject: [PATCH] early_security_init() needs a stub got !CONFIG_SECURITY
> >=20
> > An arm multi_v7_defconfig fails like this:
> >=20
> > init/main.c: In function 'start_kernel':
> > init/main.c:596:2: error: implicit declaration of function 'early_secur=
ity_init'; did you mean 'security_init'? [-Werror=3Dimplicit-function-decla=
ration]
> >   early_security_init();
> >   ^~~~~~~~~~~~~~~~~~~
> >   security_init
> >=20
> > Fixes: 45d29f9e9b8b ("security: Support early LSMs")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> =20
>=20
> Acked-by: Kees Cook <keescook@chromium.org>
>=20
> -Kees
>=20
> > ---
> >  include/linux/security.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/include/linux/security.h b/include/linux/security.h
> > index 807dc0d24982..23e1c3f17d48 100644
> > --- a/include/linux/security.h
> > +++ b/include/linux/security.h
> > @@ -473,6 +473,11 @@ static inline int security_init(void)
> >  	return 0;
> >  }
> > =20
> > +static inline int early_security_init(void)
> > +{
> > +	return 0;
> > +}
> > +
> >  static inline int security_binder_set_context_mgr(struct task_struct *=
mgr)
> >  {
> >  	return 0;
> > --=20
> > 2.20.1

I am still applying that patch ...
--=20
Cheers,
Stephen Rothwell

--Sig_/pedn2mWvzzileLDoR70LWZt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1aFa8ACgkQAVBC80lX
0Gz8Cgf/clyQnfWD9Qe6cj4Z6HFnOtKgZBPjeMuxCqyGkPn6JNS1sB6b5LsahNsQ
GqJkrFYeLZcpoy42LzBeeClJYfO3rMtboNyQ9bU/+HJY7DmETDFke20gpBl6PAOT
GAsR5ncZHvWTh7pxOgRvh7KNRPcIS8ZVjkp5rD2eg9vlk2U05nEvJAZSPCFfp57k
ZaXVvI0+BqnsfNibsMKrNZuXhph2uveed4YwnsjaO8Zg7oIhJb8PyQgZIFnUBoqL
UDPasxmg2rAm83dKu4fK4UHkhMInnTTz0gKajIg+anFJAY/C8VqdyCMM0p4ogIdo
L+uyB+vJNsJM0G6o5AFguEhmLi8j9g==
=0RWy
-----END PGP SIGNATURE-----

--Sig_/pedn2mWvzzileLDoR70LWZt--
