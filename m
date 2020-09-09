Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54192262877
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgIIHXX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:23:23 -0400
Received: from ozlabs.org ([203.11.71.1]:40417 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbgIIHXU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Sep 2020 03:23:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmYQZ1tkLz9sTX;
        Wed,  9 Sep 2020 17:23:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599636198;
        bh=d6EUXUc9+FiqXpuacjC9aDTYw/+UMcDEJgP0/w1dNDs=;
        h=Date:From:To:Cc:Subject:From;
        b=iF0d9TgFexX1zsaMEN9Rf67znAEVV1L8nHn8Dlavz2Atb9fuiJJfiqZfFpGM6epys
         VQTFOz/anr+Wx0nt9KaQF+1WGah1QUPsfyUnTNumLjw2zfmyBr+q6ymjw3kpugUCJE
         v18LYtWu2WE0gNJktbKEkhigzMwlwGdPb7xK7jRbdND32wLLOqs87gbi7jBuTErxXj
         rszTVSrdgQygX0Hz2P7xbBLRASKNc3qP8SeJNRS4595BvZA9FB4WXTZMC+X3S1PWfP
         mayUWAAmtc/PhFlPSajyCtGG0CWgnxiFNsMzv6lcstdIj9Gk1s0CmKNv6mkMwNg47a
         SCGLS38uqlUcQ==
Date:   Wed, 9 Sep 2020 17:23:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the driver-core tree
Message-ID: <20200909172317.170984de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/18lyfPQH8SGzodw.E.jQO8Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/18lyfPQH8SGzodw.E.jQO8Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build produced
this warning:

drivers/mmc/host/davinci_mmc.c: In function 'davinci_mmcsd_probe':
drivers/mmc/host/davinci_mmc.c:1243:4: warning: ignoring return value of 'd=
ev_err_probe' declared with attribute 'warn_unused_result' [-Wunused-result]
 1243 |    dev_err_probe(&pdev->dev, ret,
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1244 |           "could not parse of data\n");
      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  e1f82a0dcf38 ("driver core: Annotate dev_err_probe() with __must_check")

interacting with commit

  3a35e7e1bd50 ("mmc: davinci: Simplify with dev_err_probe()")

from the mmc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/18lyfPQH8SGzodw.E.jQO8Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YguUACgkQAVBC80lX
0GyMPAf/XYMWZojWSl9lqF7j+11gEeyUdYJZYtcFNdrqCr+5ZWyaKNAtpV0wb2h7
s4JXDBE8oLKV/0cJ0P2t3NyVyer4DYSJ6AZfMLTPSetmOvcXp82wgSBLtz6yxoOx
QEI6/R/YY0K6V8Fg+Zx1A7BECWPRXDXD7K738zRsjM+A67kHOb0/K69JElM/yOml
hw5wTwGZ31f1M1skXDPMUZ+s+tFQE49coaSZFHyMZvzeoDxF9E1i02pZ8QDBd/x/
bFPdv7yWht0Gv66YAvFbvzXtW8tzzm36Eu3hIaFGDWiZppQinX9n0GIuTSaoX6B8
Al/9G5yLIOToGrnTfbchFj5lCIIo0w==
=WNOR
-----END PGP SIGNATURE-----

--Sig_/18lyfPQH8SGzodw.E.jQO8Q--
