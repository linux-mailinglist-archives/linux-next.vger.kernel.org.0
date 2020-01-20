Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8383514238D
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 07:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgATGhn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 01:37:43 -0500
Received: from ozlabs.org ([203.11.71.1]:33845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726775AbgATGhm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jan 2020 01:37:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 481MRQ0Fw5z9sP3;
        Mon, 20 Jan 2020 17:37:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579502259;
        bh=YYz/0jaPBl6ij5ABlgtzI9E6JNm3eeHVSD9ZqSrU2RI=;
        h=Date:From:To:Cc:Subject:From;
        b=avixoM5gNVCR/SwWdHdlAxo9PiZBEhBlwCxQoUvVrm6uT3IYzLl117vZAjIGwZgEE
         Cw4UGEt8H5/uSghmjeSi/HkCligxAvBuTYXNcNIffF8rvI38nxsi2JFnY2SalFbdy9
         x+9//znDBkM8vq92lI9MrcDuQdy/tyBTTJA/lBD/rikyw2yK3Zl2QK3pTlp8xouSIq
         fta430iNoGoCPXZqde6E5SWgkw649l6shqyR+2ayvVqrMAKaREB9aB2ekOcZn7G/er
         n6KAOZzbsbbxVK3PfiBE4AQnCVa8UcOH2mXL2WqVGV/RuizEh6nzS6Op+GxJlFUWO2
         f4dURIdx51csg==
Date:   Mon, 20 Jan 2020 17:37:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wang Long <w@laoqinren.net>,
        Alexey Dobriyan <adobriyan@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200120173734.15d18473@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zh/Pl0q4Dm+8EGBK/09b8n_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zh/Pl0q4Dm+8EGBK/09b8n_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/sched/psi.c

between commit:

  3d817689a62c ("sched/psi: create /proc/pressure and /proc/pressure/{io|me=
mory|cpu} only when psi enabled")

from the tip tree and patch:

  "proc: convert everything to "struct proc_ops""

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sched/psi.c
index db7b50bba3f1,faad3d11b9db..000000000000
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@@ -1280,12 -1280,10 +1280,12 @@@ static const struct proc_ops psi_cpu_pr
 =20
  static int __init psi_proc_init(void)
  {
 -	proc_mkdir("pressure", NULL);
 -	proc_create("pressure/io", 0, NULL, &psi_io_proc_ops);
 -	proc_create("pressure/memory", 0, NULL, &psi_memory_proc_ops);
 -	proc_create("pressure/cpu", 0, NULL, &psi_cpu_proc_ops);
 +	if (psi_enable) {
 +		proc_mkdir("pressure", NULL);
- 		proc_create("pressure/io", 0, NULL, &psi_io_fops);
- 		proc_create("pressure/memory", 0, NULL, &psi_memory_fops);
- 		proc_create("pressure/cpu", 0, NULL, &psi_cpu_fops);
++		proc_create("pressure/io", 0, NULL, &psi_io_proc_ops);
++		proc_create("pressure/memory", 0, NULL, &psi_memory_proc_ops);
++		proc_create("pressure/cpu", 0, NULL, &psi_cpu_proc_ops);
 +	}
  	return 0;
  }
  module_init(psi_proc_init);

--Sig_/zh/Pl0q4Dm+8EGBK/09b8n_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4lSq4ACgkQAVBC80lX
0Gy3zAf+NWc+eIE30KIvN06xJF31T3Kv//nXmCUZBxWn/tnktEk0svEdxwOiBrXk
fow/FLIxkoOS24C47dCdP6de05eWMCq7oDfapeYHuZhAlZqubby/UjZwOpcTWWkE
e/6FFpYBCz/6rB4mbY4XyRomcsMEfYQeEjk7J03C12Oc5uwy3gOUvnJ59u7T+u5F
sCD1Tng6NAFZlholN/qTTid0ceXvmyzYZcHY463I5nXvlBZo5K+sQbyPypxDAT+K
UMfuIL3SNZRRGS93OmN9JuuxENJJ6vOOT6saYvHtsZHZT9mHTCfGoE99eHDcoaLi
VCQX1IjsXDT0Y9BsW6B91uiIPp4GfA==
=A8ZS
-----END PGP SIGNATURE-----

--Sig_/zh/Pl0q4Dm+8EGBK/09b8n_--
