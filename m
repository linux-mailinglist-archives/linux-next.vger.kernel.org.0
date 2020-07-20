Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7653C225716
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 07:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgGTFhL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 01:37:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54493 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgGTFhK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jul 2020 01:37:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B99Tc3QHKz9sRN;
        Mon, 20 Jul 2020 15:37:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595223428;
        bh=2XgeZBjjdE0EpxfJtO9yXEaHdZMYFiS96jVy6kfAMZM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qlsUEVfWLhZzsoGzVlHp4kZq8qiAa6D5Om5fTtMuWSeNBwrT++rUkJ9L+HPA6Ym2h
         dq1LXz+GdkdigcGaojJ45vM7QwW0poZ5TKCOYroY4uqOrAnok4NkdN1j3pA6dxRm5e
         gUw2SkLPB+f8VDsuFeqPCQZp2ss+rxedWeEG3f6UavxxDBliaLU1BcuP0uQgF4WF3N
         Jwu6dNahdOFOWEgwkHSlg2Wp2kBLarMI7DI58S4tor4UiFFzrm8WxIr0EdDr/MvOQ6
         kJquRxwR5KD4xV2516E6bopxvuhF6o/CxfJraDDnvtu1c8bttF3+0+Kk85PCXIk/xl
         UfW+jZvczW1eA==
Date:   Mon, 20 Jul 2020 15:37:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200720153706.440b86b5@canb.auug.org.au>
In-Reply-To: <20200714135012.447d185c@canb.auug.org.au>
References: <20200622113700.3dd74527@canb.auug.org.au>
        <20200630125459.0ca67c38@canb.auug.org.au>
        <20200707123301.79ca8a94@canb.auug.org.au>
        <20200714135012.447d185c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mns_sDvtX/2R3KX_Xse_pB5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Mns_sDvtX/2R3KX_Xse_pB5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Jul 2020 13:50:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 7 Jul 2020 12:33:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Tue, 30 Jun 2020 12:54:59 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > On Mon, 22 Jun 2020 11:37:00 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:   =20
> > > >
> > > > After merging the tip tree, today's linux-next build (x86_64 allmod=
config)
> > > > failed like this:
> > > >=20
> > > > ERROR: modpost: "sched_setscheduler" [kernel/trace/ring_buffer_benc=
hmark.ko] undefined!
> > > >=20
> > > > Caused by commit
> > > >=20
> > > >   616d91b68cd5 ("sched: Remove sched_setscheduler*() EXPORTs")
> > > >=20
> > > > Missed one :-)
> > > >=20
> > > > I have reverted that commit for today.     =20
> > >=20
> > > I am still reverting that commit.   =20
> >=20
> > Ditto ... =20
>=20
> Ping?

OK, it has now been three weeks ... I must admit I was a little
suprised that initial testing of the tip tree (or even the branch that
this commit is on) did not pick this up.

Unless there is something really weird going on here, Linus will notice
if you try to get him to pull this as he tests with an x86_64
allmodconfig build.

--=20
Cheers,
Stephen Rothwell

--Sig_/Mns_sDvtX/2R3KX_Xse_pB5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8VLYIACgkQAVBC80lX
0GwklAf/QO1rgP8S5l24OL7AOPztYJ3K+g/LfkrM2C5KVqrNqs4s8Gibgc+jXjLD
GcfmJ9DUgAlh6868Z6CRhKS9dxZCwojICPrJxDQ6Kbxb7/27oOdY1mAABBy7IOZq
YO4GeJ9804pRzVXO+CDKsvcWMTiig60cjELmpqBS3j0AkkSdiVUYTE1vuJERRAjy
AVhyshcgRQRNZ/7innrdIedENhDFabukPYNntOylbREJ/O7MyVVS5x6POgKn5NuF
wFMU+KhL1eI7ZFGqUIAmbi+vmxjd9w0XidfnhjaPp1s4X68Qkeg8PkHvPbUhOkpz
gCZlHd+sEounzSD61fz8mz0itFlrWA==
=IZ0s
-----END PGP SIGNATURE-----

--Sig_/Mns_sDvtX/2R3KX_Xse_pB5--
