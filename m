Return-Path: <linux-next+bounces-4820-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F159D328F
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 04:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81452B21CB6
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 03:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C67E155C96;
	Wed, 20 Nov 2024 03:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lvSjTTGi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607AA156237;
	Wed, 20 Nov 2024 03:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732073419; cv=none; b=nVx0/0Ga0/+Q0Grzpx/1Sq0JbrR/nbrUlKJVLHBwSLBzMFy0X+oDv8qrjACMH+0dNRgAVY7b3xbvnANlfuIIlou3PtapkUjIVgLMmqKVOwFenYrkSOUktIqutfKD7xeBrTalWZjihoGfDjlxESnD8bTIK/kJs6JdWPr6DL/yR8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732073419; c=relaxed/simple;
	bh=el5OWFx592A1YbCsHlo+Hv7iuW/uvNz61+XSg8xhXJo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MMttLCc6x+nr+V3p9ETWu7DW/jiIh/RbLgyBrd+XyJ7giGhUg3u7g8ZXMjsZA4ToP5yIwfLLjqwfUgVzRF2SOyc9N1ZH83UvXKQZiNUDmZODwGXMSTOvh5P+Fhmf7PIO45OG1yhrOXJZXoyVWztSX0C7ehbJf/x797t3OFf6WQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lvSjTTGi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732073409;
	bh=xmCYQL0h6GDyWaaMfDw4UGvEahwjobA0qZUzQrxF6K0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lvSjTTGidQ26QteOltMp6GlUfygs4wHMYapQebazh7GaelPZ7iMhsl1n5b+HFyk6l
	 wiO9rV33QIqGsopZMi1H4e1VmXun6VvFnuWCSxUbuJc6klWl8qNIBJDy0GP19xA/UW
	 K0//kIvpZJMnBYRaxclT15Sufm/BF6kQkqUjRtsAW75uECqxE3qL2TE/NUNw3bowC+
	 h1WbgXsUt74sWX8dtU2ngX3JGyAJLbDYjzdh1+C9SbC6XavJ7loP4qFgaWpLHYYIN8
	 x+U43xRYM9loJ+98APzSyh9EYnloqWI2gR3NqBnHTjbpOjr7DQ2lis/lcv7V7ygSCl
	 kngczvIUB9VGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtRh072w7z4wbp;
	Wed, 20 Nov 2024 14:30:08 +1100 (AEDT)
Date: Wed, 20 Nov 2024 14:30:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Moore <paul@paul-moore.com>, Casey Schaufler
 <casey@schaufler-ca.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the mm tree
Message-ID: <20241120143011.100edd4d@canb.auug.org.au>
In-Reply-To: <20241014144648.1923104a@canb.auug.org.au>
References: <20241014144648.1923104a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sGJiDOdvPb.JV==tAKWiLs/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sGJiDOdvPb.JV==tAKWiLs/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 14 Oct 2024 14:46:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the security tree got a conflict in:
>=20
>   kernel/auditsc.c
>=20
> between commit:
>=20
>   cd39427be833 ("auditsc: replace memcpy() with strscpy()")
>=20
> from the mm-nonmm-unstable branch of the mm tree and commits:
>=20
>   37f670aacd48 ("lsm: use lsm_prop in security_current_getsecid")
>   13d826e564e2 ("audit: change context data from secid to lsm_prop")
>=20
> from the security tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc kernel/auditsc.c
> index 7adc67d5aafb,f28fd513d047..000000000000
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@@ -2729,8 -2728,8 +2728,8 @@@ void __audit_ptrace(struct task_struct=20
>   	context->target_auid =3D audit_get_loginuid(t);
>   	context->target_uid =3D task_uid(t);
>   	context->target_sessionid =3D audit_get_sessionid(t);
> - 	security_task_getsecid_obj(t, &context->target_sid);
> + 	security_task_getlsmprop_obj(t, &context->target_ref);
>  -	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
>  +	strscpy(context->target_comm, t->comm);
>   }
>  =20
>   /**
> @@@ -2756,8 -2755,8 +2755,8 @@@ int audit_signal_info_syscall(struct ta
>   		ctx->target_auid =3D audit_get_loginuid(t);
>   		ctx->target_uid =3D t_uid;
>   		ctx->target_sessionid =3D audit_get_sessionid(t);
> - 		security_task_getsecid_obj(t, &ctx->target_sid);
> + 		security_task_getlsmprop_obj(t, &ctx->target_ref);
>  -		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
>  +		strscpy(ctx->target_comm, t->comm);
>   		return 0;
>   	}
>  =20
> @@@ -2777,8 -2776,8 +2776,8 @@@
>   	axp->target_auid[axp->pid_count] =3D audit_get_loginuid(t);
>   	axp->target_uid[axp->pid_count] =3D t_uid;
>   	axp->target_sessionid[axp->pid_count] =3D audit_get_sessionid(t);
> - 	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
> + 	security_task_getlsmprop_obj(t, &axp->target_ref[axp->pid_count]);
>  -	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
>  +	strscpy(axp->target_comm[axp->pid_count], t->comm);
>   	axp->pid_count++;
>  =20
>   	return 0;

This is now a conflict between the mm-nonmm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sGJiDOdvPb.JV==tAKWiLs/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9V8MACgkQAVBC80lX
0GzkJwf+J2c0tRqR4gk+9mvcun0G+7s2ndCvcCiyE6eL4NS8xFKr7aG7sse/L7sk
Q5pfeRd5DJT8LBSKBpKiSffioi9eQ36rsYxSUQtIOvTLee/oM3Wgy0sZyVz11xS0
be3zwS7+VB7zCpFgz24aof0WWPzCZZVQxlDFoPkZUVhUSaw1U5UStXSJhCUdvC21
dQCBb6oU7O+2b29XD+UQnv4/Gi5cxoyjtLDHKYMT+d86Bi12LxSm8dZXrXqhgBC5
p/6KnFistdkiL/09qiFNHUPZcg4QF6EzIw5nqiwb6S4W4pZhFO+e0NR1sCyZ15hA
Nqgf8OeQ4EqiWI8n+jc6LoBhLDQGyg==
=Teh/
-----END PGP SIGNATURE-----

--Sig_/sGJiDOdvPb.JV==tAKWiLs/--

