Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7AF2AADA1
	for <lists+linux-next@lfdr.de>; Sun,  8 Nov 2020 22:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgKHVSa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 16:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgKHVS3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 16:18:29 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA28C0613CF;
        Sun,  8 Nov 2020 13:18:29 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTn6T5kbKz9sVK;
        Mon,  9 Nov 2020 08:18:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604870307;
        bh=uc9QUdHCOAalQw0hmL8RNDtiCYmgWkojlrSCnNbcXuU=;
        h=Date:From:To:Cc:Subject:From;
        b=s6c6HIB/mZuqdSEzABkkgBhh/IuUTgYSOeANb+pkISd1ZjJie6XkJMaUV2sBmNO5i
         npwkpPa+qGiQzszbaS29XTmFIWRMRK8nDkkzhRKgHvI3y17V9v1w5u5jMvI06imulA
         58pGVDQ45lZABuLjnSTytFxWw9U2Nhn0SO8F21smbfbVsZ4quT5FNx5y7aJ2MUerDd
         ESE3h08ZBAqCKvedUakmIg6Wr47xxzdI+Jd/ybZOPxPJTVgC8hbEGeuTPvs8qz7c6Z
         z3ErIWLRnx/KsDs5/gwyOWcNSnnzZD2IdwN2BNTI1mjnpM7dHIiT5qH2Drw794xPE8
         JxE+IuJgSSBYA==
Date:   Mon, 9 Nov 2020 08:18:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Message-ID: <20201109081824.503b61c6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IE_R+RBZcBsTAw5q2MFFgTc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IE_R+RBZcBsTAw5q2MFFgTc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7cc7b0d7528b ("RISC-V: Add kernel image sections to the resource tree")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/IE_R+RBZcBsTAw5q2MFFgTc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+oYKAACgkQAVBC80lX
0Gx+Ngf+NyD/ACelINPxHmE1fP2R43DDhBRNJRFnzdwFn3LIltWBfAqINAU6AFLx
40M6Io+H/AD/JaSao+/fFOqM/Ehv1gl0/7BaPiKy8ETn8Tmh7h+n6mJm5CHQe1Y9
wph/GFomO0gvn6pz227SA2FVQ1Bj5Iv4GkSjVJ+nFXztngJlldo6Ryy0qeU2EEGr
Spd6CLUfCzx/BJ6xr92xHqHg3isUrsNHqhdX0RwgyauI7Zltea40sMu5eJtFVPbs
BOi9aUr9lBYsZf01PjPfIZ1lsvRQJTesmXGu38T34u9g+f5ub0oIlVUiw1lK+rzi
3nuz1ynWQb32p0e3UWfGftv65IEBKw==
=IWDv
-----END PGP SIGNATURE-----

--Sig_/IE_R+RBZcBsTAw5q2MFFgTc--
