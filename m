Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BC13B7A50
	for <lists+linux-next@lfdr.de>; Wed, 30 Jun 2021 00:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhF2WMp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Jun 2021 18:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbhF2WMp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Jun 2021 18:12:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349C4C061760;
        Tue, 29 Jun 2021 15:10:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GDzDf5pwKz9sVp;
        Wed, 30 Jun 2021 08:10:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625004610;
        bh=M+fNTuMJHgjydGf29PukASoBS07i+JbgEja0KfsykUQ=;
        h=Date:From:To:Cc:Subject:From;
        b=iA2dwpVlhpr5KCl1mtlByb9s4mtye0EsOpoDM3vIFJLg5Uwq1uF3YB2wfAJV42kYf
         Ye+64xkJ/GekdfNxxaJxBRpNNUEe3IlUGGmtDpwlmLANmsMV8PoNPasvwP+xubmD0k
         Lz+Phl9XaAi28Dt95pqiOwt7NVQdwibyvx0CgGZaWW95LdRyUbtfkpmDmsGTC78ffi
         j9gYPJUo4m/R8hMsXeai9sFpvAFYN9dvBnLyFsyUjW6UYP+AX8XX0SbVulMW9y1beU
         ydCMEO9NfJseaIKPtLeH/yvNc5Yh6uQrIMmZi8W4l9S8o6Kzm7zq0E28soJeRNhqCw
         Na7h3CQmg41KA==
Date:   Wed, 30 Jun 2021 08:10:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error fetching the kspp-gustavo tree
Message-ID: <20210630081009.7cfb9349@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0bv1WTMP_bE7kT5WPw7tqlW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0bv1WTMP_bE7kT5WPw7tqlW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the kspp-gustavo tree produced this error:

fatal: couldn't find remote ref refs/heads/for-next/kspp

I will use the kspp-gustavo tree from next-20210629 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0bv1WTMP_bE7kT5WPw7tqlW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDbmkEACgkQAVBC80lX
0GybUAf+NsREbNIF2tpcc0bpsL8mn6PSmT34EC+WK9fvwh+NnAlnjwwqnTbMx8DI
4X6bgn+3mmT9GoDtbkkygiZkjvFFTZb1oYxcTGWSXLzEWFWttk6z6ZW1JUPvgTP3
SVNFrOtZte5O04YoHiFMto9K0D2g+jH8/syOttrWjBin2w43Y9XtaxHMj0MOcBEC
aZtwdvvDxf6BTZMAX7Iwh/DqaV5cu7cuH9M99bTv04dabcY3SxZUnQ4yxbWeDWaE
0GXhAYMRf6X7vUoSc4GYYix8O2QfaD8yAjrNCl0wa6pjCAu0EF2U1GNuCIk0LRLF
UFLGbSSMHwPkZhGgRvUvp5KIyu0fFA==
=nSmI
-----END PGP SIGNATURE-----

--Sig_/0bv1WTMP_bE7kT5WPw7tqlW--
