Return-Path: <linux-next+bounces-108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EC7FC8D6
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 22:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 266D0B20EF3
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 21:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA1544C9B;
	Tue, 28 Nov 2023 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sadRXjrv"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921AA18F;
	Tue, 28 Nov 2023 13:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701208395;
	bh=KO5V6pbvlN0x2mJFnkJQlZa+zZOJEiVHRwjRN/9mI7A=;
	h=Date:From:To:Cc:Subject:From;
	b=sadRXjrv8ZUFmQsAB/olrq/FUo/SqVRnPZxRfspL2K6vKEGrCb2vFZBI0CLL+xuG/
	 lv2+03+R6pDHAUfZPEz2CRM8nZSsmPOAR5FoHynTV7l2gnv89rlHPFnfkkj3A0Rbu2
	 O/mUE/ODjgLM1Oa47wvlkqRa4vx4O+J+XRnjQ7JbN/9S1XAVvbdl3owZWRvO2VxVb/
	 3K9TAJjr+xZrDHbMhgXdgCtVckV6a4Dip+FhocrG+iTfyPqa+/MxYJ3bQDm0lEhWXl
	 cR86QrzFruLtJ3xpq5OM11aJUyFIUadZh0nxLMvEUHvrLTWHjrrvX3JOrnOq042aht
	 X2sJZTlH0JwqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sfx625QrNz4wc6;
	Wed, 29 Nov 2023 08:53:14 +1100 (AEDT)
Date: Wed, 29 Nov 2023 08:53:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Athira Jajeev
 <atrajeev@linux.vnet.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Subject: linux-next: manual merge of the perf tree with Linus' tree
Message-ID: <20231129085314.50306434@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HwCPpO2ITtrp5X1cfHT9ZVs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HwCPpO2ITtrp5X1cfHT9ZVs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/Makefile.perf

between commit:

  e2bdd172e665 ("perf build: Generate arm64's sysreg-defs.h and add to incl=
ude path")

from Lius' tree and commit:

  1638b11ef815 ("perf tools: Add perf binary dependent rule for shellcheck =
log in Makefile.perf")

from the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/perf/Makefile.perf
index 058c9aecf608,824cbc0af7d7..000000000000
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@@ -1150,7 -1151,8 +1168,8 @@@ endif # CONFIG_PERF_BPF_SKE
  bpf-skel-clean:
  	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
 =20
 -clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-c=
lean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresi=
ght-targets-clean
 +clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-c=
lean $(LIBPERF)-clean arm64-sysreg-defs-clean fixdep-clean python-clean bpf=
-skel-clean tests-coresight-targets-clean
+ 	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
  	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive=
 $(OUTPUT)perf-iostat $(LANG_BINDINGS)
  	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delet=
e -o -name '\.*.d' -delete
  	$(Q)$(RM) $(OUTPUT).config-detected

--Sig_/HwCPpO2ITtrp5X1cfHT9ZVs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVmYUoACgkQAVBC80lX
0GzwHgf9FleqT7MMh5KhBBfDJtFdimuTA1owuafutlCBkA5PWwYGr+X3QsrRRRXe
BbB26uskBLFZ9d4li8gSAbtqocL6ioPkTe9jzY63giVamNPmuya2mptish9R8QSv
7FolC2WiS2j1HpAQO+ge3P5uHTFBgtidN0aMmJzCzdPg17xfUI+McK4zvqV/++/L
IsjiHEZoO/vs19vPf9M773SPvYiMYyG4jbBMtBkRDSn6BISTpcr7dv/7f3481cfQ
BXPmEHSpkk14LDYlDOopJGZBJCLOedWYSkyST3tsN4JpvzQcoypfyTcEMgjAOEX1
OAnblEz7evVVg9sUXD0zzyx9Q/FqsA==
=dD0H
-----END PGP SIGNATURE-----

--Sig_/HwCPpO2ITtrp5X1cfHT9ZVs--

