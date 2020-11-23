Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9132BFE3A
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 03:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgKWCnO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Nov 2020 21:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgKWCnO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Nov 2020 21:43:14 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03135C0613CF;
        Sun, 22 Nov 2020 18:43:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CfWfc0dpQz9sSf;
        Mon, 23 Nov 2020 13:43:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606099390;
        bh=hOYEtrEXqQGDGZMWmJodC4zriy8NU5JIkir5pBIrqKw=;
        h=Date:From:To:Cc:Subject:From;
        b=kEaXdfyuF3CaAhuyujVUpXlKofimCg5lYVSc60o+EmtUAB+8r1Aop61uLwCa8EIMj
         Q6XqDm884Qdea8aPtdOcIxlWdeHEmRpaDS3Yx/UFwrUG3+cN6okAXOjfzT/qwYvXan
         YOdIMUtd9qQ2r9X3sztFbFRmguGWvoN5pk7zvUtIXZRABeK+Xnz8uVUL2ahtan5alz
         6ol4QI6Fh6CIocr0Lvh2QjWPScVS3No9D5xcQ2Ln9UVL8W1G5n8KZ0FkLjFqUGJiGd
         PNd7yPqhIw7TQhg1FFwomz84WBx8MuzCT3AYXNEgArQbsYGX4syCtd7lVcfBdm4deI
         Ljty0lJDU5hLw==
Date:   Mon, 23 Nov 2020 13:42:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Brahadambal Srinivasan <latha@linux.vnet.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: linux-next: manual merge of the tip tree with the cpupower tree
Message-ID: <20201123134259.2dc63db7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R7s9RWw92O3/jidyRFPpAsl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R7s9RWw92O3/jidyRFPpAsl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/power/cpupower/utils/helpers/misc.c

between commit:

  748f0d70087c ("cpupower: Provide online and offline CPU information")

from the cpupower tree and commit:

  8113ab20e850 ("tools/power/cpupower: Read energy_perf_bias from sysfs")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/power/cpupower/utils/helpers/misc.c
index 2ead98169cf5,e8f8f643a627..000000000000
--- a/tools/power/cpupower/utils/helpers/misc.c
+++ b/tools/power/cpupower/utils/helpers/misc.c
@@@ -1,12 -1,16 +1,17 @@@
  // SPDX-License-Identifier: GPL-2.0
 =20
  #include <stdio.h>
+ #include <errno.h>
  #include <stdlib.h>
 =20
 +#include "helpers/helpers.h"
 +
  #if defined(__i386__) || defined(__x86_64__)
 =20
 -#include "helpers/helpers.h"
+ #include "helpers/sysfs.h"
+=20
+ #include "cpupower_intern.h"
+=20
  #define MSR_AMD_HWCR	0xc0010015
 =20
  int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active,
@@@ -44,64 -48,44 +49,104 @@@
  		*support =3D *active =3D 1;
  	return 0;
  }
