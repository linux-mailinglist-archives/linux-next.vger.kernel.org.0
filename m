Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5C943A84F
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 01:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235387AbhJYXmK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 19:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbhJYXmK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 19:42:10 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0F0C061745;
        Mon, 25 Oct 2021 16:39:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdWdS6DLYz4xbt;
        Tue, 26 Oct 2021 10:39:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635205185;
        bh=DIn6Lwu0JtS4xjt9Q8VXcNJRWKHerw5Ic37kWMHbh8g=;
        h=Date:From:To:Cc:Subject:From;
        b=gBF2/2mSgDt0JasH4+I4vAm/tMDPCEkZpBoUwSv2mxIMJCLOsChckBo1xbHUkgJLU
         QH7TpEUESlDD9ExxxCyUTmghpGyONybAfVWAqTH2O4GXSSeSbaXvBL5yozo4OAd61p
         fcM6pqwvF6EX9HXM1UJ6F7unBdCW/dvR8IusMlRRoaaekSfZriwIjzjsD4lpFL9N7O
         V2mdfWcWg6Q+cNooFZLlDy3PIq5oY7fbPTmrq5yQK7ft3obZiXXurutdzyuTZ/JKQ8
         I2R3Fj96HCN423E2IGRPR8EOPn5W9hdDL7RqSJ0dRlsHLy5oSFOQgOqTlGq0xzHsGv
         MT0iYNyytNNvg==
Date:   Tue, 26 Oct 2021 10:39:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Oskar Senft <osk@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the arm-soc tree
Message-ID: <20211026103939.136dc73b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZnDGE4V1LcKmJct+oU3eltL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZnDGE4V1LcKmJct+oU3eltL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing:2: WARNING: Inli=
ne emphasis start-string without end-string.

Introduced by commit

  c6807970c3bc ("soc: aspeed: Add UART routing support")

The problem is (probably) the '*'s on the previous line.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZnDGE4V1LcKmJct+oU3eltL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3QDsACgkQAVBC80lX
0GzWUQgAj1w0j6Zg/wBSLJwUWz/rbSLqhpwP4vlKJTLxRJeCX1N4d82nJrSVjf86
isPTRhavekdynZ05yZAJzchV9oqLVmf6xezxK8K1DK7ZErI0nciCbFQfMlg3leTW
/P1VOR+nxrLcWWpoKhbvhzeEMSthmVDqt5zNPMPlONmpl91W1EPHtH/W/TleKAgP
fpfW9d7zvva3EDF55BOyeT8WPjd/4RO1MxDe78BWNqxVhNECtO0eZYesKfFUBjTh
J03flcelPX5yWYToFHkFIdKhfBwhOut+ShVw1KXYVAImWmjvemxQnDz5ri28uEnM
aSmFhbPVIRMauPBNjTmbLb2Le/pREw==
=Ximn
-----END PGP SIGNATURE-----

--Sig_/ZnDGE4V1LcKmJct+oU3eltL--
