Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B7537B19A
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 00:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhEKW0I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 18:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhEKW0I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 18:26:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DE2C061574;
        Tue, 11 May 2021 15:25:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfstL2MK7z9sVt;
        Wed, 12 May 2021 08:24:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620771899;
        bh=eg3dusZ+Nto5rmGgc1s+6T8TBTKlakxJgp0CS+0cmPs=;
        h=Date:From:To:Cc:Subject:From;
        b=AuGkIDLtHld9JWQFs/UeMRXz/mk4s8MJow7PsyBN4mz/U5fAyF9oJ4ScJku9OdS+3
         EHriZIjIbUkP1MGA8V7D90ba9C6R9rZzh91omJdzsl582UuOyf9VxMGRVpA7Uy4kmv
         0tTuI6LuLWpr0CcVNYOkoVRNLeo68QRWvQRq9s7sXeZrFMGXdj1i4hCdyCGx/DI1jj
         ah1ugxe0vqbvw3ByMeqKis00AnSWp4s7IXt6Z4gp8O7kizZCeXLaZXF9W9AETQ6HH2
         z9ePSRz8tVlxOK5B+YQ4SKjFxVkzBQ15l2rPvNg8+2CAODygROjaIbH09VtCosuODI
         8Kj0xCt1a5yqw==
Date:   Wed, 12 May 2021 08:24:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the spi tree
Message-ID: <20210512082457.370f3062@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sKua6nEabQTi=W5Ug.58v5E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sKua6nEabQTi=W5Ug.58v5E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  86b1d8ecb5f1 ("spi: tegra114: Fix an error message")

Fixes tag

  Fixes: f333a331ad ("spi/tegra114: add spi driver")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/sKua6nEabQTi=W5Ug.58v5E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbBDkACgkQAVBC80lX
0GwlEgf+Mhb0yB37TQwroNCByA5r5JxqoZgVEIZ4arFFYZE8sRo8In6eQ/D2QGgh
JBaueFCSs4zr46qIWkEsA8F71RiWuPDNEyTCiMi3H7u1xCmMWA3h0vfVtev7Yo9i
13iLtt25ovWeHw0V+n7T6H1963QqFoBJ1txT5nmxdmYgCUVCuAjkW0Bks4uFjEMj
LDyMeoQETxrsK2SlUy0OrDTNiXnfk5ardpHN+Eqm3t4qv+c89zKVZVzL4eq1UMYU
JPpdPSgsdwbpBluRxge/MpZ2YmBhhzgselxYylF40XwyCkIUATG+lVFz6v04fASp
MdTC0HRxecUMSoIP44k9zBxYSnyuEA==
=c/eO
-----END PGP SIGNATURE-----

--Sig_/sKua6nEabQTi=W5Ug.58v5E--
