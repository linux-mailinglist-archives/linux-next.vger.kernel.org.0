Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFFA26E9B1
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 02:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgIRAAZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 20:00:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52861 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgIRAAZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 20:00:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bsv9L51KCz9sRf;
        Fri, 18 Sep 2020 10:00:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600387222;
        bh=av0Qkoc0K3cVyYRKgm8VeC/8t+na5neqYt0ktSZe2Mw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FVIk/YpYJNDnxhiaG1FK9+2PmUT2OI+2z/LjyoTmISErENIxMhbDcs2769iUTEW1R
         Y4GOA7qBbLtXBtxh5jScCN/Wc043tBwgcufbcpIxYdkNm6J4nKojM/3eAVgMUjVC7s
         DyAYwfuNQUjS7Yl+SrVsaWwpefPv4k6iElZWP8uiI0kc9uHdb4kUEcTjueIh1eel26
         JQQMz2RJuv+fwhPUiUhZ7f/NWhQ2pIWjqyIxdhCcwlatxyFEgyNhCnV/syMCSplHdD
         XDp1F7+sjSIjjCIBo9a9WO527LfdMbON8qsvHe7ma/DaOqOmsxyCcn3umRWIGH8dpQ
         V/AbmdCos+B+Q==
Date:   Fri, 18 Sep 2020 10:00:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20200918100019.6bf0053d@canb.auug.org.au>
In-Reply-To: <20200917220145.GQ29330@paulmck-ThinkPad-P72>
References: <20200917151909.01fa6684@canb.auug.org.au>
        <20200917220145.GQ29330@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DD0guL027BVH7Hlb/Q8mJCj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DD0guL027BVH7Hlb/Q8mJCj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, 17 Sep 2020 15:01:45 -0700 "Paul E. McKenney" <paulmck@kernel.org> =
wrote:
>
> On Thu, Sep 17, 2020 at 03:19:09PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the rcu tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > In file included from kernel/rcu/update.c:578:
> > kernel/rcu/tasks.h:601:20: error: static declaration of 'show_rcu_tasks=
_classic_gp_kthread' follows non-static declaration
> >   601 | static inline void show_rcu_tasks_classic_gp_kthread(void) { }
> >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from kernel/rcu/update.c:49:
> > kernel/rcu/rcu.h:537:6: note: previous declaration of 'show_rcu_tasks_c=
lassic_gp_kthread' was here
> >   537 | void show_rcu_tasks_classic_gp_kthread(void);
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   675d3ca52626 ("rcutorture: Make grace-period kthread report match RCU=
 flavor being tested")
> >=20
> > I have used the rcu tree from next-20200916 for today. =20
>=20
> Please accept my apologies for the hassle!  I believe that I finally
> have this straightened out.
>=20
> Please ignore if you already pulled -rcu for today, as I previously
> set rcu/next back to a commit preceding the offending one.

No worries, I have the new one.

--=20
Cheers,
Stephen Rothwell

--Sig_/DD0guL027BVH7Hlb/Q8mJCj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9j+JMACgkQAVBC80lX
0Gyzmgf/WMV4EFR23rztXLLazfHOz4zjdvzqRJUoHlfvpd/+H44UHEoBePPeabF9
hDs1JYEMGLRaDJB7qa3kTk+wx8Xf6/8aW6WrkdHNZ30JCw4HNJiJSSUT5zRUdxQ8
RrJrxk5rYFyA/lwJN2d5vyatMTtvyO+X6kVGrkp5xgeVsnGPfWVEtWbhCs6441YO
3Ipx1HAUCCUHrGIzpJao1D/H3fg2akT59cyn0sX808Y5cMJp0/KjhtDSR5c0hUNU
TWTUqgDa7e9ycC8yB4pLmgt8ZNTpCpys+dUshPeIW0VRa4BhYpXwkpaZtyurhk5P
+U74j4yRPsadrp1lkCgnoHpVaZImYA==
=JsXm
-----END PGP SIGNATURE-----

--Sig_/DD0guL027BVH7Hlb/Q8mJCj--
