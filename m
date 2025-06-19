Return-Path: <linux-next+bounces-7182-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A57AE05FE
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 14:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD321885DCF
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 12:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4CE235055;
	Thu, 19 Jun 2025 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pijNqx6v"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CFE22A4EA;
	Thu, 19 Jun 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336459; cv=none; b=dxfS3Rx2Fgb+PtkdT39HZaqB/5u46jen5n2nbQfdYx8hEbiyZGb/i46sJMFhAVMgPWZFgj/Ma6UUsPnqZjkVlwBdDGGD8rqlfOH6fWFO0sxN/gAUzjdRpzlmfD3gsNrAyjmvTEsqepo2afy6KIZCBREJLpa0SJWY2wM89iQ1u5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336459; c=relaxed/simple;
	bh=aLPMbfIm5cKWZ/338XcDNfm+QiQ0j3PUZ9LyDjZmQ6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XikRF4dcJjhSICcrbC9xQ3lTfRb1ajESFtC6cZohau84DsxBXvOeeaNubUFOTjdDRrg5jrUT69C82v5ly1Qh4olyEWze56E8OCkCA7383SpB9bUqtjGUmlmFg6HsV6nxHaQusB6w5P2JAxTTuZsjvh9Ohsor8eLyzXjNMQQeia4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pijNqx6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3D7C4CEEA;
	Thu, 19 Jun 2025 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336458;
	bh=aLPMbfIm5cKWZ/338XcDNfm+QiQ0j3PUZ9LyDjZmQ6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pijNqx6vWdCKj87oqwDre7BeeGM5SKTB+jaTS5suiIFYOpdcbarAh6H3fDLiXkogf
	 i3AsbxVckSeMbNz8JACD6BjaqUNxVGEim0tTzzaiuF1eu9yO5TaCNBd/SxmRg3wwI0
	 4E5tThhcBSEVTrPq8xZHPH75r8/w7Z25ny2DpSQGgB2gGK0ysk/kW1u7oAetgPSe2C
	 rINTHjhHw3JpO+plJK01nH5X8t4PjfRJJ1WXEgRCwGi9KL9lhFjugfEZFh/Ufhj/4U
	 PyfEDVRwjY414VTuWjf8M5o9ZeHJfDfoONe7RVVXhPq19uq82P/3HM0H3OU8lJDI9t
	 t0BGehz5SGjng==
Date: Thu, 19 Jun 2025 13:50:21 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Waiman Long <longman@redhat.com>, Kees Cook <kees@kernel.org>
Subject: Re: register_syctl_init error in linux-next-20250612
Message-ID: <vvorpevngfle6budlgqhmj3f25lb77czzyvd5aa6jil7zkaqgp@weanygri324r>
References: <20250612175515.3251-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oicuzgdo7d7ymoi3"
Content-Disposition: inline
In-Reply-To: <20250612175515.3251-1-spasswolf@web.de>


--oicuzgdo7d7ymoi3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Bert

Thx for the report.

I just tested on my https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/=
sysctl.git/log/?h=3Dsysctl-next
and can't see the issue. Maybe its something that I'm missing in the
configuration. Do you happen to have your the .config that you used?

