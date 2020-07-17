Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAA2223922
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 12:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgGQKTi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 06:19:38 -0400
Received: from ozlabs.org ([203.11.71.1]:47357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725864AbgGQKTh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Jul 2020 06:19:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7Rtt0VNKz9s1x;
        Fri, 17 Jul 2020 20:19:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594981176;
        bh=iuIH+LASadzm2UreQMbO1qINbFP2imUTuPyS4+HY+YA=;
        h=Date:From:To:Cc:Subject:From;
        b=X9Xr7HIWA97zzxb9ZaLSG/+KrJGp05leODi4et2+Cx9U08SlJ8U5kWIDS9ety2TAz
         r3V66EOPVpt6VO/A0gE5dk1aiBu4zlu6naR2RBZ9VFAORcjOH7iypdi9eacrqToLU4
         uM2qW8QTSQcJ+NkOeWxYoKMLSqnnqBtYJO22oSnbUTn36V4jSTGNerNFGd61sFVmDH
         x/0v2uvfnXjMzjWIV9fHdEpHVjuuFYS2HaAzGVY+yMkju7aqmXgjaFiR2aHOsRjlBU
         FS5vx7RChWf+Y5WqcS8oofxLO2WbMIYKC36Ro3JnqwmOgCTHwbodLzL5UVtZRhT1ff
         +siSX7QIfTF6A==
Date:   Fri, 17 Jul 2020 20:19:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Belits <abelits@marvell.com>,
        Nitesh Narayan Lal <nitesh@redhat.com>,
        yuqi jin <jinyuqi@huawei.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200717201933.210f3d27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a70x30UVTV5zOFXK2eVPW2x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a70x30UVTV5zOFXK2eVPW2x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/cpumask.c

between commit:

  1abdfe706a57 ("lib: Restrict cpumask_local_spread to houskeeping CPUs")

from the tip tree and commit:

  6f7ee3fd63c9 ("lib: optimize cpumask_local_spread()")

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

diff --cc lib/cpumask.c
index 85da6ab4fbb5,2fecbcd8c160..000000000000
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@@ -6,7 -6,7 +6,8 @@@
  #include <linux/export.h>
  #include <linux/memblock.h>
  #include <linux/numa.h>
 +#include <linux/sched/isolation.h>
+ #include <linux/spinlock.h>
 =20
  /**
   * cpumask_next - get the next cpu in a cpumask
@@@ -193,40 -193,56 +194,61 @@@ void __init free_bootmem_cpumask_var(cp
  }
  #endif
 =20
- /**
-  * cpumask_local_spread - select the i'th cpu with local numa cpu's first
-  * @i: index number
-  * @node: local numa_node
-  *
-  * This function selects an online CPU according to a numa aware policy;
-  * local cpus are returned first, followed by non-local ones, then it
-  * wraps around.
-  *
-  * It's not very efficient, but useful for setup.
-  */
- unsigned int cpumask_local_spread(unsigned int i, int node)
+ static void calc_node_distance(int *node_dist, int node)
+ {
+ 	int i;
+=20
+ 	for (i =3D 0; i < nr_node_ids; i++)
+ 		node_dist[i] =3D node_distance(node, i);
+ }
+=20
+ static int find_nearest_node(int *node_dist, bool *used)
+ {
+ 	int i, min_dist =3D node_dist[0], node_id =3D -1;
+=20
+ 	/* Choose the first unused node to compare */
+ 	for (i =3D 0; i < nr_node_ids; i++) {
+ 		if (used[i] =3D=3D 0) {
+ 			min_dist =3D node_dist[i];
+ 			node_id =3D i;
+ 			break;
+ 		}
+ 	}
+=20
+ 	/* Compare and return the nearest node */
+ 	for (i =3D 0; i < nr_node_ids; i++) {
+ 		if (node_dist[i] < min_dist && used[i] =3D=3D 0) {
+ 			min_dist =3D node_dist[i];
+ 			node_id =3D i;
+ 		}
+ 	}
+=20
+ 	return node_id;
+ }
+=20
+ static unsigned int __cpumask_local_spread(unsigned int i, int node)
  {
 -	int cpu;
 +	int cpu, hk_flags;
 +	const struct cpumask *mask;
 =20
 +	hk_flags =3D HK_FLAG_DOMAIN | HK_FLAG_MANAGED_IRQ;
 +	mask =3D housekeeping_cpumask(hk_flags);
  	/* Wrap: we always want a cpu. */
 -	i %=3D num_online_cpus();
 +	i %=3D cpumask_weight(mask);
 =20
  	if (node =3D=3D NUMA_NO_NODE) {
 -		for_each_cpu(cpu, cpu_online_mask)
 +		for_each_cpu(cpu, mask) {
  			if (i-- =3D=3D 0)
  				return cpu;
 +		}
  	} else {
  		/* NUMA first. */
 -		for_each_cpu_and(cpu, cpumask_of_node(node), cpu_online_mask)
 +		for_each_cpu_and(cpu, cpumask_of_node(node), mask) {
  			if (i-- =3D=3D 0)
  				return cpu;
 +		}
 =20
 -		for_each_cpu(cpu, cpu_online_mask) {
 +		for_each_cpu(cpu, mask) {
  			/* Skip NUMA nodes, done above. */
  			if (cpumask_test_cpu(cpu, cpumask_of_node(node)))
  				continue;

--Sig_/a70x30UVTV5zOFXK2eVPW2x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RezUACgkQAVBC80lX
0GxqtQf/YTRY5xhPGPSpuBLkSHB6BMHxXjecZr95IZ0XVV6JU+Oewj4ES+Qx8L1H
ih5rwbcLshBTo6y00gj2dZ3gvDsnMsHs/EhMPWjfJAetSyRiToTsuCldpmcGnygc
rithkeUD8JDYIKhaIt/34NzF6t/2xbn5Vr89uF/hLpF1D+XYRD281QBfI7VZlcJS
OMEA3lfz4xCWDQcrLM5WaU9bu8GUD1N+RMGuvEeZUb4ruLn5oLr12zcLMpX1hfim
L1nY6ytqnDl7XWoVdM+Fb6X4Yrxu1cYMgy/v7uB0uEte7sCiW45osgm65L4eWz0s
v9IoY8I+u85D/ctgT7W0U/ESp0gBJg==
=yNyX
-----END PGP SIGNATURE-----

--Sig_/a70x30UVTV5zOFXK2eVPW2x--
