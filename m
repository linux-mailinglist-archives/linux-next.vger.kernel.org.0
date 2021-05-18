Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1682D3872CA
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 09:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240696AbhERHFu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 03:05:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47995 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237944AbhERHFt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 May 2021 03:05:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fkn6x3DjWz9sW1;
        Tue, 18 May 2021 17:04:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621321465;
        bh=g3wDgr6MQQD9WBp9vNtKc0Ko1CkkmDiMlXocU+4rTQU=;
        h=Date:From:To:Cc:Subject:From;
        b=UHq3RZgWCZbWo2VydlSBxcA3ejCk8PVrDtQGtsYaed1oi3yNcofHBV+3F9kDM1nS+
         b9NuwnK9SykBrgWTuI08dq/2yDEi4BO22z87ZNl9Gx1PZm9MuWnLTutBHlOdS2B67h
         YNBCbmDMWRAZbEHuggXGi/cZQSnbWQ/9c7AXKpZqiammij1BMY0FFACXz4H6/Ch9PN
         ptV6mtt1T++LVbmZSMBSydiLmSi4DT0R3jEjL46hee20IH1sYKfFls5gfl3L4+8aLo
         bZHWUcei5wB8fdvn+VgJ+Zm7lw7G19qLU3QpjZzt1xAmtpV+xMbF3tx6LhDFQ/phFl
         MCQia2pdSLLVg==
Date:   Tue, 18 May 2021 17:04:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hyperv tree
Message-ID: <20210518170421.584dc0ec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LXdNxqsqA+Wo.ao9XCHST7.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LXdNxqsqA+Wo.ao9XCHST7.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hyperv tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/printk.h:7,
                 from include/linux/kernel.h:17,
                 from drivers/hv/hv_util.c:11:
drivers/hv/hv_util.c: In function 'hv_timesync_init':
include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of=
 type 'long int', but argument 2 has type 'int' [-Wformat=3D]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
   11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
      |                  ^~~~~~~~
include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
  343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~
drivers/hv/hv_util.c:753:3: note: in expansion of macro 'pr_err'
  753 |   pr_err("cannot register PTP clock: %ld\n",
      |   ^~~~~~

Introduced by commit

  32c0ff83550e ("hv_utils: Fix passing zero to 'PTR_ERR' warning")

--=20
Cheers,
Stephen Rothwell

--Sig_/LXdNxqsqA+Wo.ao9XCHST7.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCjZvUACgkQAVBC80lX
0GyqdQf/d0keGIj+k8R5AmaHhQ7f6BjAAu3Tn9QDjxDargxGIFlHcGKbjoMtivzt
mZjkRDCHGmKrMSh6tGsDY8MIkQbbBBVYI1OEWF+bz85A7KqdPxuETCgtHL+FZ2tv
XcDMrZcOUpp/jmwH78XDYeTcwleuT7atPQ5z6RtfTTM+Du09IrTFJdLJaMeEQIkW
pzXSnfgPrp60dYxC21Q0c12AdK1WEZzioZzUw2maccZWN9SyOn6ftx7xd3TbnubP
59RLWzgHQeKZpExpBCuGvx44niwItRzzorw+UonMa5UEgMGuF413uFosne1PvKjW
IoGzwBGkJqxneQamtsd6Q+Pz6T4mFg==
=3Ni1
-----END PGP SIGNATURE-----

--Sig_/LXdNxqsqA+Wo.ao9XCHST7.--
