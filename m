Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447248F7C4
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 01:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfHOX5h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 19:57:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59415 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbfHOX5h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 19:57:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468k0G13t7z9sDQ;
        Fri, 16 Aug 2019 09:57:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565913454;
        bh=9i0HriZXkUOIw393EkMb0OLCjxJPlfiJhqCtswsGvIQ=;
        h=Date:From:To:Cc:Subject:From;
        b=sIK6zRUgyiIMEk/F2ORLaz7ggcKC9pWp6y8VKt/mBmemz+vQjy2AK+92oLcC6xNub
         /+0Ighp2XzT4qIR9Fj9rcIn/iVPgXs2XyPIZuOIg9af+LdwZabnSS7oQ3nKtnwedoK
         QtOcnbuLvzzFBXGGe+I7rbR5oOyWX+WE45sbTajTLo8SJ7nEqJ5WEWGLCAkpLkjyfL
         F2ImbpWQ20ax805Bbu3S44VjZD7rrF4UWkrnS+IE4VpSsFsu13n0ow08S3lxU+bhqd
         +g5vA5qu1PEIBJUowozVaTE/MAKnI6ETQVigdAmqALgKn7eKpT0P8XTNFpx+151sYU
         eLTGyVnggO4Lw==
Date:   Fri, 16 Aug 2019 09:57:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: linux-next: build warning after merge of the clk tree
Message-ID: <20190816095732.0ffea609@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wW4HF+6t_L8/vB=qk60FrM0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wW4HF+6t_L8/vB=qk60FrM0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/clk/actions/owl-common.c: In function 'owl_clk_probe':
drivers/clk/actions/owl-common.c:71:24: warning: 'hw' may be used uninitial=
ized in this function [-Wmaybe-uninitialized]
   const char *name =3D hw->init->name;
                      ~~^~~~~~

Introduced by commit

  20cac6d02815 ("clk: actions: Don't reference clk_init_data after registra=
tion")

Clearly not a false positive. :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/wW4HF+6t_L8/vB=qk60FrM0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1V8WwACgkQAVBC80lX
0GybUAf+Itj+VhjLoPWpkjn+BxSnxb3D5OfJpA4vghJbrdshK4gNLlxPAXSLXVse
nviHyRdLpXA6c6fou27o6gmgKKpY3t5GS5W5Cn6XgBASobvA3TOQ/tSSxmNzmbrz
CJpqMXn8i4VfAbk79GniO0X4MTwLJL4ACyZ3YY8NgpDjdo8Kw7QV2+G+ZS1XtsjY
4m5XOkeH+xaAG/UTMJE3dpbWDu5KU7PcsJpffzYBgBKD+dnZ/WFnyerUj8Sv7FoH
JFBlLgLTmc+cxEJonH6UOlTflGPTjvAHRBoP+Ac/mw7nguutMqTJoICRFlRNLWBx
0puqCuFsB5+XWxsAHIEAftmIsQrI5w==
=x25U
-----END PGP SIGNATURE-----

--Sig_/wW4HF+6t_L8/vB=qk60FrM0--
