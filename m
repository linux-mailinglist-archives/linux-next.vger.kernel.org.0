Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB9E2F6B3D
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 20:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730091AbhANTkU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 14:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730071AbhANTkU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Jan 2021 14:40:20 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13B5C061575;
        Thu, 14 Jan 2021 11:39:39 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DGvlX0sCRz9sVF;
        Fri, 15 Jan 2021 06:39:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610653176;
        bh=QEr99U4zb6PHnEMZT5+uS65Kg/DMjvhILmdph6YIc4Y=;
        h=Date:From:To:Cc:Subject:From;
        b=tFE3DqebJdaunAFJIN3Ye98DpNoXfSmy46TKsX3v1C4UTcdHVUYItHXPzXKQpFda/
         aFgWFpCF9rXIahgxFxAeKw+IcJgCwZAcjuX/37m93DO9VKNCqmW7Vkb7lU8BOXjUZK
         WAQa28ENwWuololKI7TatciEslddJDpESiZf9vcxYZ0Y8YDZjYVB8q64aVgLfLsw0h
         LXkUzyUnTDPzFsZv/GRjjnZr7z/g1jAWvcjWVzkh3VSKudECY2FnOOB6s5S4zEa3B6
         e7n3ffHqVknSIc5XHXJikFWkwtRE3BX5Hk+X67O82gH5jbqbFZA4CTUqSWaawBh/SD
         Llx5klkPjNWHw==
Date:   Fri, 15 Jan 2021 06:39:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the battery tree
Message-ID: <20210115063935.30edd44a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B2CpmPI8FloriqCRCPv=n2V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B2CpmPI8FloriqCRCPv=n2V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e1cc2d7d3868 ("power: supply: bq256xx: Fix BQ256XX_NUM_WD_VAL and bq256xx=
_watchdog_time[] overrun")

Fixes tag

  Fixes: 32e4978bb92 ("power: supply: bq256xx: Introduce the BQ256XX charge=
r driver")

has these problem(s):

  - SHA1 should be at least 12 digits long

Probably not worth rebasing to fix.

Can be fixed in the future by setting core.abbrev to 12 (or more) or (for
git v2.11 or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/B2CpmPI8FloriqCRCPv=n2V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAAnfcACgkQAVBC80lX
0GwdQgf/X6PseRBlUJK0Gt3p+izISk/umGFarBFhmfObFojpCbxcYRAGVgkAGR6F
qSWzFjgsnwhsNv268Nn2IuWmgR/bnguxqXRHhA2yUtJXvvlQieN0W9e4SIGWwATX
F2KycuLj5RxyjHlvvezYV8Mqn13Kol9V6RntUPAb4CE9x5VUJsx3kSpRtPaZsdfg
SlRxruhyoqz7VjnbTw1Avea8bW6TorJrKRoKR4FT5SinLyHGVhDQY8TvEGMQ34O8
dFISwiyMoJcWOujxaLSjRT3WLT8NqjW78NGGDDiM1Zyw0iAlx1DEJMwBM9GbKMuF
hdf7bTUea7KOMKLRAue57FopvBBaUA==
=t4en
-----END PGP SIGNATURE-----

--Sig_/B2CpmPI8FloriqCRCPv=n2V--
