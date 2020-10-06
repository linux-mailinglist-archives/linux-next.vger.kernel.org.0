Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A917C284466
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 05:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgJFD4v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 23:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgJFD4v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 23:56:51 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA04CC0613CE;
        Mon,  5 Oct 2020 20:56:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C53Yg5Ynsz9sSs;
        Tue,  6 Oct 2020 14:56:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601956607;
        bh=fs47VFkN5SJjvHvLpni591wkIF9hZauOUCb5aevTnvk=;
        h=Date:From:To:Cc:Subject:From;
        b=tfvHGPoaYFDskfbiet3P8vdxaJY8KjvlMdGvoJkbt3nESQ8KN6ywkEpYSb3dbFAsK
         FbHsYgoDhAOr7DvxwGlJDlnl2qxB8LccRzKpaMwJAamVaVbtEtobIoGDp4KJNKIXjH
         aOf9Qc7E6OfrtN2IuR1h6r+NyVw+uGsKOO1nZXZk6W1o61NlbwfYc5l7tVfy8i11Dz
         dgN+CQ7zGPfzvlYIpUC+LLx/rJnmn798hwcpN87r0KAWqVE+UcX67rBrK4VoaEKY1h
         GCLjHBmsF2L+8geb4lMgvHF76fHbYbyWU9IwTDwuVXNwzjVPHXC1nxYVBDc6H11HDi
         NFvFPstRM/iGQ==
Date:   Tue, 6 Oct 2020 14:56:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Yangtao Li <frank@allwinnertech.com>
Subject: linux-next: manual merge of the sunxi tree with the arm-soc tree
Message-ID: <20201006145637.57d20ba1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e0Q7Ztg09gC+KDrNArzZYmB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e0Q7Ztg09gC+KDrNArzZYmB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sunxi tree got a conflict in:

  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi

between commit:

  0dea1794f3b4 ("arm64: allwinner: A100: add the basical Allwinner A100 DTS=
I file")

from the arm-soc tree and commit:

  7e66a778cb8b ("arm64: allwinner: A100: add the basical Allwinner A100 DTS=
I file")

from the sunxi tree.

These are 2 versions of the same patch.  For now I am just using the
version in the arm-soc tree ... please sort this out.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/e0Q7Ztg09gC+KDrNArzZYmB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl976vUACgkQAVBC80lX
0GxooggAnOftleaedfL1YdmpaEc9eObEeLx2rfR353dsQfTfJ+u2BizE7+Zjx3w1
FdSwp6R/jh2/fIjG6aiXxCqD0iWiipvbTOoJJhVp9gLV16DH5zsjw83whm4deDv8
Eqpc67S5RbgEqgN09/cZx/MkCGqjapXlqKYpcioh19Cy9fOYtJ+k4vHADZ6DJoER
UOJPxyKtnMQ+bn7tRFLxKBUF/eUNxjOxwf/ITuJS/S0FZBpW/Ukf63AFH75VyxT8
ghDwmGqrG9rIx5AuxEIuIApp/FysXbX5XUNO08YPLiPE8vCAU258mV9CTuI74Qj9
Kh40+ZNFiMOdrIp5RbMXd8DfBu8VBA==
=x5SO
-----END PGP SIGNATURE-----

--Sig_/e0Q7Ztg09gC+KDrNArzZYmB--
