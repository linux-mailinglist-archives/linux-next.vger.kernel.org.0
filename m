Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A84440CB8
	for <lists+linux-next@lfdr.de>; Sun, 31 Oct 2021 05:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhJaEcs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Oct 2021 00:32:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34083 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhJaEcs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 31 Oct 2021 00:32:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HhjrM3VGvz4xbc;
        Sun, 31 Oct 2021 15:30:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635654611;
        bh=vEzmphI99yoDvtVkzfKFMonILD2eztvW5urapUsPvVo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Mk7qScKRoMs1j8oTqGbOFU3LdsI/EXQw80US3JpfPNL/S0Soo/GA2iRUIRHbpI0Fy
         VS+SieHf1ER3iMuHYgW7P6Q/GD3R5BTfqx3XqPGSXTw4Ouxo+SiWDhnoxXg4SQPabB
         UGt6kV2R5+N/ohLgPdcOnSE792ZLljDsInoe+DSzrZFeNFmycxGYhBT4q+koKIA3LA
         dj9IgVgkERV6mkyAXvMpfyUBOVRaNA5xBuyLS20H6AV6T5jAG8bSDtDrrAHt3crDva
         Mph40cK8EgVgwqGCEVVFj50r1dVnW7YKDc+vSr2f5X0VgcPaploq/1Ve6/xVhYS3B9
         EWOnUZSg4lJMA==
Date:   Sun, 31 Oct 2021 15:30:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20211031153009.79a2879d@canb.auug.org.au>
In-Reply-To: <20211029121409.GX20319@suse.cz>
References: <20211027210924.22ef5881@canb.auug.org.au>
        <20211029095226.GV20319@suse.cz>
        <20211029105052.GW20319@suse.cz>
        <CAHp75VdXJEuY86pFC+bLoGbAYuGsA+KqEV-g4Dca25HHD-njHA@mail.gmail.com>
        <20211029121409.GX20319@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G+VgasT.S=ynf_DLQSYpa4y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/G+VgasT.S=ynf_DLQSYpa4y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, 29 Oct 2021 14:14:09 +0200 David Sterba <dsterba@suse.cz> wrote:
>
> On Fri, Oct 29, 2021 at 01:58:53PM +0300, Andy Shevchenko wrote:
> > On Friday, October 29, 2021, David Sterba <dsterba@suse.cz> wrote:
> >  =20
> > > On Fri, Oct 29, 2021 at 11:52:26AM +0200, David Sterba wrote: =20
> > > > On Wed, Oct 27, 2021 at 09:09:24PM +1100, Stephen Rothwell wrote: =
=20
> > > > > Hi all,
> > > > >
> > > > > [I am not sure why this error only popped up after I merged Andre=
w's
> > > > > patch set ...] =20
> > >
> > > =20
> >=20
> >=20
> >  =20
> > > Also I think that next time you can use some older version of the
> > > for-next branch instead of making the whole subsystem depend on BROKE=
N.
> > > This causes much more harm in the testing setups that suddenly can't
> > > work at all, compared to testing a few days older branch. =20
> >=20
> > The Linux Next reflects current state of affairs and marking something
> > which is definitely broken as BROCKEN is what I expect as a developer w=
ho
> > tests some other stuff on top of broken code. =20
>=20
> I'd argue against using the big 'depdends BROKEN' hammer as much as
> possible, surely not for linux-next. Normaly the BROKEN status is earned
> after known unfixed breakage for subsystems where nobody cares. If code
> is buggy and causes crashes when testing linux-next, that's something we
> want to see, not "no test results at all".
>=20
> Can you imagine all compilation breakages in linux-next get resolved by
> BROKEN? I know Stephen is capable of fixing various compilation problems
> by himself and given the whole-tree scope it's heroic efforts, leaving
> the shortcuts for the rest. In this case the fix may not be obvious so
> I'd understand not merging my for-next branch at all or merging a stub
> like the latest rc instead, ie. resolving that on the integration level
> and not touching the config or code itself.

OK, this was a pain because the error did not show up until late in
the day (something in Andrew's patch series exposed the problem - note
my report was sent at 9:09 PM - my day starts about 7:30 AM).  This is
after I had merged maybe 150-200 tress in top of yours. My choices are
few at that point (you don't expect me to remerge all those trees,
right?).  Almost all errors I see are immediately after I merge a tree,
at which point my usual response is to reset my tree to before the
merge and then merge the previous day's version of the tree. Generally,
I do not fix build errors unless they are caused by an interaction
between 2 trees.

Given that I had spent some time to figure out what the problem was, I
expected a fix to be done pretty soon, so the easiest way I could
continue was to just mark btrfs broken and continue on (I still had
another hour to go before I was finished (my days get really long just
before Linus does a release :-( ).
--=20
Cheers,
Stephen Rothwell

--Sig_/G+VgasT.S=ynf_DLQSYpa4y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF+G9EACgkQAVBC80lX
0GzDPAf/V2rEcDDyyC6/LLjMMmA6ctcKZpCLBHJhzcbzEs2fRvyldHqfczXT1c37
2bGTSjRJxp3DIdaWQc5WxSK32AQ6MnvB8wsfRpolHJD1tmcAx5bQg7+obrC9oJVd
VZrXC48KVTYoc6XuZ77HFExnrzVP4dES1wXKOWmZIOAmyVmSX+2CV7FrxneUwPDB
ALIJzEjmx7LVxK67/O2ZP5pzI7DVmbxxGhJgj4/U/V923Ketv+G/yyY0OPfBKuWA
Km3vPCnaHsMJ6Iq/fcUF8qEG+pZKjsCqaE86iomb1MvaWUxvlt0JUnWQ6PynpzHy
5gKFcwQNHvP67IVLla6eVJr5YGrZOQ==
=lUs1
-----END PGP SIGNATURE-----

--Sig_/G+VgasT.S=ynf_DLQSYpa4y--
