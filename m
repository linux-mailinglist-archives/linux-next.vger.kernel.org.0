Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7531ED82B
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 23:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgFCVtc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 17:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgFCVtb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 17:49:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75570C08C5C0;
        Wed,  3 Jun 2020 14:49:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cjHF4t95z9sSJ;
        Thu,  4 Jun 2020 07:49:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591220969;
        bh=XKBgp2L0GUOLSIg/boLMt9j4CLVhXJp35jPh8omNObQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MIByWuDG8NxSAxHilcOm18JB7UA/swZnhC+zVQYYkIHfz5VGwY8SeBJnMSu3l8yZC
         f7VlbqBeWxu3PXtEjNSy34uFhWUgm+bYMFr9JI4AIAi7GiKFCs7SWE050MX7EGmyFO
         SiWjKH7kcKP/NJ5kbNzhkygdAweCeWH/aDggUQC0xVzj48iLWfEIRX0dlvA7C1g+oK
         Q3vdrjsYqp9x5doxBGPW71oLIoL6Vu4DntH+OAee9LZllO2E4ETQjjfky4jyxBFp4l
         GiILLHGuZWehO9q6iOAPhvPISbFkToZUyKHBYk0qYKx3RmJL+mOWhpKZl4ABiCfzV/
         Ro6Z0sthMNUPQ==
Date:   Thu, 4 Jun 2020 07:49:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Tom Zanussi <zanussi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20200604074928.41aac4b5@canb.auug.org.au>
In-Reply-To: <20200603113058.11895c24@gandalf.local.home>
References: <20200603174253.60deace5@canb.auug.org.au>
        <20200603112223.3adc3451@gandalf.local.home>
        <af08615d0ce87b7c920a0ac6a5389834a0504cb7.camel@kernel.org>
        <20200603113058.11895c24@gandalf.local.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1=jckIQ6GodOgy9MkQ79wLt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1=jckIQ6GodOgy9MkQ79wLt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Wed, 3 Jun 2020 11:30:58 -0400 Steven Rostedt <rostedt@goodmis.org> wrot=
e:
>
> On Wed, 03 Jun 2020 10:24:36 -0500
> Tom Zanussi <zanussi@kernel.org> wrote:
>=20
> > > It appears to be the ascii art that is causing the issue. I have no
> > > idea
> > > how to fix it. If someone has a patch they would like to submit, I
> > > will
> > > take it before I push it off to Linus.
> > >=20
> > > -- Steve   =20
> >=20
> > I just sent you/posted a patch to fix this.  Should be in your inbox
> > already. =20
>=20
> Thanks Tom!
>=20
> Stephen,
>=20
> Can you test if this fixes the issue for you? If so, I'll add it push it =
to
> my for-next branch.

See my ack on the patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/1=jckIQ6GodOgy9MkQ79wLt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YGugACgkQAVBC80lX
0Gxx5gf6AzOmB3c6Punfr7TY5SDcqUZpvf2M0CflHIn/rqMgVDc/g8aR7HVYZwOZ
KLdgbvv3WqdetJ9bEU3gmjqmaebwjhl2pw184JrhQ3YYZViQVHWJl9/ubjGAE3nn
huQfrSk92J3d/EiRC2zDjMMP5wPTWMnD7Z8OLwgM3xOf6KAW8dWk4CapuKBhc1aY
D2hxVuU6jf588nmyYDVQeqI7Y5j6Gra2T12Nzk2WCw2R7F4u5nbbZCpGP7X6EPQV
izbWW7cxhyuRjcdoNoyhYq5yDWeOa9E+Dx7aBTWGoVWPWS9xTRMEPQwoPMyGd7A5
FS9Zqd1IG6bCY6Og+szV5RkVWgWkYw==
=3X58
-----END PGP SIGNATURE-----

--Sig_/1=jckIQ6GodOgy9MkQ79wLt--
