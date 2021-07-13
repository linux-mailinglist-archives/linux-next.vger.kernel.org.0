Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761BA3C79B1
	for <lists+linux-next@lfdr.de>; Wed, 14 Jul 2021 00:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236668AbhGMWew (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 18:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236656AbhGMWev (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 18:34:51 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25562C0613DD;
        Tue, 13 Jul 2021 15:32:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GPb3K6GsXz9sW8;
        Wed, 14 Jul 2021 08:31:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626215518;
        bh=8Jtq1OX6YylljaUszTJXxPZtEclKGDBlspJTMMJKThw=;
        h=Date:From:To:Cc:Subject:From;
        b=kgWv42O2JCRSdpwsuK1entBDhsVzrN1Y24dYe1VQMbXOe7iwMUkJieLcbojIXNrpM
         wbqd4InemuUMFMQJMCO+yrBGL3SxQ5ZSXAk9wn7kUWni/Zk8FQDA3Pl8F5gQtY8c/3
         Jsde3XASOSdaOA0EceNtB66eWLTfmuJurHK1FczSNU1LCP4ccT+q2OncClRz9Xtgqz
         DemX2B6yfYOaseYXg9Ic4FZbTdk8rPjZbJajxcsoWOhCjBE9sD5MwbzbNp0xozBs41
         POvVCZDiGHOktvujemlsHHZqIVl8CU4N7GE3yUTxTKMctqpy2jgG5KXdfy3p4VOcou
         f9Q6Zs6lIwD6w==
Date:   Wed, 14 Jul 2021 08:31:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the clk-renesas
 tree
Message-ID: <20210714083156.29032075@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B6dkYP_hqq6/3daV6f2cp0b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B6dkYP_hqq6/3daV6f2cp0b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  1a95840b0d0d ("clk: renesas: r9a07g044: Add DMAC clocks/resets")
  1f5cda1cc885 ("clk: renesas: r9a07g044: Add I2C clocks/resets")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/B6dkYP_hqq6/3daV6f2cp0b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDuFFwACgkQAVBC80lX
0Gz/3Qf9EAwwKP0/Uq3z5ma+De7e6+WGjHw4Ck81ENHrDu5HILo8bvMHfZmOYclv
O4uTnE4jR6Wzs/PmHs5FcfT0S5rogchCip1IWB/fU9Eb1a9G51vdQtvXAxKgjvL+
MVuRSs6C9k4x50xkWGAcVuJ4fLRMdwGvjeQq0cclxd/7h6m1/Wo8qy0e8ia7++K/
AQRG27bo9cnZjO3qttGN59xAWDgZQu5bp7dTW6Z9iNHi9EDOGD07SvHbiIEQDZDi
7BcBidNI+jPa6gh0ufvsWHM4oyGP+ZKyVvqAHyNQ2EPeKqFmmbK2vc5totlVmHw7
wPp09UIxUvhGp5BkROQSJfGH3x3YbA==
=HNlT
-----END PGP SIGNATURE-----

--Sig_/B6dkYP_hqq6/3daV6f2cp0b--
