Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8198E4422C5
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 22:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhKAVkC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 17:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKAVkC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 17:40:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB2FC061714;
        Mon,  1 Nov 2021 14:37:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hjmb970QVz4xbG;
        Tue,  2 Nov 2021 08:37:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635802646;
        bh=R2g6314wfI+jVPSGyFRnRf7F7nejhu40CD3isQ5N8wU=;
        h=Date:From:To:Cc:Subject:From;
        b=k3Ux3y9vbEW7IEAqyUKocxGMV3R1kmtOuu2r4koAa/I+BsjlXulISrG+3qNfUCzUQ
         Jx73Q7gm+Mc4cEfR6FuSTqy+2JtNY54yhrFV0UgsqqzwguwZT74/w03ma4uH4oZWPX
         9mEw+EUyoanJe6OW6iahxoo5lo/5LAyt19Estefr3ZPV1xyA8l91Psjxhdwr+9wDQf
         GSG/AfaNUBiDpCJ7GgNoCcH91cVUx+c6KBOzivL7QXQQBUXe8zBjhYu/P1jy6jagEI
         QKB34j3vLbhYrgMeSI7tPtRGiHFw45o39Zd/LwZE9rXQmzCwIDERE2BG2aR/pj34g/
         tS/EwIvTM1c5A==
Date:   Tue, 2 Nov 2021 08:37:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Tim Crawford <tcrawford@system76.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drivers-x86 tree
Message-ID: <20211102083724.5e6c8d68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//DJ/bDfAjnElL1rw2a5yVtf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//DJ/bDfAjnElL1rw2a5yVtf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7885061a10f4 ("platform/x86: system76_acpi: Fix input device error handli=
ng")

Fixes tag

  Fixes: 0de30fc684b ("platform/x86: system76_acpi: Replace Fn+F2 function =
for OLED models")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Also, please keep all the commit tags together at the end of the commit
message.

--=20
Cheers,
Stephen Rothwell

--Sig_//DJ/bDfAjnElL1rw2a5yVtf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGAXhQACgkQAVBC80lX
0Gwv0gf+Nun+98I4Tr/DpVp4BauomAbZptR4+AN4oN/MWAwfhW8tZF9Zu2ZYfZsJ
jAVpeHCAsk2F4CwmIXk8Bjl3aQoZn6SOze45m0tUVEoQZgi8ZUD0AkufqkesNQkI
HbGF0a87+v+YsjSrvAX6G3gA6nc96bm/SZEuz99H7Sju6Yt0Yh5p4ObCNyBCwzHk
hQl3vrizEgQP9paWTyAstaQSzV1qAZ/KJ0zwq6Pohp9kK4pSDVxuXcEd+Zi0u9CL
UNsoCCYDdjhqklGVTZk2EsouSQdikBhi5xegBdwjfC1nlYv73QypVJ5HpbLR2NKZ
SQgvwJzv7+/tfqRZJ97z5xvIrndw1w==
=DDUj
-----END PGP SIGNATURE-----

--Sig_//DJ/bDfAjnElL1rw2a5yVtf--
