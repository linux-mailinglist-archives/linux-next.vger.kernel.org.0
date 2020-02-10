Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0BE15862F
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 00:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbgBJXfe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 18:35:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44559 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727484AbgBJXfd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Feb 2020 18:35:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Gj2C2KBmz9sP7;
        Tue, 11 Feb 2020 10:35:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581377731;
        bh=A9I4Exyx1amA8GHIZASrDs14+WqyvB9VNO9ep/EreSI=;
        h=Date:From:To:Cc:Subject:From;
        b=sLIVMCZmGiv0TEeZHU8k2ATV+Pa68fu8iJ/mcItRYmZ+RkteNpEs0yCEED8gy9bBX
         /tBLFoh7AT4In16A42QTEGH1jASLp1dpURN5RunV2WlPVD7MuajCAPoLbVQDvHG0ez
         ymboSINdE4QcMSHKkO+OrJ1BBIyflqLu3RhgYNsfp9+s1Ow76nzEUEL4hD9xeLN7EU
         /WkRoO6LsazQhhDJLQIjFbhnUAZ8vrOCHA7BuQ3C2x7udGS6Oeea7BWkHry66ziaYW
         IYddiACniU/5z0+TQd3xeAPa6MWT8igwAs4irnw3hvdQOXCuLKBmAeN48Ego4asvWc
         HQQmb4DkmE61Q==
Date:   Tue, 11 Feb 2020 10:35:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gayatri Kammela <gayatri.kammela@intel.com>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Message-ID: <20200211103530.41d1e6ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r5cBcmlIGBFgBWeYwt1f3n6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r5cBcmlIGBFgBWeYwt1f3n6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/platform/x86/intel_pmc_core.c: In function 'pmc_core_resume':
drivers/platform/x86/intel_pmc_core.c:1329:43: warning: passing argument 4 =
of 'pmc_core_lpm_display' makes integer from pointer without a cast [-Wint-=
conversion]
 1329 |   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
      |                                           ^~~~~~~~
      |                                           |
      |                                           char *
drivers/platform/x86/intel_pmc_core.c:978:30: note: expected 'u32' {aka 'un=
signed int'} but argument is of type 'char *'
  978 |      struct seq_file *s, u32 offset,
      |                          ~~~~^~~~~~
drivers/platform/x86/intel_pmc_core.c:1329:53: warning: passing argument 5 =
of 'pmc_core_lpm_display' makes pointer from integer without a cast [-Wint-=
conversion]
 1329 |   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
      |                                                     ^~~~~~
      |                                                     |
      |                                                     int
drivers/platform/x86/intel_pmc_core.c:979:18: note: expected 'const char *'=
 but argument is of type 'int'
  979 |      const char *str,
      |      ~~~~~~~~~~~~^~~

Introduced by commit

  2cf128fbf321 ("platform/x86: intel_pmc_core: Dump low power status regist=
ers on an S0ix.y failure")

--=20
Cheers,
Stephen Rothwell

--Sig_/r5cBcmlIGBFgBWeYwt1f3n6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5B6MIACgkQAVBC80lX
0Gxv0Qf/dMOTapA+5L5ohlE1hJhE4Mq/PcTpgXz5+OT9qJ13+GAVaoYUjuYyx8EU
CuUbRsZYNL2PYJ3K9Gq95IaYIBzg1CFBl/jNHvqkqESNNLd0xiyFRR9XYwK335mb
5WcyX6VmLJGcrXhtKnn4Bpyg8r/cXWg8QJLhCU8aN7YVOZ2Xlv1UL/026Gjq5CFY
gcXST2ZkKgUiHUBVHqgjLmVQj0kmFbL5U/pCiozob91ty0YEv7w+IRHDBC+HV6Xy
s4WxrcdddS6w0GzqmOwk6pGtqATWdMYrtCrAOqX9Q6DWNyumaQYwyhqiSAL56fga
qLd33EDPIyk1J0s+XAsSjqygvHYRYw==
=IbJr
-----END PGP SIGNATURE-----

--Sig_/r5cBcmlIGBFgBWeYwt1f3n6--
