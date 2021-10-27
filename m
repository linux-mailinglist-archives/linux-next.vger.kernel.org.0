Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADBB43C8E6
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 13:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240046AbhJ0Lzx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 07:55:53 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36391 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237415AbhJ0Lzw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 07:55:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfRsf1Btqz4xbG;
        Wed, 27 Oct 2021 22:53:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635335606;
        bh=xTMWFrksv1QlMVqet1pAyRiIGapHjDO+EZTOtQ3vg3s=;
        h=Date:From:To:Cc:Subject:From;
        b=INVs9QUlB1T+3ooMMf3giaJ0q/P/ba3ZHi84deAKQXNgXTuglDtHNF1W7Oc4NmfIy
         IeCg9vUrSO03hfzVJCJvQHs3JK0ZF1aeybOoWPxNNWt4EuJUEJ7He/fIdiTmW+kowC
         qCwmUo/CgRNAUH6EeOjNe1X9dCgAsFF08w0OZeYbBCHcQpNLay5bpizeiHxGJ8u/EU
         SE46BdKbNH4wc4HWz7/P38AqkNuI/aT8ay2Ry1a1EgLW50y3Xl0oG2yqWfULaEgnQX
         M1Cs9rhgAE+PgFbJzxPDQYqKvCEIBdfyJzCMkN9bG8nghiFpW+/iuL+K1hQLrAhC6U
         aoDk6+Vu0aSjg==
Date:   Wed, 27 Oct 2021 22:53:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the arm-soc tree
Message-ID: <20211027225324.2a1813f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.9_xqF4DmumvCYalt6eHW2Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.9_xqF4DmumvCYalt6eHW2Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  fcc92afad9b5 ("arm64: dts: apple: j274: Expose PCI node for the Ethernet =
MAC address")
  92038722074e ("arm64: dts: apple: t8103: Add root port interrupt routing")
  1877225c5fa0 ("arm64: dts: apple: t8103: Add PCIe DARTs")
  3ca4ea148ba4 ("arm64: apple: Add PCIe node")
  97f0b33b9d2c ("arm64: apple: Add pinctrl nodes")
  4c929eb8eab4 ("MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE")
  f2434d68992c ("MAINTAINERS: Add pasemi i2c to ARM/APPLE MACHINE")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/.9_xqF4DmumvCYalt6eHW2Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF5PbQACgkQAVBC80lX
0GzOfQgAoE3HIHcthqT7xgf9RC0zfLB5af8FRMe4eiHTRpIZNnfWjY2xMw9lmo2B
F6VVI5ERTqOeLf7k/YYVkEiKqtriALmvITK8RZS9ldVscKVaywkY8H0eoI1G6jrD
j0WewPGlXPHqj5VOU1ZoXvi9oIw+H+HYppJmaZqlfI8dcNTUUN/lJ3RwdZGwe5wo
Lu65wQDKi1Y2v04CMgu2LieHY9OzdGax513vscPNN9w+nSmpPfdn5ubigSmJHMpI
5VDBA87fw7yUxyUkT87KMnRWHOyYstYuQqyRKGsIUsVq60PQ2W8gIXn6NDkebu3U
KJ/mcS2AJSgxFM9Jibo4jkeHcPUtcg==
=MxfQ
-----END PGP SIGNATURE-----

--Sig_/.9_xqF4DmumvCYalt6eHW2Z--
