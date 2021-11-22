Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A02459867
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 00:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbhKVXa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 18:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhKVXa2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 18:30:28 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F6CC061574;
        Mon, 22 Nov 2021 15:27:21 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyk2G6NHCz4xZ5;
        Tue, 23 Nov 2021 10:27:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637623639;
        bh=cNN1KH3IiFOzRnbbUMcFEjeDGKA7GrqRdSkqp6HqSLw=;
        h=Date:From:To:Cc:Subject:From;
        b=JOBxwxJVw2w6YDUsXlssPtUg2JOAj9uS17byy9MbYQ1mDPsCLu/yDQK3vlXWoR5ls
         l8hzja4HYKaEml+cie5lq6y2Exj0JyfQmTAvsriEqIeGrGuNebC1wI7qY/xABXORn2
         Lw++AwvN/SPCHUe6hfeUhqwDJM/tn6CncMz6CNgCuPQQgmpCjiTGBd+RCLPLPM6lro
         k6agmfI0SkSLY7ZO0iqyqPqoNg6BW5vL+wuzF8G/dT1lKt343x+OCHKp3YVZTtzW/8
         vo/7tYiYUkmIT9akHHOmdHakkzazmXJEIr3LjUHU4omDzayhsYlhIHTqYYQlNj09Rz
         JSNdK2rKsxFhQ==
Date:   Tue, 23 Nov 2021 10:27:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Samuel Holland <samuel@sholland.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sunxi tree
Message-ID: <20211123102717.1c3b086f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V/kQEjOnOWoeMFQP_pY7bHa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V/kQEjOnOWoeMFQP_pY7bHa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sunxi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c: In function 'suniv_f1c100s_ccu_se=
tup':
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:532:39: error: 'pdev' undeclared (=
first use in this function)
  532 |  reg =3D devm_platform_ioremap_resource(pdev, 0);
      |                                       ^~~~
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:532:39: note: each undeclared iden=
tifier is reported only once for each function it appears in
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:534:10: error: 'return' with a val=
ue, in function returning void [-Werror=3Dreturn-type]
  534 |   return PTR_ERR(reg);
      |          ^~~~~~~~~~~~
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: note: declared here
  526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *node)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:543:10: error: 'return' with a val=
ue, in function returning void [-Werror=3Dreturn-type]
  543 |   return ret;
      |          ^~~
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: note: declared here
  526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *node)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:552:9: error: 'return' with a valu=
e, in function returning void [-Werror=3Dreturn-type]
  552 |  return 0;
      |         ^
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: note: declared here
  526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *node)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c: At top level:
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:561:11: error: 'suniv_f1c100s_ccu_=
probe' undeclared here (not in a function); did you mean 'suniv_f1c100s_ccu=
_driver'?
  561 |  .probe =3D suniv_f1c100s_ccu_probe,
      |           ^~~~~~~~~~~~~~~~~~~~~~~
      |           suniv_f1c100s_ccu_driver
drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c:526:20: error: 'suniv_f1c100s_ccu_=
setup' defined but not used [-Werror=3Dunused-function]
  526 | static void __init suniv_f1c100s_ccu_setup(struct device_node *node)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  72dc8e122383 ("clk: sunxi-ng: Convert early providers to platform drivers=
")

I have used the sunxi tree from next-20211118 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/V/kQEjOnOWoeMFQP_pY7bHa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcJ1UACgkQAVBC80lX
0GzEVwf/Us+FSe2QOqvy73v4WxNSs9fr1XKPIhuXm1jEwiRl7JZRjXOuvPgibKEB
kC5xl8htOfRpyIqQ3RwtlGT/a6tJnb5bMOKpVnMSZZrMkkL+YQ68mxjUSsYBV96B
ZB++qoBlAWKdRuVYbYx9be47j9q1zjBFn5AJiNsaWD362FCU60Bmxw8MiE1rqXtw
ybZWCz5J+FpqHkrErdYMS4qC+5VVrs1oqW+SjROF6SEuQQweZvUNqFts4xQm8+1c
TJ41CNXgrhAmC5Mju1oRCAQ6vIBWIZZAlPt/1RaqD47gDexQX8h5UpMEPPx0o8LY
eP5Ha9/L0dm44+TmCP4GtzmwubA3rQ==
=3lHg
-----END PGP SIGNATURE-----

--Sig_/V/kQEjOnOWoeMFQP_pY7bHa--
