Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7533211CA
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 09:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhBVIKV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 03:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbhBVIKS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 03:10:18 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD61C061574;
        Mon, 22 Feb 2021 00:09:36 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkZbJ1pmNz9sBy;
        Mon, 22 Feb 2021 19:09:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613981373;
        bh=/kO2yzASfVqsCYvqWo0MJAP9LM+MmjcpeRWvrSn5hSM=;
        h=Date:From:To:Cc:Subject:From;
        b=Xt5hRaZzLC2XIeRc3jnl0p3O2efy6cGs7Pha1aQE4BfStosSEdIpx6YvZIy9ZL143
         Ken24YvNBH+63NWAIve38hcLY9DRJjK3nXXaD88cG+0zb4ideSGpndyQfAiCKEMFRW
         +cWpZzNFTZH5FVnf9UKA+OOHmStTjc3vOka3ZGCIu7399qP3Tf/eZB8SJPPXPjcg62
         ixZ7xv9jW02znhHRta3hRvncpthhjCBSsEy6WBxFkUWcqLoeVg2Pk/rGM7rLFO4YlE
         1xq2IUHO+7ERhS5IojIZrb95Y6u5KGJtcZ2wfoQHyaxTW0QgdBwD33Xmx8GZVT3xCw
         OL2Kq/nfE4NIA==
Date:   Mon, 22 Feb 2021 19:09:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Corentin Labbe <clabbe@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the sparc tree
Message-ID: <20210222190928.4f093646@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ta3zzFdFJPmgtWKlbVvRjKm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ta3zzFdFJPmgtWKlbVvRjKm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sparc tree, today's linux-next build (sparc64 defconfig)
produced these warnings:

arch/sparc/configs/sparc64_defconfig:237:warning: override: reassigning to =
symbol ATA
arch/sparc/configs/sparc64_defconfig:239:warning: override: reassigning to =
symbol HAPPYMEAL

Presumably introduced by commit

  520615e1f5b2 ("sparc64: switch defconfig from the legacy ide driver to li=
bata")

or commit

  a57cdeb369ef ("sparc: sparc64_defconfig: add necessary configs for qemu")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ta3zzFdFJPmgtWKlbVvRjKm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAzZrgACgkQAVBC80lX
0GwHkgf/QtXPFPUR9U9spr0yWGZPXirsYRdNpJWabyJoWysKvKBuBezDWQmCKfnb
UtkAO8zGJiX4aKWrcmzmlvNRi77Id5EHvRECiYw5IlOmqH2pHblNi8izxnNfz2dI
4gbXdImmAEmIK8cksyMkr+suZmFVnQr+ohc/lCzMeHnj8p+be3vhjo9Jf9C6Llfi
S+U6eTH0NyBqLjMm4Z0REs3A4xnKV6RrBUnHh7RpqB0dJpXKKU6zFQnJULHCmHF4
vTMruRBD8mrEgsi2aIjEVCkwaZDlRI2B99Dg/l7+ZTdPya/CpSRq4tgehuaaQ6Dj
lGo1wVZ4HZOwBSuFxOCaKOWDAocesg==
=aCfV
-----END PGP SIGNATURE-----

--Sig_/Ta3zzFdFJPmgtWKlbVvRjKm--
