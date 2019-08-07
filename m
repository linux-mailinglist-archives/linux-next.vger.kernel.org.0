Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6181185678
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 01:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388270AbfHGXbz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 19:31:55 -0400
Received: from ozlabs.org ([203.11.71.1]:36993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387849AbfHGXbz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 19:31:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463npJ4gNcz9sBF;
        Thu,  8 Aug 2019 09:31:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565220712;
        bh=D4954wWJFIxeNOAVCijZOojKttQJdCVp6dAMHpHJBYk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q+skvyy73bh+ueDzhcKMjKlRSYzXaCCxgrX6NDyy5Tzh9ghKs7cR3BymxbZCU5U6T
         yAMsqZM92mMcarCtTU1k89qMQpoK40pguulgJmeyJN4prVl6NwY3ubv0Cald+An2yO
         4R52Xqly490gOUTSYM0wH7inL7stWfH6VQ3WDNHsOdfJrnDpzeAjpCbfm7x3YCPIN7
         rFZP0eQG5x4okmcQ7Gd/YtJzRINkvvm9BmEVQDjLNbYAnsClM0fUeiXbdoDoHkdGGe
         4vtm+CcY+nfElk+5OXXcjhqMY1ZeoMe9t+XYBn/Gq9DJAl3cuT7fFSesAu5dEjKyNc
         qajJef3XjxUdg==
Date:   Thu, 8 Aug 2019 09:31:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20190808093134.1a5df132@canb.auug.org.au>
In-Reply-To: <20190807112917.GA4624@rikard>
References: <20190807180041.07f06dc0@canb.auug.org.au>
        <20190807112917.GA4624@rikard>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S1/XyKHC=Oh8eUWuEWK2PHJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S1/XyKHC=Oh8eUWuEWK2PHJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rikard,

On Wed, 7 Aug 2019 13:29:17 +0200 Rikard Falkeborn <rikard.falkeborn@gmail.=
com> wrote:
>
> Hi Stephen, Andrew
>=20
> On Wed, Aug 07, 2019 at 06:00:41PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the akpm-current tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > In file included from include/linux/bits.h:22,
> >                  from arch/x86/include/asm/msr-index.h:5,
> >                  from arch/x86/boot/cpucheck.c:28:
> > include/linux/build_bug.h:49: warning: "BUILD_BUG_ON" redefined
> >  #define BUILD_BUG_ON(condition) \
> > =20
> > In file included from arch/x86/boot/cpucheck.c:22:
> > arch/x86/boot/boot.h:31: note: this is the location of the previous def=
inition
> >  #define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)=
]))
> >=20
> > Caused by commit
> >=20
> >   d72f2a993607 ("linux/bits.h: add compile time sanity check of GENMASK=
 inputs")
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell =20
>=20
> Please drop this patch, it has additional issues that needs to be fixed
> in another revision.

I have removed it from linux-next for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/S1/XyKHC=Oh8eUWuEWK2PHJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LX1YACgkQAVBC80lX
0Gz1vQf/Vr+jSE3tZ3mO3nFRIABShN33fdZ8ctsctp2uCkjyX5JZmgQ04MRZZKCM
V2XABQmTugkVJ5B2RK4Mgc4QYvsHDUUSO7f1sjA2c97uU7GxxbkmoNP+ZXGKe5YT
DuH/I8pOmF4J0TAUURAhXgODc9j5fZ9qYFFt3u8l+6dXnlo5TxsEO9uaV4E36z2b
v94ChOSTlHLLB6J5SxNAmSv5zFuMhBeQ5d23zub//ynN5Dp8hVUOxfi4Gww8YSPO
lrjvvun84fRGi86j/NA1gYlGjX9FohRWJ3vVYtNQKOBtvm0oVB6R2nmH9IFFPRm8
uTdWuigz1JdKRtTwKX0lnsB+TUfvRA==
=An6g
-----END PGP SIGNATURE-----

--Sig_/S1/XyKHC=Oh8eUWuEWK2PHJ--
