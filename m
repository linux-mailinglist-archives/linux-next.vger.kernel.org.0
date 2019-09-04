Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66532A954C
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 23:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIDVjg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 17:39:36 -0400
Received: from ozlabs.org ([203.11.71.1]:45437 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbfIDVjg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 17:39:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Nxzp1JR6z9sDB;
        Thu,  5 Sep 2019 07:39:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567633174;
        bh=Nkc0HkYO/x0RTv0Alngals51mJgcrSX+X+cmXRsFX4Q=;
        h=Date:From:To:Cc:Subject:From;
        b=L6nO0WxcEpwQPWOzj753nKDQDuXP7dgWWe8m3pebiJQqHvcl8mzSMCJdFVtsTaOfN
         JCDfl0ERKIUnR1bWOMnky3LMf5wZzFnmQn0/4t8dOx0anJ2aXtQkJc45ueTC89rCTP
         PKHnb8e33Jp8PifITe1kftv3idyEW6eYib/sft/yTcO5TrsMmuvMhlKfvwxJSBtz82
         lBSQm/GV1qYKLNL8nBumF5em/9Fy7CkgDvnxG/fRHdqP+xRUqllpemn2OO+JYI1F5R
         MR9T8zKoDzRQ1XcYbmeyLIGRlMbTjjLvCx6FEz9efRV9NiMN5PJSbLEoDLixSXGH+G
         1lfw3FIHnVIew==
Date:   Thu, 5 Sep 2019 07:39:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ext4 tree
Message-ID: <20190905073931.642040db@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n+F5DPF.84nTp=gmxp1S+eV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n+F5DPF.84nTp=gmxp1S+eV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  520f897a3554 ("ext4: use percpu_counters for extent_status cache hits/mis=
ses")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/n+F5DPF.84nTp=gmxp1S+eV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1wLxMACgkQAVBC80lX
0Gy4YQf/WNd1yRKkMO3FjbneNAOYtXwzvBFUH0ikK0SoVvX2JyOujxH796T1UFs0
N9r4Gl5beCGWeRaLiZ1krII2ESUmR8aVsNz0WN4rVhNYojUSdUNFBSwjOs6VZy60
S0qGoGyqPHHCSMiXppQGud6fltRKJBaL80k86wnf1qn3WrLJpKY5Tiumo2UJYleS
6yb6kBTdYSKfyM+y20/t9sGVl2mT44L5FAxLR47rfzyT8ORBXWQfFX8dug/UyFiC
dyP7lwx/QG6QuEfzv+PpKld1YuhsIW7c2ZxbuBANOhSNy0OyzfdSCtbs+rfWiBfr
ipgqK8fAlTzzCdX7NeWIk3A/bwCX9Q==
=1y0J
-----END PGP SIGNATURE-----

--Sig_/n+F5DPF.84nTp=gmxp1S+eV--
