Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6F01D2F9E
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 14:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgENMZn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 08:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726225AbgENMZn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 08:25:43 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63A5C061A0C;
        Thu, 14 May 2020 05:25:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49N9jv4YD4z9sRK;
        Thu, 14 May 2020 22:25:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589459139;
        bh=SNaosvZmQLb74ht8CoeiZr5UoAYQoZmsadhzR6qPBPE=;
        h=Date:From:To:Cc:Subject:From;
        b=OsggZylFxJKtKR6ijHuL73pkYmulpMoHp7uFf7lBoItNThq2WBaNAw9cnN+hHXZs7
         5TNND1xvBvRrcSj6Bt044YaRXDOLeP5JWpvpASGSl3/cKhrDkL7k+iTsBs9GumfwpO
         x6l3XOMRny1hgK90gxhQcNXQfVfRk6ovs1edA4C09MhgWfmSQLA/xY6lPbqofLvVxa
         laHY5xAAIs3mcgx2s6/whaKeEGGkQQ3eRiJJbJOyl7V7HsL908lm/PWzXysk1rvAd4
         /AmOJpQNIcg9bfFj7wrkWRRUcZZ/YZHG6iiI41HgVUzIXXN87Riyvn4U5uJMG0ZLX5
         vhSL2zxLDqPTQ==
Date:   Thu, 14 May 2020 22:25:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
Message-ID: <20200514222535.259cb69e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yxmulef2UZ=5ydp6gFs=GrA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yxmulef2UZ=5ydp6gFs=GrA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

This patch in the rcu tree

  d13fee049fa8 ("Default enable RCU list lockdep debugging with PROVE_RCU")

is causing whack-a-mole in the syzbot testing of linux-next.  Because
they always do a debug build of linux-next, no testing is getting done. :-(

Can we find another way to find all the bugs that are being discovered
(very slowly)?
--=20
Cheers,
Stephen Rothwell

--Sig_/yxmulef2UZ=5ydp6gFs=GrA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69OL8ACgkQAVBC80lX
0GylJwgAgal2EKER5HrmQVX1icexlogtPTFqKU4NbQrB//PuIMbF+c8g+bGC+wzd
LlYNDZCwRX7UcgVmxIluFCezF0STF2b+9K4hF6wo8kGf6Wbu1jCI2N1rd981RUrx
UFRPoTqtJh7fS6B0fJT1L0bOoh7jdxiW44FaTofkV0NJwuLvNYa8Ea5Xzy/2Y9fh
wMKgMpwgG+tWrm/dxsMfgEzEl54roe28rGqOQIjW1SWLDZrCWqBgxm8YX/DtvnFt
OmG6r0alA+odm24UHwVfryEpHo1RoNLMberziyKpGHORv0QVLNsxQHdjW56SfISQ
lJo435n2ElHkYEUp5COjMERxBLZFIw==
=RVHt
-----END PGP SIGNATURE-----

--Sig_/yxmulef2UZ=5ydp6gFs=GrA--
