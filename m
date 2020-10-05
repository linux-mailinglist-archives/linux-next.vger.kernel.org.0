Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EADF28331F
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 11:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgJEJZu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 05:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJEJZt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 05:25:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA56C0613CE;
        Mon,  5 Oct 2020 02:25:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4Zvr57dPz9sSn;
        Mon,  5 Oct 2020 20:25:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601889945;
        bh=nBtq0iMdoADKekhuB0pTLrmsjxA9ckU9vz1iB8xF9bA=;
        h=Date:From:To:Cc:Subject:From;
        b=t+rH66vXJ9F7eqYFb3eRQFFOO2vESmuXZjb8iDy1Nn6wl7coeLDstj7IpbWyuX2Sh
         0Kq4DJ82+hGRIg+g9nYrur59m3z5T4wAYAIQzo4XO6ANXlPniFhOPaSf1edQPaZAEt
         Ee4f2c9r25ubyE+O9aCcg/frqSJ2hPetFn7Izl/Z8yIIVnruLPFLDZLSnNyIjU5I9n
         UuxsQPAW4Fw2Z3FEC1OapAXSDa2wB8mnvp/vPA6m4iQy26TRft/LdwzcM2RkgyrRp2
         lnqLBItf3N03WTQFuYZupcWivQmOe/pU2Ums6fpzNUxutTj0M8McMPPRQjjjjgIAxP
         IsVa7StRHS3GQ==
Date:   Mon, 5 Oct 2020 20:25:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: linux-next: Signed-off-by missing for commit in the amlogic tree
Message-ID: <20201005202543.5cb4a828@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D/_GefiEZ9RfQrRP0j1FAFr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D/_GefiEZ9RfQrRP0j1FAFr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b3cf5ff01d47 ("arm64: dts: meson-axg-s400: enable USB OTG")
  628c9c809f84 ("arm64: dts: meson-axg: add USB nodes")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/D/_GefiEZ9RfQrRP0j1FAFr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl965pcACgkQAVBC80lX
0GxEawf+PF4XaUrJ7H7UInSSo+cUNdknPyfkcl/gL6zdxyCFYdVB2W8BcjfRGe/M
qCt4ngB8c0+LtiXIZ+Uda6aq7cVHN7yNZ/s85RCNA2aR4krYExJekcTNXK7v70Wo
DLrPWDU/iy09jLSnQ6cZw7DU8g+RrdVNvETsTIrhQyRpCTv/0YcTO1s1rXDePtef
ueKTE2khmWTyou+PySO0HfDxX+RuW1sNaFriouwnmZUfeEUwXnUaHVl6hOp6axgq
Gb/v/qk+1jj6CUYIGwcjwWc+Lsqkr1oHbB0F8mvdbgwM4vyjIad1Xx3kPNIYpe2H
+udk0OCQROLqUJlibzTzTTspvew51Q==
=ByWF
-----END PGP SIGNATURE-----

--Sig_/D/_GefiEZ9RfQrRP0j1FAFr--
