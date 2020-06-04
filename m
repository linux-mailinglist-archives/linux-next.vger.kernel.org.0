Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5331EEE0E
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 00:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgFDW7l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 18:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgFDW7l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 18:59:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA6CC08C5C0;
        Thu,  4 Jun 2020 15:59:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dLnk1WW8z9sT5;
        Fri,  5 Jun 2020 08:59:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591311579;
        bh=Bx05GZchflhHQnQOpvVcbmHr7TTZhaG2nAlzy1wVUBc=;
        h=Date:From:To:Cc:Subject:From;
        b=dlZ0pqShKjK9Zi7zuiT1vIUL+AK6fEWoy7qz8UPwFk4pnzy6FdwLQxvewI6SOBMY6
         cvZaDJVQk052azHy+t/XvwPZtfVmlZ+EDRDHw5VLcdM5eaDwT+Fp2q8KUrlCURWTCD
         +lh2OIsHncBQebbTyQNZsRLBW30yv6Nda+109rNOxjMUhKJqpoIol/o3RjSj9v2EQG
         4qDuY86n0BF5V6gJH0PqIEYz1GPcjGn+mNPsfIQ/2XOjCrkwzKWcU2Q5PfICpqCm2T
         bcJu5ysFN+uXs563/WT56Eu6o4dkfWhTXfGCpKFo9lZpo+P8CVmf4iqPdU+FsDNtOJ
         f6/k6joXYyTqw==
Date:   Fri, 5 Jun 2020 08:59:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Denis Efremov <efremov@linux.com>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Message-ID: <20200605085937.4b3f1d96@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NMJVyTq9HgSG4eZWnmO2fqI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NMJVyTq9HgSG4eZWnmO2fqI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  arch/mips/lasat/image/Makefile

between commit:

  10760dde9be3 ("MIPS: Remove support for LASAT")

from Linus' tree and commit:

  1312a1e434c1 ("kbuild: add variables for compression tools")

from the kbuild tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/NMJVyTq9HgSG4eZWnmO2fqI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ZfNkACgkQAVBC80lX
0Gy0fwf/bZtuFR9IevBX1lzd+SwGeZU2MmMJMYpp2yxDSj2Bmr/Pyz7Elwcr2QjH
HFKo9n/2HIur5j7rgGYafwIqbW8ALZDb/o66hXVB+RORxUmxbwcWRUPIGeqyskVj
+Oqg8TAN6UuD4dtXhsjWTgEN+PBrc0j1ybEdwiSXamLsG8hxBzhLeVhxVVsbnWDO
FWnis55RHHMU5RovbYcaDfvojIgiy/zPg+Ca8TL0hvVR6Vv2BS9q0nfijmJa5CuQ
CgBkI/4jKY1SzcYo7sBigtDE7+ed1hEon66Y1GuBWJRZQ9tAKv8EMO0L7oWeLgV4
dQzdV/HWY9yO+QSzsTXPtu6f5dbV+Q==
=3H+h
-----END PGP SIGNATURE-----

--Sig_/NMJVyTq9HgSG4eZWnmO2fqI--
