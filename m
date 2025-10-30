Return-Path: <linux-next+bounces-8764-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC5C226DC
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 22:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B17E407551
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BBB2F90D5;
	Thu, 30 Oct 2025 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sYnAE4ZG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416ED13C3F2;
	Thu, 30 Oct 2025 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860139; cv=none; b=sr5XlMoqx8jVmOV97TGoNitorcTfLIvbAsNrYZaSGAFnaispKgrjyXPwAMFyopECsVDSwyMhz+uLKDiyl45QVRuJ689mnSTlSC+xkQDa443pC9xYRja2RU97DGm7dU/n0Vh++0m+deggp5BMlLoKnxMOD/kHyimN1sjsmGQfJRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860139; c=relaxed/simple;
	bh=fS1bE4KpfoLX6sLifapuk0WBbL4Jcr3hZBNe5UFS++o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tr1k7zMDrXdIMzXpZpebQnHdsvnsd+RV5zK+gS0H6PcfAsryM8nk6sokao1oMtV7lrvPBdjKfhmrJe+ladhDb4aI4k6pJqlHniqMwWGZ3KZijt9r3w+zuIJlWS4wvtlcWoDAHwGfYaZg1UEgutoG78Aw1GrGAFvVNqp+e2Py6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sYnAE4ZG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761860132;
	bh=81IGFNJFE/aATygJVVWIXOCCzKbZf3iPEEOLaVmpKcc=;
	h=Date:From:To:Cc:Subject:From;
	b=sYnAE4ZG0+SbKe2wy5Oj+nfSb8tuhVlk3XGJDpmfzWOipJDd1fxW6UEMBmgD+VEPd
	 hZdFDpsPr7wAJUMmZk0xePGesA2boYcMkjAUhmObCLQk5Vj6+40zjesuRE8KqXAfo8
	 r5Fz2lgdFNXscEUglDz1dJTzNAIRTwWXtLcNZsgKKSQCCkOeZdbI0ylwFyWsrsHCcN
	 KX5ce+5Zr5RjwoE6lTDGjdQhU16Chwxm5DckJBin0hJaUwBp93Fgl7yckduCsFCFcp
	 CxImKhdSeTvvrnrSUTjXdbY3LIRj2ZpjjR2fhPEMfOBkHGIqrqoLm2UwcBiETKfOTx
	 gaVnxRlIZhZYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cyHTc2g4kz4wMB;
	Fri, 31 Oct 2025 08:35:32 +1100 (AEDT)
Date: Fri, 31 Oct 2025 08:35:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251031083531.56c76f27@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tZ+7p9Q31fQu0BI7QEpVqKe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tZ+7p9Q31fQu0BI7QEpVqKe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/init.h:5,
                 from include/linux/printk.h:6,
                 from include/asm-generic/bug.h:22,
                 from arch/powerpc/include/asm/bug.h:116,
                 from include/linux/bug.h:5,
                 from arch/powerpc/include/asm/cmpxchg.h:8,
                 from arch/powerpc/include/asm/atomic.h:11,
                 from include/linux/atomic.h:7,
                 from include/linux/refcount.h:104,
                 from include/linux/ns_common.h:5,
                 from include/linux/nstree.h:5,
                 from kernel/nstree.c:3:
kernel/nstree.c: In function '__ns_tree_add_raw':
kernel/nstree.c:144:48: error: 'struct ns_tree' has no member named 'type'
  144 |         VFS_WARN_ON_ONCE(ns->ns_type !=3D ns_tree->type);
      |                                                ^~
include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON=
_INVALID'
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
kernel/nstree.c:144:9: note: in expansion of macro 'VFS_WARN_ON_ONCE'
  144 |         VFS_WARN_ON_ONCE(ns->ns_type !=3D ns_tree->type);
      |         ^~~~~~~~~~~~~~~~
kernel/nstree.c: In function '__ns_tree_remove':
kernel/nstree.c:210:48: error: 'struct ns_tree' has no member named 'type'
  210 |         VFS_WARN_ON_ONCE(ns->ns_type !=3D ns_tree->type);
      |                                                ^~
include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON=
_INVALID'
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
kernel/nstree.c:210:9: note: in expansion of macro 'VFS_WARN_ON_ONCE'
  210 |         VFS_WARN_ON_ONCE(ns->ns_type !=3D ns_tree->type);
      |         ^~~~~~~~~~~~~~~~
kernel/nstree.c: In function '__ns_tree_adjoined_rcu':
kernel/nstree.c:355:98: error: 'struct ns_tree' has no member named 'type'
  355 |         VFS_WARN_ON_ONCE(list_entry_rcu(list, struct ns_common, ns_=
list_node)->ns_type !=3D ns_tree->type);
      |                                                                    =
                              ^~
include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON=
_INVALID'
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
kernel/nstree.c:355:9: note: in expansion of macro 'VFS_WARN_ON_ONCE'
  355 |         VFS_WARN_ON_ONCE(list_entry_rcu(list, struct ns_common, ns_=
list_node)->ns_type !=3D ns_tree->type);
      |         ^~~~~~~~~~~~~~~~

Presumably caused by commit

  c6b288f5382b ("nstree: maintain list of owned namespaces")

I have used the vfs-brauner tree from next-20251030 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/tZ+7p9Q31fQu0BI7QEpVqKe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkD2iMACgkQAVBC80lX
0GyBagf/cbAFZ78JA9dCH8UN0D6vDnCBjDxevuoi/WxAXP5EugIU6VKSO6AT2sX8
joG3z61eRj3s+mwKXdE0OPUI4gC9BfmlVL5iRiPQuyAegXdQPkZDXlK/dTCrmMqG
9vvOo8A1K7lmhXjOFSUDo7sPHogoFrpfIL6jWsR3z12uawWGf0/dAoDx76TU87ka
aXxwwRFtNTFL/2nitiJvUFyq7/lkAsx8lxNTdz9OCyvLcjE94TT0IpskmMXs70O7
DK6mfzCC46YPFhkn/3dRlHpCR2FsecrrL9dy7TXKsZQ2kRKTRoqXCbnZkdzYcPOJ
QejoQDm9d7V88+VLOMHSUxT1TXI4hA==
=u0Er
-----END PGP SIGNATURE-----

--Sig_/tZ+7p9Q31fQu0BI7QEpVqKe--

