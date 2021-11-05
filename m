Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5973A445F37
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 05:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhKEE5j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 00:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhKEE5j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 00:57:39 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA2AC061714;
        Thu,  4 Nov 2021 21:55:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hlp8g0FKhz4xdW;
        Fri,  5 Nov 2021 15:54:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636088099;
        bh=tlaLmczFVmVr9iNjno5jS9HDvbVxdlwBmZqZQWHD+0c=;
        h=Date:From:To:Cc:Subject:From;
        b=TTdg67ifg50099hnBkIzC+ze0ABzWRMKxWDequ93HnOEhK2xYv+WcaJ/txhw5zX5y
         xb7MfpiIAfLgH2R5wbopbww4GjcniJjzPpUFUq07dF8vukkXG5oBocoo7gz6gb6Cwz
         GzSZOJzyyQKUwCVealTQyTKOa4otkto5d4U9dbF8RK+tFM2EQJQDD2PxR1JXQrfjRg
         unWFb1zZXOzt5sKNZrf3X791RzaTGEKaqCLjrGeZ331D3L3FtwlJr1cCLUY6w9vpc7
         uwbG9bhmIb5XHO5Ss6BL/za06m1HIQDxVdulDh0v6E0SXMk7tyC7u16ygpO10f0gge
         HYLP7w/30n5Lw==
Date:   Fri, 5 Nov 2021 15:54:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20211105155457.770efec2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lJNtsGB5RtfhF_+0ErTAu0_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lJNtsGB5RtfhF_+0ErTAu0_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (arm64 allmodconfig) failed
like this:

ERROR: modpost: "this_cpu_has_cap" [drivers/hwtracing/coresight/coresight-t=
rbe.ko] undefined!

Caused by commit

  8a1065127d95 ("coresight: trbe: Add infrastructure for Errata handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/lJNtsGB5RtfhF_+0ErTAu0_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEuSEACgkQAVBC80lX
0Gw/tggAopKMqnMrCYyKCAkrRgzHqeOZe4V5Cj1gcOyk6UgBx6uQT17HIw4D7KlV
I2dYppgisiIKWA8ge7DtNyihCizKBaLc7DC9ZV0L4bNYIB2W9mS0/d9RUdUAZ202
8zSHn32aGT8B25WJGmTRRJSnfiY8on2A3fwKmYQTzfFcU/fz3fKsuJSiyEjOK5C0
g1pjjEDRP6SXUgC9HbOwXoLfiR0R2nlGitNLvG8xAXgvDA4C7wkEADrujx5rs+Rg
p/NG/3+EYfXolZdeu96vP2fWYFsDGSpxqmRxhE6OBcxKxG29vHZ033XDDXV0GWqM
qp3mJZBQ5NRFhUqxfxmXcjhvlieVTw==
=XuMU
-----END PGP SIGNATURE-----

--Sig_/lJNtsGB5RtfhF_+0ErTAu0_--
