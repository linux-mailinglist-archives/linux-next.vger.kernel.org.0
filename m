Return-Path: <linux-next+bounces-7189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D17AE15DC
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 10:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36BE3ACD13
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 08:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5442367AC;
	Fri, 20 Jun 2025 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxnWpXI+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313A2367AB;
	Fri, 20 Jun 2025 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408011; cv=none; b=m0mhP/lC8RykFd7WPZbUCTjfMelnI+EoiT3zp5qNK/qstekQdRp9C/cWh6UbATTdPgnU86nlQuw2OvT/ykrJ6DRq5EmbmjqIl1MB5gDU78ACtxED9ZMjzQK+znvWvJBZMM4M6QBH8qIpCOa0T+1z+Qwihw6a0u+egLLAkmBxvrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408011; c=relaxed/simple;
	bh=+h9eFZ8d2RrK7e661NeNG17wGE6IokhW0xC3sOOLs/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H952ynB5vXu+Eqa8h6WMmtBaie15mGOk43i8pEqYhb6CCsOEimdRBDdyFzacr2mB4GsA5AvaqxTUWDr4in4A6uq/CFtG5ZL4oC+Vm9S4AzV1JzbuRkBllPwQzh1N2n1wRhGntojZaviIxb4WIgWaczLxrwYuB5iV/ZxTkDDc5X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxnWpXI+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBB5C4CEE3;
	Fri, 20 Jun 2025 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750408011;
	bh=+h9eFZ8d2RrK7e661NeNG17wGE6IokhW0xC3sOOLs/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxnWpXI+CglGKUO5Slcv8Lhg95GypceRyfiC3SGcZ8o7WlmzVyrOV7os/2FgyBEDY
	 Xi7VGxqZ0ztz30yXQOc1tdv1+ugDYnIDawNMDZpwxqOq1zSbMUp6hknb4BYYsdJSb6
	 a4sqkEPkbGga6g0SRItrLoQFA0h3ngYON2YKJj5QijN1meAkpArY549sIZSQruZudy
	 X0L4weIulFXYi4fSkTV/8z+n240yAzW6hxNyI7rEnIaCuI+pMyQVrtOBhXq70YqfWH
	 50PMJZaoTX5P2kXJDtTUQ9XiFOEv2rEmc/TA33XHsiThCfMvOEDEWpJLHHguAPVXT+
	 spiDF2SmiD2jg==
Date: Thu, 19 Jun 2025 14:39:23 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Waiman Long <longman@redhat.com>, Kees Cook <kees@kernel.org>
Subject: Re: register_syctl_init error in linux-next-20250612
Message-ID: <mve232hzw4tqc5rnqlacofzlygqks7uirkumfmibrnmzcmpywh@kpchyerpb4ju>
References: <20250612175515.3251-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywyfpauhmm5c24tq"
Content-Disposition: inline
In-Reply-To: <20250612175515.3251-1-spasswolf@web.de>


--ywyfpauhmm5c24tq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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
I just tested with next-20250619 and I see /proc/sys/kernel/overflow{uid,gi=
d}

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
And I do not see these messages in my dmesg. And
/proc/sys/kernel/max_lock_depth exists.

Maybe its something that only happened with the version from the 12th?
Could you test again with the version from the 19?

Best

--=20

Joel Granados

--ywyfpauhmm5c24tq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmhUBPEACgkQupfNUreW
QU/NkQv/fdSiC0qLyu4q9p9xED4nCT54eri5GJKuzjwiRgg5P2mr7rqNEpI81+K6
g+u1/hLW6wWvqjbOAAp7eNnhF0dGjGsP+Gl8U8vy1yx5wS50aZ1dhELbjL9u1eEY
tv5hT04xoYk0qlyXw4NuWP4DeP4/o3WeQz/cBcQ/b75oXuPJ4BWuV5Kop+DAI33b
FRjzRyfbfnN17RUsUeKd07SsQ9OoXzZVZa6gYZ2iX/kVu3UDEAT2p+vYAS6UiLQV
EG7hwDXYkhMMEigDjfXLAatEUUfldcKtDPYGWEgrFypMvr3py2R4SLZ36AJFJoup
BFyxskoY6s2QpxhMEJj5m3zCWP/b34F0yLAKV3Ziay0muephreG7LRNTBm/PaANB
q4HDKrBUkZ3QJ+PgWyqplcahnYRG+qPiqpooXrFm9+NTxynJ1b9Db7M0FvVgRT9G
W1GUPs+lChz6hYSAFkjbJuXDZPS8VuqG5uIdDJs9J1xORQdB+lrIjI2PUmPclt+N
Dzg/tHn6
=FjsL
-----END PGP SIGNATURE-----

--ywyfpauhmm5c24tq--

