Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6613A5D41
	for <lists+linux-next@lfdr.de>; Mon, 14 Jun 2021 08:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhFNGws (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 02:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbhFNGwr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Jun 2021 02:52:47 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B77C061574;
        Sun, 13 Jun 2021 23:50:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3MXX6NHXz9sRf;
        Mon, 14 Jun 2021 16:50:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623653437;
        bh=QHy17iezKeraGW8eO1cKuQFhfrapQ2dvdasqzmYp1b8=;
        h=Date:From:To:Cc:Subject:From;
        b=Wa79ySyncOyrf2HtWefpK+TxBJwAXXeARsr8gHsYZQ0i01QN9ooQuSpnL4A0uZfrP
         7GjfW5ImqlYQjUrWrMw/p4trSNbkB+FNPMBKnbxlhkXY4QaJiFHGEBs4VGra0GrfM6
         eSorD/zfEoMA5wqrpob3QDDWDZiGb6i8iFHPB1gbJsTzcOwDb6QlAxejo3PmvCQgig
         voQTz4NwhFRTOaUDm1KQfeNtLZH+tCpvaRc5Gz9jl/cTn1859YwNSh8WdB2R5zoGtP
         +8yhTM9dwdKOJrljRYwG0FSFw/FB25rsZN5GvE3OaIU7s1ePZg6TpQ8/hUZsSHkwXB
         nNnlDHnRw7F6A==
Date:   Mon, 14 Jun 2021 16:50:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the risc-v tree
Message-ID: <20210614165035.7e988616@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PNb.XryqZxghtBuZv+drCFt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PNb.XryqZxghtBuZv+drCFt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  84a844dab497 ("riscv: Map the kernel with correct permissions the first t=
ime")
  837f6a73c03a ("riscv: Add mem kernel parameter support")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/PNb.XryqZxghtBuZv+drCFt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDG/DsACgkQAVBC80lX
0GzUUQf/VUNsWBG/yHMk2qEh1u1tOn8G5h6TFsBrO8aYgtTF9/0Aq/ylq74ygN/W
O3HDbjB5x9QSfz1QUnQsyFaXyJ89UR0j94FQO0tSqRvMXbha+D0ZVs0J7t41rSid
2OGWXzQ2eg/T+4KXkQ7w5jPMyUW7eiJHymVOfRZPsbYMPNNAqgI6+uGkLbbx39xj
l0M5s7JPfgwFa+tV8OXd2GxVriyz3Q2MhclWb+DGB0zTspVMXXke1U1OrOiHQZ0n
YpSFHOrzJLjseeKbxwFTFp9dMNoUgO9AHMB/JIEeLLat/onVbMHPRzYcETrAD759
cc9dBEGaC0PV8iV7Lo59kCQ3OokYFg==
=tisw
-----END PGP SIGNATURE-----

--Sig_/PNb.XryqZxghtBuZv+drCFt--
