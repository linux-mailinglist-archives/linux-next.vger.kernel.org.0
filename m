Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD062717C8
	for <lists+linux-next@lfdr.de>; Sun, 20 Sep 2020 22:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgITUJi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Sep 2020 16:09:38 -0400
Received: from ozlabs.org ([203.11.71.1]:34437 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITUJi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Sep 2020 16:09:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bvdvg0WYXz9sSn;
        Mon, 21 Sep 2020 06:09:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600632575;
        bh=dzLxHm43q2IqUU0qtn5Z8UjyY8ns7S4FloU9chYv81Y=;
        h=Date:From:To:Cc:Subject:From;
        b=e9ewhvbnOHxz07YFroaw765Hid9z5UKHcfXrxVK7YCXPgDZ8yFzB3UVqAbYO1xaDX
         h+sJm82qVDVrSH0CeX3jZN2rUUQ0Dq5Tla9NB33KM6snyOs9OA5OsQ3Ej5FmkRVtrx
         +L6d4j+HDvp1ty66BaSFFedWf+Wv0QZcFNgBh9mMVNN40NL0hySVKECuuzGunP+66g
         BdSt/puj2N/21ZBuXbU4gSUmvaxtjUHUUVVepzbBd/D/0CVbIommjFs7NH7g/cEYkJ
         wtp1/ZqOdcgl0E/1c8OCqH6nnJRfgXkHSynhqZTtIG6dOwW2P2MWsNiPnJSwPucN6m
         mgMSPOPM9ZiZg==
Date:   Mon, 21 Sep 2020 06:09:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20200921060934.7b1a4021@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+iLdp9gw1sVYiPtoacQLMLk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+iLdp9gw1sVYiPtoacQLMLk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  aa4796e18397 ("gfs2: Fix bad comment for trans_drain")

is missing a Signed-off-by from its committer.

One of the traps of rebasing ...

--=20
Cheers,
Stephen Rothwell

--Sig_/+iLdp9gw1sVYiPtoacQLMLk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ntv4ACgkQAVBC80lX
0Gw0kggAi3DBr9MyKAH3p7sz3mRLk4/NVAQf0qiauF7ssdDARex5VDvFNs0QkriN
HvjA9NfgCPpgrb5JcSgzH5PapLtfHWeJt9eU/eA0NSHMo6IRZ11H9EBAHdvFKeA5
e6L5bdNBav+rXayDWEr9OStURMn4vjPVtqiN1uQwwh6FPkZGKkl6T9j2A9SeOYcU
IutGgK4IcbOM/S0J3iWkBsU+jkzcOJmZXSAv66nLMs9PtNfSzgtgAoQd1aXRH1g1
e2JTPLEuvllIyc6p/lqIjUUKBKiu5wcB29+COsSdLOFLCwreWtWCsYSG5LI2vPR/
fCn8uSMJt390pzg6Ws2P2U2SmwOB8A==
=JNqK
-----END PGP SIGNATURE-----

--Sig_/+iLdp9gw1sVYiPtoacQLMLk--
