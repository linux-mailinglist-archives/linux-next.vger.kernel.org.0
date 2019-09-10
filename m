Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37ECAECA1
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfIJOIo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:08:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45477 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfIJOIo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:08:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SRhg1kZDz9s00;
        Wed, 11 Sep 2019 00:08:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568124521;
        bh=ToRhPGlcoQOz3W0tvCtXfppcVOrElMxZdY3EbgCg89I=;
        h=Date:From:To:Cc:Subject:From;
        b=mUKkp32cve5EpbR2bbmXPEG18/3BbjyjlbKzBwH3hUPk2ujm8l8zFQjbsRhY9atBm
         5s5L6zNiThsUqIW/0UxIKmQfA4kNlvrJCel1YGMceh5VgxPPloHX8PyxN7r2j4RMe7
         lk2A3mgUBektE3BTCMrQujoyVHYpACBD3t1Gt6kNxUykiAdlipX1vbn8HSch9ccmPv
         acfpmiJAK4W5B6KWuD0gkRXgCWaqO5C74r1qu1+rT+fBdWsnpSqTQKCICZ6otTDQOK
         y4a6DxursNgNFim61BtWqnsj6a9RT+8a4vD9XuNxJpTW0Y4cz3s5zS2PNXvJexNFXw
         8sL7I3go/R/Qw==
Date:   Wed, 11 Sep 2019 00:08:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>
Subject: linux-next: Fixes tag needs some work in the omap-fixes tree
Message-ID: <20190911000818.6539fd35@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NXap02BYKNTOsWkBiCfmvNM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NXap02BYKNTOsWkBiCfmvNM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a932b77b4d19 ("ARM: dts: logicpd-som-lv: Fix i2c2 and i2c3 Pin mux")

Fixes tag

  Fixes: 5fe3c0fa0d54 ("ARM: dts: Add pinmuxing for i2c2 and i2c3

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line (and also just
keep them with all the other tags).

--=20
Cheers,
Stephen Rothwell

--Sig_/NXap02BYKNTOsWkBiCfmvNM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13rlIACgkQAVBC80lX
0GwPmgf+PBwutFnwkTwruJb8CZzAfNQY6r8L2e5fudE676JyAgIhjsvO4KIGclBQ
EHz3YufphJbxGvr7Ia5NbQGcX8IclDdPdknMy4MI9UoQbXqOLCVbVzuHUn4QRYHw
W6MUg1V+miHRA7qqAVOWDLrMg0jY4XxLMHGeEGBiZ7LLc1tONlKAHj8qp1uOGkO7
EZQlYGdoqXZ1ENZmpOFcGdULq14dlxxofqG0aEw5flYCT1oDF3/NWOEX0BLGFzKM
VTqXa3fCmdcqGw71eFKWZRQStqWlt9JyLdqqT4rjwbN/pRW/mbDfCJEl2MmIYbJE
ReAo+7WkNOarPF9wd4wZB/E0+EtgBA==
=fUB1
-----END PGP SIGNATURE-----

--Sig_/NXap02BYKNTOsWkBiCfmvNM--
