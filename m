Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C116D144C56
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2020 08:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgAVHFx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jan 2020 02:05:53 -0500
Received: from ozlabs.org ([203.11.71.1]:60749 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgAVHFx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Jan 2020 02:05:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 482bz23Hq4z9sRG;
        Wed, 22 Jan 2020 18:05:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579676750;
        bh=yyQczwsAq54YDwgkqgCUdGf+BJvUuuEzPmmA9SnY00A=;
        h=Date:From:To:Cc:Subject:From;
        b=cNXbJDFXc5m4E70qodd5Y+9pETIr27W+N2jGE/4xSwfQO3BpRWIEi1uKTybY1Sm/7
         zwVh8Eexdg0cqSkuk3QO2sYHuvbyMK2GDXADaWdfTjhWI4k8daL1ibrOluQPNRX+O1
         nSTM5xzgrUKoclbC6trJYzhtnWPLgxYsWE0bh+we9+e1xp/i7fUcQltEkVty7g4cc/
         7VvaOjFRFXASL/okwY5vSEWh2Qq5iVEXZawvIfFWPDpr9m6zP69G0gkDddSwe6tGle
         KXtfv+s/bmbiFfZmGsRAqtjsmb89mGnN/55GJ76S7MCYVGxn6wTvNdxC0C56W4I8Ot
         xWKkfD2X1EKuw==
Date:   Wed, 22 Jan 2020 18:05:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200122180545.36222f50@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M8uKf=ek//wp/Y81RFcNz7R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M8uKf=ek//wp/Y81RFcNz7R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Also reported by Randy Dunlap]

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/sched/psi.c: In function 'psi_proc_init':
kernel/sched/psi.c:1286:37: error: 'NUL' undeclared (first use in this func=
tion); did you mean 'NULL'?
 1286 |   proc_create("pressure/memory", 0, NUL, &psi_memory_proc_ops);
      |                                     ^~~
      |                                     NULL
kernel/sched/psi.c:1286:37: note: each undeclared identifier is reported on=
ly once for each function it appears in
kernel/sched/psi.c:1287:39: error: invalid operands to binary & (have 'void=
 *' and 'const struct proc_ops')
 1287 |   proc_create("pressure/cpu", 0, NULL &psi_cpu_proc_ops);
      |                                       ^
kernel/sched/psi.c:1287:3: error: too few arguments to function 'proc_creat=
e'
 1287 |   proc_create("pressure/cpu", 0, NULL &psi_cpu_proc_ops);
      |   ^~~~~~~~~~~
In file included from kernel/sched/psi.c:133:
include/linux/proc_fs.h:64:24: note: declared here
   64 | struct proc_dir_entry *proc_create(const char *name, umode_t mode, =
struct proc_dir_entry *parent, const struct proc_ops *proc_ops);
      |                        ^~~~~~~~~~~

Caused by patch

  "proc: convert everything to "struct proc_ops""

I have applied the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Jan 2020 17:59:00 +1100
Subject: [PATCH] proc-convert-everything-to-struct-proc_ops-fix-2

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/sched/psi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 19967bceb64d..ac4bd0ca11cc 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1283,8 +1283,8 @@ static int __init psi_proc_init(void)
 	if (psi_enable) {
 		proc_mkdir("pressure", NULL);
 		proc_create("pressure/io", 0, NULL, &psi_io_proc_ops);
-		proc_create("pressure/memory", 0, NUL, &psi_memory_proc_ops);
-		proc_create("pressure/cpu", 0, NULL &psi_cpu_proc_ops);
+		proc_create("pressure/memory", 0, NULL, &psi_memory_proc_ops);
+		proc_create("pressure/cpu", 0, NULL, &psi_cpu_proc_ops);
 	}
 	return 0;
 }
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/M8uKf=ek//wp/Y81RFcNz7R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4n9EkACgkQAVBC80lX
0GzVtAf/S1mqEoFoYlx4Bc9gOGest/DRuxnTvzzEH9VSfnRyfWhQhJ0fWlv99rQk
gNu++UVARbfAfavv1n4GQB45DyH8h/HmngmrDjG0OCY9F2VvXy7/+0NuUVHRO4rB
xAVEiavY/FcVWNNaAXB9sCI/6HYzm2Jlg37I2eCg8AwxXfCxmFeKpDq8g2p6PKA0
9duy5wEQrLbdrO0hX0s3blBiAK7mo9pin6dUu6Llaeel799be/Wb18jLeEnYXlPp
qErsnim9Rm47Jg0ViyXmbnEljNtJZsWe57Mky5Ig+2+Wvd2mUW67MhZvDsUv9YwN
ZU2ITQsWcS6iqCEwewSjr6KcEwoG6g==
=1qFT
-----END PGP SIGNATURE-----

--Sig_/M8uKf=ek//wp/Y81RFcNz7R--
