Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065EC1C7B38
	for <lists+linux-next@lfdr.de>; Wed,  6 May 2020 22:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgEFU0M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 16:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725966AbgEFU0M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2020 16:26:12 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF764C061A0F;
        Wed,  6 May 2020 13:26:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HSlv14w9z9sSW;
        Thu,  7 May 2020 06:26:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588796763;
        bh=Wq1sglCpECUE4LQWE1MlgyBsf0dkPIun3z/nUibW79A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OZ0+mkHBbkdrqUfSPCt4D8ZHkbwIM7HvuuKh6jsSaGiljRzDQ6LaBaXmXRVaw7Brc
         Pm3+JMZs+dKRuDPqVUeVpxWG+LNHNjhBokz9QnrVsfa/GN9MzB5T8GXnNwBZ70VduY
         E6Ywmq60n/nRsOeGgTmmIatsb/gr8C+8dBeVDnmvVmg1pkyeaAWD7PsX0uIZfqlaX+
         GdiUm76lNXLvDsuDewAJH05U5kEFFuigsVA+RRprYiKtkMhN9g+73h3XqqaUrzMnV4
         W4im1wfNrP2/53e8qZARI2KkEd0i3WTuqPFnaqgBFIlDN9DgNcpYWwOy3FPr1BKCxd
         DYCRNBuoLzwWA==
Date:   Thu, 7 May 2020 06:26:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Qian Cai <cai@lca.pw>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Amol Grover <frextrite@gmail.com>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        syzbot <syzbot+1519f497f2f9f08183c6@syzkaller.appspotmail.com>,
        David Miller <davem@davemloft.net>, kuba@kernel.org,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "paul E. McKenney" <paulmck@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next boot error: WARNING: suspicious RCU usage in
 ipmr_get_table
Message-ID: <20200507062601.7befefa6@canb.auug.org.au>
In-Reply-To: <20200507061635.449f9495@canb.auug.org.au>
References: <000000000000df9a9805a455e07b@google.com>
        <CACT4Y+YnjK+kq0pfb5fe-q1bqe2T1jq_mvKHf--Z80Z3wkyK1Q@mail.gmail.com>
        <34558B83-103E-4205-8D3D-534978D5A498@lca.pw>
        <20200507061635.449f9495@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3_bheHXWx0/2aPnk1_GNESW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3_bheHXWx0/2aPnk1_GNESW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 7 May 2020 06:16:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi Qian,
>=20
> On Tue, 28 Apr 2020 09:56:59 -0400 Qian Cai <cai@lca.pw> wrote:
> > =20
> > > On Apr 28, 2020, at 4:57 AM, Dmitry Vyukov <dvyukov@google.com> wrote=
:   =20
> > >> net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!   =20
> >=20
> > https://lore.kernel.org/netdev/20200222063835.14328-2-frextrite@gmail.c=
om/
> >=20
> > Never been picked up for a few months due to some reasons. You could pr=
obably
> > need to convince David, Paul, Steven or Linus to unblock the bot or car=
ry patches
> > on your own? =20
>=20
> Did you resubmit the patch series as Dave Miller asked you to (now that
> net-next is based on v5.7-rc1+)?

In any case, I have added the 2 commits in this series to my fixes tree
from today - I will remove them when some other tree has a solution
applied.

--=20
Cheers,
Stephen Rothwell

--Sig_/3_bheHXWx0/2aPnk1_GNESW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zHVkACgkQAVBC80lX
0GxLsgf/Vo8OYwv4P130G27YQELe63LWR7o96Sr6Hy50NY9rRaTPyVtB7ECwggzX
5HDq2XXWJKCV0B/raqNIEWN34adieKh1lVwZmo4koK/DAKoCcujuPkdjFWycSI6H
0WLiX3Nq1nunOhfNW0SlXAn/qa5LCjD+W2lQU7/fExL8K0l387c9i+9Aued2Ngf0
4xqCsuv+gPjIvxsWwDRE0voZRraCwxp041MPzVWEYqOYXz3pIHhlyN2Mct7XYcjP
JocSNu4Jumqr20kx+9AFW7WgXNFP7R1WWottfA6kZpQLxBjEIu14PDj0m9uEftvd
NeqBa/tXmGWPHCYuJqqDChRNh2e9Ew==
=gHSw
-----END PGP SIGNATURE-----

--Sig_/3_bheHXWx0/2aPnk1_GNESW--
