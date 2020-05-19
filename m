Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E9D1D98E0
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 16:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgESOFb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 10:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgESOFa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 10:05:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A67C08C5C0;
        Tue, 19 May 2020 07:05:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49RHhk1Rm1z9sTd;
        Wed, 20 May 2020 00:05:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589897126;
        bh=gd7ByV6aHDlFX73FDNTZQfneNBpwpSGtYtHfxszLkI4=;
        h=Date:From:To:Cc:Subject:From;
        b=pLl5Ux7o0sSjUQpsK31vPGk5n1A8uTU08erERo7vM0K+5bgHgJZ/ikPrS+gTYzlWz
         0K39Zbi9xFhGeIeTBQW5iX/twTfYAx3Ov6NEpH4h2zT8AhyR/u5rXgpBDCvyfkUjA3
         atcOPp6J9kaGsAn7D9jKlShNh7CzOelpTbwjMdCIe5AI2Vivdds3GTIM0+gb7FnK8n
         zWh18pq7yMJbtPTzuZ675FHPfFbwM30u/fAnjKArLalKA9z0wFWNV3kSRJsGN0U2wV
         dRYHtaQXpkLWhGb0/xpmuLJSfhvYWHw7K8xfps25JOiq+PzwvzTRqLfvb5tnjG/wiM
         KQQ9poghhCKWA==
Date:   Wed, 20 May 2020 00:05:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: linux-next: build failure after merge of the kgdb tree
Message-ID: <20200520000524.69af8a86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/7nNt/HW9l6xjKDYNjG/32";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3/7nNt/HW9l6xjKDYNjG/32
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kgdb tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/tty/serial/kgdboc.c:418:13: error: expected declaration specifiers =
or '...' before string constant
  418 | early_param("ekgdboc", kgdboc_early_init);
      |             ^~~~~~~~~
drivers/tty/serial/kgdboc.c:418:24: error: expected declaration specifiers =
or '...' before 'kgdboc_early_init'
  418 | early_param("ekgdboc", kgdboc_early_init);
      |                        ^~~~~~~~~~~~~~~~~
drivers/tty/serial/kgdboc.c:546:13: error: expected declaration specifiers =
or '...' before string constant
  546 | early_param("kgdboc_earlycon", kgdboc_earlycon_init);
      |             ^~~~~~~~~~~~~~~~~
drivers/tty/serial/kgdboc.c:546:32: error: expected declaration specifiers =
or '...' before 'kgdboc_earlycon_init'
  546 | early_param("kgdboc_earlycon", kgdboc_earlycon_init);
      |                                ^~~~~~~~~~~~~~~~~~~~
drivers/tty/serial/kgdboc.c:505:19: warning: 'kgdboc_earlycon_init' defined=
 but not used [-Wunused-function]
  505 | static int __init kgdboc_earlycon_init(char *opt)
      |                   ^~~~~~~~~~~~~~~~~~~~
drivers/tty/serial/kgdboc.c:411:19: warning: 'kgdboc_early_init' defined bu=
t not used [-Wunused-function]
  411 | static int __init kgdboc_early_init(char *opt)
      |                   ^~~~~~~~~~~~~~~~~

Caused by commit

  220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using bo=
ot consoles")

I have used the kgdb tree from next-20200518 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3/7nNt/HW9l6xjKDYNjG/32
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7D56QACgkQAVBC80lX
0GxfBAf/TKf1zO+S+d4005Wd8niJDcTION0P3bXtqmcaNP3/dt0K6QD7u5DtoxAB
QG/hAaglbVfj0fdv0WF0RSQwyXm7TUe+fNH2AW+BN37QBC2jhys5Zl0k7N/5Cult
qpgwIIrz/pYlEwXSxtTBTFPkG8nytp9dEaKbPP6dwxvWLchJUHKithlptGk1Q8OF
SHcsGWWLyVyQE7hzbXWaaSgLb+SVKrgDznb+T/kzwcHSgChVOi3nnEQVabId31hm
+BKHwrHsBxGiRlLRBuxtpNGB/eBXRydhBoUL0Yv6naVMV5wuSBlLV0iAl71L7AzD
lFTWhxICyanUK8jYhMOsueESPcoTHQ==
=G6e/
-----END PGP SIGNATURE-----

--Sig_/3/7nNt/HW9l6xjKDYNjG/32--
