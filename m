Return-Path: <linux-next+bounces-6885-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF854ABF213
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 12:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9D31BC132D
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448A71A3BD7;
	Wed, 21 May 2025 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CiIh1+zC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B12620FC;
	Wed, 21 May 2025 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824568; cv=none; b=QgocjcjiflQwOers3GKAGoAUICoj2Wfo0I4/etN3z14RFJt6ydHsIvv/DLt4MWAdGAv8yRx3CtDXwZgQQRItNWUR+Kz2C3STnfYAk5QURLgYwhoLmmHFr5gmdEBVRiomRYQmwJSc7BNVM9qlwppti6SSTcfJLI7jmPk6s75YVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824568; c=relaxed/simple;
	bh=1RwH4+bgmzmtI0aAVkVNYpLqVce6QA6FXTFOVdMhE7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SxXUjoTBiexlZ3PT/Y94CMSqNJJ3fBkUgaCpavE23Sa2JOHLOSn+IEPMK1MJOW+4oFUZPVi6+YG7ZTHI0BVVTykgDkKjfOHPXQgYF41saL9pznzrWipIcG42Y9d1tfC/PYuw0TmPI0IL438yEm0g3WiQzv63Tfgtt8zPUlrsCDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CiIh1+zC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747824563;
	bh=739TDMW0F8FV58+8yfYLrGwcIxqR7kkE1vTRdlXgiP8=;
	h=Date:From:To:Cc:Subject:From;
	b=CiIh1+zCH5EebMOPhrEJ996z08G6RSBaLJ8ysMmlmvm9guV0m+wWsKILdZBKqucPO
	 oCpurQvdiBVsRrcDS1//VqRLmWg7uKLyjAVciN1hwgcuCxpux2QkS3YEOy0ZLn6LSC
	 l5WwV+jn+92rWASll/I8Q7qVxYX5sxuE9esa/jMwFzEsBJFv/o+dz2JF0VcBrhPWN/
	 Gq06Yd2sqjOp/9TuA5rMG7Ca3Q+uIV875XL+e1W3y08UoH1raKExIbJ/7TA8bCvIDZ
	 HADSt/+tYciNBWIP6tEGOL2jmvH/yfDMlMHG1yI4pDCBA0B0khjgTpCDzEjb4SBLFU
	 VrUijfMNeDXlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2Spq62D7z4xM2;
	Wed, 21 May 2025 20:49:23 +1000 (AEST)
Date: Wed, 21 May 2025 20:49:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250521204923.1e002f04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9XnRb++Q2vjExyHRaJLHRqC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9XnRb++Q2vjExyHRaJLHRqC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_84
allnoconfig) failed like this:

x86_64-linux-gnu-ld: fs/coredump.o: in function `do_coredump':
coredump.c:(.text+0x1795): undefined reference to `sock_from_file'
x86_64-linux-gnu-ld: coredump.c:(.text+0x17a6): undefined reference to `soc=
k_from_file'
x86_64-linux-gnu-ld: coredump.c:(.text+0x17b3): undefined reference to `ker=
nel_sock_shutdown'

Caused by commit

  997e88a74ed6 ("coredump: add coredump socket")

# CONFIG_NET is not set

I have applied the following hack for today to make it build.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 21 May 2025 20:41:32 +1000
Subject: [PATCH] hack for "coredump: add coredump socket" and !CONFIG_NET

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/coredump.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/coredump.c b/fs/coredump.c
index cb727a5b59ac..62d1584b24ff 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -962,8 +962,10 @@ void do_coredump(const kernel_siginfo_t *siginfo)
 		free_vma_snapshot(&cprm);
 	}
=20
+#ifdef CONFIG_NET
 	if (sock_from_file(cprm.file))
 		kernel_sock_shutdown(sock_from_file(cprm.file), SHUT_WR);
+#endif
=20
 	/*
 	 * When core_pipe_limit is set we wait for the coredump server
@@ -975,6 +977,7 @@ void do_coredump(const kernel_siginfo_t *siginfo)
 		case COREDUMP_PIPE:
 			wait_for_dump_helpers(cprm.file);
 			break;
+#ifdef CONFIG_NET
 		case COREDUMP_SOCK: {
 			/*
 			 * We use a simple read to wait for the coredump
@@ -985,6 +988,7 @@ void do_coredump(const kernel_siginfo_t *siginfo)
 			__kernel_read(cprm.file, &(char){ 0 }, 1, NULL);
 			break;
 		}
+#endif
 		default:
 			break;
 		}
--=20
2.47.2

--=20
Cheers,
Stephen Rothwell

--Sig_/9XnRb++Q2vjExyHRaJLHRqC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtr7MACgkQAVBC80lX
0Gw/PggApUsJ5KHINLDrGxSZhAXPdYF8tsh0576JIP3sQjypjo/bYs0yFFvwWMny
r2o3dHi1MQ1bBBkqQXBOqnF4yNmjW798Nr5NsAZ4dvfaIwPmwxImEA4FM4CWAriO
9jfmw2mpITOA/oS8fXDr24hkkHwLKC1o0xejYAwAR5LwYtcJigvb23MJJafwlEWL
NxYtUTMiJE6EVmjOgt6eBZD+j2D2S+Ytd2UhZiU/ElYxHKlmHCBWB/jiDO1sSQuL
RSKPNqUdNEzuTrpX/W+Vor0TLKwxe7EqwPyNjCvnRW7HSEJSyHunOtA+x/vpmNsA
JiiimO1YEHDhwlYQLsOGjHvRQVjTpQ==
=KDMw
-----END PGP SIGNATURE-----

--Sig_/9XnRb++Q2vjExyHRaJLHRqC--

