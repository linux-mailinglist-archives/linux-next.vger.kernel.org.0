Return-Path: <linux-next+bounces-7785-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6AB169D2
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 03:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BC6A18C6AE0
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 01:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63F51EB39;
	Thu, 31 Jul 2025 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ke6gF2Fh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BD2EAFA;
	Thu, 31 Jul 2025 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753923926; cv=none; b=qw6QHh+AKTjGeV3BZuG+1xpEw/UNuM/kfXZVX8urPR4VCaV5+mWY4UymInGI+TdfZvMhIYksc0W0kjPGLx4nDGdOgn4BK7rirM9ScDlVN7b+B3TjmJXhl++9X72F64sK0LSPdIxKJGaBUtlZ9+EYk3Fo1yFeUacw56DCjv8fL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753923926; c=relaxed/simple;
	bh=UvIwgOJRXIf1VXIpgoGWxB1WkI9XRDu5kbQjNYwPcYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ChaeEm6FfPyTR3fgGx0I4MEcRpbygFVRk26RPnU3t7u+mk45/kj3Rsqv6SGI+qDFGB+8Pr54TNGqlk5fSUium3XkzE/cPXb/qw5MPPbYL25acOS0fDhIf44DvPKOe4L+6zeKDeAf5NpXQRIVJ5v+0j8EdPnEPTEJogrAh0w22XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ke6gF2Fh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753923700;
	bh=EkYc18w0Q8BVRIbICnes4KWjn2XKjf+tuad2MYsKPSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ke6gF2FhRT+GEwbxtFrfDHVFEjrpBqpfwDOSvQuv9vHl1xVifKdPArglRoTsOS1fU
	 TsfIi9zC+5tO3mgVpvqE1UNi/iCRPxFAHAzXnYORBp5jIliUqa0paktG1jUUWuJmrc
	 QsC14vzSvwVm11dpnvun+Zxpk0fL6rhu83B1Xp3H5AVnkkq37cXIke13dBY/JFJRus
	 b6dk48EfXdr4sQ/UJSq/ZblyaLjOh52ttvnRqDe0qoM+XF0x2m9A/dGMJsVh+2A8h3
	 ZZZbeU+AQcVZA9oNgrroO/DUG7G44Gp3oQqLSg0ouRPSeiD8s+zP3P1SolC3ZZox1d
	 RpGUKjzTxCqxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsrPw1RmCz4x4w;
	Thu, 31 Jul 2025 11:01:40 +1000 (AEST)
Date: Thu, 31 Jul 2025 11:05:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Feng Tang
 <feng.tang@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <20250731110521.0cf9d6a2@canb.auug.org.au>
