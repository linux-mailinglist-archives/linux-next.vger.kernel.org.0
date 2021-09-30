Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1534341E3F9
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 00:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344846AbhI3Weu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 18:34:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41481 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345059AbhI3Weu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 18:34:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HL7L96p73z4xbT;
        Fri,  1 Oct 2021 08:33:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633041186;
        bh=LCM8DNO1qI3dWRJlOo6wyWQYwjIr5Y4EtneKXHAGK6s=;
        h=Date:From:To:Cc:Subject:From;
        b=msHtktWlqDXiFFAZzuB9kz9YZgVOcdnohssQAkSQSyOhVF7x603yXB6f9bGMs4lEo
         glXEuFjcbKpgg0+ObmyTu2hf2lahT7e9tPsXkcb6KWOZIwjrcp+soyPdVZwvd1VnS0
         23FOnhzE/UTnnsY8EEiEz4ZGqmgGUw6dWyiHPxpfVg/UwP7aHDgIqWlik5GpTkXf+9
         s7X4Ub4OeLFudAgBKLLshhFrqlCjfC1YViwXgkyn0buasGC2di75ZbK7d5Pt3UDZvG
         Z2fOFvwb03qjEKI6u2jkbfhKODw1ufrAb39pkzwgbnEMesH7acoDbxWsElhxkz282B
         j6RM9HXNK9XwQ==
Date:   Fri, 1 Oct 2021 08:33:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Jacky Bai <ping.bai@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the clk-imx tree
Message-ID: <20211001083304.3cab4195@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.3D828iSp.WqVXT5aChXQJJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.3D828iSp.WqVXT5aChXQJJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b00bad50a24f ("clk: imx: Fix the build break when clk-imx8ulp build as mo=
dule")

Fixes tag

  Fixes: 86ce2d393ff7 ("clk: imx: Add clock driver for imx8ulp")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c43a801a5789 ("clk: imx: Add clock driver for imx8ulp")

--=20
Cheers,
Stephen Rothwell

--Sig_/.3D828iSp.WqVXT5aChXQJJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFWOyAACgkQAVBC80lX
0GyEFggAiD9uAkCxGNGy0+Z4urVs8ZtShc01U2GdhpPPrNFwqRWGI21JpM6Iv4/N
LkhG7HEnFVkVN0iI5Eg32XaEhrjDn4xwy4QUwvii6rTcQBk4lFagLxU95f/Fscxm
toEcHszQ9wCq0MBJ56aqfMWu4MR2/eRq/QkllGbMeqqMverRrvN1kL6NoBiTjC/P
zqA1GACpGADDr6kWbmoISFISZaykgYtTDtPfdUjU09gLHzrC+PRNsDk/GKKjNFSg
NXTBJo+ctUfx8k6hfBJo5BvfFoC3m+Q9Du9MAcXXRAk+64YsCYhoFy/F5yQyJSpH
W7vSjzW9xrCvTu20Dul8C0Mhuvqzcg==
=stfg
-----END PGP SIGNATURE-----

--Sig_/.3D828iSp.WqVXT5aChXQJJ--
