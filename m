Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CE64232A5
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 23:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236669AbhJEVHQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 17:07:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33059 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236662AbhJEVHP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 17:07:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HP98f2jP6z4xbC;
        Wed,  6 Oct 2021 08:05:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633467922;
        bh=vL2QHeNhPbZrBOQHl/4VANxWXSgXmKRcCLaEx2NpUKA=;
        h=Date:From:To:Cc:Subject:From;
        b=qlbWYiPl/ezLJV2B4hNzZhKSXjh9rsIxs+MOSQcp24KBaLCG7hSpGnQzBDC0r6iVR
         t0JYsSVc9uMjtXQGuMPZ5hRnpzx+jiEvqlW4QZvkuxbsZpRcQMlS5eg58vRmTk9CO2
         ExBlH3PA0/241tVSOlFxb51qLQSq7/q5eAn7GBiEBJRYlXSDZq8DSWfqR67lkFvCZd
         HO9MxUAe7b3h2rpEvJ3hV/ApX43Nx1jiFczgpiT+bDslnQLDPvbK7BmXi7GD6pXyaw
         p+mGuCpaumfq2xBsw3bjR2iBFmJglYUHTevO0tvApn2q2HtSFMkABweUdD/YJeXJCY
         5ryTh98rAYMkQ==
Date:   Wed, 6 Oct 2021 08:05:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20211006080520.1a7e34fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HTenxCkyTa48cNW6Qlazf2M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HTenxCkyTa48cNW6Qlazf2M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  7c4a8b989a99 ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
  5b340e7813d4 ("soc: imx: add i.MX8M blk-ctrl driver")
  592d47ea2f24 ("soc: imx: gpcv2: support system suspend/resume")
  be4756d4bb83 ("soc: imx: gpcv2: keep i.MX8M* bus clocks enabled")
  d0118b6be392 ("soc: imx: gpcv2: add domain option to keep domain clocks e=
nabled")
  68c3c82c034f ("soc: imx: gpcv2: add lockdep annotation")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/HTenxCkyTa48cNW6Qlazf2M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFcvhAACgkQAVBC80lX
0GyULQf9ELPhd4VOmHvi9m3nBhx9W2HqFiwKZQOFYW8ScPqEARJUqmphBQMNqWhL
mkLUa1UAoYCgSiA51QhpLYj62ogBlyjxbx7RVCrbTI8pbpwEI76ef99XN3nKfs5z
EXak4o3vs2Hymjer/J7SZpB5KFXX/xTRVxnkYYt9rFSwpg3kxAyFTbV0j3NtFBNZ
hAPstGDM49Oah6PxXKnHBtxaF77ZD652KEINejDvkFNShqa7ICYHi9+a+Gm8bcQA
Ub6pPWR30YWiXWmyk6eDdot+SnJZOC6YnPX94D9npbyJEDUkdSoS89jb7wa7i0os
IbFXRNms8KNF4U222NOgsy/alAuDvA==
=pxL9
-----END PGP SIGNATURE-----

--Sig_/HTenxCkyTa48cNW6Qlazf2M--
