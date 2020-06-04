Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6A31EEDC4
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 00:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgFDWhT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 18:37:19 -0400
Received: from ozlabs.org ([203.11.71.1]:45293 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgFDWhS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Jun 2020 18:37:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dLHw3mX2z9sSJ;
        Fri,  5 Jun 2020 08:37:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591310236;
        bh=C2mPrjZW5spl9pNtMe+LHqh77Ct8qznvaw9r9mc0xNE=;
        h=Date:From:To:Cc:Subject:From;
        b=ZpWBi1fiQGJn/EgEX8aiX5lB3zWrsm9t97v/xz1riyF0ni9MXA9PVcuwNll8JCjk8
         ZnOhJ417QAnynI22Dpr3Ne5EP1cVg7tOWrdid7cv+wLJ+WJg1TeDk9p+zcm/SzfvFs
         swuubwBP/H6Nl+swYcTWYvMNTr76PEF7swdmDruzm41dJxLf6R8UzhO50qpwfNz3Fl
         OLezvrkureNSiBlhnp4B+MJKXeuAgMa/a0vKj0ZoDj4rowwtotwFtdODd3ryajX6SO
         C7lC9MhLk4fIof4vFmYxCzOFW5s+qYfHnxXc3p8txTvyKYOMh1cRm9Ye/ZLvqZRP/I
         /ghnQjPy4ZJpw==
Date:   Fri, 5 Jun 2020 08:37:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20200605083715.1a6c29ce@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9/.eRZ7rhdTdRkf4S8x/Dhj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9/.eRZ7rhdTdRkf4S8x/Dhj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

kernel/module.c: In function 'do_init_module':
kernel/module.c:3593:2: error: implicit declaration of function 'module_ena=
ble_ro'; did you mean 'module_enable_x'? [-Werror=3Dimplicit-function-decla=
ration]
 3593 |  module_enable_ro(mod, true);
      |  ^~~~~~~~~~~~~~~~
      |  module_enable_x

Caused by commit

  e6eff4376e28 ("module: Make module_enable_ro() static again")

This config has neither CONFIG_ARCH_HAS_STRICT_MODULE_RWX or
CONFIG_ARCH_HAS_STRICT_MODULE_RWX set.  This failure was hidden in
linux-next due to commit

  db991af02f11 ("module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRICT=
_MODULE_RWX #ifdefs")

from the modules tree. I have cherry-picked that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/9/.eRZ7rhdTdRkf4S8x/Dhj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Zd5sACgkQAVBC80lX
0GzgiAf5AYMgODfx+jFXqWYVYpHuplHsNBiS9KiFhWOjH1vF+FeM+qyDdC3/RhWa
eR2tK6ffnkCV/44yY9h5UMY/LBUVa/nEniBd5P2LDg88MV95j61E2CsCK57TNwAd
sdTWghV5InfBDvPjfvNrSUQGkUoa8NokHb24BFhAZFAlorWRyP6gXlGSV2sgZAju
g6/X1GPENidChAFeBI1suBX24DOnNSdpX4MY8lfX50eUHloL8H/Fk7bCqnQF1vHf
6RSU65gCoXO0TPPyWf3KyB6WG5coezBZ6M4JQw+M0fyxrqEnHCv661UIFDrGkoUe
VMR9L/pTlvF6EH9SBU9jtrC+xlj9/w==
=9MAn
-----END PGP SIGNATURE-----

--Sig_/9/.eRZ7rhdTdRkf4S8x/Dhj--
