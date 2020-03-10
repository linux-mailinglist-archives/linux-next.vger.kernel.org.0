Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C36E17EE2A
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 02:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgCJBte (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 21:49:34 -0400
Received: from ozlabs.org ([203.11.71.1]:38073 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbgCJBte (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 21:49:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48bygh0Vbxz9sRR;
        Tue, 10 Mar 2020 12:49:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583804972;
        bh=2nMbPXqoFva+vIQiZlyjpUkDxSQLc6a9j+wggGzR0Mk=;
        h=Date:From:To:Cc:Subject:From;
        b=PudBCYXAt551Jub9w7iWPLOTZChGK+qvy8C7dywCchs74obrzhxexpS0sdQx5u3Lh
         pPPrUMvBvnviGINii9el1z5FS2ndmxPQ5OJT9mjHYNRZMpARQfub20lHQgI+yJLTTT
         nNkE0FGpMnif57L2NzjwzKsPG/FfMikd+HQOyW2/fPvpaxHPPFYl4sGhUw9I1ljXIr
         EY61FT5vsI6xvHR/eJrVmUQHZqXck/lfUCbwON/jYYAVl+v3a7IZ5hmTZdXrT2q4zX
         41j3a4G+HcpjpVn/8XZWjCY7iSy5LXjRH9qSVIFHythBfvSZH9SAxkVG91MHK0USfc
         w2Kwfe3tk7CPA==
Date:   Tue, 10 Mar 2020 12:49:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Message-ID: <20200310124918.4b46924a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1W3_m_cXI0R=jJB5FTj6d4=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1W3_m_cXI0R=jJB5FTj6d4=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/arch_topology.h

between commit:

  cd0ed03a8903 ("arm64: use activity monitors for frequency invariance")

from the arm64 tree and commit:

  ad58cc5cc50c ("drivers/base/arch_topology: Add infrastructure to store an=
d update instantaneous thermal pressure")

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

diff --cc include/linux/arch_topology.h
index 1ccdddb541a7,88a115e81f27..000000000000
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@@ -33,8 -33,16 +33,18 @@@ unsigned long topology_get_freq_scale(i
  	return per_cpu(freq_scale, cpu);
  }
 =20
 +bool arch_freq_counters_available(struct cpumask *cpus);
 +
+ DECLARE_PER_CPU(unsigned long, thermal_pressure);
+=20
+ static inline unsigned long topology_get_thermal_pressure(int cpu)
+ {
+ 	return per_cpu(thermal_pressure, cpu);
+ }
+=20
+ void arch_set_thermal_pressure(struct cpumask *cpus,
+ 			       unsigned long th_pressure);
+=20
  struct cpu_topology {
  	int thread_id;
  	int core_id;

--Sig_/1W3_m_cXI0R=jJB5FTj6d4=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5m8h4ACgkQAVBC80lX
0GwT6wf+KBeH9e8kPWUbUmEx7Y5cRTj6eN0mxZ4ejAz+6S5kzJzVMfaPCCXEaatp
a22dEHuhEauckjjJWcqnUOECUJiTM8uSnvsGZemR8B0o2oFTUq53/rqDNBJgFxPx
NlTWz+JASpmzW/eyCqEUSumk3cAHeV2sxLzCb85Bf2JEBx+yQtieb+hkRyUzkua/
zdsRln1eaGUUsSHS1J8xDlC87j4U/xAI5UEcvXwfDpCoeAIxpF1Znei0VkRXaQUi
McpaiBxcI/ihF8M5lfLQFkluwPS+zGyiWbXswfdkCDRKaVfajx3DuPwRDtcd8xl3
y8XVqY9dvFSdwUMhkfvs4qR5rGzOmA==
=5uon
-----END PGP SIGNATURE-----

--Sig_/1W3_m_cXI0R=jJB5FTj6d4=--
