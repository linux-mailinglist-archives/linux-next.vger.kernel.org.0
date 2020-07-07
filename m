Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42272216706
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 09:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgGGHHY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 03:07:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50353 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgGGHHY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jul 2020 03:07:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1D5k1mTRz9sDX;
        Tue,  7 Jul 2020 17:07:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594105642;
        bh=YFll0k+1Vt7bPXu2cNXZ83E+LRuqAG/yRXn3e723MEI=;
        h=Date:From:To:Cc:Subject:From;
        b=GlLSCLYcozrY0F52Ew8GmekzuQmfgauvcuagF0U36zavUvT/7qe2Yidm8x0V4b+G+
         kG69rNoDBqEUeIzj9lmOs1mvcufF4z7detJWBm2LKOiXt0iZcZwuOPaowLoyQ/6oKa
         ySfzOBS+J9u98ZS5g00UnI4YxOlyMC/VVazoM0uJnmD9FsDDbny5uRzQMzwClS5lRu
         0M3St5twZzOL5OcLKTW0uosQIRxX47BjpKKnxPlioGp21atBUtMwkqVz2jPnFxjMlr
         LIFAEJfx4q0hRzsxwerVJQuLBAfmE4WwTR+95M5OeAdEWFNUJt/lzzYbXmwbyR+dNd
         p+T20FrJ1TTFg==
Date:   Tue, 7 Jul 2020 17:07:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20200707170720.55be721f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1_x2AQfpHF.Hf30awvJdm2A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1_x2AQfpHF.Hf30awvJdm2A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

cc1: fatal error: opening output file arch/powerpc/boot/dts/.ebony.dtb.dts.=
tmp: No such file or directory

and directory arch/powerpc/boot/dts/ does, indeed, not exist in the
separate object directory.

Caused by commit

  ea4679253288 ("kbuild: always create directories of targets")

at least, reverting that commit makes the build work again.

--=20
Cheers,
Stephen Rothwell

--Sig_/1_x2AQfpHF.Hf30awvJdm2A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8EHygACgkQAVBC80lX
0GwfuQf/Tv3Jg6172Jf23qpw/eFgrBRTlU9r27xFlxn0fGUd8yiJd5UGxa4Qj9GV
CGG+Ztb4OBN7fN509qlZZlkEkvX1Shb6BDKPl7/ut7rXyMhQDk2TRAw2hAPNNyTg
ti73/EgYeOI0Tcj0N6TlDFKz7Qr/Ei8Vrnp93Y/JZabdMW/D/cL1hFK/VWCeLfdZ
mqDYTqEjCq6p9My/XY7AOEaYCsEBQeQMBe7q0xUlBkFjAvgJoZAAd9vlwNQIoTlL
UCGbZW/7euyR4h126XVuo3RrP9jkHnw9Uizpa2ROap9HjTsmbUfUHpBgyQhnOG/D
uqNTwS7mr7KwbD2aUUrvOJs5SlmTlA==
=TKlc
-----END PGP SIGNATURE-----

--Sig_/1_x2AQfpHF.Hf30awvJdm2A--
