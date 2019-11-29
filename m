Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B49710D584
	for <lists+linux-next@lfdr.de>; Fri, 29 Nov 2019 13:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfK2MMF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Nov 2019 07:12:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfK2MMF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 Nov 2019 07:12:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47PYKG1PHqz9sPv;
        Fri, 29 Nov 2019 23:12:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575029522;
        bh=w+aopI9O2Dzyfr0nxTm4hkaf4KVgkKPxak3kfRPZys8=;
        h=Date:From:To:Cc:Subject:From;
        b=cYj5mokhYkP4R+179q5yrXtqQUIGGo4pRYLnC9cWnueUsZgZUsu2x27XdG6/ZnlxR
         iNjFw+pZIox0UepZkK6mqRF9WJCe8CcbfendITWlSzeKq2Jm10qMOYz2HJqLHKjEVp
         n6Mxu1E14o3O0+Uem1Dv7XRH/0hRglzQcaddNqWI7KhUjw6VNyVtzP2tImbLeEC62j
         Qj/QZBaa0synVMWPDUV3ebplJK/SjLGErOU7XoZpAwfpMRB71SYnZsojtB7D2KG2Og
         EeGhrUbjDwOtl/wif+wTJVm23UiqC0mLsIWGzPsDO8M4wDk7dU4P1lmc+SwyvjwRnj
         V/XeGvd8XmVog==
Date:   Fri, 29 Nov 2019 23:12:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the powerpc tree
Message-ID: <20191129231200.1f5ae2a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z+WSB/13xWh+vsrbuuRskKy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z+WSB/13xWh+vsrbuuRskKy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6f090192f822 ("x86/efi: remove unused variables")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/z+WSB/13xWh+vsrbuuRskKy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3hCxAACgkQAVBC80lX
0GxWpgf+M6hymsP96u6qxbCtaZhvWUaYrAF3CMJ0/eO5oU1+NHGDpkHCLb2wIy21
JHI94c6IYFklCeAB37hbLItrVVfQWiv62/6g5rxi12IoJkgqjw/6M5w7uBjukDIT
wjYp8SRHPtE2I4qbRWcu4hVv1GWh8fFoNTtQIuQXkJ5LOKKCYYl8RDNMSHVg5tUF
ECoP6CCSpfUzado8teE+N7Lri7h1YMxz9YHf86FEAuDwJK7VHxVDFAYlCDlK0Lxs
8YPz/fFOIB+OmhvkjOd0VxXGFrTCbu3W9RMpdNyvQ3b3yzm2wLHeFdnkwgjNIo43
o76HRB62p7LTHhA4ksSvF7q/+of/VA==
=R+J/
-----END PGP SIGNATURE-----

--Sig_/z+WSB/13xWh+vsrbuuRskKy--
