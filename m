Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06DEE8AB3E
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 01:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfHLXfJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 19:35:09 -0400
Received: from ozlabs.org ([203.11.71.1]:60145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbfHLXfJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 19:35:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466sdh5qp0z9sDQ;
        Tue, 13 Aug 2019 09:35:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565652905;
        bh=w5C3ZkmHOk9kOs+eEwrKFMW1sTL4vPGtQoSZ5biw8Rw=;
        h=Date:From:To:Cc:Subject:From;
        b=O/4sboGaG/zaWVdLtazhMeVWzXSwmJjuKu/AkXfzjZBM5W6IsQSjVIyvqA7JVlyRE
         1l61BNQIbgqPiYRItSeGA42WzAb68yU4fJE84I7jPfJPEVtPQkgbzP2PggFQNF40a8
         AvXLc/HkUH8DkjFnT+wfBWsBe/dJBTOuV1Dsq179OPq3ifjzBau6XVdj8R3tZbYY/+
         Kuh9q/42vS+Tp+BdKhkRO8FfV/RN4nAm9e9hpV3jonXhge8tJZpA7B98HdDCn+0Wjm
         8RZGId4/5GNbqPsoFv7hYWPBCYv/cgAZm2jU2xJ+CHuUf0RybHGfXr6VdtkafAlObN
         vSWszLXAyj36A==
Date:   Tue, 13 Aug 2019 09:34:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Atish Patra <atish.patra@wdc.com>
Subject: linux-next: manual merge of the risc-v tree with the arm64 tree
Message-ID: <20190813093447.747a5853@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qDRPE4LeVl/DGF9Q.z8Vj7u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qDRPE4LeVl/DGF9Q.z8Vj7u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/arm64/kernel/topology.c

between commit:

  98dc19902a0b ("arm64: topology: Use PPTT to determine if PE is a thread")

from the arm64 tree and commit:

  60c1b220d8bc ("cpu-topology: Move cpu topology code to common code.")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/topology.c
index 6106c49f84bc,6b95c91e7d67..000000000000
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@@ -296,72 -59,21 +59,32 @@@ topology_populated
  	update_siblings_masks(cpuid);
  }
 =20
- static void clear_cpu_topology(int cpu)
- {
- 	struct cpu_topology *cpu_topo =3D &cpu_topology[cpu];
-=20
- 	cpumask_clear(&cpu_topo->llc_sibling);
- 	cpumask_set_cpu(cpu, &cpu_topo->llc_sibling);
-=20
- 	cpumask_clear(&cpu_topo->core_sibling);
- 	cpumask_set_cpu(cpu, &cpu_topo->core_sibling);
- 	cpumask_clear(&cpu_topo->thread_sibling);
- 	cpumask_set_cpu(cpu, &cpu_topo->thread_sibling);
- }
-=20
- static void __init reset_cpu_topology(void)
- {
- 	unsigned int cpu;
-=20
- 	for_each_possible_cpu(cpu) {
- 		struct cpu_topology *cpu_topo =3D &cpu_topology[cpu];
-=20
- 		cpu_topo->thread_id =3D -1;
- 		cpu_topo->core_id =3D 0;
- 		cpu_topo->package_id =3D -1;
- 		cpu_topo->llc_id =3D -1;
-=20
- 		clear_cpu_topology(cpu);
- 	}
- }
-=20
- void remove_cpu_topology(unsigned int cpu)
- {
- 	int sibling;
-=20
- 	for_each_cpu(sibling, topology_core_cpumask(cpu))
- 		cpumask_clear_cpu(cpu, topology_core_cpumask(sibling));
- 	for_each_cpu(sibling, topology_sibling_cpumask(cpu))
- 		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
- 	for_each_cpu(sibling, topology_llc_cpumask(cpu))
- 		cpumask_clear_cpu(cpu, topology_llc_cpumask(sibling));
-=20
- 	clear_cpu_topology(cpu);
- }
-=20
  #ifdef CONFIG_ACPI
 +static bool __init acpi_cpu_is_threaded(int cpu)
 +{
 +	int is_threaded =3D acpi_pptt_cpu_is_thread(cpu);
 +
 +	/*
 +	 * if the PPTT doesn't have thread information, assume a homogeneous
 +	 * machine and return the current CPU's thread state.
 +	 */
 +	if (is_threaded < 0)
 +		is_threaded =3D read_cpuid_mpidr() & MPIDR_MT_BITMASK;
 +
 +	return !!is_threaded;
 +}
 +
  /*
   * Propagate the topology information of the processor_topology_node tree=
 to the
   * cpu_topology array.
   */
- static int __init parse_acpi_topology(void)
+ int __init parse_acpi_topology(void)
  {
 -	bool is_threaded;
  	int cpu, topology_id;
 =20
+ 	if (acpi_disabled)
+ 		return 0;
+=20
 -	is_threaded =3D read_cpuid_mpidr() & MPIDR_MT_BITMASK;
 -
  	for_each_possible_cpu(cpu) {
  		int i, cache_id;
 =20

--Sig_/qDRPE4LeVl/DGF9Q.z8Vj7u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1R95cACgkQAVBC80lX
0GzjrQf+Irkjq9nucIWfVaZI7zqV1yRRrOVf+EPUDEP7w1ON2v1s5fBJF22WQDXi
PBRJQe1dIBh3OC2CC1AcrhXe98Lg1j91QNnhkouWGrUMIAxytKsgX32ad/B9JeBj
ASrwHu17vzj8FtBDQ3kqxeUMzUBQAg68nwJKLD54eJBtCJ7gBUZeO/2QC2NOEegD
NivI0haXBY8GxJZSjNr95ubSC5KtEIdvdxbkM54QebgSfvJg/5yAXqti8D96DnD4
SD3a5ZnrYnNLeG1eLn+dTk8d32M1+ERtYcP8ov4AqgPXOtvdxnKVWNM9QrfBsAct
ddU3gR5gtD+azJmXxfkp3gU6KobSqA==
=VK8O
-----END PGP SIGNATURE-----

--Sig_/qDRPE4LeVl/DGF9Q.z8Vj7u--
