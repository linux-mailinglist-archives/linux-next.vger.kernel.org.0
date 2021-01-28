Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBE4307F12
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 21:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhA1UCb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 15:02:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhA1UA1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2021 15:00:27 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51564C06178B;
        Thu, 28 Jan 2021 11:52:42 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRWN62qMXz9sSs;
        Fri, 29 Jan 2021 06:52:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611863559;
        bh=DUuGCV5ce7TwxbqP7aCiJ1eGJTGXNVhfnRNzRSR8moo=;
        h=Date:From:To:Cc:Subject:From;
        b=t/nkFk2SZdj/wRTzlZl5suI7sZvfvna97zc81jWuuDkPM9HHnu91HywA5RpHZuR+Z
         aumroeiQIY/OSK03DB0adW9WmPTMgLGsecOhR9muQ1crEv87/j2bhciYi3gfGbtDkV
         V9eqOv2a4WjgtIjk0C1fJUO5eZNEkrgjpOghNt11bA1v/sZehlI87hFpTjxx79yzBi
         KljxNIee6b+tW5y4xAE+vhU4CD19mb1ICe7SvfCueGhvQPA2bzjGbLHMXRzIsKYuIU
         ULIh8KmOGvIsjet1ltS2+Ok3GZBfV631d1nA4saNyO6iBfmNdD46JMrZVn5+wUhlOw
         FkJn4HKWxUgQw==
Date:   Fri, 29 Jan 2021 06:52:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: removal of the ia64 tree
Message-ID: <20210129065237.39b2bea3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/++R3vca69HTgv/DCS.37Kp/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/++R3vca69HTgv/DCS.37Kp/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tony,

I noticed commit

  96ec72a3425d ("ia64: Mark architecture as orphaned")

just went into Linus' tree, so I assume I should drop the ia64 tree
from linux-next?

--=20
Cheers,
Stephen Rothwell

--Sig_/++R3vca69HTgv/DCS.37Kp/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmATFgUACgkQAVBC80lX
0GzX/Af/QX1pglHkHNn6sj4zCbDVx6QCWV9KMz+kfnjf9DiRwu9QrbVvDPIkbzOi
c6nBsXQd9y0fk/+ms4OqB0zhXJB+JAxWjbOyL0tmMNKgWHRHHe5B11u9W9wSP4i2
lYnGfmZi44mGInm60Uup1jeHhdQap18RwHsadHgYvqiFlEDSRPoxN/MBUDdAdr91
/S02EySzQ69m991y1tTuOlEji34cnFZYKAzDy0BZJ6ZFcJ4yBPaHAiIuEmr19lso
Efy61EQJefUKbzp1JxpUrc/PepXylOmzdcCAt3D2mPfxL+gt3fpBOxoXUyAxAkjt
CPIK0UyK+WofwHH4Zmko8xQwrJuquw==
=DHrc
-----END PGP SIGNATURE-----

--Sig_/++R3vca69HTgv/DCS.37Kp/--
