Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61A716F0D2
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 22:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgBYVDu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 16:03:50 -0500
Received: from ozlabs.org ([203.11.71.1]:53599 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728315AbgBYVDu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 16:03:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48RryC5xCzz9sPK;
        Wed, 26 Feb 2020 08:03:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582664627;
        bh=HPqXkIn+MgJBZsNBSijjuS9LP2UjJf6VabZzx7IxYd4=;
        h=Date:From:To:Cc:Subject:From;
        b=YfFQpEC6yskyvsN3rUFpUb+aL7qEsfxAJZUqcb+uxaJHIpAueW5oH8oCKyPBRiZE5
         EH+qx69XzEdluP0I6BDE5CFpVmYok8X0HAx7h+GrJx8nxunlz/VTYL8UVRW5J9X3E6
         DwVeB71NfAnH+TFLJnOGSyZ9496GhoW5y12yZQuY0h/B/282K7nZ4DNHCEfnRGo2O1
         3me2eUZVJgIYHX3j/IRbC76mmhXk5C7HcZQgAmAL9xvNHojSyDCQ4DmKZs4TOFikEl
         htzDob37wsebS7czP0zRQ6gO/VvzPRUDFsq3q53VLaC8DdyDhdedwfv9BzmfdEe7Ym
         mOKjs/mSChzVA==
Date:   Wed, 26 Feb 2020 08:03:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: error when fetching the kasan-bitops tree
Message-ID: <20200226080344.609a0bf8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RfhLAwFap6JBP49g.cDIL9O";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RfhLAwFap6JBP49g.cDIL9O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the kasan-bitops tree
(git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git#topic/kasa=
n-bitops)
produces this error:

fatal: couldn't find remote ref refs/heads/topic/kasan-bitops

Should I just remove it?

--=20
Cheers,
Stephen Rothwell

--Sig_/RfhLAwFap6JBP49g.cDIL9O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5Vi7AACgkQAVBC80lX
0GxQVQf/ZELYJXfHaIlnuQoBcOBXpiu9R/+uBoefy+iIW5iQ65iG1HTsnqvON4RV
+t1DFr2TjuYdP6EXhoUP8gCt819b50ANkDqOdFUjma0y/HnIjRa6GO0F0S0EJ4JT
Zq5JlMIsEHtSkpVbQBCwVhL4Yr9EqfOblP3vlJ7QPFG9Tf+dGZ0AaJ96X64uPT5X
0VWRx9/1mmmTVYgqxva5D3+W03p7ZLk5eLaJp3jCsBED37zbBBO62dm9yzmIXhkD
0aMXF6+6WW/Y37OEoeEpGh7FIaxUZqnFk/4OsOHNLyvcPInYAgSuSTWryc/llAkR
OamAddC1woWVLDQc6LWDlNMHcIXr4g==
=Bbjl
-----END PGP SIGNATURE-----

--Sig_/RfhLAwFap6JBP49g.cDIL9O--
