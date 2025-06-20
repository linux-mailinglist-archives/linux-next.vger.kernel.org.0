Return-Path: <linux-next+bounces-7191-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5151AE19AA
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 13:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01C117B0BF2
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 11:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBE025F98D;
	Fri, 20 Jun 2025 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElxpZUBO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EF78F4A;
	Fri, 20 Jun 2025 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417896; cv=none; b=osSqXhdnNQ2lx4uBVnZmaPNCsTiLaYHL2BOXlWucq+XnRSrWw5zEW8fQ96LBNikLRGt1vJICgjKoLj83dytp7mLjcXnYqvn1pl1b7IgQS4liWB6y3nC4Bf8zYZZi25NvBCy0Oi1foGhYMzixLZm6uE1udPmmFgiAKrOeZ1+JC28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417896; c=relaxed/simple;
	bh=cy8sb2YDbk+4p5WEKcAZTmU3ATHgsbRxuH4N1gObOTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJf4Frj1okx3cWlK5C2+XtiUUWPZngtTCMa6MkVLBK+w20IRdpH2ogLZqQtGtlyRTNk1JTBP6YJm5Hz94+j5GDLOLzNc+XO2t/1xN1xVcqQo9Rspg8W6+QmR6QHL0NHEEgcu1z1WAyb+DXljwt/aS+nOXxN2SptDAg9cJ5WrSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElxpZUBO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D362EC4CEEF;
	Fri, 20 Jun 2025 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417896;
	bh=cy8sb2YDbk+4p5WEKcAZTmU3ATHgsbRxuH4N1gObOTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ElxpZUBOZmvrsdxg74RJrDytXLNkKxuV1WJrFuNjc6FiAfbUt6pTYbCs35UFmY7pY
	 wsyKF9Y9fEMFJVRKcbARShGfctlvKUBQa8G7jle93yaXJiR0kfoSi0sOi2TNdtUJhS
	 U5cGstDMuEns1H4X1fDkmrb9Z3xBUqoWHwHVgNs4qs43GCmd1aWmqR2Zgz6vfugnvb
	 MSjljU2AvZ2lBJ7KqbCQgWeU93fvRmdgHOgIAi39KL/IgrIJPL5llFUfHHqB+63XKv
	 lnfpYP2CumtpVIANYhWwWGRBd9bFGYfd06UT20lQ0XIoNf5KEsxmkVhMiw4VioIM7C
	 U2+S0oon+RqnA==
Date: Fri, 20 Jun 2025 13:11:30 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Waiman Long <longman@redhat.com>, Kees Cook <kees@kernel.org>
Subject: Re: register_syctl_init error in linux-next-20250612
Message-ID: <agdzhkcb7f7w7zmcivjx6gnlilwglvd526pp3p5cgkdricwfx4@6iduwkqkerjp>
References: <20250612175515.3251-1-spasswolf@web.de>
 <mve232hzw4tqc5rnqlacofzlygqks7uirkumfmibrnmzcmpywh@kpchyerpb4ju>
 <3eec91e437e2b9861e069a6c63e80b2bfd7e9802.camel@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ftl5bdt5sbuceua"
Content-Disposition: inline
In-Reply-To: <3eec91e437e2b9861e069a6c63e80b2bfd7e9802.camel@web.de>


