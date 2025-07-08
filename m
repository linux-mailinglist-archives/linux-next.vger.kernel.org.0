Return-Path: <linux-next+bounces-7403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762DAFC66E
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 11:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 850703B45C1
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098D5221554;
	Tue,  8 Jul 2025 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N4YvSng7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3684298CC4;
	Tue,  8 Jul 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965211; cv=none; b=sLEN4GdEWQyFSE0ECsfOUsqQvamWVmhGryvG+6yOhpfjE5+fpGqrL4OudiupzSN9ayWaoOIsJnzxJcSsoQE877hERXKmFjHsi0yrO69OeQa2fEUWg0eqaDIzN1471txP6odA5i1vRzbsU3SEcmEs09Eh+he6157Zyfpz4TDHOpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965211; c=relaxed/simple;
	bh=0pGAUAdFjfpTgmLq5KGpx6SMyldQ56FfBSiIfnDjz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i6kS1VKKK/dvxLg+VfhfPcHUSHn3YHW7oysfIAwdlNTzemZSQiw4tq0VgxwYVNGc47ZSKmJv0VxKpFJxO9n1oDpVMXvbqSNOTGTjaQhlNrtYd+YpD25RefYFqUiirhyAefKTGdjXSWPhhfcuHiH/xz/wmOKeWMfM57vyOA6LoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=N4YvSng7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751965146;
	bh=3H+fGCXlSNoWhEpeSYgjHT8uyRrS2/8FltBMpJgNVTM=;
	h=Date:From:To:Cc:Subject:From;
	b=N4YvSng7Y1M9AHGxbYNEIUnWz1OMkn6TVZWsWakYrZqJYibGF/D3ou+PjnmY8FA5H
	 cmFWPDOhscE8qM6C75EtGBYKoiKiknoPM4YpCJWdwfArRb8y+TBSn9TEybNE1zOoAA
	 O7SDFxa4WdL/tRhR7/D06BPXJLu1C7BuQMJtrphW2oZYvkcyBbVh7zh4SGXiUkSPX3
	 dU5HhwknEhmVdFrlQHoqHFUo1z3TazoRM2noRpxpurlOVt/QrBywSk80GTmOpuHRkB
	 5iWpYVwPObhtxtH5jnbrB+HdQK9Tne2T+jcXVf7PQxA7/4pu5v7JYlhjx9CwOHxf4G
	 SJBE/LwCSDdZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbw5Q3Dc5z4w2J;
	Tue,  8 Jul 2025 18:59:06 +1000 (AEST)
Date: Tue, 8 Jul 2025 19:00:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Feng Tang <feng.tang@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <20250708190003.4eabc8ab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JvQd4r+SuOKb07YPaY/WIvZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JvQd4r+SuOKb07YPaY/WIvZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  kernel/panic.c

between commits:

  f8dbd6138e05 ("panic: add 'panic_sys_info' sysctl to take human readable =
string parameter")
  3699d83ae18b ("panic: add note that panic_print sysctl interface is depre=
cated")

from the mm-nonmm-unstable tree and commits:

  48f1dc94d25e ("sysctl: Move tainted ctl_table into kernel/panic.c")
  9aa4e27ef60c ("sysctl: Move sysctl_panic_on_stackoverflow to kernel/panic=
.c")

from the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/panic.c
index df92b763f857,64e58835086d..000000000000
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@@ -78,13 -84,50 +78,56 @@@ ATOMIC_NOTIFIER_HEAD(panic_notifier_lis
  EXPORT_SYMBOL(panic_notifier_list);
 =20
  #ifdef CONFIG_SYSCTL
 +static int sysctl_panic_print_handler(const struct ctl_table *table, int =
write,
 +			   void *buffer, size_t *lenp, loff_t *ppos)
 +{
 +	pr_info_once("Kernel: 'panic_print' sysctl interface will be obsoleted b=
y both 'panic_sys_info' and 'panic_console_replay'\n");
 +	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
 +}
 =20
+ /*
+  * Taint values can only be increased
+  * This means we can safely use a temporary.
+  */
+ static int proc_taint(const struct ctl_table *table, int write,
+ 			       void *buffer, size_t *lenp, loff_t *ppos)
+ {
+ 	struct ctl_table t;
+ 	unsigned long tmptaint =3D get_taint();
+ 	int err;
+=20
+ 	if (write && !capable(CAP_SYS_ADMIN))
+ 		return -EPERM;
+=20
+ 	t =3D *table;
+ 	t.data =3D &tmptaint;
+ 	err =3D proc_doulongvec_minmax(&t, write, buffer, lenp, ppos);
+ 	if (err < 0)
+ 		return err;
+=20
+ 	if (write) {
+ 		int i;
+=20
+ 		/*
+ 		 * If we are relying on panic_on_taint not producing
+ 		 * false positives due to userspace input, bail out
+ 		 * before setting the requested taint flags.
+ 		 */
+ 		if (panic_on_taint_nousertaint && (tmptaint & panic_on_taint))
+ 			return -EINVAL;
+=20
+ 		/*
+ 		 * Poor man's atomic or. Not worth adding a primitive
+ 		 * to everyone's atomic.h for this
+ 		 */
+ 		for (i =3D 0; i < TAINT_FLAGS_COUNT; i++)
+ 			if ((1UL << i) & tmptaint)
+ 				add_taint(i, LOCKDEP_STILL_OK);
+ 	}
+=20
+ 	return err;
+ }
+=20
  static const struct ctl_table kern_panic_table[] =3D {
  #ifdef CONFIG_SMP
  	{
@@@ -134,13 -183,16 +183,23 @@@
  		.mode           =3D 0644,
  		.proc_handler   =3D proc_douintvec,
  	},
 +	{
 +		.procname	=3D "panic_sys_info",
 +		.data		=3D &panic_print,
 +		.maxlen         =3D sizeof(panic_print),
 +		.mode		=3D 0644,
 +		.proc_handler	=3D sysctl_sys_info_handler,
 +	},
+ #if (defined(CONFIG_X86_32) || defined(CONFIG_PARISC)) && \
+ 	defined(CONFIG_DEBUG_STACKOVERFLOW)
+ 	{
+ 		.procname	=3D "panic_on_stackoverflow",
+ 		.data		=3D &sysctl_panic_on_stackoverflow,
+ 		.maxlen		=3D sizeof(int),
+ 		.mode		=3D 0644,
+ 		.proc_handler	=3D proc_dointvec,
+ 	},
+ #endif
  };
 =20
  static __init int kernel_panic_sysctls_init(void)

--Sig_/JvQd4r+SuOKb07YPaY/WIvZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhs3hMACgkQAVBC80lX
0Gyxxwf+OMF210iKzwJ3rqOHjyigvuTf4b/ilOn6VoUhiVEUJzRvdSZfooMV44lQ
zXcuZYxqBc72FXlkztxi33nQCsjb94N1atVJRBgjcSApwDFGneTOgAGz/1JyOmEX
giFRH8uzW9C4TeZqaGsMms/dNO1C+voOkycNuetG2b1ge/3ypdR/oo5k1px7B0f+
Xfsc2kGVs/cnXrJdGIJHAdTdiaZs7iCB19FJStnSUN6AEsVsRW4bYjhGfjGTszqu
p4KiTCkN7pdWQRRoRlpbIT9ixUd54WZb/BC+4mkXqehQlAuwfe+AiqDWeytwmWQX
13dfwPC/2KvMA0AKYH4gU8lmlOBrDA==
=GPha
-----END PGP SIGNATURE-----

--Sig_/JvQd4r+SuOKb07YPaY/WIvZ--

