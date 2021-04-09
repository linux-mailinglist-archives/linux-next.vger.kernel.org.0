Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48594359BB5
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 12:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbhDIKPr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 06:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234696AbhDIKPK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 06:15:10 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A9EC0613AF;
        Fri,  9 Apr 2021 03:13:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGv935JmMz9sW1;
        Fri,  9 Apr 2021 20:13:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617963209;
        bh=0BjMUodmgPcivICj4iCsFznMR7XM2fWs437KiiMTk1A=;
        h=Date:From:To:Cc:Subject:From;
        b=Jt2tltatENitpE2vqx+BdBzRYQxBmIPSqVtXhiN5jMZymXBG5rbSM/zp41jTvbt5O
         5yaZploqBjbNodRJx3ZMSm3G2JREsDa+JJYh7E0p6RxepoRxJ3cvrRwXCiZFEb4VXk
         Tuo7tUZGdUpcwSMfYIT7LOvfgxPPf/HaRZ9CtnRRevYdkU+fhdeGj+uYkRKhy97AKa
         jvEEyC9dFPBtJkB2ZNk1O1SN0gHpC1a05ydljoRNOKP8nsm3uhqpWGhOCnn7KeWmJW
         WMTgBYrvS+kVPodt7TqGKaaGrGH0WfPg3FyUeT8AdoRESGs7wrA25Tg/lF5hzm0qgk
         9Izm94lQWdL+g==
Date:   Fri, 9 Apr 2021 20:13:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm-soc tree
Message-ID: <20210409201316.6c9295a4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O0xy41JSU/+P=v9ZX3QWlKm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O0xy41JSU/+P=v9ZX3QWlKm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (powerpc
allnoconfig) failed like this:

drivers/of/address.c: In function 'of_iomap':
drivers/of/address.c:907:10: error: implicit declaration of function 'iorem=
ap_np'; did you mean 'ioremap_wt'? [-Werror=3Dimplicit-function-declaration]
  907 |   return ioremap_np(res.start, resource_size(&res));
      |          ^~~~~~~~~~
      |          ioremap_wt
drivers/of/address.c:907:10: warning: returning 'int' from a function with =
return type 'void *' makes pointer from integer without a cast [-Wint-conve=
rsion]
  907 |   return ioremap_np(res.start, resource_size(&res));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/of/address.c: In function 'of_io_request_and_map':
drivers/of/address.c:942:7: warning: assignment to 'void *' from 'int' make=
s pointer from integer without a cast [-Wint-conversion]
  942 |   mem =3D ioremap_np(res.start, resource_size(&res));
      |       ^
lib/devres.c: In function '__devm_ioremap':
lib/devres.c:47:10: error: implicit declaration of function 'ioremap_np'; d=
id you mean 'ioremap_wt'? [-Werror=3Dimplicit-function-declaration]
   47 |   addr =3D ioremap_np(offset, size);
      |          ^~~~~~~~~~
      |          ioremap_wt
lib/devres.c:47:8: warning: assignment to 'void *' from 'int' makes pointer=
 from integer without a cast [-Wint-conversion]
   47 |   addr =3D ioremap_np(offset, size);
      |        ^

Caused by commits

  7c566bb5e4d5 ("asm-generic/io.h:  Add a non-posted variant of ioremap()")
  89897f739d7b ("of/address: Add infrastructure to declare MMIO as non-post=
ed")
(and maybe some others)

I have reverted 86332e9e3477..7d2d16ccf15d for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/O0xy41JSU/+P=v9ZX3QWlKm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBwKLwACgkQAVBC80lX
0Gxngwf9GQWNnc5LyM+HCaI+pb327CTB58y3t1AoTLkQSwo3Z71bVcl/Z3rv1CuV
7othJZfgn7gkU29CcB3KZXVKk2IaPfvhVqEEOjNEo7UsR/C1TBU4g5SGI3uCBhEg
XE8Fxr4RrQ9N6IE7e8qMb6XsEXdC6bxSWmrSRLKKPMPH01PGIeRRmbrTKqtJwSAN
rD4HDdlo+zGd6qTFuR49SqaJM8jgdA+XzKZmHKCDCQmnVVd/u7ILQ9U+dOxxy62u
JdA6Xzl8M5aA6BEI/Vbstr8U1DuR3p2V9T/KcfBruyi8X/nOaRb5gtTwA8LbTQOY
TnF4XkfJzuF+ic29VXw+50dtA6cKcg==
=Akh3
-----END PGP SIGNATURE-----

--Sig_/O0xy41JSU/+P=v9ZX3QWlKm--
