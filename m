Return-Path: <linux-next+bounces-4252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002F99BE4F
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 05:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DE921C21EAC
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 03:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3F0487BE;
	Mon, 14 Oct 2024 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P7UALpFo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D320E6;
	Mon, 14 Oct 2024 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728877615; cv=none; b=Ke5XD3iy76rn2gbJKPOwiwL/JHv7AE47/kxco/lOw8KVeeIaakOtnTBgkcirWvwEOov1RjCs/hg/uDwmXsQvaUp7TKnzbg4XMvTGKavUZ4Efb6rTKgsf8EJVha6rmU4Gfrwo6B5xMv37rwSY3h0KJORfI3O9TK+oGE+HymNgZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728877615; c=relaxed/simple;
	bh=2NsT0WAo+3qTiXMENIEjzGb38f/nMG9A+IRUyZ08r+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AgIuGU90hzoIXlj6P2XWatWnzcLoGb68N3y+GQLoMZYeoM4QEyo2CTv31cdkInH6PY9Ny+KM0rgy6vaONRXVJ44X/is6zW/NmuBKGvPLZBH3/lftepF0341HaIr5LLa7gzdfUGXGtTX7eqbpK/TN+PhgW/zxl60kYOR1EVLIeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P7UALpFo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728877608;
	bh=IE+eFhBCyhykX0HaoXeVsgGgtRo5zD6kl1e9wJhuCWY=;
	h=Date:From:To:Cc:Subject:From;
	b=P7UALpFoC9/8IJgoRKuU0QdLLX2pDtoiTsWvxr2uxlkhG5ZtJ6eLR12Ndgp2hbwj+
	 LB057t8hPIARWqDKI26ES/XZ+CLB05CI0xw9VM8Izb8Fr3oEUMcWcnuCD33z3CQlr0
	 nzWSCaN/jWrrwMwQyLHB8w0QSMAnspRD2aJyBLgQm45CurRBJUSEnfNTdQEyHovafr
	 sCkHZw5qRbc5ligf8wWQh1Q2h+/Hxt1BtF3I4reELP4pttUGHt6LQNPGS7FOfxZZe0
	 JRaz3A1C794yJu9P+AsyCoPJtjkLPEdTp7OGZZbYEGHHRo5bzttJAQwGhw3L3LawfO
	 eSYnFfO5SCrCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRjpJ3gZpz4x8T;
	Mon, 14 Oct 2024 14:46:48 +1100 (AEDT)
Date: Mon, 14 Oct 2024 14:46:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Casey Schaufler <casey@schaufler-ca.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>
Subject: linux-next: manual merge of the security tree with the mm tree
Message-ID: <20241014144648.1923104a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bvzq9izB=+eAOMZ29dmGYWD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bvzq9izB=+eAOMZ29dmGYWD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  kernel/auditsc.c

between commit:

  cd39427be833 ("auditsc: replace memcpy() with strscpy()")

from the mm-nonmm-unstable branch of the mm tree and commits:

  37f670aacd48 ("lsm: use lsm_prop in security_current_getsecid")
  13d826e564e2 ("audit: change context data from secid to lsm_prop")

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

diff --cc kernel/auditsc.c
index 7adc67d5aafb,f28fd513d047..000000000000
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@@ -2729,8 -2728,8 +2728,8 @@@ void __audit_ptrace(struct task_struct=20
  	context->target_auid =3D audit_get_loginuid(t);
  	context->target_uid =3D task_uid(t);
  	context->target_sessionid =3D audit_get_sessionid(t);
- 	security_task_getsecid_obj(t, &context->target_sid);
+ 	security_task_getlsmprop_obj(t, &context->target_ref);
 -	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 +	strscpy(context->target_comm, t->comm);
  }
 =20
  /**
@@@ -2756,8 -2755,8 +2755,8 @@@ int audit_signal_info_syscall(struct ta
  		ctx->target_auid =3D audit_get_loginuid(t);
  		ctx->target_uid =3D t_uid;
  		ctx->target_sessionid =3D audit_get_sessionid(t);
- 		security_task_getsecid_obj(t, &ctx->target_sid);
+ 		security_task_getlsmprop_obj(t, &ctx->target_ref);
 -		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 +		strscpy(ctx->target_comm, t->comm);
  		return 0;
  	}
 =20
@@@ -2777,8 -2776,8 +2776,8 @@@
  	axp->target_auid[axp->pid_count] =3D audit_get_loginuid(t);
  	axp->target_uid[axp->pid_count] =3D t_uid;
  	axp->target_sessionid[axp->pid_count] =3D audit_get_sessionid(t);
- 	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
+ 	security_task_getlsmprop_obj(t, &axp->target_ref[axp->pid_count]);
 -	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 +	strscpy(axp->target_comm[axp->pid_count], t->comm);
  	axp->pid_count++;
 =20
  	return 0;

--Sig_/bvzq9izB=+eAOMZ29dmGYWD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcMlCgACgkQAVBC80lX
0Gwywgf+IwyZEUTP5cnKHGRLTZuJ3pvWgtBgiMJANnZAgZTHmsqlmOgGAw20NtlF
wwIpbA2unwZLwmvRWdC/HCAZFCVN5E61MJgM1WmR5qdWDeHWuHguRzLWN5xE+rSY
cUV0iQGasTul01usVR0bzZQqzspoObJUub48x8ku1BZdBXhL7XjY1hCirFerVKCG
xjUfMh6Ali7MdTY5It7DsN8mklOlS8i0u2AL+z5S59QGiwgoDR8G/eNKJ74zEGeN
7JhKkSuUUtvjxC71I0wTD6DDOJuSJrwVccFGycwC3jtHBRqnuent7DiY9wp7Zvwo
Uc8MPEONR7KWApdQbz/OGiyWFscBiQ==
=pKRg
-----END PGP SIGNATURE-----

--Sig_/bvzq9izB=+eAOMZ29dmGYWD--

