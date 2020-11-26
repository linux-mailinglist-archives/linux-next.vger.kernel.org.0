Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0332C4EEA
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 07:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgKZGob (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 01:44:31 -0500
Received: from ozlabs.org ([203.11.71.1]:58189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbgKZGob (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Nov 2020 01:44:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChSsm6l6nz9sTv;
        Thu, 26 Nov 2020 17:44:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606373069;
        bh=z3BnwiRy6G/S1AQI0u25OTzCoTcSnq4cg8C3uNzwyN0=;
        h=Date:From:To:Cc:Subject:From;
        b=HmDwY1exd4aYeuqRmuxfuawv6aUCr9f9jc7spmZbBReI71xaMKemRIN3hbXtWbB1G
         ciiFOJwXp7nIO0HrP41Pjq0OItihUol0Zi18i6XWw5rIZrXzPm9oczXCywowJ3NjL+
         qedLi72ONP/nsOb1vkD/cyL2N9Ak6pDJteKpO2eSuKu8dp9X6BvmCim4l3j1CvRDXg
         PPuovTdqQ0IczRnBDa5cKisOaXTcgKiNc7ntetwENuQDBbKg4i0lMso1DsfgVFF9oX
         SNlu+qJ3FqWdq9WcR/bOMY3/rsCS6dw7BN+vLq0yLpPi2wHweY7EbFj8kefLCYK7+D
         gSgasrc1ngYhQ==
Date:   Thu, 26 Nov 2020 17:44:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the rcu tree
Message-ID: <20201126174428.675f3cfd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OJhJUS96dCJqZEmEOF_awR9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OJhJUS96dCJqZEmEOF_awR9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/rcupdate.h:872: warning: Excess function parameter 'ptr' desc=
ription in 'kfree_rcu'
include/linux/rcupdate.h:872: warning: Excess function parameter 'rhf' desc=
ription in 'kfree_rcu'

Introduced by commit

  beba8bdf2f16 ("rcu: Introduce kfree_rcu() single-argument macro")

--=20
Cheers,
Stephen Rothwell

--Sig_/OJhJUS96dCJqZEmEOF_awR9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+/TswACgkQAVBC80lX
0Gy2BQgApJ5ILEX8DH/qCfpqukSr0A5Qgq04CzdiDD44k0f0VcHvePlA6L5LAbsw
CfhAEljiQB8fe1/xDVavqv+E/5AXZi9H14i+CA+bQPTme9owM6oD1hX4S8qvLAxq
n2itY+TXL26/Gz5vg6w/g1GBtUwCxo7VmaLPgHD5yV8av15AdjXLyiqEUjtRTHj1
+MQqoJn57hYxAV+J5uimNMUDTepcS8zh4tArPa/XM/4h16bc1nlQVpNkE3LNVL85
g0csS3zC6rSNYfaKOObScMWYcvOwmA44v0Z23JLprgjuViYe2x5LOp2szyuBsLHs
yyJmIORwJOEUrcul5tuFbLJ8oUGOwA==
=JiKp
-----END PGP SIGNATURE-----

--Sig_/OJhJUS96dCJqZEmEOF_awR9--
