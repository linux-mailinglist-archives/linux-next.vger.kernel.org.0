Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85CC1C9EC8
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 00:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgEGWxZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 18:53:25 -0400
Received: from ozlabs.org ([203.11.71.1]:59751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgEGWxZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 May 2020 18:53:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49J7zQ5Hcsz9sRY;
        Fri,  8 May 2020 08:53:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588892003;
        bh=bjOOtanshmPtcis3DwE+InyiVjX3681m9s9kVOMiMC0=;
        h=Date:From:To:Cc:Subject:From;
        b=d66q7XIG7+EHx2Hv+VyeyXFATWEqe+3B2ZbpZo5BK+uis3+TpHVwuwzs+2hgQ5EUu
         75mb1hMsuAl/wh2ssrMwHqTGFVxIixA6ipH34GQPrbZdowhkwG46p1g5uY9cNns4DP
         qER4nx9eDppqU11qIvHGce+YKw/wc0ELGjgjL1hfKy4tsygsvAPd2khjzjGz9DjV/4
         bi3vS46CrISOdOfHluUOB0AGx8yGQu41jjLSXv+4yjyUeiOKA0HfR2sqeZhHs3BuBA
         OngeihhcN2mvRcThow9uqp9tbBXoJ9WE1wP5Il29i09xHHBH6BPY4L3buN4ulSYlIi
         MctPP8QqvNUIQ==
Date:   Fri, 8 May 2020 08:53:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: linux-next: Fixes tags need some work in the omap tree
Message-ID: <20200508085320.58da9ffa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R0thPct+ecGr7jqJLj_4F2S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R0thPct+ecGr7jqJLj_4F2S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0f84d0247722 ("ARM: dts: am437x: fix networking on boards with ksz9031 ph=
y")

Fixes tag

  Fixes: commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode support for t=
he KSZ9031 PHY")

has these problem(s):

  - leading word 'commit' unexpected

In commit

  3a78c16f67a0 ("ARM: dts: am57xx: fix networking on boards with ksz9031 ph=
y")

Fixes tag

  Fixes: commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode support for t=
he KSZ9031 PHY")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/R0thPct+ecGr7jqJLj_4F2S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl60kWAACgkQAVBC80lX
0GynsQf/eAv93WMBJuy28pPmLTC3GcpUwAcvjPgzay0sN9HnAwNEhKmuLtU9dByD
o7bu1b4CHNYTGA/b2vmnsWAKgzKBFU/E8gtSaZ/WgGy2XYZkZOEkBMZjdkaqTjf0
PbmkU/NQs3hr+PgJlaGWsoHCaetWCKlNsFClj8WUwLGxVbAVLqP20QXaZpkISp8n
GCbWMK3MfW0JYR+wzsFBWRCzZfD0HgZDkpO8/+kP6D+hqI/KXkobDHcIuUn+psYJ
azb+8ezEvdKiGvFN9ajngy1X1v8xXpD4PVWpUONFKO1yyMvSWe3mhBdC33d0FMHm
Gf09tAEMxObucDAnyi1KnDMKigjuwA==
=GPsj
-----END PGP SIGNATURE-----

--Sig_/R0thPct+ecGr7jqJLj_4F2S--