In-Reply-To: <20250708190003.4eabc8ab@canb.auug.org.au>
References: <20250708190003.4eabc8ab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TKiXJSJG5lz.5luU9IqRU+2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TKiXJSJG5lz.5luU9IqRU+2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Jul 2025 19:00:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the sysctl tree got a conflict in:
>=20
>   kernel/panic.c
>=20
> between commits:
>=20
>   f8dbd6138e05 ("panic: add 'panic_sys_info' sysctl to take human readabl=
e string parameter")
>   3699d83ae18b ("panic: add note that panic_print sysctl interface is dep=
recated")
>=20
> from the mm-nonmm-unstable tree and commits:
>=20
>   48f1dc94d25e ("sysctl: Move tainted ctl_table into kernel/panic.c")
>   9aa4e27ef60c ("sysctl: Move sysctl_panic_on_stackoverflow to kernel/pan=
ic.c")
>=20
> from the sysctl tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc kernel/panic.c
> index df92b763f857,64e58835086d..000000000000
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@@ -78,13 -84,50 +78,56 @@@ ATOMIC_NOTIFIER_HEAD(panic_notifier_lis
>   EXPORT_SYMBOL(panic_notifier_list);
>  =20
>   #ifdef CONFIG_SYSCTL
>  +static int sysctl_panic_print_handler(const struct ctl_table *table, in=
t write,
>  +			   void *buffer, size_t *lenp, loff_t *ppos)
>  +{
>  +	pr_info_once("Kernel: 'panic_print' sysctl interface will be obsoleted=
 by both 'panic_sys_info' and 'panic_console_replay'\n");
>  +	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
>  +}
>  =20
> + /*
> +  * Taint values can only be increased
> +  * This means we can safely use a temporary.
> +  */
> + static int proc_taint(const struct ctl_table *table, int write,
> + 			       void *buffer, size_t *lenp, loff_t *ppos)
> + {
> + 	struct ctl_table t;
> + 	unsigned long tmptaint =3D get_taint();
> + 	int err;
> +=20
> + 	if (write && !capable(CAP_SYS_ADMIN))
> + 		return -EPERM;
> +=20
> + 	t =3D *table;
> + 	t.data =3D &tmptaint;
> + 	err =3D proc_doulongvec_minmax(&t, write, buffer, lenp, ppos);
> + 	if (err < 0)
> + 		return err;
> +=20
> + 	if (write) {
> + 		int i;
> +=20
> + 		/*
> + 		 * If we are relying on panic_on_taint not producing
> + 		 * false positives due to userspace input, bail out
> + 		 * before setting the requested taint flags.
> + 		 */
> + 		if (panic_on_taint_nousertaint && (tmptaint & panic_on_taint))
> + 			return -EINVAL;
> +=20
> + 		/*
> + 		 * Poor man's atomic or. Not worth adding a primitive
> + 		 * to everyone's atomic.h for this
> + 		 */
> + 		for (i =3D 0; i < TAINT_FLAGS_COUNT; i++)
> + 			if ((1UL << i) & tmptaint)
> + 				add_taint(i, LOCKDEP_STILL_OK);
> + 	}
> +=20
> + 	return err;
> + }
> +=20
>   static const struct ctl_table kern_panic_table[] =3D {
>   #ifdef CONFIG_SMP
>   	{
> @@@ -134,13 -183,16 +183,23 @@@
>   		.mode           =3D 0644,
>   		.proc_handler   =3D proc_douintvec,
>   	},
>  +	{
>  +		.procname	=3D "panic_sys_info",
>  +		.data		=3D &panic_print,
>  +		.maxlen         =3D sizeof(panic_print),
>  +		.mode		=3D 0644,
>  +		.proc_handler	=3D sysctl_sys_info_handler,
>  +	},
> + #if (defined(CONFIG_X86_32) || defined(CONFIG_PARISC)) && \
> + 	defined(CONFIG_DEBUG_STACKOVERFLOW)
> + 	{
> + 		.procname	=3D "panic_on_stackoverflow",
> + 		.data		=3D &sysctl_panic_on_stackoverflow,
> + 		.maxlen		=3D sizeof(int),
> + 		.mode		=3D 0644,
> + 		.proc_handler	=3D proc_dointvec,
> + 	},
> + #endif
>   };
>  =20
>   static __init int kernel_panic_sysctls_init(void)

This is now a conflict between the mm-nonmm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TKiXJSJG5lz.5luU9IqRU+2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKwVEACgkQAVBC80lX
0GzWzQf+ONt4uBsiN5b5SswIb19PXmoPfsUhw4hNnQ8SSLSSmZMM9oObS5xDP6Bm
SSTn7O6Zi7N3cDZIQnKdKDFKJ6UhKaxMyRe6n7IAJnlqdbGmkFNbj1hePKdxZw/O
rSnFOBk7CVTF9qy7k3/4gNfy0spKdAiFZTcBhC5f6qNRAN3qBg8BxwvOZAAymeS8
ZO5Q3mTB2u/u5/Ue0vO6NXgWkL0UrYWeCnoixcpsImGhGg2pJNV0ErgwCnMzk08b
8HAmz7kqPRDjM2fojhLr0ay253d6yAzvUeoDajeu/WyKyY1uEvf2hbI+q4LBInaB
oqLcka8saK9cWpS2y7IN1BA8SNoEKw==
=acao
-----END PGP SIGNATURE-----

--Sig_/TKiXJSJG5lz.5luU9IqRU+2--

