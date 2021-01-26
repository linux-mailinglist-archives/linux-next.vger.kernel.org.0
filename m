Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E8A3046EC
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 19:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390344AbhAZRS2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 12:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390687AbhAZIz1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 03:55:27 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CF7C0613ED;
        Tue, 26 Jan 2021 00:54:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQ0sw029nz9sCD;
        Tue, 26 Jan 2021 19:54:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611651284;
        bh=I3s1EpOWv+y62ui6MVTuNwPkXzAWpBfawc34KNcJQLY=;
        h=Date:From:To:Cc:Subject:From;
        b=XgNPtOths/PcYpcPvxamvHx/uIUFcyMdEoOBn6m39GsNjW3UyBPhk/qOE6gVtBQGs
         GXO7r1t1m26z3/K0viBmGh+3FxeYA8d9qXjH9qI7C1tHzK4MqVx3LBpYKk6u0sySY7
         zjq4/yXfZunh5wyemRFGZ/I0SY6u00SFe61BMlc3mVneaCfkOiXk2MBL0U2eQKvEAK
         Ay0RVoB6d+lbevVXMXT3VqGWB+wUXjMX6XWFRFyY/+pv9P151fFM/4UNNeJc3aYChV
         KZMqWUjgzIF8fiBRcI9CZNSi9YFhvdemzjC86xvJB4Ebl/M56kp3MUsrT6ipqqRU2l
         ETNk4h/kZgvFA==
Date:   Tue, 26 Jan 2021 19:54:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Florian Dollinger <dollinger.florian@gmx.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20210126195441.69c45ad9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BmVtMDl89ADAvxfWA1h0GMF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BmVtMDl89ADAvxfWA1h0GMF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  98d2c3e17310 ("Bluetooth: L2CAP: Try harder to accept device not knowing =
options")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/BmVtMDl89ADAvxfWA1h0GMF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAP2NEACgkQAVBC80lX
0GwKwAgAmU5gtV87Z+KrIlM1yHD2+tDHiaT5i9Qmxk5l0iHZW/eKcz1AtEeOyiEh
So7JtLfJWOZbNkgvgdM+AEOWfar+SFRIWvzIWW36awJoPfS4+k6pgI1/HEWlUF+6
P1d7jcSzWAKbDykaRaJPdfSTwsieRGWFNIXrjAv2CifeqYu3iIJI1cKPNReGPn1m
a6XKSHvHX+wNmmmWHdrBtUljW1RbrM08IBA/m5D2PDNMjnhrxO5tEqWjXV/7Lw8r
bCKBqDqzgWR8+I2cFTtmRoNuDuNXOFR1N/thmn0ha3sL2acVHvImKy+690yCubdE
N4THJQtRwCexejXjPw/M1BXUElOv/g==
=4jbi
-----END PGP SIGNATURE-----

--Sig_/BmVtMDl89ADAvxfWA1h0GMF--
