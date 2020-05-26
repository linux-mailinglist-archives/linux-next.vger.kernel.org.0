Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6D01E33C4
	for <lists+linux-next@lfdr.de>; Wed, 27 May 2020 01:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgEZXdJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 19:33:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgEZXdJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 May 2020 19:33:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49WqyS2sVJz9sSF;
        Wed, 27 May 2020 09:33:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590535987;
        bh=DS33VVEi3a4rS6s4CNOcItabnFGhtB/uHDdXCzu4lUo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YOuIYaIiuYdbOb4zklo7nO1u90nFzQUgj1hECQGZxo3OlE98ttqDDcuL111D2xUvI
         qhKiXTCdbjz4qLyW2E/YjHGvRTpz0dIaGhaKXEjAJFIvjiSqWwfXcRcySI2rB+8NEu
         XVMRFk++IYuaduUnhhSAancSnmpXNYTV0vZyamr31dcoEoSlWQnnw/lieYRhFhPtNe
         /MumaBAJ5f2yDQRnmZ9aOCFMWnZ7fmN6XZn76w7N8MkoaqcsYqFK6unbOf9+8BR9iM
         D9Mm62YA5HCa0/ePenzfc8j6m2000ggXOv2UMk3U5WesFPR00JiJFwl1kgLp1+n3Vf
         tdikSjS0+Bixw==
Date:   Wed, 27 May 2020 09:33:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: linux-next build error (8)
Message-ID: <20200527093302.16539593@canb.auug.org.au>
In-Reply-To: <CACT4Y+ap21MXTjR3wF+3NhxEtgnKSm09tMsUnbKy2_EKEgh0kg@mail.gmail.com>
References: <000000000000ae2ab305a123f146@google.com>
        <3e1a0d59-4959-6250-9f81-3d6f75687c73@I-love.SAKURA.ne.jp>
        <CACT4Y+ap21MXTjR3wF+3NhxEtgnKSm09tMsUnbKy2_EKEgh0kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MXZV/pG4aCD+L.fsW4oaXcu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MXZV/pG4aCD+L.fsW4oaXcu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, 26 May 2020 14:09:28 +0200 Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, May 22, 2020 at 6:29 AM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >
> > Hello.
> >
> > This report is already reporting next problem. Since the location seems=
 to be
> > different, this might be caused by OOM due to too much parallel compila=
tion.
> > Maybe syzbot can detect "gcc: fatal error: Killed signal terminated pro=
gram cc1"
> > sequence and retry with reduced "make -j$NUM" settings.
> >
> >   gcc: fatal error: Killed signal terminated program cc1
> >   compilation terminated.
> >   scripts/Makefile.build:272: recipe for target 'fs/xfs/libxfs/xfs_btre=
e.o' failed
> >   make[2]: *** [fs/xfs/libxfs/xfs_btree.o] Error 1
> >   make[2]: *** Waiting for unfinished jobs.... =20
>=20
> +linux-next and XFS maintainers

What version of linux-next is this?  There was a problem last week with
some changes in the tip tree that caused large memory usage.

--=20
Cheers,
Stephen Rothwell

--Sig_/MXZV/pG4aCD+L.fsW4oaXcu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Npy4ACgkQAVBC80lX
0GzduggApjJQ+LNbc3K2h4h1mpk4aj6ZBHuwIH3/9GjMmkN39PXgy/+nGEX8t/RV
dr1Y0z3SOwHXefDtuhuIBN5/KiP1ljqMDkye/fQXCAoH37oZbDS4yfARAcy2xVdp
cb7iO9Ik9q0pfBdShRC+e+IybDlNyxvTveEhyWAuHGBmh8TyIV+LwUrJGhPjQYmH
mdNfIjNta+G5whnP336rLOWdInvLI6XK/J6FjqFQ+xJpmdzXp0daDTsZ5l8qAE0P
pD1VsVyfjN/G3eLqBAhZKclKjQjnFKJL8H+cQWgrUIJ2KDu0WURZKxC0XuF/aVKl
nNRkeHXhbeoA0loQqIrZjH1vs6wQAw==
=ussQ
-----END PGP SIGNATURE-----

--Sig_/MXZV/pG4aCD+L.fsW4oaXcu--
