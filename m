Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C9443AB66
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 06:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhJZEqn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 00:46:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38849 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233481AbhJZEqn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 00:46:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdfNx3wWLz4xbM;
        Tue, 26 Oct 2021 15:44:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635223458;
        bh=V2CIYn4RawmcMkvg1g1f0I0MPOz+EoazwfmOKwdVBJo=;
        h=Date:From:To:Cc:Subject:From;
        b=IcEBuJiS3fnaToHZ+ZUX/lk4lKD3V78sts9M8iq02YHkCIFbia/E01dol6dORy3iB
         nXsokMIWRupw41f7s/LZlQlw0Jh2sCbpB7Mihd61Owsfql3tiLHkIuEYF4XjGUMgmh
         aZ/2ahmBY86CPxS6hJ7GIsEj/JhqUJWmVRJmtSxL48jGuuEzBFumlxHI7nQpqHNx8n
         70wGqNSk0ohkhNW5/VT7dnyJRwuRC/vP57TeyzWobhgzOFVkTZDY6lJpJgkczy8Qv0
         ZWvFPD1s4Xbz1+bbPuaGBgVGV7f+oiMtxV4I/HFzz7LSA69yOrRJVG3iCm2vhLbDcP
         G/bA206/euIlw==
Date:   Tue, 26 Oct 2021 15:44:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: linux-next: manual merge of the phy-next tree with the gcom tree
Message-ID: <20211026154415.3f6c7c28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a1KYrISwVi5tHbziJ7EObWb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a1KYrISwVi5tHbziJ7EObWb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi

between commit:

  442ee1fc60c4 ("arm64: dts: qcom: Drop unneeded extra device-specific incl=
udes")

from the gcom tree and commit:

  956bbf2a94e8 ("arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY")

from the phy-next tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/a1KYrISwVi5tHbziJ7EObWb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3h6AACgkQAVBC80lX
0GyoEwf/ewptSAusgMnZcsmYQmOrihDJekCJ/E5SIfI8d1N3b5fuZOLwLmEcCdWS
b/xbGut7vJZziJDI+2Dda5VpBCNfkx9Q8A2vBXXYG6MDKPRVDhvhLsnWyfszx8a3
0Ciya5Nu2qNIyHkGaLXn4gNQW6mXblHYkGQk3vPUhF5els3UYeGTyY7BWaQdKiKE
iUUowQ3tO4J9gLG/TZ6MIfkZq8pQ5eoLo4detkRQXtKfinq6QWzxs5qxHfl3ALsv
fAEHqYlYvpBkQVSEr1tnZ4M8m1gEqbUY4Up1eKN4LP8U2qdYTUWwQ9OIdL+9w1NH
lQvJCxkzS3UM7Uak95qNKWBAypQK2g==
=u4At
-----END PGP SIGNATURE-----

--Sig_/a1KYrISwVi5tHbziJ7EObWb--
