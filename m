Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56611B32BC
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 02:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfIPAA7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 20:00:59 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56118 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfIPAA7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 20:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wBeyGHhlC8OeOKanI5Kle4zluKcz42LukBrLrIn21MY=; b=rT1jfPPKxW6cMs3yYNBw6dJj7
        1hy7AnIVHDBTZKlkqwjCPrburudwNxc7ZaPD7FXHWa5YYQPe725KK6az8kSyxu2GPKqy2wHjV07Sg
        n+8bZOpwOx72X7uhjAAxQxvPUWHd3qXbI4dPN4LIBBv/ZY/tXL3ZXhP50B9e2d3RbJhBc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9eRd-0001jQ-FE; Mon, 16 Sep 2019 00:00:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2B1BE2741587; Mon, 16 Sep 2019 01:00:40 +0100 (BST)
Date:   Mon, 16 Sep 2019 01:00:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matt Fleming <matt@codeblueprint.co.uk>,
        Tom Vaden <tom.vaden@hpe.com>, Christoph Hellwig <hch@lst.de>,
        Tony Luck <tony.luck@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the FIXME tree
Message-ID: <20190916000039.GR4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q8a9NmTVi5AMeZ2v"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Q8a9NmTVi5AMeZ2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/ia64/Kconfig

between commits:

  fc5bad03709f9 ("ia64: remove the hpsim platform")
  cf07cb1ff4ea0 ("ia64: remove support for the SGI SN2 platform")

=66rom the ia64 tree and commit:

  a2cbfd46559e8 ("arch, ia64: Make NUMA select SMP")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/ia64/Kconfig
index 5dbd7fd7578f4,997baba02b70e..0000000000000
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@@ -311,7 -386,10 +311,9 @@@ config ARCH_DISCONTIGMEM_DEFAUL
 =20
  config NUMA
  	bool "NUMA support"
 -	depends on !IA64_HP_SIM && !FLATMEM
 -	default y if IA64_SGI_SN2
 +	depends on !FLATMEM
+ 	select ACPI_NUMA if ACPI
+ 	select SMP
  	help
  	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
  	  Access).  This option is for configuring high-end multiprocessor

--Q8a9NmTVi5AMeZ2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+0KcACgkQJNaLcl1U
h9CH2Qf/ZZPhAOObqGRvz8kSFZaFgZTzHDHQPM1MYNoKf54c741CGiScRJMgIEQn
K/arry7UolumR7PamDglk5K2qXVJFyG8rCfmMdti3c6HykEPbp1YXVhmOqGQBzlb
YOJgermA8gRx96QCu6UixM2SUZCpGmfvY8BDJ+MRPF2I9UAZafQi0pPAY27PtVNY
nxjTTV05A2H/CfbLRwhYSl1cKXdUItVKoVGkexcJQn0bbeEaqPUaXAX45CEl2fWK
hwr2iqZZr5SnFD6an8bGFvUFByDJj3RSv3RYSR+WADsXhFLyDjSVYtSWBZAFh4fW
Qx4tIi8JT56qXfJQYrlz9l9J6ULwSA==
=YsIT
-----END PGP SIGNATURE-----

--Q8a9NmTVi5AMeZ2v--
