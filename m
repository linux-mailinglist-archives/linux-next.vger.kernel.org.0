Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8881E1A72
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 06:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgEZEgg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 00:36:36 -0400
Received: from ozlabs.org ([203.11.71.1]:59261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgEZEgg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 May 2020 00:36:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49WLl50fF7z9sRK;
        Tue, 26 May 2020 14:36:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590467794;
        bh=4v8ocGM/APo2sSgppiU/a6nI3q4TeGO4rhe21S8OGMo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V5Uh8HJBzGV7gcBzXAj8zRUgdsUcf4HxCOU4Fwqb2ObX2nf/TFqzbFgXYhx85LoTq
         dxT277ChkPmq147KLwFVatU9YyVLPr4En646pqvi8T4NuqUqHCPzttLvknIIhTQdoo
         4CbsVgsjR8qbRXpx908nBDiUMXdexy5CtcNTWlPNu5dsEzGWQAJVOI/xnUOFJMT0an
         iJaTRq6aT/r/m8ZhVuAqFGToaMk2ra6wcB0shi+Pp8dZicO7MB9xwPNuFtCYPSgtAq
         l0OU9lYL5dpeS0gum+9XqlTGVetUQJLJCx6tXhAjAH7rJ6+tQMf0pWOjnDrLC68RrF
         ex0qYuxE8keGw==
Date:   Tue, 26 May 2020 14:36:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     David Sterba <dsterba@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20200526143630.7e7fbc79@canb.auug.org.au>
In-Reply-To: <c0e6af76-46d8-ccf0-3874-0751f7622caf@kernel.dk>
References: <20200525150837.54fe6977@canb.auug.org.au>
        <c0e6af76-46d8-ccf0-3874-0751f7622caf@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pxLirPxGa6MugXWK9gm1DQd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pxLirPxGa6MugXWK9gm1DQd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 May 2020 13:03:44 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 5/24/20 11:08 PM, Stephen Rothwell wrote:
> >=20
> > After merging the block tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > mm/filemap.c: In function 'generic_file_buffered_read':
> > mm/filemap.c:2075:9: error: 'written' undeclared (first use in this fun=
ction); did you mean 'writeb'?
> >  2075 |     if (written) {
> >       |         ^~~~~~~
> >       |         writeb
> >=20
> > Caused by commit
> >=20
> >   23d513106fd8 ("mm: support async buffered reads in generic_file_buffe=
red_read()")
> >=20
> > from the block tree interacting with commit
> >=20
> >   6e66f10f2cac ("fs: export generic_file_buffered_read()")
> >=20
> > from the btrfs tree.
> >=20
> > [Aside: that btrfs tree commit talks about "correct the comments and va=
riable
> >     names", but changes "written" to "copied" in the function definition
> >     but to "already_read" in the header file declaration ...]
> >=20
> > I ave applied the following merge fix patch: =20
>=20
> Looks like a frivolous change... Thanks for fixing this up Stephen.

The variable name change has been removed from the btrfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/pxLirPxGa6MugXWK9gm1DQd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7MnM4ACgkQAVBC80lX
0GxN0QgAkrTNBQkQoE+E8c1r8/lTP6z3sg4vMtkaNdAvj1KqOvGJ8nDw99s4APYR
v4KnZ64ZjgK6Rc0mTwK05QRG80OvzLLTewpyINAT5bMzq9SjP3TIbKeYu1gINDZC
nZD6mhryuq56q5gL4ifP+yshLjVg4kH8kn5rkREH+DK1uK1q4nUD+mfO871wUtCY
CMVMC5pvRf+jOpgpYzAq+mLuEXfoVVkNCrBnqZuXpAKi29e878NTsrz9t9QkblxD
1XZFaymjGGQ2f+nTSdjcBbhur/io3fQsrdpt5J/WgTlMnJMXK8yHPhRWPRZ98OjG
cehbze+Hm6NMqtV9mN9wYanu//NgVA==
=HJ9b
-----END PGP SIGNATURE-----

--Sig_/pxLirPxGa6MugXWK9gm1DQd--
