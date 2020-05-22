Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71111DE142
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 09:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbgEVHtv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 03:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgEVHtu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 03:49:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71485C061A0E;
        Fri, 22 May 2020 00:49:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49SzCt48Xqz9sSW;
        Fri, 22 May 2020 17:49:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590133787;
        bh=vq9L6SID6J7jzdJ5f+G1Nl4QAlI00mXh+3ZjRT0D/MQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lYXoHpwbHRC5wZ1X4aTm2nIhxp2rvY9+ZlQN7X/HxPPDS20Yn7lUULZ/9BTMFk9WW
         dPZuU/2cgpJNC8Tj4FSd/V4AEvy24DUk1s0Mr9LhBGJJxfVrHMQbRf/sEsa19KM+Qc
         W+L/20DwitIFmRir+aBjJKmfcqyrHxGE0XTlyAWEAyMW08eIA4vJoqx6cQXdKMfUax
         xQxpGF0aciJ4bZyUpmAgGs3gIX8dIwY2ZXpt3TWu1loxBHNIAfEuTMc9e7IGYZF8kc
         c3XBF9oODsHFzb+OxWNOGyj31LKwIEF2d0A7DOwVg2S29O5D3L3+yn2/h6vdk0HBpY
         WNaDzzOmRLOwg==
Date:   Fri, 22 May 2020 17:49:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Will Deacon <will@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        elver@google.com, bp@alien8.de,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200522174944.1a1732fa@canb.auug.org.au>
In-Reply-To: <20200522171708.5f392fde@canb.auug.org.au>
References: <20200522033119.1bbd99c5@canb.auug.org.au>
        <20200521173520.GL6608@willie-the-truck>
        <20200522171708.5f392fde@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eh=D+yNo=dsM9t+J0nOsqNZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eh=D+yNo=dsM9t+J0nOsqNZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 22 May 2020 17:17:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 21 May 2020 18:35:22 +0100 Will Deacon <will@kernel.org> wrote:
> >
> > [+Marco and Boris]
> >=20
> > On Fri, May 22, 2020 at 03:31:19AM +1000, Stephen Rothwell wrote: =20
> > > After merging the tip tree, all my linux-next builds took signficantly
> > > longer and used much more memory.  In some cases, builds would seg fa=
ult
> > > due to running out of memory :-(
> > >=20
> > > I have eventaully bisected it to commit
> > >=20
> > >   cdd28ad2d811 ("READ_ONCE: Use data_race() to avoid KCSAN instrument=
ation")
> > >=20
> > > For my (e.g.) x86_64 allmodconfig builds (cross compiled on PowerPC l=
e,
> > > -j80) the elapsed time went from around 9 minutes to over 17 minutes
> > > and the maximum resident size (as reported by /usr/bin/time) from aro=
und
> > > 500M to around 2G (I saw lots of cc1 processes over 2G in size).
> > >=20
> > > For tomorrow's linux-next (well, later today :-() I will revert that
> > > commit (and its child) when I merge the tip tree.   =20
> >=20
> > Sorry about that, seems we can't avoid running into compiler problems w=
ith
> > this lot. The good news is that there's a series to fix this here:
> >=20
> > https://lore.kernel.org/r/20200521142047.169334-1-elver@google.com
> >=20
> > so hopefully this be fixed in -tip soon (but I agree that reverting the
> > thing in -next in the meantime makes sense). =20
>=20
> Unfortunately, the revert didn't work, so instead I have used the tip
> tree from next-20200518 for today (hopefully this will all be sorted
> out by Monday).

And the rcu tree has merged part of the tip tree that contains the
offending commits, so I have used the version fo the rcu tree from
next-20200519 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/eh=D+yNo=dsM9t+J0nOsqNZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HhBkACgkQAVBC80lX
0GyBZwf/eP5pmzk52tkvFe6/zdU2wiaUPFpW9VQgO3X8cug27JSUGiBVj/vDEA0a
W/SrpF0X7TPgbI7/PAEXFQ7qBH1C+33BE0jxHHVtvDhkoK1URM4naTs5/bGsQ1Cv
XvswxAyz4U4TDsgg37JbcA93AJvk9qTv6wXC+I0dRKo+fT42HGT0HgquFEpIaaUu
C4sAxZ4ruE5DRbXrrBpy2mNvCyyBVucWoBon78GauaNDeeS5SRhJuR7BjSNKf2kY
F+uZMtlxDmU/QiAwRFsP2KfClftmtmxjzwee3TxDeqjdLBzPfDD1jQ34xr3Fi30p
wNEPym+6hrHFzfWCKWFMR4ZMfoy2QA==
=2LQB
-----END PGP SIGNATURE-----

--Sig_/eh=D+yNo=dsM9t+J0nOsqNZ--