On Thu, Jun 12, 2025 at 07:55:13PM +0200, Bert Karwatzki wrote:
> When starting evolution (gnome email client) on my debian sid with
> linux-next-20250612 I get the following error message on the terminal
> emulator (the Gtk messages also occur  when):
>=20
> Gtk-Message: 13:34:49.069: Failed to load module "colorreload-gtk-module"
> Gtk-Message: 13:34:49.070: Failed to load module "window-decorations-gtk-=
module"
> Gtk-Message: 13:34:51.012: Failed to load module "colorreload-gtk-module"
> Gtk-Message: 13:34:51.013: Failed to load module "window-decorations-gtk-=
module"
> bwrap: Can't read /proc/sys/kernel/overflowuid: No such file or directory
>=20
> ** (org.gnome.Evolution:3327): ERROR **: 13:34:51.245: Failed to fully la=
unch dbus-proxy: Der Kindprozess wurde mit Status 1 beendet
> Trace/Breakpoint ausgel=F6st
>=20
> and the following message in dmesg:
>=20
> [  305.600587] [      T3327] traps: evolution[3327] trap int3 ip:7f64442d=
3ab7 sp:7ffc9f4e94d0 error:0 in libglib-2.0.so.0.8400.2[66ab7,7f644428c000+=
a1000]
>=20
> I bisected this to commit cf47285025e6 ("locking/rtmutex: Move max_lock_d=
epth
> into rtmutex.c"). The absence of /proc/sys/kernel/overflow{uid,gid} seems=
 to be the related
> to the start failure, in affected kernel version the files are absent whi=
le they're present
> when evolution starts normally.
>=20
> Also when booting next-20250612 I get this error message regarding max_lo=
ck_depth and
> rtmutex_sysctl_table:
>=20
> [    0.234399] [         T1] sysctl duplicate entry: /kernel/max_lock_dep=
th
> [    0.234402] [         T1] failed when register_sysctl_sz rtmutex_sysct=
l_table to kernel
> [    0.234405] [         T1] sysctl duplicate entry: /kernel/max_lock_dep=
th
> [    0.234407] [         T1] failed when register_sysctl_sz rtmutex_sysct=
l_table to kernel
that is weird. I made sure that we only call register once. Will test
this on next and see what I get

>=20
> Reverting commit cf47285025e6 in next-20250612 fixes the both the "sysctl=
 duplicate
> entry" issue and the missing overflow{gid,uid} files and evolution starts=
 normally again.
I would like to fix this instead of reverting. Let me give it a go and
revert if there is no easy fix.

>=20
> As there were conflicts when reverting, here the revert patch for next-20=
250612
> to illustrate conflict resolution:
Thx for this.

>=20
> diff --git a/include/linux/rtmutex.h b/include/linux/rtmutex.h
> index dc9a51cda97c..7d049883a08a 100644
> --- a/include/linux/rtmutex.h
> +++ b/include/linux/rtmutex.h
> @@ -18,6 +18,8 @@
>  #include <linux/rbtree_types.h>
>  #include <linux/spinlock_types_raw.h>
> =20
> +extern int max_lock_depth; /* for sysctl */
> +
>  struct rt_mutex_base {
>  	raw_spinlock_t		wait_lock;
>  	struct rb_root_cached   waiters;
> diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
> index 705a0e0fd72a..c80902eacd79 100644
> --- a/kernel/locking/rtmutex.c
> +++ b/kernel/locking/rtmutex.c
> @@ -29,29 +29,6 @@
>  #include "rtmutex_common.h"
>  #include "lock_events.h"
> =20
> -/*
> - * Max number of times we'll walk the boosting chain:
> - */
> -static int max_lock_depth =3D 1024;
> -
> -static const struct ctl_table rtmutex_sysctl_table[] =3D {
> -	{
> -		.procname	=3D "max_lock_depth",
> -		.data		=3D &max_lock_depth,
> -		.maxlen		=3D sizeof(int),
> -		.mode		=3D 0644,
> -		.proc_handler	=3D proc_dointvec,
> -	},
> -};
> -
> -static int __init init_rtmutex_sysctl(void)
> -{
> -	register_sysctl_init("kernel", rtmutex_sysctl_table);
> -	return 0;
> -}
> -
> -subsys_initcall(init_rtmutex_sysctl);
> -
>  #ifndef WW_RT
>  # define build_ww_mutex()	(false)
>  # define ww_container_of(rtm)	NULL
> diff --git a/kernel/locking/rtmutex_api.c b/kernel/locking/rtmutex_api.c
> index 9e00ea0e5cfa..2d933528a0fa 100644
> --- a/kernel/locking/rtmutex_api.c
> +++ b/kernel/locking/rtmutex_api.c
> @@ -8,6 +8,11 @@
>  #define RT_MUTEX_BUILD_MUTEX
>  #include "rtmutex.c"
> =20
> +/*
> + * Max number of times we'll walk the boosting chain:
> + */
> +int max_lock_depth =3D 1024;
> +
>  /*
>   * Debug aware fast / slowpath lock,trylock,unlock
>   *
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index 0716c7df7243..82af6e6f5dbb 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -23,6 +23,14 @@
>  #include <linux/uaccess.h>
>  #include <asm/processor.h>
> =20
> +#ifdef CONFIG_X86
> +#include <asm/nmi.h>
> +#include <asm/io.h>
> +#endif
> +#ifdef CONFIG_RT_MUTEXES
> +#include <linux/rtmutex.h>
> +#endif
> +
>  /* shared constants to be used in various sysctls */
>  const int sysctl_vals[] =3D { 0, 1, 2, 3, 4, 100, 200, 1000, 3000, INT_M=
AX, 65535, -1 };
>  EXPORT_SYMBOL(sysctl_vals);
> @@ -1525,6 +1533,15 @@ static const struct ctl_table kern_table[] =3D {
>  		.proc_handler	=3D proc_dointvec,
>  	},
>  #endif
> +#ifdef CONFIG_RT_MUTEXES
> +	{
> +		.procname	=3D "max_lock_depth",
> +		.data		=3D &max_lock_depth,
> +		.maxlen		=3D sizeof(int),
> +		.mode		=3D 0644,
> +		.proc_handler	=3D proc_dointvec,
> +	},
> +#endif
>  };
> =20
>  int __init sysctl_init_bases(void)
>=20
>=20
> Bert Karwatzki

--=20

Joel Granados

--oicuzgdo7d7ymoi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGyBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmhT+XUACgkQupfNUreW
QU+QxAv2KvRI9sJN8Cg3ptDIL7CXGjE14J64TPqB1Ktu6YJ+ztoR2COizm4+UkUk
K+K8C98WdZ1quzObxfV+44yVJWiAGQw9O1nSQhJAuqklpm6MUeMx8J+l5ft9/olM
pr6GJXabpnIyCi3pjlzN2Ripy54/9iOcvT9ei77tySX0YFnPTtjUJsdgk/3qoyTc
QoJD/xN2aA3bEC0a6sxIekAIk007K7IkzclwPFiq/fRIBB3axHz+8n3ijhHd22wg
3uBrD8qtNnREMCJHgwOVXmujkxyJOppeU484PdFUTcCvpjDx7RoU+Mc/+kZ5Cro9
BbpkcN4pv7MIZmol1ambW1nN/1PYGyqOeGGVqioYK4mqkSvp9xECXvAl4H2NAMmr
4/IqWPADOJVo0U2saQ28bkOdGIRNz56r8dwgfPOV88tcNa+3i4eGERlCWcOUJ0WG
/36j48qtnGCjqeo/wfZmOE9XKio0a2xD05ZtWLLINVv1u0MDyqmsmEp/lapvpu9q
Ag8p5YE=
=qOhU
-----END PGP SIGNATURE-----

--oicuzgdo7d7ymoi3--

