Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD66131F6B
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 06:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgAGFnX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 00:43:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35909 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgAGFnX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 00:43:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47sLrl0wlqz9sPn;
        Tue,  7 Jan 2020 16:43:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578375800;
        bh=X9vjrI1Lwv1FP46BoDJdpJqV+onCifTfPABlXvfeWVs=;
        h=Date:From:To:Cc:Subject:From;
        b=HqDMmYVBJ057mrfA3W0uNfYJAdT6492y6NLnfbibLKycrxOlQfn0xMtfnHomfTDqs
         3KbH4jHDOvl/ksOFcUzgTaNDip7YLq6PiRfQblPYnP1Sy7uP5yFe/8Tp83kx8bXuM/
         iz5CwFLu6iOLKqZMjlR/2FHydhMwyI6Bj6UHJvOKA/I3U0jzrTZk+9rfID2MZIk7U0
         ezuj/HhKMWJC75uyl8kw5wI85dk1JafUULHFZ+0nirWBSd7Fps/lO8bIwu7MniGAs/
         Ym2pC4L3nd24YaabrbNHZcknhWT0m5f7QtjrySMUhXu3BZx5y9ZjmTg7NnctrGjK1P
         3LgVwRSFOKroA==
Date:   Tue, 7 Jan 2020 16:43:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20200107164317.51190747@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kJ9G.R6pHsqk5ni8ZYg+kWJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kJ9G.R6pHsqk5ni8ZYg+kWJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[This has been happening for a while, I just missed it :-( ]

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

arch/x86/kernel/unwind_orc.c:210:12: warning: 'orc_sort_cmp' defined but no=
t used [-Wunused-function]
  210 | static int orc_sort_cmp(const void *_a, const void *_b)
      |            ^~~~~~~~~~~~
arch/x86/kernel/unwind_orc.c:190:13: warning: 'orc_sort_swap' defined but n=
ot used [-Wunused-function]
  190 | static void orc_sort_swap(void *_a, void *_b, int size)
      |             ^~~~~~~~~~~~~

Introduced by commit

  f14bf6a350df ("x86/unwind/orc: Remove boot-time ORC unwind tables sorting=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/kJ9G.R6pHsqk5ni8ZYg+kWJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4UGnUACgkQAVBC80lX
0GyNQQf9Hu7jqQ0EnR+61XDUjlbyJar0srNrR552esV4mOAPLZ2tuHL0wBpoWUi3
0CXYb9hsFLWcN3s3TOdJ65kwdn22plchzRSU3ctJALarR/ikJcLiHdk8CYyorQ8S
i0wZD3tcohx2dZ+HBQHKg5CRwi0L97nsTWujn8bvG51FN4YwDu2MJpMNDIWxY+Wo
4f1LpC5vxmNuAkdNMoc8AGvwtkvDM6UdflzGNzfmpv8SHbZnMe2UabjIrpbAztem
kF8jOgw7xqSi8dNYCVz+uDUWg71bIZYxvTcaU3aBV2JywLq5psaW6zakbo7HJONf
uZWKWMX2iFqyyyjlcYpm6NCHPzgbhw==
=ED+X
-----END PGP SIGNATURE-----

--Sig_/kJ9G.R6pHsqk5ni8ZYg+kWJ--
