Return-Path: <linux-next+bounces-3208-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE3B9455CD
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 02:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73E7DB2135E
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 00:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C095258;
	Fri,  2 Aug 2024 00:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F8iLPN8N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B34C91;
	Fri,  2 Aug 2024 00:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722560253; cv=none; b=PoOw0fP3fa/ib94SuHbFUHloC07Wi8vvZZsTRn28rd2+/0uCFka53rT0gQsBE9i45tMwXZZ1b5lEJCqyqF8rvh1kMVdjfV4qNESmuDoS+LcUVqHXQkQAMEbJk5gbLEPxJHcYhcchfwQxTDx2y6t7rkHZsWwgJyTyGgX05lTsvNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722560253; c=relaxed/simple;
	bh=3NLzT/3jx2hm5IvGk88iE8hl5vNX3Rv+N1VcqMRD8LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=haMhf9ZpdsAuhKaqXFJzE+WOGHAzqut0XDtEF1EzflRtwOS4c1Pbgq4QhnaQRvjX824bHR1EKP1NFJGCfdQmHKhVt+yph4VpQk93HMANhbjug0jsJiwj/g7Xynra4BGnSNXRW8aF308+IM1deAK6hL6Y9MqOryuUE7otkpEIY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F8iLPN8N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722560247;
	bh=gEcvdzYghf0C2EKbmvRbt3Bfu5Mp5vQg61UTvv695/g=;
	h=Date:From:To:Cc:Subject:From;
	b=F8iLPN8NuQ2AYn2thUDDHIEXyCFk5fTLJ++9t+N5j1nZZ4sXqJplggEf6+0Edbj83
	 k+V4556c++a+yIfc4ZIRhmjG6xGC0NsL/cqd1a1dvSJuGIIr+5q7YprjtSWKk/NpUt
	 GGWp4S2qIj3af0rlLn6WYH+wzamAOQPNG5DCcjy+KFsR+ZVl39eikpgA+Kt52DJ4on
	 SRB2MtJGtvML1yq0m2hAdDTRVRRn1/Ky0OM7l/9bEwsujc246ppRQA44CIl4JOTA6J
	 mhhsLSmAeEbHb6O5FH8HBImUVYqq844SYOB34VmDEyr9trKAsG15dIKV5RjPFPdj1H
	 7VBN/ksbDsMIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZnVb4C5Qz4wcK;
	Fri,  2 Aug 2024 10:57:27 +1000 (AEST)
Date: Fri, 2 Aug 2024 10:57:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cpufreq-arm tree
Message-ID: <20240802105726.6ce93aa8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wDvO.EjsPMksGST2MI4cUAN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wDvO.EjsPMksGST2MI4cUAN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cpufreq-arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/cpufreq.h:17,
                 from drivers/cpufreq/spear-cpufreq.c:17:
drivers/cpufreq/spear-cpufreq.c: In function 'spear_cpufreq_probe':
include/linux/of.h:1435:51: error: lvalue required as unary '&' operand
 1435 |                  of_prop_next_u32(_it.prop, NULL, &u)};            =
     \
      |                                                   ^
drivers/cpufreq/spear-cpufreq.c:201:9: note: in expansion of macro 'of_prop=
erty_for_each_u32'
  201 |         of_property_for_each_u32(np, "cpufreq_tbl", &val)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/of.h:1437:62: error: lvalue required as unary '&' operand
 1437 |              _it.item =3D of_prop_next_u32(_it.prop, _it.item, &u))
      |                                                              ^
drivers/cpufreq/spear-cpufreq.c:201:9: note: in expansion of macro 'of_prop=
erty_for_each_u32'
  201 |         of_property_for_each_u32(np, "cpufreq_tbl", &val)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  e960bbac0af4 ("cpufreq: spear: Use of_property_for_each_u32() instead of =
open coding")

--=20
Cheers,
Stephen Rothwell

--Sig_/wDvO.EjsPMksGST2MI4cUAN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmasLvYACgkQAVBC80lX
0GygFgf/ZZSEZUgGsecXtpq6vIH8JJtdf0RB80YEX0UYZwuZ7zc+1CnCU21uqOCk
RUefy7XwqyR+pmj0a2X6YXKcF9GGf/Ox+3uJJDnCYOSI93SZiUCg57P1MlZtHo3g
N4Jext/EFbzUKt8zrjYf6YdnrpNr/vaBHeZ1IrV9b5qa9iTwCI+D/qmK5Iee7yqo
Sp7QYPXB8SwJgFIQrh4RGcVCJcPOwW9vYMxvFaIVjvOHNBOx0iugQhNUAt1zC/Xu
620+p19FqREi2IP8l1/GWnGYNrxM7vC4i3M6dWmi98tMYTmgdZ9Mrv0vXi18O3//
8odH4U3b2GW2sFKT0XhBMgmom/VEkQ==
=Dwqh
-----END PGP SIGNATURE-----

--Sig_/wDvO.EjsPMksGST2MI4cUAN--

