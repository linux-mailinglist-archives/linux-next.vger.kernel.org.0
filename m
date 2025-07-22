Return-Path: <linux-next+bounces-7686-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE2B0D665
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 11:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D38CF3BD4CA
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 09:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009002BF007;
	Tue, 22 Jul 2025 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CT8sh2cb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9128C873;
	Tue, 22 Jul 2025 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178333; cv=none; b=kmU7o6gQnjEF0aQ0nrzv6v0FYneW1VPdFPTOYtC5WTsK7qEZzJjyOgDjSS+kJlYH0ohqvHmXkDAs37rmL2N7vkk4Hics0Vh+U0t1m16+bN6haRscomIFzs/0CPMKZ1O5ySxLyrlo9xoxW4mpLMSNeVp7C7rZZLymwcp4qVprc28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178333; c=relaxed/simple;
	bh=qEeWfk6RMw0ttB9++h2U3jo0V/IeWqr7albfrVsTTOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCjcigcnyxD87lmbhZrzvq38xAmRBdz/4WJ4hN9PoafFYMts/qxCkKJ47U2Wjr3XdLd7MB5jl7xixHAHqdrWwSOfFcJvdkukwpkfT+8d0ahsBgGLkYsgKGxKbDba36o2Pfs0fQnfi3A2OHGKiEBBLe95IKR0VK1VY82Jc7BeQQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CT8sh2cb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9F0C4CEEB;
	Tue, 22 Jul 2025 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753178333;
	bh=qEeWfk6RMw0ttB9++h2U3jo0V/IeWqr7albfrVsTTOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CT8sh2cbnPBOabSSjlEaI0mTXUClBT9FBUgNopwaM+SsRWYmKBIErMSJttydoupWu
	 D4I7WH2N2PtoWMOaz9XIiitcS9EZE2Lij6PQN0FtKfuT2TffB7oTmMK5l1+65ZVbf1
	 FFH9jMt55hIuiP6Rn71r73Poby+Sm8UU9xiG5PjJtWFuobUoGdsbB8HwEPms4e60rQ
	 G32GVoNzUKOfxhTuQr+5pgREaXNz5e5LijGZKFIfSwRlkWdMOqDAPORVvVOEPusH8u
	 RWvOLLh96OMQw+k5DdsQ+fjpowV+rVxV9hBsxQ0ij09lhcl4PPZS80LyIiYd5QiIqQ
	 2mL/jhj/rXM5A==
Date: Tue, 22 Jul 2025 11:58:48 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <lzabgfj2r5uf4gnmuibx6vhgdddi7bhqv3wj3ty6arnquu4itw@wsj4knxljyv6>
References: <20250708190003.4eabc8ab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3olfnkpid3bjzui6"
Content-Disposition: inline
In-Reply-To: <20250708190003.4eabc8ab@canb.auug.org.au>


--3olfnkpid3bjzui6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2025 at 07:00:03PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
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

I double checked these, and they seem ok from the sysctl side.

@Stephen: Do you prefer an actual acknowledgement that everything is
good? Or would you prefer no answer to these merge conflict advisories?
I personally, always make sure that things look sane, but always feel
that sending out the ACK is a bit of a waste.

Best

>=20
> --=20
> Cheers,
> Stephen Rothwell
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



--=20

Joel Granados

--3olfnkpid3bjzui6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmh/YM0ACgkQupfNUreW
QU+7gAv8CbB+tvR1CAoqpttZiblZm595dw0OX5Jq9gGGXP/Tj9Ri1QO14LbpQTWx
5G0bn7e4tGGfwV5JScHnYM30XO3IW6NRmt2FTNacieXhQ6Meg4hJ1umAZXuT65sR
DfpzY1QdDs1zWUXD5Ef5dXTs9X92VuHN+Ux339KNz3LTHskP/fj0d/kQE42ywqvk
nngLF6fMD/nuFgA+nI+5JS6rwW08gdmGjjYt1gnS9TTmPyxPsl4b27YpmNDTXr05
Gu5WsAJAFKdnD2cE/j4v288wyfV2k+azrVv5g0Xt9cqiLU56ySVOK1a2ay9dw9ee
kvHOSBkIAl9f+rDQka0bZyWA6YvnkcSwvM73JP9cp/j/3i/5rzPdyOkCyTkNA8it
UJTiCw8FuM8oRTHQPB6/GxZqgfmAROUyVGuAibXjbIvZ+Olf3Y2JFdHXm6Uhg1oX
jICa3lW1Mtc2vtHqhU60d+KAlCTc2VWPmzISLExjhb5oNpFnoh+ejl8bahySpXQZ
tDcjr2Ky
=YUf+
-----END PGP SIGNATURE-----

--3olfnkpid3bjzui6--

