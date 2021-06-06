Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9144B39D204
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 00:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhFFWuk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Jun 2021 18:50:40 -0400
Received: from ozlabs.org ([203.11.71.1]:40619 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231172AbhFFWuk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Jun 2021 18:50:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fys9r1G4Jz9sRf;
        Mon,  7 Jun 2021 08:48:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623019729;
        bh=awGXucHVI3y+7HShzGTa4yx0jdME2qw+Akoo9ojNQZE=;
        h=Date:From:To:Cc:Subject:From;
        b=rTsFE/bPxbyBaxcN8O16wmx64vclxJ1/Sl4/F9HdDCHP/BLmhHc1DBPAXZuvupLPK
         bRHiD/AbRcmZMf4ReUxWpO3tvOH/4kkkGUvCSYkEAwyE99oLzfMFZ3fFsFuhoqqY7c
         ZOg029O2/hr2KTRRYzVDshgqF5+6Ffq4ZlDzWm86K0vgRWz5fLRQdVi4m/EJAt/lM2
         a2JZuhRnlmLFu97leXbpmZPBebVtKoraBcfEoUH+oTG6k5SoS3EZyfQ5Z8iKR0w5ey
         EobxYx4EAc44cZ2bWIIZM+o0y3kRHWRVGxvTCgtN2Jp0BzE1DFxvnRdyJY0L/H81fH
         GiDreSApR2p6g==
Date:   Mon, 7 Jun 2021 08:48:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>
Cc:     Yang Li <yang.lee@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the cgroup tree
Message-ID: <20210607084847.34b4980f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9w7WsdYEgSHvr/WfUia.bYh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9w7WsdYEgSHvr/WfUia.bYh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2ca11b0e043b ("cgroup: Fix kernel-doc")

Fixes tag

  Fixes: 'commit e595cd706982 ("cgroup: track migration context in cgroup_m=
gctx")'

has these problem(s):

  - No SHA1 recognised

Please just use

git log -1 --format=3D'Fixes: %h ("%s")' <commit>

so

Fixes: e595cd706982 ("cgroup: track migration context in cgroup_mgctx")

--=20
Cheers,
Stephen Rothwell

--Sig_/9w7WsdYEgSHvr/WfUia.bYh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC9UM8ACgkQAVBC80lX
0GzLVQf8CmT5C9NFNZ+UQxyaO1VXruiVVtYouFRabrI+UQ4c91sU1+YEHB4f68vd
bxGwMHHmraRJxpmBRZ3+xmCNKRuHPts9kpNEYEvq8Vtdh+IPIb92Yfu5YQa5z9uw
+jjppp3Qqr5HIPmIceVtWDPUwbioN3PtdvjmdP48aKpyCSE1ekaRCq4XCZuJcnQt
yvy9RYpqzyR3DzTFCNJUuSMbIhl+8dYdcwNR8NijLABrokKG48Mwngao+ueZCQJn
z/aq4VMCSyfdRNl6FnjEv8BgdgI7X2KrU15m5YVx1/P0KsroOUie7QNctcJ8XuTy
HLrQ7a6IoSdt+oT/cWV4ezfTtJrV5Q==
=IsKx
-----END PGP SIGNATURE-----

--Sig_/9w7WsdYEgSHvr/WfUia.bYh--
