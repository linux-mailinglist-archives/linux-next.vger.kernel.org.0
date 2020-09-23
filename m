Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870DE275764
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 13:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgIWLqh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 07:46:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWLqg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Sep 2020 07:46:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BxGbs4c6qz9s1t;
        Wed, 23 Sep 2020 21:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600861593;
        bh=eye6SEzmucc+/NTBmKikAHNBAtsHj7/63Pf1q9rB4lM=;
        h=Date:From:To:Cc:Subject:From;
        b=bAP9SciHerusvhQOYrPm3ZaNdSPNwh0KkcDtPHb/BFjPVNcrM5CAxY7bp41k3x8Hn
         8xcavACbZZo6F96IGqkPf9Nz5laAS2Nol7FHmNV24gM9PKMsVON7689i2kfpZfhpGt
         ujd/w+ZbYIUBYXt+TbqL0YPZqGayx50LrVAJ926tXt0gsMjbW6VHLyiapMWf+Cu/Tx
         hURMs+gWqTJ69soQsVQ/LmUNPy4KhfCJ9BIgvPGG0QKcfuUbYVhOZ/HeCSQDX9UtoQ
         y0toDfQTBAbT0VkEt+XfpuI+1CWNyHqxsEworck8m5Mb9AosTZMAAx7qLGz9TzuCZ6
         disI0KRl1ZE7g==
Date:   Wed, 23 Sep 2020 21:46:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: linux-next: Fixes tag needs some work in the clk tree
Message-ID: <20200923214632.079690f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9dg_U79/MDQVD6.217Edlop";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9dg_U79/MDQVD6.217Edlop
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b02cf0c4736c ("clk: socfpga: stratix10: fix the divider for the emac_ptp_=
free_clk")

Fixes tag

  Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more that one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/9dg_U79/MDQVD6.217Edlop
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9rNZkACgkQAVBC80lX
0GwJ5Qf9EBDBmMSFsQYPP6+nVwiv9DasCbsB/4r2W5jk60eq2FvyZn7OHipLGF6W
m+A+vW0KcHeSnpkatO88cvGlTdDd4ua9iCvbRJFthFbd3ZQbxrvP8ALfIk0CQ0eX
2HT/Nc0pAvsaf9hkZIB9425yc6hFLxyJNNWlVf5tQi38JR1Nnp10LdGf36mfbxFv
213B9uniBwoKxv9E+lgqZmS2DNSP96exfZpI+JLWvrANTqdWNJvchLYLm2sltop3
1AXFHXdU9DvI/fuNUaG4wvPT2NJMpGTD1fhYXfD0Fj2AQ9qAgvgs//ZaYEiH8yJL
n3/FxxWHTv3qS/6oFUIef4z10Xs1jA==
=Tdu/
-----END PGP SIGNATURE-----

--Sig_/9dg_U79/MDQVD6.217Edlop--
