Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA0D240063
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 01:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgHIXK5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 19:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgHIXK5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Aug 2020 19:10:57 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D532CC061756;
        Sun,  9 Aug 2020 16:10:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPvwF5Ww6z9sRN;
        Mon, 10 Aug 2020 09:10:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597014655;
        bh=62/ANexaml2nU1uyBjlonQv0bbaANz6e0ISUG6IKM0A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W/fHe71bJCYWtfDC6QoyAQHLWubgVq8ywIgQykszzlSYPS3eTFnLf0o49eZgZnPmj
         bF/RulB49i5ByltQNoMmyCgJmg/A1PB0OX4D3NIdkLnv8JohL5uJX3c+bPUpElaKlf
         AcfbISfL6lib1nwYwvpdZkZVAo6XjPvTUdj91wno8Y+5g66k54eXH+5IthtUWCF/I8
         UFd0SUqSc3Dqrt4Lv8CkVXVXES1u8mBr7qkWE4HUtoVbHOHRYDIKt1lJNHCgILCzJY
         tuDPHBeF5aJPSjxu/rtwZ+Klvy4hDD96jx5iJMg6PXNQOcHCBeVSDGUBEa+gDqMTeg
         ZTt57T9VlObQA==
Date:   Mon, 10 Aug 2020 09:10:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
Message-ID: <20200810091053.2757b97f@canb.auug.org.au>
In-Reply-To: <CAHk-=wjjsrVPKirEN7hTioibRYSOZuo82seuUm6k7=tqeWHnZg@mail.gmail.com>
References: <20200630160346.696f6419@canb.auug.org.au>
        <20200809181838.23c6b829@canb.auug.org.au>
        <CAHk-=wjjsrVPKirEN7hTioibRYSOZuo82seuUm6k7=tqeWHnZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d+QMHKPb=sUEnWkbLFT/FPm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d+QMHKPb=sUEnWkbLFT/FPm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, 9 Aug 2020 11:04:28 -0700 Linus Torvalds <torvalds@linux-foundation=
.org> wrote:
>
> On Sun, Aug 9, 2020 at 1:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > I looks like the above report got lost along the way to you :-( =20
>=20
> Hmm. Why didn't I see this as a build failure?
>=20
> Oh. Because the USB4_KUNIT_TEST stuff requires everything to be built
> in. And I have them as modules.

Yeah, I only saw it because I do an allyesconfig build late in my day.

> > Here's the patch in case you want to directly apply it: =20
>=20
> Will do. Thanks,

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/d+QMHKPb=sUEnWkbLFT/FPm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8wgn0ACgkQAVBC80lX
0GwYRggAmEkyrmpGdpFG3QWPfnLnkyXUBTU0+qdM+HHoA7pReqZkx5ab6XuJ5yy3
Y6Z+8WKSM8HShQezExx4vTZ85ZyK4HApZZU53yT9k5XE/AqzaAPydeooetXgPOiE
bH0wxXYdPiB7D2X870kd0yoX6sSGLI/tFuVGDJuzUgcJe0DHXQxLHKNx2qG3mSXj
mgHFzBjf3qdQnxivlKZBIq148vZ0q6Bj2lhClomhgISBeelJnGzw5FSC2lh6V5lY
X6LyV39nzCnGrpXWq6CxBOY/GiGlx4d0H0KblJ7dWHxrLgKuVTI62Cmm+PbUxfPI
WobyYcftGfYYzGma+7bUvZnY5+IBuw==
=3w0A
-----END PGP SIGNATURE-----

--Sig_/d+QMHKPb=sUEnWkbLFT/FPm--
