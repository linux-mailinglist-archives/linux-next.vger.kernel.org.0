Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CE8421AC8
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 01:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhJDXls (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 19:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhJDXlr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 19:41:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2AFC061745;
        Mon,  4 Oct 2021 16:39:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNcdQ1btDz4xbQ;
        Tue,  5 Oct 2021 10:39:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633390794;
        bh=aB8IhWK87FWexNccjwVQpSKQmkPZxtzJR0jnzym8MlQ=;
        h=Date:From:To:Cc:Subject:From;
        b=fPbZTUtn+6mxB7FjW1/yoaJWXG9A/zaRsqpw7x3EAQNskufHy6GkDf41ogLA+5kqS
         o+8Tg8FRk0xFNaLQlNefEtCm+Z+mrdEzVA5R2Ta2P2EwsRqsgKox5+se8dNazqG5wo
         5kozGLRDsrW4Ylr+0jx5v/THk+HTcltPcsgZ+eL/jBk74nsYu90WImezpWFX0gIK/q
         xFma1R7KCpRCfOA7XmEnal2/TnoSQ79nAl2BkfBwJy4dfrnNruBi95HTTKOH1tt9fp
         yQYtJZO/6rC2LhVJtQk4oV86ocWWpTdiKC1m7O//100lYmJHOD9HqwXoWxWv/NN21a
         DXoegpdlxwCEA==
Date:   Tue, 5 Oct 2021 10:39:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tegra tree
Message-ID: <20211005103952.0914094d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NRVJUM/wJFDNVy_FKET=KhO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NRVJUM/wJFDNVy_FKET=KhO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tegra tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/include/asm/bug.h:84,
                 from include/linux/bug.h:5,
                 from arch/x86/include/asm/paravirt.h:15,
                 from arch/x86/include/asm/irqflags.h:63,
                 from include/linux/irqflags.h:16,
                 from include/linux/rcupdate.h:26,
                 from include/linux/rculist.h:11,
                 from include/linux/pid.h:5,
                 from include/linux/sched.h:14,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/of_reserved_mem.h:5,
                 from drivers/memory/tegra/tegra210-emc-table.c:6:
include/linux/clk/tegra.h: In function 'tegra_cpu_rail_off_ready':
include/linux/clk/tegra.h:112:15: error: 'tegra_cpu_car_ops' undeclared (fi=
rst use in this function)
  112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~
include/linux/clk/tegra.h:112:15: note: each undeclared identifier is repor=
ted only once for each function it appears in
  112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~
include/linux/clk/tegra.h: In function 'tegra_cpu_clock_suspend':
include/linux/clk/tegra.h:120:15: error: 'tegra_cpu_car_ops' undeclared (fi=
rst use in this function)
  120 |  if (WARN_ON(!tegra_cpu_car_ops->suspend))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~
include/linux/clk/tegra.h: In function 'tegra_cpu_clock_resume':
include/linux/clk/tegra.h:128:15: error: 'tegra_cpu_car_ops' undeclared (fi=
rst use in this function)
  128 |  if (WARN_ON(!tegra_cpu_car_ops->resume))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~
In file included from arch/x86/include/asm/bug.h:84,
                 from include/linux/bug.h:5,
                 from include/linux/cpumask.h:14,
                 from arch/x86/include/asm/cpumask.h:5,
                 from arch/x86/include/asm/msr.h:11,
                 from arch/x86/include/asm/processor.h:22,
                 from arch/x86/include/asm/timex.h:5,
                 from include/linux/timex.h:65,
                 from include/linux/time32.h:13,
                 from include/linux/time.h:60,
                 from include/linux/stat.h:19,
                 from include/linux/module.h:13,
                 from drivers/media/cec/platform/tegra/tegra_cec.c:14:
include/linux/clk/tegra.h: In function 'tegra_cpu_rail_off_ready':
include/linux/clk/tegra.h:112:15: error: 'tegra_cpu_car_ops' undeclared (fi=
rst use in this function)
  112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~
include/linux/clk/tegra.h:112:15: note: each undeclared identifier is repor=
ted only once for each function it appears in
  112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~
include/linux/clk/tegra.h: In function 'tegra_cpu_clock_suspend':
include/linux/clk/tegra.h:120:15: error: 'tegra_cpu_car_ops' undeclared (fi=
rst use in this function)
  120 |  if (WARN_ON(!tegra_cpu_car_ops->suspend))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~
include/linux/clk/tegra.h: In function 'tegra_cpu_clock_resume':
include/linux/clk/tegra.h:128:15: error: 'tegra_cpu_car_ops' undeclared (fi=
rst use in this function)
  128 |  if (WARN_ON(!tegra_cpu_car_ops->resume))
      |               ^~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
  121 |  int __ret_warn_on =3D !!(condition);    \
      |                         ^~~~~~~~~

Presumably caused by commit

  bbe30ae68d14 ("cpuidle: tegra: Enable compile testing")

I have used the tegra tree from next-20211001 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NRVJUM/wJFDNVy_FKET=KhO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbkMgACgkQAVBC80lX
0Gxt1gf/Xi25Ccipu9S6381vB5Rj5/YGf4iPXTWG1OuWTrTedw0h2jnr9SiQAaCF
p+iuYkNRt3pfJqECXgyuEq+h4cg9XH5rI/312NQivNHbRPWyMOZzkacLPkiG072t
Q3fvmgWWjuzgr8O+9snfCd+qMgFflsZUbumcQuKp8K9CiPNi3bDvcXQcm+5b74nO
Roq9MwCeLvRbZxdybGYd91VCyinYH37qUfC3vlwaEoo14vPzSxRiaZySWnwtP5+9
vlLdq7Bbpz/tmKC56yDkhrrjThAuVsq8lLdeau3O0I75pCrS2MZXYMcA7wJDvvry
+rGx4PfNR3Hjp2aYPPLdVBRY639fFw==
=mKWV
-----END PGP SIGNATURE-----

--Sig_/NRVJUM/wJFDNVy_FKET=KhO--
