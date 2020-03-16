Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 819B81864DC
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 06:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbgCPF73 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 01:59:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729363AbgCPF73 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 01:59:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48glxV2N4qz9sP7;
        Mon, 16 Mar 2020 16:59:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584338367;
        bh=mMXlKwv2wkXsZZhNPjEU1qh9Iayn+k5XQ67A6MNIImQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TQ7i9WKTg2aAOm/AL5GhBImlgPQ3wWxQoRtfe3UqqH+pQhQzzFN+BhM5aRQomfxUm
         OLI7Lm377V8BzDfuvcJSz7vg0dC2QqnaRrWcVVioAIyuXDNG30HIDjkc5d7kKeZgBo
         vmROJeC/GH8BJGaEID2bH34irZrqLjabBaKhT9DYLongribrDvePP+UH+m5WA7mbU4
         DhDptBDES2S3JMatuxncDCGrmjGxr+QQQqdKfjqjy7P6bv4TfJ0CblsAS11EEJQ5hB
         VP4keycHaLy6pKBBVPgnxGyTa+xxyDbbryTRmNQudt2MPBbRjJqp7Y/3RyII2awq7v
         RZi6rh15G3TFQ==
Date:   Mon, 16 Mar 2020 16:59:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the random tree
Message-ID: <20200316165923.043f4454@canb.auug.org.au>
In-Reply-To: <20200310144618.GC58231@mit.edu>
References: <20200302144452.6a7c4907@canb.auug.org.au>
        <20200306155348.7bdc9622@canb.auug.org.au>
        <20200310121747.GA49602@lakrids.cambridge.arm.com>
        <20200310144618.GC58231@mit.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sx/yj4l2VWmhj8MbY5lFxK.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Sx/yj4l2VWmhj8MbY5lFxK.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 10 Mar 2020 10:46:18 -0400 "Theodore Y. Ts'o" <tytso@mit.edu> wrote:
>
> On Tue, Mar 10, 2020 at 12:17:47PM +0000, Mark Rutland wrote:
> > On Fri, Mar 06, 2020 at 03:53:48PM +1100, Stephen Rothwell wrote: =20
> > > Hi all,
> > >=20
> > > On Mon, 2 Mar 2020 14:44:52 +1100 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote: =20
> > > >
> > > > After merging the random tree, today's linux-next build (x86_64
> > > > allnoconfig) produced this warning:
> > > >=20
> > > > drivers/char/random.c:820:13: warning: 'crng_initialize_secondary' =
defined but not used [-Wunused-function]
> > > >   820 | static void crng_initialize_secondary(struct crng_state *cr=
ng)
> > > >       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > >=20
> > > > Introduced by commit
> > > >=20
> > > >   5cbe0f13b51a ("random: split primary/secondary crng init paths") =
=20
> > >=20
> > > I am still getting this warning. =20
> >=20
> > Sorry, this is my bad.
> >=20
> > We only call crng_initialize_secondary() in do_numa_crng_init(), which
> > is only built for CONFIG_NUMA. We can either drop both
> > crng_initialize_secondary() and crng_init_try_arch() under the
> > CONFIG_NUMA ifdef, or add __maybe_unused to crng_initialize_secondary().
> >=20
> > Ted, does the below look ok to you? Or would you prefer moving things
> > under the ifdeffery? =20
>=20
> Yes, that looks fine.  Reordering the functions to move them under the
> #ifdefs will make the code less readable, and adding extra
> #ifdef/#endif would also make things less readable.
>=20
> Thanks for the patch, will apply.

How are we going with this?

--=20
Cheers,
Stephen Rothwell

--Sig_/Sx/yj4l2VWmhj8MbY5lFxK.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5vFbsACgkQAVBC80lX
0GzK9gf9EN4LRj/WWy5QHMFoA6BkhjGufz49lmYGcbTapzj5FudC3qFKwof7ujJV
EuoZmietL5wqrql7eI8O8hoI4sUJ99WuBD++bokmiP6cSrquHItW0T7dD/R+Zwir
J7j2WLoycFSjZ5Byn5j5uMbncqK+pn02XGNPdl3b8GZisXrAcjUh2KCXoToo8RWu
4rDp3NKSVRU8yNpksqJzV5G2yaD1QyjrpqeM9e5Kan8bLuBvepKviONiPDiNgmlR
T7BybDbHEUyEWDbHdBhZjiv18VNyPdQ0W+WM3LnZr0a86uzNy/J5BsCbQluH2dt3
+NMOV4ou5Gkib8PJehZZ/B1UoT6y+g==
=6gN+
-----END PGP SIGNATURE-----

--Sig_/Sx/yj4l2VWmhj8MbY5lFxK.--
