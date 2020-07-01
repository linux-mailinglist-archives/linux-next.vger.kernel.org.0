Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764CF210188
	for <lists+linux-next@lfdr.de>; Wed,  1 Jul 2020 03:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgGABex (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 21:34:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38313 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgGABex (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Jun 2020 21:34:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49xP0p6CHSz9sQt;
        Wed,  1 Jul 2020 11:34:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593567291;
        bh=3ukyBJG0kTFDpGGEh20Qlaet1jTzYAghsJP37TMFTYM=;
        h=Date:From:To:Cc:Subject:From;
        b=By1Sl2S8F6G5C8OF0ZazNkhaMynOSO3zS6U3UXlXhyoj6N7LS0uHDtGWwrC756chH
         gug3o/oMVwS2B3hx79kU74M/NDnJ9SmIT4HIBbDZl8kAaifPJT+JVI/8gduHbuLvST
         h/qbcB7jlZk4pHzXBatOcFwYVuxrd+drd/a0YYRJ6DNafJgrgAWYTucAYsSkkJp7h8
         qRmX5476NbVRwIBMSPmTUA9ZnxSXn+PoJUWf+bynRdE7LltxYFbZhSK6kMMQL+NYKC
         ryETccobByXdzLllCKldMNZE+XxP4yJlWvoQ8DbjLr0ABuQb+eIjMNJDZ0r3oPNfrY
         YwIdV4Ec7gVlw==
Date:   Wed, 1 Jul 2020 11:34:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Elver <elver@google.com>
Subject: linux-next: manual merge of the rcu tree with the kbuild tree
Message-ID: <20200701113448.3119f64f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LbbdNw.r9ne.vHhmNn7xx/+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LbbdNw.r9ne.vHhmNn7xx/+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/kcsan/Makefile

between commit:

  f7c28e224da6 ("kbuild: remove cc-option test of -fno-stack-protector")

from the kbuild tree and commits:

  2839a232071f ("kcsan: Simplify compiler flags")
  61d56d7aa5ec ("kcsan: Disable branch tracing in core runtime")

from the rcu tree.

I fixed it up (I just used the rcu tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/LbbdNw.r9ne.vHhmNn7xx/+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl776DgACgkQAVBC80lX
0GzUyAf/b6pF4g88e7Ygc0CBSiGjsiSuBCPQdWRXNWgkSmeii+0Cu3nBmIHVaQNT
BaN8HlMEk2wdKsjrZPqNaaSwamLeI3mpT5eS9tgkrL9VG2H/xGzvDgSVZ5TKMRmW
FKODItOD8FDK+PCjFduJMuqYPlAE/6RdGDpCd3Dk9S3SsqNNf9nqyfDSoGZg3P4o
+7yhdcy1Ir2gqfxOah9Y8kW6ImLrgRymgkFb41f39vxHESVVDyrste7jvUODHvoH
zTFJv7WF4Tl244AASgpg8NyZpkbE9GtQgAjJ0/SYdmbu+7WrODjvYEOqR6sbpLa5
ccXryN/SStERFQfVTOaWEq/ahPYmRg==
=IDEy
-----END PGP SIGNATURE-----

--Sig_/LbbdNw.r9ne.vHhmNn7xx/+--
