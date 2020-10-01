Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853F527FCAF
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 11:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbgJAJx6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 05:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgJAJx6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 05:53:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2B4C0613D0;
        Thu,  1 Oct 2020 02:53:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C27kB1W4rz9sTs;
        Thu,  1 Oct 2020 19:53:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601546034;
        bh=EWKQMkJ/Tz+lGXgLkt0ZKJpI0buD4RIdCeYfrd4ddsw=;
        h=Date:From:To:Cc:Subject:From;
        b=CzOUNaMuHJlqvclqVSO1aLe50W+gD3UlvT/h+H1aA3Ig9AJX3lmAqQz6ZRYx6YVeC
         sBIp+tLJQ+QZcKuY2Lgzb1dgbX+cXVUC+mQIysT5JMHszV8JH+EmA9HTj9nvROGH+W
         gwMJme0ePkVwSb4tcyxKEOidXnOXT23+7zpdhFeC3pFk4SycTJGmDoYlQErOBIKeuH
         R0HYayOa+NK0nmtkMqb4Mi8AyvOA7buy9jbtxPbKeYyZOFKkqAbrx60P9Grky314qT
         k4eToediCwuXEwmCEe9W4JCba6O47mn6mMHn15fCFDADIFvuvPnCYEiTODH0WzWImC
         gg93B6XPALwcg==
Date:   Thu, 1 Oct 2020 19:53:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>
Subject: linux-next: manual merge of the akpm-current tree with the pm tree
Message-ID: <20201001195353.7e3551f7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6BWvLz=k3oUAN47eqFkIpd3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6BWvLz=k3oUAN47eqFkIpd3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/acpi/acpi_numa.h

between commit:

  4849bc777049 ("ACPI / NUMA: Add stub function for pxm_to_node()")

from the pm tree and commit:

  623347c1b949 ("x86/numa: cleanup configuration dependent command-line opt=
ions")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/acpi/acpi_numa.h
index 09eb3bc20ff5,0e9302285f14..000000000000
--- a/include/acpi/acpi_numa.h
+++ b/include/acpi/acpi_numa.h
@@@ -23,9 -23,16 +23,20 @@@ extern void bad_srat(void)
  extern int srat_disabled(void);
 =20
  #else				/* CONFIG_ACPI_NUMA */
 +static inline int pxm_to_node(int pxm)
 +{
 +	return 0;
 +}
+ static inline void disable_srat(void)
+ {
+ }
  #endif				/* CONFIG_ACPI_NUMA */
+=20
+ #ifdef CONFIG_ACPI_HMAT
+ extern void disable_hmat(void);
+ #else				/* CONFIG_ACPI_HMAT */
+ static inline void disable_hmat(void)
+ {
+ }
+ #endif				/* CONFIG_ACPI_HMAT */
  #endif				/* __ACP_NUMA_H */

--Sig_/6BWvLz=k3oUAN47eqFkIpd3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91pzEACgkQAVBC80lX
0Gxr3ggAiyypJPMkTLBiqZIjkHRjUi+TXtvdaeULcJ/pcfIXffC3Z/7Zm3Y8Ti+g
m6blLRpVGUozgz+kWxBrkrYurgr6/qz2S7FvBob9SF42zEwRB6Q0M+VUm7UIHWwF
ZzBUwEup+BjdyfhW4PXGzBC8g6dd5oLXWK8MfD9bhQdWpSQplQPQ1jNhI6xbiKhs
Q16bkAsQ+HatYaPdcdwCaKJ87XQ2dVPMiFox5vG/8Nhl6RHnBEbNzfXSfhD1nx0I
4lOYuHkmhw8t0ycv0iHVE9J0u7BFbiECytIHNKb1EujYEiU15S7pgg/CWgqiVY+d
akNfCorJK8v/rwQkgioWBbFhyuqg7A==
=UyCY
-----END PGP SIGNATURE-----

--Sig_/6BWvLz=k3oUAN47eqFkIpd3--
