Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034CB2F04CE
	for <lists+linux-next@lfdr.de>; Sun, 10 Jan 2021 03:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbhAJCZP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 9 Jan 2021 21:25:15 -0500
Received: from ozlabs.org ([203.11.71.1]:57007 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbhAJCZP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 9 Jan 2021 21:25:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DD0z46vFPz9sW4;
        Sun, 10 Jan 2021 13:24:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610245473;
        bh=zjghzu5Wt9VrmQ60QHmu0Kr+lXituQFwYruEZJtrx/U=;
        h=Date:From:To:Cc:Subject:From;
        b=DAT9jPGRP2m5vx0sxgh7wasyKvN1S6/fqyJzyMXY7+owVAPYal9XMA7ig2zkOPtUe
         37yoUi8XtOBgHvZMpa8VR8/A6nlGtGYWQf/sTrMK9WFHhDAe89Oz2ZD1d+ZhZh8wo7
         l7NU1RsQWL7uGYWws1u7t+ZMN0vX7UtUjDRS5sPad3y1NWKAbfAhboKfn77t7gwPav
         aEXfqXa52/fNZUNLRnC4WwsGhgI43+Z7cjslzPfgLD7WzvxcUpeTPJsyB481RnoIrb
         +BzX3cRXAO3WNpN2DmDf6b0TFEpIeoyPMpQ3rxagKPS7v3fEfvuvSyyaxhqd9QWSf2
         eye1Ir2SSeXmQ==
Date:   Sun, 10 Jan 2021 13:24:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20210110132432.7eccaaac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iuQhhoM46Vkk4s4AQ9Cdn6E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iuQhhoM46Vkk4s4AQ9Cdn6E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  cffdc9c7c24c ("EXP sched: Print list of runnable tasks in the current rq")

is missing a Signed-off-by from its author.

Paul, remember the rules for -next:

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell

--Sig_/iuQhhoM46Vkk4s4AQ9Cdn6E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/6ZWAACgkQAVBC80lX
0GzZeQf/VHN/ZSc/QG8TLsjmwXcQ3z0bKiIgM7VzCK/qivKsAzt2h1dqXBh/Q3l+
XGPuSimoIsNiv+U9QVf5ucI7Q+EWYTI4YBYTeYUkZb04PyeEgitsCVQq7QTs3yEr
yWYvNmjuCNBpj3vLeWc2p7jpv9wd8svJhjQx2/kJ5ylndsH9MiFajRo5hh/oKyaj
K3Q2zukrfajk1sJ0m9LLghWcbfjnJbIE4Qes9tS6oudoDj39T+QeKxioT61qWvWe
baPts30SdMVwH+jrnw9N/YsRUzyNJWA35FU6MotNrlweyUoJ46fuuCfBOR1oLv91
gNgTwxBhjt0Cq1gWP70ad6pUgMGG2Q==
=WPya
-----END PGP SIGNATURE-----

--Sig_/iuQhhoM46Vkk4s4AQ9Cdn6E--
