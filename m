Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AAB44DCFE
	for <lists+linux-next@lfdr.de>; Thu, 11 Nov 2021 22:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhKKVUP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Nov 2021 16:20:15 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:51637 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhKKVUP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Nov 2021 16:20:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqvgR6xHWz4xdG;
        Fri, 12 Nov 2021 08:17:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636665444;
        bh=d+YFz+xxVj8JsJogAlBigt8VLo55wEivhwfVX6zFdeo=;
        h=Date:From:To:Cc:Subject:From;
        b=CCxlKN5L39VlVZ25kzeR0/eKvFHpFIdF338zWzhptoBGOYMEz3lgN5bgM0dVuwHAy
         bHT54QBaes0k9aptpu/b2tU0GKBgqMsjdxkjyiui+EIbaEaSi76IRuerVXDTAfWrTl
         ukaq1ygVVOu91cOqt4Dxp2f7vyTpMbXj6qA9BG2Ncpgh1IX1PRpWsmqMK1gaM3bosS
         b8e7DWNRq03evAWcNXX4NnLeQbJJu5tviRGu7sM6L9/Sl9RqUoR/VaMNhkri4nS8Sb
         Iqz9dHgtWMJeT68BI6+XGmv3+veHbPiDQdTtFEmnGl1yEE4DuT2DXF7zmLMXN0sPo+
         +TsX5xXF+cPKQ==
Date:   Fri, 12 Nov 2021 08:17:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: unexpected file in commit in hid tree
Message-ID: <20211112081721.45529b69@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GbTT.1+KxW39bu/GiXD39K8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GbTT.1+KxW39bu/GiXD39K8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b763dc3f17a2 ("HID: intel-ish-hid: fix module device-id handling")

added this unexpected file:

  include/linux/mod_devicetable.h.rej

--=20
Cheers,
Stephen Rothwell

--Sig_/GbTT.1+KxW39bu/GiXD39K8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGNiGEACgkQAVBC80lX
0Gxbvgf9EVRd5UBG+XYbXYSWIGKKBjfl3HHX9jI3oPhCRvrVSFxCneVeBi4XXqKT
R8FENKEey5KItgnaop5TXnTnZeip9NZgoCe+YuSLwJfMEOcpH0b8Dq+ScB2IJHr9
G7KZ8NC05ctD0BVd29EQRzqK/fbZXeu8wQ4m/A5QxKEG9fTPt5mXW6XT+bfu+nc9
XhTant1JLOxonsCKlcf0Dt+oSHv1n5htYd1luJIxqjMv8jwQ3p33826DNGXJO+Nr
MhhKCo/B9D3In3krLuuEhdsCF6DYZ1+3OpfPBbAxxIYFjLMzMQ1J7ntjCQB59D2X
v8aOj2pDUYdP7mXJIYOhdifjQr/Evw==
=q3ND
-----END PGP SIGNATURE-----

--Sig_/GbTT.1+KxW39bu/GiXD39K8--
