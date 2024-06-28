Return-Path: <linux-next+bounces-2712-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76891C62A
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 20:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74FA3B22AE5
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 18:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66E350280;
	Fri, 28 Jun 2024 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBfoPlu4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5D27725;
	Fri, 28 Jun 2024 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601021; cv=none; b=Bi1CC8BAKUnmuMbl//GYwsSge9CTLolZe0RANu6nVEP9c27KXGa/FUHe9OlI5GjPm2Bpd4o/dOypf/QFFtuypUun547zHz4PQcjOb/x7Rqg+NgcknFNLUnx98RfM/RFgzjRePnhTRJ5Bksn1k3KHIytoJ3KxStm6OogNjLG1OCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601021; c=relaxed/simple;
	bh=5VUTv0K7j117mOcdc2YQqAjaz8U5wDgMxLjwXubblhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rN1CbLlgp9CIypBG2Gi6TquEYFEg4HNvsLL74K2eUnD4GlyM8whm6/IJduqsZKxgVQ4rbzxPTiGODVzpdrlQtYEjOTwLkm2VuZYppbhKTYKVq3G9v79rl4Lc+PAXhQ29svrsa0HiLoab6K0896cJyhdlYU2ElKXvsllwpOJf4Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBfoPlu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F47C116B1;
	Fri, 28 Jun 2024 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719601021;
	bh=5VUTv0K7j117mOcdc2YQqAjaz8U5wDgMxLjwXubblhE=;
	h=Date:From:To:Cc:Subject:From;
	b=dBfoPlu4Z9hUT4D2ixkRT4Ry8S5m0lfHVqLP0mr3PyKZkXDM5i3CKDLRPaYyyavME
	 vqYciK5bly2ifBDy+gPbw0oLgt+2zUSKolegSTq4+a7BD3+v00z08qu7tIzqb1VhK8
	 /Pc4Y1JM5gC+6OeDVVfCixPVPhRRxskx2mhRxiahwU2MeD9LuBCe+s9Qgs4FLoJIsX
	 KzihyIP/0Bbw9ekvysXLOAWdU5gxlIdOJWk6cDtHSHOo8wotGWjWK+V3kpvyvfkArL
	 l7gLxh23i9c0GKnrvQ89VkbzOgw6CKeJ3BhbTUYj024NFHvhy0bFuXs4A7WPTYDmjt
	 WquiinWYEJbzQ==
Date: Fri, 28 Jun 2024 19:56:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Shenlin Liang <liangshenlin@eswincomputing.com>
Subject: linux-next: manual merge of the kvm-riscv tree with the perf tree
Message-ID: <Zn8HeRRX3JV2IcxQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zRopLGLXR8zcfVMV"
Content-Disposition: inline


--zRopLGLXR8zcfVMV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-riscv tree got a conflict in:

  tools/perf/arch/riscv/util/Build

between commit:

  e467705a9fb37 ("perf util: Make util its own library")

=66rom the perf tree and commit:

  da7b1b525e972 ("perf kvm/riscv: Port perf kvm stat to RISC-V")

=66rom the kvm-riscv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/perf/arch/riscv/util/Build
index 65ec3c66a3754,d72b04f8d32bb..0000000000000
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@@ -1,5 -1,6 +1,6 @@@
 -perf-y +=3D perf_regs.o
 -perf-y +=3D header.o
 +perf-util-y +=3D perf_regs.o
 +perf-util-y +=3D header.o
 =20
 -perf-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
 -perf-$(CONFIG_DWARF) +=3D dwarf-regs.o
 -perf-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
++perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
 +perf-util-$(CONFIG_DWARF) +=3D dwarf-regs.o
 +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o

--zRopLGLXR8zcfVMV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ/B3gACgkQJNaLcl1U
h9Ax4wf8D9HoIhbSjLhTzI7Vq4lj49enCDROzqB8utktsaggg5CVzAQXGS/w1PiA
KROCfJRRz5PeoiN/Oawo7EKI2RX+e7YeRYvpfQxrWndWJcQjWVjSHwUNF5T13QXV
rat7lqDa2g2f9terDGjOVLJJbmWvKGCc99ptcNqc91JWNS6XBxzupVa4FxLdj8Zc
pGBNPMOSDWtAtUeyB8o2E+3mtlXCO9LqEwHxed1rX3MD+ICxSuoq1plEB/ebYIrL
s19/s5+zMK25oLz534ks0i+MiZocpzLLaJ0HdTcedIoLdMATtZg1uXF+kkFNL1lg
YMtvr7ssm/nLD0Xe3PNdAqirBN59HA==
=CDMe
-----END PGP SIGNATURE-----

--zRopLGLXR8zcfVMV--

