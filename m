Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5412A36A45A
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 05:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhDYDQl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 23:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDYDQl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 23:16:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECADCC061574;
        Sat, 24 Apr 2021 20:16:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FSY7y5qKPz9sTD;
        Sun, 25 Apr 2021 13:15:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619320560;
        bh=RZhY5iKAzPNG0hzQj5seU21XSEWot88w564/ZzszT+M=;
        h=Date:From:To:Cc:Subject:From;
        b=gDl7cgwVTlEDX5wFWlREO3pP6i/07XJOUuDPTgmUSIdr63Vy/NFihypqVkiywMjxp
         AsA/sdDQ2bcmDVWW0FZT2mERNNnxmrjFs20sH/aEPdmZX/etDzr6x7pZGlUHAMtKRB
         v1q2r8cda6q7Rx3PEuhBGHrg6lEBLF7yFhX5Dnxlp7xB0PsvDohzII7T5L1hKsiIfk
         2pv6QSNDS2a44V19TggHA/fHiKJKwtGFm4rhC6LdgEuXGpHwz1E1VfEH340R1Ta01o
         jXOu2O11p5JRx4n2uRQCpSYae6wcXf0O8cZg9XL32R49Srduv0tEDLG7QIX51JJzap
         F/XjzbJ6sL5gQ==
Date:   Sun, 25 Apr 2021 13:15:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pwm tree
Message-ID: <20210425131557.5eab8265@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bFoQaMtzAyIYzAUhuxC+ig6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bFoQaMtzAyIYzAUhuxC+ig6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  30d0031bd7ca ("pwm: Reword docs about pwm_apply_state()")

Fixes tag

  Fixes: 539ed98e2bd3 ("pwm: Clarify documentation about pwm_get_state()")

has these problem(s):

  - Target SHA1 does not exist

I could not easily find which commit you meant.

--=20
Cheers,
Stephen Rothwell

--Sig_/bFoQaMtzAyIYzAUhuxC+ig6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCE3u4ACgkQAVBC80lX
0GzzPggAl2I7R0+wM92wgQdZKFlofjdHoLBf1xTULtr7JcfF6BlZOPa/oQXxTT0Q
lutB5LnKD2jXNJs4UOZa3LT8ezPA1qAggx6wafe5a1bAZFSQyBXf/+NCTOlsYw+l
+EbpUIMm5RM/AsiDuqGxcyr2XvCmTFK0ckOo0p1y89pRpQyVknQd6IqndEPhVF3J
caLcDLWiN84Y1BiWEw+X1bu9X4ATaNvjMC4h/foCfZVKwXmjxaXX+FONzO6aNMMk
ZKwr3t3bKpKhSdHugsBq3UcjjbPCFaw6WeiK25htZx6IpBlN/aSOHbwow0wsnqIS
b9rTbN8J7mWyYHQiG/FCGTnsy2ljTg==
=a7OX
-----END PGP SIGNATURE-----

--Sig_/bFoQaMtzAyIYzAUhuxC+ig6--
