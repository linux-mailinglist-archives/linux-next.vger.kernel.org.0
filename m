Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BF92A22C3
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 02:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbgKBBis (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Nov 2020 20:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbgKBBis (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 1 Nov 2020 20:38:48 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE54AC0617A6;
        Sun,  1 Nov 2020 17:38:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CPbD405F9z9sVM;
        Mon,  2 Nov 2020 12:38:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604281124;
        bh=zK/ydDG40tBMu8RZeW7N9EO0OhY0hIJHkzDE5V8XJk4=;
        h=Date:From:To:Cc:Subject:From;
        b=ZGCoay7zve6YwRATxZF92iHtuTCCntvhejmxi8wI5BySQISRUn3feYWR8g6oL253l
         FCshHNocAseo0veroz9EE0GfXBvBYAS/Vu1gUmpl1OJbkou0BU6ZBadr+/oIRLACY+
         jaxt9mObNxIZq+65xX37soga+YBM5CT+1L31t+4WaVyEEryBQtIZZ19oCREQ5WGOQS
         1d1DvJUM1G3/xyq9X0gSUJefvvgxKJCjvKMgD5oTjHhDM948d3onGQ/UQECbZCo6Ds
         uiOO5iO69xX+3tR7pD23cFC4eX6bICatco1B97CRnghjJqVFqEUKb0SEtLoiuGvTCB
         DsT4/GMfw5jRQ==
Date:   Mon, 2 Nov 2020 12:38:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the parisc-hd tree with the asm-generic
 tree
Message-ID: <20201102123841.39eb4216@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vsWjGt1DImMEyJlxtqWUcz0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vsWjGt1DImMEyJlxtqWUcz0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the parisc-hd tree got a conflict in:

  arch/parisc/kernel/time.c

between commit:

  686092e7daaa ("parisc: use legacy_timer_tick")

from the asm-generic tree and commit:

  3b7ab4a74a2d ("parisc: Switch to clockevent based timers")

from the parisc-hd tree.

I fixed it up (I effectively reverted the former commit) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vsWjGt1DImMEyJlxtqWUcz0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+fYyEACgkQAVBC80lX
0Gw0mAf/Q9jxVya+9wf5d0+CvtsHmaFBm9lXTg6leeRT9i7dmwL/P02XN/RwQdKb
olvhmxI/YPIiaiZZoXnQAIBbamoOKE2IlwpoUMX5uKr8d2XGVSJ6iTpz1AsXOqwi
A18bkLqUUhSuaK6XTSZPk9g9CWtOg90EQALBeNeG1F1r9fAF+iXI0+UT+H2Z2wOj
d+OWKbXB+enWRUrznQs8X6UitP6Y+pWv0OKxaEmGFy4nsUh0I2yHPbcet7Or8GXN
gkBKPbPKbt2s1A2Z54vLN2D7QCJt3N/9+vZjJDyDbiDAXMHKlpxDYV/jkbC7rpZW
0qZotUvFDWaEepOJhrpla6ZHabWk2g==
=3WyG
-----END PGP SIGNATURE-----

--Sig_/vsWjGt1DImMEyJlxtqWUcz0--
