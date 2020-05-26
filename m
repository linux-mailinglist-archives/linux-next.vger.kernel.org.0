Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674151AEA8C
	for <lists+linux-next@lfdr.de>; Sat, 18 Apr 2020 09:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgDRHoD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Apr 2020 03:44:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgDRHoD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 18 Apr 2020 03:44:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4944hs26Dpz9sQx;
        Sat, 18 Apr 2020 17:43:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587195840;
        bh=lsX1LshwCZNrx62Bs3fV3s4Q0snTkCIhD6+87FUwWMQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=opKoWBpdo/QgZ8aFY5W8WY8DV0z2DUZi597rOnunTMmBL8MJjeziC6hQa82YBKgLH
         B0YQucMLdruk+v3O7E0wxuhPT9Y6uDznV/nqY9dbkc3kMv/Q7RNOp1cGYJCI+/+/5K
         hgpDQkBhLFV0VjGPPZmcr3asPJgYq0X9208TkjG+H9FSj9fcbrlvj4+E9FdmlF7EjA
         kvMrDnxANcNt1U3hrObY9LTClHzhfNEniNhytneYg4GGYOb5Asf37VZgJmF/3y2QYh
         OUv3fytDY6ksdU4LqWAtqxd1Vkj0q4Ta343YT4s93pamxzsul9+lBvwgUpa5Fs8hhy
         ZL+LYtGMzS+IA==
Date:   Sat, 18 Apr 2020 17:43:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        syzbot <syzbot+826543256ed3b8c37f62@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Cgroups <cgroups@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Vladimir Davydov <vdavydov.dev@gmail.com>
Subject: Re: linux-next test error: BUG: using __this_cpu_read() in
 preemptible code in __mod_memcg_state
Message-ID: <20200418174353.02295792@canb.auug.org.au>
In-Reply-To: <CACT4Y+Zfcs2MxD9-zR748UbkEpsV4BYjFgw1XgSqX4X8z=92CA@mail.gmail.com>
References: <00000000000022640205a04a20d8@google.com>
        <20200309092423.2ww3aw6yfyce7yty@box>
        <5b1196be-09ce-51f7-f5e7-63f2e597f91e@linux.alibaba.com>
        <d3fb0593-e483-3b69-bf2c-99ad6cd03567@linux.alibaba.com>
        <CACT4Y+Zfcs2MxD9-zR748UbkEpsV4BYjFgw1XgSqX4X8z=92CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5HjOiotoj/lOEPJeGW0.wVY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5HjOiotoj/lOEPJeGW0.wVY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Sat, 18 Apr 2020 09:04:38 +0200 Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Mar 9, 2020 at 2:27 PM Alex Shi <alex.shi@linux.alibaba.com> wrot=
e:
> > =E5=9C=A8 2020/3/9 =E4=B8=8B=E5=8D=885:56, Alex Shi =E5=86=99=E9=81=93:=
 =20
> > >
> > >
> > > =E5=9C=A8 2020/3/9 =E4=B8=8B=E5=8D=885:24, Kirill A. Shutemov =E5=86=
=99=E9=81=93: =20
> > >>> check_preemption_disabled: 3 callbacks suppressed
> > >>> BUG: using __this_cpu_read() in preemptible [00000000] code: syz-fu=
zzer/9432
> > >>> caller is __mod_memcg_state+0x27/0x1a0 mm/memcontrol.c:689
> > >>> CPU: 1 PID: 9432 Comm: syz-fuzzer Not tainted 5.6.0-rc4-next-202003=
06-syzkaller #0
> > >>> Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
> > >>> Call Trace:
> > >>>  __dump_stack lib/dump_stack.c:77 [inline]
> > >>>  dump_stack+0x188/0x20d lib/dump_stack.c:118
> > >>>  check_preemption_disabled lib/smp_processor_id.c:47 [inline]
> > >>>  __this_cpu_preempt_check.cold+0x84/0x90 lib/smp_processor_id.c:64
> > >>>  __mod_memcg_state+0x27/0x1a0 mm/memcontrol.c:689
> > >>>  __split_huge_page mm/huge_memory.c:2575 [inline]
> > >>>  split_huge_page_to_list+0x124b/0x3380 mm/huge_memory.c:2862
> > >>>  split_huge_page include/linux/huge_mm.h:167 [inline] =20
> > >> It looks like a regression due to c8cba0cc2a80 ("mm/thp: narrow lru
> > >> locking"). =20
> > >
> > > yes, I guess so. =20
> >
> > Yes, it is a stupid mistake to pull out lock for __mod_memcg_state which
> > should be in a lock.
> >
> > revert this patch should be all fine, since ClearPageCompound and page_=
ref_inc
> > later may related with lru_list valid issue in release_pges.
> >
> >
> > Sorry for the disaster!
> >
> > Alex =20
>=20
> +linux-next, Stephen for currently open linux-next build/boot failure
>=20
> Hi Alex,
>=20
> What's the status of this? Was the guilty patch reverted? If so,
> please mark it as invalid for syzbot, otherwise it still shows up as
> open bug.

The patch was removed from Andrew's tree in March and never made it to
Linus' tree.  I can't find how to tell syzbot that the patch went away ...

--=20
Cheers,
Stephen Rothwell

--Sig_/5HjOiotoj/lOEPJeGW0.wVY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ar7kACgkQAVBC80lX
0GwY4wf/aR9/b0Bn1zKRTAs8KTvlcg21lG6elnys8xvDaiOu5ZAA0w9dM3e+d/SG
lxroFSw0VID2lZkoSh8bIGx5RGyYE7xWKxKo/4OD8SmhUNiAF2+2C+DHtc84STNF
7eskFXQ6ccvwGKaQR+bEKP7hmFCQvPSG9U0VWmOc5BwJM/nyA4S65KQMOo8Wx5q7
XLFCLeYDTrL9lwTJXYjAJwtlzKu2pGqOlNaX5Sa7PO0HJAmX32vSehl4gQNcbygV
KDPMFnAEDD8hiQDk9/4p6PRx2M5xWh+53WJX9HNt/Qr1LUYyyZal3gTPLst+wJBH
d5poxN4kD1/w/D9hK+qukjB2ryevEg==
=bX7+
-----END PGP SIGNATURE-----

--Sig_/5HjOiotoj/lOEPJeGW0.wVY--
