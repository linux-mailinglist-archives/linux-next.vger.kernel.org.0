Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF66E1EC537
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 00:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgFBWlM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 18:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgFBWlL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 18:41:11 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D4CC08C5C0;
        Tue,  2 Jun 2020 15:41:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49c6TH1ztHz9sSd;
        Wed,  3 Jun 2020 08:41:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591137667;
        bh=9gkMEVcoX1XzlxGPcQNJUcQc/QyIGQ5Tuk0vJfXij1g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IbkZM6SAfzwVHu3hVzS8hUBj5/dwl/TrBchq9e/IKdfbaoeWuRTGoNgiTNAu36LOh
         SqXb9nBRjimZSegOly2FEGl9aRfD+KMLP5Xt4hkc2+Ll+RNFDaBWdML6Omm1kCkbGq
         /MZZaMT2tqlgwxAN2p1qMiWB0jVJ/LLyLhH0lse8ORP5f575QpfQ4/xm2sYCvJEkKN
         OKCAyezmgt+gRq/beeOSswSqLBb1tSiUG6UAXd/5qB73W/z7n2yz8E9PBTWpgR3F2f
         Nz8OsASQ+S0d5cds77YlGLRHa410WkpHvLGZElaBFsvUgJngeEOzED06Pv0y4mtdAa
         Xi9btcNc3DHIQ==
Date:   Wed, 3 Jun 2020 08:41:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: linux-sh for-next reactivation
Message-ID: <20200603084105.47bd62c5@canb.auug.org.au>
In-Reply-To: <20200602202832.GA3776@brightrain.aerifal.cx>
References: <20200602031123.GA1079@brightrain.aerifal.cx>
        <20200602150039.780a0ac0@canb.auug.org.au>
        <20200602202832.GA3776@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.dwtc6obdFlmLkY.lFda2yE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.dwtc6obdFlmLkY.lFda2yE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rich,

On Tue, 2 Jun 2020 16:28:33 -0400 Rich Felker <dalias@libc.org> wrote:
>
> On Tue, Jun 02, 2020 at 03:00:39PM +1000, Stephen Rothwell wrote:
> > Hi Rich,
> >=20
> > On Mon, 1 Jun 2020 23:11:39 -0400 Rich Felker <dalias@libc.org> wrote: =
=20
> > >
> > > Could you reactivate linux-next pull from my arch/sh for-next branch?
> > > It's where it was before, at:
> > >=20
> > >     git://git.libc.org/linux-sh for-next
> > >=20
> > > and has newly accepted patches ready. =20
> >=20
> > I already have an SH tree from
> > git://git.sourceforge.jp/gitroot/uclinux-h8/linux.git#sh-next .  Should
> > I do anything with that one?
> >=20
> > It currently contains:
> >=20
> > $ git log --oneline origin/master..sh/sh-next=20
> > a193018e5290 (sh/sh-next) sh: add missing EXPORT_SYMBOL() for __delay
> > 1d5fd6c33b04 sh: add missing DECLARE_EXPORT() for __ashiftrt_r4_xx
> > d70f1e3d5dbd Merge remote-tracking branch 'origin/master' into sh-next
> > baf58858e8b6 sh: prefer __section from compiler_attributes.h
> > 8619b5a9035a sh: Drop -Werror from kernel Makefile
> > 3a3a78124693 sh: kernel: disassemble: Mark expected switch fall-throughs
> > fb8f77490f55 sh: kernel: hw_breakpoint: Fix missing break in switch sta=
tement
> > cd10afbc932d sh: remove unneeded uapi asm-generic wrappers
> > cbfc6edb6a4a sh: use __builtin_constant_p() directly instead of IS_IMME=
DIATE() =20
>=20
> Hi Stephen,
>=20
> I completely forgot that you had the tree from our other co-maintainer
> Yoshinori Sato on the list linux-next is pulling from. Would it be
> okay to keep both? That would help with quickly identifying and
> resolving any conflicting commits and make things go more smoothly
> with two maintainers trying to be active.
>=20
> Let me know if this doesn't work for you and we'll figure out
> alternative arrangements.

Added from today (I called it "sh-rf" - if you want a different name,
please let me know).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/.dwtc6obdFlmLkY.lFda2yE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7W1YEACgkQAVBC80lX
0GxVZAgAimxKIcraDpE2K87qzDmZP+oslCaTChUho1oSKmGXBvMCq4IfScsvhshQ
Wah5+bTdRM5dzebPB21SuCvXjZhKMVI688ziityzNvLbcak1peFRyBEDhvwR433N
uZeNGl2z+2emgidbCW9byWAxqv3d4Y2sbaGlEbeL377NzQ17yYRn9aqmuNO5MhEC
Yp4pkKC01CTAEkSDcMaf4tzpbcs8hAJpck08MrCB7U/hOx9rWf8RU7DUJc6RT/Jk
Xvi+cggVv5EyXrQ0290qJg+HP6b6bMj0E0rEg08wEXbv1lBmCwHimz6fYWjliEEf
4A48Mz3ZiZStRpp2NyXK6waQCHe2Og==
=98WM
-----END PGP SIGNATURE-----

--Sig_/.dwtc6obdFlmLkY.lFda2yE--
