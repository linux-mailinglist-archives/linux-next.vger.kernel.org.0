Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C832C4ACE
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 23:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387477AbgKYW1P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 17:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387474AbgKYW1O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 17:27:14 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77069C0617A7;
        Wed, 25 Nov 2020 14:27:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChFqw0tYCz9s1l;
        Thu, 26 Nov 2020 09:27:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606343231;
        bh=GUGR5Jb8Ps+88ArLoeZmH1zDG+KVi5x+k26h13IPYMk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g1pirN09gNiwxEEWXFWtM6XXCfRSEZodmwmj2GpiJ+myjXn/YMmB9k3cyILlamCLi
         bmY9C83SDEGFCl+Pb272tI+frmHayU6vskvaqloRwr5MimnqTf36bNs+AmtPcQFG22
         ZQr1VzNH8Rl5la+yj9rlqK202fH8M8aWhiCpSmL7my2bUDfz/c2ae5b2UIVpE+m9Ol
         CI5V165pB8HM3pDnT9lWZ2RKTNsYXJ6e4ci4GDlpKRF0Kys8GxCmCYFvsgOaB10HLF
         YXCTXDXlaYaPGcV3uBfMMR7KWH1dIR4GXium2UYixGcCoyWaJLeVkFD4a+BI7kKkkt
         TuLGVImotOImw==
Date:   Thu, 26 Nov 2020 09:27:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Lorenzo Stoakes <lstoakes@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hui Su <sh_def@163.com>,
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <guro@fb.com>,
        syzbot <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/memcg: warn on missing memcg on
 mem_cgroup_page_lruvec()
Message-ID: <20201126092706.1e06aa08@canb.auug.org.au>
In-Reply-To: <0918d6f5-8459-7b5e-82a3-6c9792d17433@linux.alibaba.com>
References: <00000000000054aea005b4d59e71@google.com>
        <20201125112202.387009-1-lstoakes@gmail.com>
        <0918d6f5-8459-7b5e-82a3-6c9792d17433@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S1QJfwUbyxzDCF4y6WxxMQm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S1QJfwUbyxzDCF4y6WxxMQm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 25 Nov 2020 20:15:11 +0800 Alex Shi <alex.shi@linux.alibaba.com> wr=
ote:
>
> Acked-by: Alex Shi <alex.shi@linux.alibaba.com>
>=20
>=20
> =E5=9C=A8 2020/11/25 =E4=B8=8B=E5=8D=887:22, Lorenzo Stoakes =E5=86=99=E9=
=81=93:
> > Move memcg check to mem_cgroup_page_lruvec() as there are callers which
> > may invoke this with !memcg in mem_cgroup_lruvec(), whereas they should
> > not in mem_cgroup_page_lruvec().
> >=20
> > We expect that we have always charged a page to the memcg before
> > mem_cgroup_page_lruvec() is invoked, so add a warning to assert that th=
is
> > is the case.
> >=20
> > Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> > Reported-by: syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com
> > ---
> >  include/linux/memcontrol.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 87ed56dc75f9..3e6a1df3bdb9 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -618,7 +618,6 @@ static inline struct lruvec *mem_cgroup_lruvec(stru=
ct mem_cgroup *memcg,
> >  		goto out;
> >  	}
> > =20
> > -	VM_WARN_ON_ONCE(!memcg);
> >  	if (!memcg)
> >  		memcg =3D root_mem_cgroup;
> > =20
> > @@ -645,7 +644,10 @@ static inline struct lruvec *mem_cgroup_lruvec(str=
uct mem_cgroup *memcg,
> >  static inline struct lruvec *mem_cgroup_page_lruvec(struct page *page,
> >  						struct pglist_data *pgdat)
> >  {
> > -	return mem_cgroup_lruvec(page_memcg(page), pgdat);
> > +	struct mem_cgroup *memcg =3D page_memcg(page);
> > +
> > +	VM_WARN_ON_ONCE_PAGE(!memcg, page);
> > +	return mem_cgroup_lruvec(memcg, pgdat);
> >  }
> > =20
> >  static inline bool lruvec_holds_page_lru_lock(struct page *page,
> >  =20

I have added that patch to the akpm tree in linux-next today as a fix
for "mm/memcg: add missed warning in mem_cgroup_lruvec".

Andrew: the original patch is here:
https://lore.kernel.org/lkml/20201125112202.387009-1-lstoakes@gmail.com/
--=20
Cheers,
Stephen Rothwell

--Sig_/S1QJfwUbyxzDCF4y6WxxMQm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl++2joACgkQAVBC80lX
0GwWMQf/Q2aM02yswn7APiVTNxVOArueh6QNTpAd64O6C4UYV/xVXE610PTdiN4B
78pvnV2eMWZNH/UAPxP8/DeVS2ScDF5CGdlHEbWxBmQNyzpsIJzodLvZBJPiC5xp
DItXhuE6su028Mpdm+SElzk6OOhWwhVP+2ktPVKeUFJSfmxJcjgf3uO7y370Ywit
Zs6BKxGMLzrqfGGfR4p7s0yGbUpOydXP8gFkp1gg8KcgvxjtFzm6eIF8KWBp5MxM
Fr2R5Y+2mIhu8fW1NTuOwPgIf/+FTm5g3YZI1b4vqCEyzcn6Xs2nuWlaRZqUHq4B
auVlC1NCh5E/S6bB30xlDxiKSgNK/A==
=Ltrr
-----END PGP SIGNATURE-----

--Sig_/S1QJfwUbyxzDCF4y6WxxMQm--