+=20
+ int cpupower_intel_get_perf_bias(unsigned int cpu)
+ {
+ 	char linebuf[MAX_LINE_LEN];
+ 	char path[SYSFS_PATH_MAX];
+ 	unsigned long val;
+ 	char *endp;
+=20
+ 	if (!(cpupower_cpu_info.caps & CPUPOWER_CAP_PERF_BIAS))
+ 		return -1;
+=20
+ 	snprintf(path, sizeof(path), PATH_TO_CPU "cpu%u/power/energy_perf_bias",=
 cpu);
+=20
+ 	if (cpupower_read_sysfs(path, linebuf, MAX_LINE_LEN) =3D=3D 0)
+ 		return -1;
+=20
+ 	val =3D strtol(linebuf, &endp, 0);
+ 	if (endp =3D=3D linebuf || errno =3D=3D ERANGE)
+ 		return -1;
+=20
+ 	return val;
+ }
+=20
+ int cpupower_intel_set_perf_bias(unsigned int cpu, unsigned int val)
+ {
+ 	char path[SYSFS_PATH_MAX];
+ 	char linebuf[3] =3D {};
+=20
+ 	if (!(cpupower_cpu_info.caps & CPUPOWER_CAP_PERF_BIAS))
+ 		return -1;
+=20
+ 	snprintf(path, sizeof(path), PATH_TO_CPU "cpu%u/power/energy_perf_bias",=
 cpu);
+ 	snprintf(linebuf, sizeof(linebuf), "%d", val);
+=20
+ 	if (cpupower_write_sysfs(path, linebuf, 3) <=3D 0)
+ 		return -1;
+=20
+ 	return 0;
+ }
+=20
  #endif /* #if defined(__i386__) || defined(__x86_64__) */
 +
 +/* get_cpustate
 + *
 + * Gather the information of all online CPUs into bitmask struct
 + */
 +void get_cpustate(void)
 +{
 +	unsigned int cpu =3D 0;
 +
 +	bitmask_clearall(online_cpus);
 +	bitmask_clearall(offline_cpus);
 +
 +	for (cpu =3D bitmask_first(cpus_chosen);
 +		cpu <=3D bitmask_last(cpus_chosen); cpu++) {
 +
 +		if (cpupower_is_cpu_online(cpu) =3D=3D 1)
 +			bitmask_setbit(online_cpus, cpu);
 +		else
 +			bitmask_setbit(offline_cpus, cpu);
 +
 +		continue;
 +	}
 +}
 +
 +/* print_online_cpus
 + *
 + * Print the CPU numbers of all CPUs that are online currently
 + */
 +void print_online_cpus(void)
 +{
 +	int str_len =3D 0;
 +	char *online_cpus_str =3D NULL;
 +
 +	str_len =3D online_cpus->size * 5;
 +	online_cpus_str =3D (void *)malloc(sizeof(char) * str_len);
 +
 +	if (!bitmask_isallclear(online_cpus)) {
 +		bitmask_displaylist(online_cpus_str, str_len, online_cpus);
 +		printf(_("Following CPUs are online:\n%s\n"), online_cpus_str);
 +	}
 +}
 +
 +/* print_offline_cpus
 + *
 + * Print the CPU numbers of all CPUs that are offline currently
 + */
 +void print_offline_cpus(void)
 +{
 +	int str_len =3D 0;
 +	char *offline_cpus_str =3D NULL;
 +
 +	str_len =3D offline_cpus->size * 5;
 +	offline_cpus_str =3D (void *)malloc(sizeof(char) * str_len);
 +
 +	if (!bitmask_isallclear(offline_cpus)) {
 +		bitmask_displaylist(offline_cpus_str, str_len, offline_cpus);
 +		printf(_("Following CPUs are offline:\n%s\n"), offline_cpus_str);
 +		printf(_("cpupower set operation was not performed on them\n"));
 +	}
 +}

--Sig_/R7s9RWw92O3/jidyRFPpAsl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+7IbMACgkQAVBC80lX
0GxsLQgApcXE3lUFRifLu6eaVbdKM2qgMv0Goder8cJnFrUkll2GptVucIYiz963
a0YSl2IYYxxVz8x96Wt5y9cfz+M4eBl8vux9nfvPs5Vk0vbd8MNa8ZyVJYvCpdoI
vwhu0/VVnlkKtoIl64ailGZWxony6rMPM8C1rV1hZv1MwKcoccbdSvw+exIzAK6h
UR23oMaFR1kbgG1rt4aiPkOqPKP5NPZ0Tc/ZukZ7AePeoN1s1Ut7ky0nywUC++AA
kyCfGoSyKb6ATDlnXf6A/Q8kedGnyn7f3EeQ7lmjz86K2rHlw4CsBExnJLx9edoL
4zhM+2NQje+rJ7R5jfA+VjLDqULhwQ==
=Qiqt
-----END PGP SIGNATURE-----

--Sig_/R7s9RWw92O3/jidyRFPpAsl--
