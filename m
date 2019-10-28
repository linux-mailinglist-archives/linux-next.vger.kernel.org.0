Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6461BE7A8C
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 21:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388406AbfJ1UyF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 16:54:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34841 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbfJ1UyF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 16:54:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4726QL0bwZz9sPK;
        Tue, 29 Oct 2019 07:54:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572296042;
        bh=uXKKtrWcmFDYYPlD9rtCWJrkQC/1ERmsfphevMt+2rA=;
        h=Date:From:To:Cc:Subject:From;
        b=ePA70cTWaCWaC5iIC0dCjwivvZMVCd8AIGsJFNMP2H+ftUdhk6qK2vW5iTOYfEN6K
         aehpd+aEePzjwINfeW1NAwOmBMpXQoZSLf3PQNEXGfNzEHTy7cqXYAJ92LtQpFuwzW
         yCsDYHi7IYtYRSCue4qkbQkUnzDR1lTeQkfZWBS8RdodEXgtdRyuFLEZOqT3a7mSsO
         pZnoyo3AbbKghiCokl5oZj6gg3zTj0PKaA1QYwEFznq4Zoi87A4IILhekNpS68AlzO
         qMPh1XwcuptYrVYvB4cVHUBLUzflVobsp0vO6geLE9ZIm4wAqEZRplYi/mNSM1cNyy
         0BfInhhl6BLEg==
Date:   Tue, 29 Oct 2019 07:53:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20191029075359.59d06466@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XFikfy265N.7f2E=MUAEpzu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XFikfy265N.7f2E=MUAEpzu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  51db3f987f62 ("Restore docs "rcu: Restore barrier() to rcu_read_lock() an=
d rcu_read_unlock()"")
  a0c1ba228721 ("Restore docs "treewide: Rename rcu_dereference_raw_notrace=
() to _check()"")
  8b3b77cca47f ("Revert docs from "treewide: Rename rcu_dereference_raw_not=
race() to _check()"")
  f7bf64a4ff9e ("Revert docs from "rcu: Restore barrier() to rcu_read_lock(=
) and rcu_read_unlock()"")

are missing a Signed-off-by from their authors.

--=20
Cheers,
Stephen Rothwell

--Sig_/XFikfy265N.7f2E=MUAEpzu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl23VWcACgkQAVBC80lX
0GzkYAf9FO/kSQ2duUsVOKJm/9fQbbyK/npZ6ZKOC6ix2hvEn/5CTOfyfFNmTipB
ttQZhQkDYCQ46Thxblq1zi/De5WZ6ZPsoCX+BGGyMl/spLUqyFWtVqeE8AgxTyKG
vNMZzkw1SjUhxc5vcrLrb7bJbCxTd3B2wX3QfQjEroKhelA5GZM9afuAXrA/WJ6P
kwmEZ6n4+TV+6FtfojcOpPI+8vSmz+989SCmykKOmwuM9meT64WFNHkzxvZI83Gj
ow4ns9u/yRCU3jVjxzWc6gi6tlhY/sizlFRaw6iD5lqJVXjB2NrhrD3JUnYOA7hU
c9b6AzvOrSAoxn8cyMPJ7pgHD4hQoQ==
=d3vg
-----END PGP SIGNATURE-----

--Sig_/XFikfy265N.7f2E=MUAEpzu--