--3ftl5bdt5sbuceua
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 11:37:40AM +0200, Bert Karwatzki wrote:
> Am Donnerstag, dem 19.06.2025 um 14:39 +0200 schrieb Joel Granados:
> > On Thu, Jun 12, 2025 at 07:55:13PM +0200, Bert Karwatzki wrote:
> > > When starting evolution (gnome email client) on my debian sid with
> > > linux-next-20250612 I get the following error message on the terminal
> > > emulator (the Gtk messages also occur  when):
> > >=20
> > > Gtk-Message: 13:34:49.069: Failed to load module "colorreload-gtk-mod=
ule"
> > > Gtk-Message: 13:34:49.070: Failed to load module "window-decorations-=
gtk-module"
> > > Gtk-Message: 13:34:51.012: Failed to load module "colorreload-gtk-mod=
ule"
> > > Gtk-Message: 13:34:51.013: Failed to load module "window-decorations-=
gtk-module"
> > > bwrap: Can't read /proc/sys/kernel/overflowuid: No such file or direc=
tory
> > >=20
> > > ** (org.gnome.Evolution:3327): ERROR **: 13:34:51.245: Failed to full=
y launch dbus-proxy: Der Kindprozess wurde mit Status 1 beendet
> > > Trace/Breakpoint ausgel=F6st
> > >=20
> > > and the following message in dmesg:
> > >=20
> > > [  305.600587] [      T3327] traps: evolution[3327] trap int3 ip:7f64=
442d3ab7 sp:7ffc9f4e94d0 error:0 in libglib-2.0.so.0.8400.2[66ab7,7f644428c=
000+a1000]
> > >=20
> > > I bisected this to commit cf47285025e6 ("locking/rtmutex: Move max_lo=
ck_depth
> > > into rtmutex.c"). The absence of /proc/sys/kernel/overflow{uid,gid} s=
eems to be the related
> > > to the start failure, in affected kernel version the files are absent=
 while they're present
> > > when evolution starts normally.
> > I just tested with next-20250619 and I see /proc/sys/kernel/overflow{ui=
d,gid}
> >=20
> > >=20
> > > Also when booting next-20250612 I get this error message regarding ma=
x_lock_depth and
> > > rtmutex_sysctl_table:
> > >=20
> > > [    0.234399] [         T1] sysctl duplicate entry: /kernel/max_lock=
_depth
> > > [    0.234402] [         T1] failed when register_sysctl_sz rtmutex_s=
ysctl_table to kernel
> > > [    0.234405] [         T1] sysctl duplicate entry: /kernel/max_lock=
_depth
> > > [    0.234407] [         T1] failed when register_sysctl_sz rtmutex_s=
ysctl_table to kernel
> > And I do not see these messages in my dmesg. And
> > /proc/sys/kernel/max_lock_depth exists.
> >=20
> > Maybe its something that only happened with the version from the 12th?
> > Could you test again with the version from the 19?
> >=20
> > Best
>=20
> I tested next-202506{12,17,19} and sysctl-next and they all show the bugg=
y behaviour.
> CONFIG_PREEMPT_RT=3Dy is needed for the bug to appear.
Hey

I have managed to reproduce, thx for the clarification.

Did you have the chance to test with the patch that I sent?

Best

--=20

Joel Granados

--3ftl5bdt5sbuceua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmhVQdIACgkQupfNUreW
QU/v8wv/ZhjouvkFYifNjmtHxzTJCtzTU4FCu14BOYUBCLwecWcuDOuFCKTxstU9
SHYDtiTmz65VpGzPc8LQS1FuIVB1Gyq+lpqXuc4v1Ndzfm8qNq9WhTXiY5IpAa5i
oePrARLXzlezLgYVa0liaoH55t6Q3fjSog9zyHtQ79t1qOtaTjqLqc2Bxwls//uF
OGv+1OE6doUmHBGy753O/3AD3COT8qYzzXUwio68tGGgidp2MEx213LAlmskMSSy
tTSk8oX0ki4vw14a/ICsz64RavF4JJfKN2//ipcTUTq+Qs+SxBbtUsq52rJz5WpF
oTkI2rKbPgF2vM/Cwui92iyU7BHa7FQjyTt8huPAkyaznTZpL/ZcW1Jk/ixxtv0A
T5A5YMWY/zsMAsVuG183Vs7LzZN1K+bxOVARd0cbAK2Gvp9LuH9X6xOufbqTHifL
fmyk4GM1quec/e93NFR5RC+gtqL65hebZYI5l3DwSE7TwYntA/rQJWumPrG2enHW
XioLk98m
=P9mq
-----END PGP SIGNATURE-----

--3ftl5bdt5sbuceua--

