Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2466514043C
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 08:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbgAQHJM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jan 2020 02:09:12 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41785 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbgAQHJM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Jan 2020 02:09:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47zXH93XX5z9sRd;
        Fri, 17 Jan 2020 18:09:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579244950;
        bh=hkDVEvnVrmeAFNUKNofyyOq6lC5b2ZpNBu3ZZrmArgo=;
        h=Date:From:To:Cc:Subject:From;
        b=Xcv27WJ0dGjZYHmzjoLCL/lOhmlsNLiwu17andBxyxlOUfacAP8LKTo8c3e8u4KmM
         JU+RMeHzNRpiWB8o5YYlLi453iohed2DAmXk9B0ZL17avUtZCS0w4/lI1T/ESiC4cO
         kKZ3oiySmZD4k2zWX9sEjt5obBskcQbZSX4ziTHsle6pOGocgEcWv8DzeZ3swKw7oW
         AByzp+L7ZxTwl6536NHvwwE/d7xGoQh0nHy4B0x8rtlcLhkcJCVuBuua3b3uWLEJeq
         OWGR4bjQ6okhoFJzneDcCYti6CvsFn5CFCpFPWT1j06FtWH5BR8k6NWswgvpIX+n0v
         viGIw9VdIaKqg==
Date:   Fri, 17 Jan 2020 18:09:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Artem Bityutskiy <dedekind1@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Richard Weinberger <richard@nod.at>
Subject: linux-next: Fixes tag needs some work in the ubifs tree
Message-ID: <20200117180907.2e5cfb88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bxdP.u+XNFU2PKE8DSSq+4_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bxdP.u+XNFU2PKE8DSSq+4_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f5de5b83303e ("ubifs: Fix deadlock in concurrent bulk-read and writepage")

Fixes tag

  Fixes: 4793e7c5e1c ("UBIFS: add bulk-read facility")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/bxdP.u+XNFU2PKE8DSSq+4_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4hXZMACgkQAVBC80lX
0GwUkAf/fa2Z0NdtI3ovO8DzpRFShpHAqeYF4FoPahil2joxk28lqfVPNiFKfx90
WdKGK64MFTQ2a5pTBMS5lwIMKg/blR1ge4CRwQtSjuxH9gyKiEXPlTY3b7kLF/sh
hWdb5XLuJT/F/C77xrq5EhxCSqItzKNt0kA9uUyEm7Ri14LThtTs73tRrrUC/nn5
+G92Y4Eaf8NgkDkYdJW9cNzepzBLHaRhKChYsoWrY2NmfoCl11+HENSu4Z3mZfFq
IeDL745I3nmO3pXMjKGhX1xWcItiuhK/laj6fvahK85BE3Dx+r3ivkxho3XO5LF9
dIsGhUiTf7qcfNN0Q4juoBetpXs7aw==
=a0tD
-----END PGP SIGNATURE-----

--Sig_/bxdP.u+XNFU2PKE8DSSq+4_--
