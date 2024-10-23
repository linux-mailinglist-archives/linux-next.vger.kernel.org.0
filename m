Return-Path: <linux-next+bounces-4378-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11B9ABB07
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 03:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 069FC1F244B6
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 01:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47744288B1;
	Wed, 23 Oct 2024 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PQsCqoQ9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB31C6A3;
	Wed, 23 Oct 2024 01:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729647108; cv=none; b=jiLsFpskQNW0VLCWMPQ3N91b7ucXPoMbUkDMzTWUT3VjaOay7sV6eZ7Uew3u3Rp/5XKy/G0RGuxtWfm9w+gjKw7Zv7a0CV2B7zFg1mRmnTnetK94ZZdYnqr/g3O2fOO79RGwNvUD7iXTR1EDRKTs+QTM8JPte0AW8hSdCKOLxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729647108; c=relaxed/simple;
	bh=KKSHl3T02IeGDl4hwhOlKZZ9eorEoQsmVDcBpwJQs2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uyhuq/l2U0vd2MEjQFzrkbSpiYq186Hp+GeaoUUG+qAMCMq88tSJ/iOCQRqpoRn0ocwOhoCNwrX6y0YrYlEW7sV5WGRFVE6FhP0rOndI3VVGQ/lgs+z5MF9+ZT14ueVejZvqzkPu+7ThmQrGBRtCYUwzLkPLcvHfdXfJyzqlbsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PQsCqoQ9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729647099;
	bh=FGhil7diUrAQR5Cbh0J5oYz2NBOTG/tvY530NcHuqLQ=;
	h=Date:From:To:Cc:Subject:From;
	b=PQsCqoQ94DYrStKJMXi8i99/6tepSEGKCe/wt+gqLwtJKQJFnPUpJNJPzZvKYRKpe
	 fJqSM1fOeAkIx8pefwjyjqd4aHWUn15wyQIjX/zmkw9jcu1y+DCunxbNxryOwMh5AT
	 SgkrGl+PLRzNMaZL/lhrNsN4KlYkGtHjZ3P5wIwWy/8L8XRKL9fURJTYy8OnyKUV4J
	 OOpmAP67t+yIpHvO/Qaeb5hzQgS7WZZTz6SxJE3vhRqTPvsTtSyFCCmKBXR1UmbsRR
	 eaeTb6Dxxx7rPEWkcdiDjrpM+faIbOIMMrWb1jG5SrXI88+w74j7s0IbknyprrMYHW
	 yIJpOEhKG/dJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYBNC2bFHz4w2K;
	Wed, 23 Oct 2024 12:31:39 +1100 (AEDT)
Date: Wed, 23 Oct 2024 12:31:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?B?bg==?= <mic@digikod.net>, Yafang Shao <laoar.shao@gmail.com>
Subject: linux-next: manual merge of the security tree with the mm tree
Message-ID: <20241023123139.127ad800@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WQowSxJqyET+xvMki/SC3l6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WQowSxJqyET+xvMki/SC3l6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  security/lsm_audit.c

between commit:

  b62d29a06242 ("security: replace memcpy() with get_task_comm()")

from the mm-nonmm-unstable branch of the mm tree and commit:

  cfb1f7e5c9a7 ("lsm: Add audit_log_lsm_data() helper")

from the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/lsm_audit.c
index 9a8352972086,de29ce8ff708..000000000000
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@@ -428,6 -422,21 +422,21 @@@ void audit_log_lsm_data(struct audit_bu
  	} /* switch (a->type) */
  }
 =20
+ /**
+  * dump_common_audit_data - helper to dump common audit data
+  * @ab : the audit buffer
+  * @a : common audit data
+  */
+ static void dump_common_audit_data(struct audit_buffer *ab,
+ 				   const struct common_audit_data *a)
+ {
+ 	char comm[sizeof(current->comm)];
+=20
+ 	audit_log_format(ab, " pid=3D%d comm=3D", task_tgid_nr(current));
 -	audit_log_untrustedstring(ab, memcpy(comm, current->comm, sizeof(comm)));
++	audit_log_untrustedstring(ab, get_task_comm(comm, current));
+ 	audit_log_lsm_data(ab, a);
+ }
+=20
  /**
   * common_lsm_audit - generic LSM auditing function
   * @a:  auxiliary audit data

--Sig_/WQowSxJqyET+xvMki/SC3l6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYUfsACgkQAVBC80lX
0Gw9/Af+MNBvHeK1dfxb2NBbSwPWGBmzrcbiMdDSoeqCdoGa147TTn5rCYYLnzSp
FWyk9e0iT8+BqanCtARBs725AJ9I1XuBUcb2TvO04grxrfs+bVEm3rNQpvTaEFfx
OvdV6zLY04OcFP1r+qv1aqmX+p75rgDXHSes8Df5bvea3yQblypIKEhJzuELvtsN
rJSJSl3cyi8X8H3X9UIKnx1pfiM2QRW7QP7+6VrOWCapQD6nHDyCCbDuqf1rmGr5
/3p++9dghh7BhD/ohXdcMSeiV9iVEJ3ZQX4aYZBGZbXPxu4nVzJMCUDIn7yn/BJb
iAAwewRehjOG+xZJNREjvxHH+EQH9A==
=Cf5z
-----END PGP SIGNATURE-----

--Sig_/WQowSxJqyET+xvMki/SC3l6--

