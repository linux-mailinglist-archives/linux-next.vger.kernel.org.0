Return-Path: <linux-next+bounces-5299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25EA19B89
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 00:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1AF168F3F
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 23:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83AA1CB9E2;
	Wed, 22 Jan 2025 23:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D5wGxk7O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831281CAA9E;
	Wed, 22 Jan 2025 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737588964; cv=none; b=dVVAPjyXqscKsxvd3zUiyZSRX6hNVe5bqGTtCaSzXchyqRLSmZHWnPH2T8++9IGsZbAoIHDQb8CxP7BGUzhGQyJ+K44HUTRwVKgc8rIvwWS+dQNtanDbUytIacvc4zNZqbFjTimWvZEqsj/PRfAEbFVdxRKDg9CUsOVzFphHmvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737588964; c=relaxed/simple;
	bh=nK6Zf99PX6IP9Uj7N9d3VeCqq1ZAXf/e29iTV3o6y8c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kaZAG73nnlQF3DKQsU+2xN9x9SMk4hOeQohHlBv9f7S4PMIPGi08ItC5wCYScAX0cDWN8FLyLDxJInJ6lwJMgZprkwWdSnI5RehUy0fT6NUMk2Z5ZHxxszk3VIOFJzJC/3wSfIs3SUW6dAv1DxrZA0CsVNDzl0XdBmwBsMHKaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D5wGxk7O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737588947;
	bh=7zpYmkkaSjnnu9Zxj9TDJxfErGaLVAVs3xEygizvY1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D5wGxk7OBbhuudzbEV/p1HdslqbaFa10FPFUXKneIrGiMub/mL/goIiXR9SWX2M6s
	 4zBI7s8R9IdJnHyMLekdZTjZZuHWTwQPZ4ssWW4nAxqPfQtJO/Ep9jzR++GidNQtlh
	 iyonN7FVcgZqdPupbXAEadKLRKA+G3UozfPJ8zfEtQ3mPJChDOnfaQ4ex2OjY+O7d/
	 LPL14cP1W5PbxndBs9UM9/5oljlX3YToYkU9NDOpkQHs5KMofTGX6NIgGp6OvHva4u
	 W1+v6tGuYuCoEQnZB23WiumtJPKMyLWiNtMZtlJl5esAh0Q8hnwEJgCbjQSFKwW61H
	 WeTDKCKAjh4PA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YdgS24bjhz4x4t;
	Thu, 23 Jan 2025 10:35:46 +1100 (AEDT)
Date: Thu, 23 Jan 2025 10:35:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Airlie <airlied@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yafang Shao
 <laoar.shao@gmail.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the mm tree
Message-ID: <20250123103553.32f41759@canb.auug.org.au>
In-Reply-To: <20250108121650.09a8e828@canb.auug.org.au>
References: <20250106130348.73a5fae6@canb.auug.org.au>
	<20250108121650.09a8e828@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K7fChHFaSC5IPMG5nbYJhn3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K7fChHFaSC5IPMG5nbYJhn3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Jan 2025 12:16:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 6 Jan 2025 13:03:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the drm-intel tree got a conflict in:
> >=20
> >   drivers/gpu/drm/i915/display/intel_display_driver.c
> >=20
> > between commit:
> >=20
> >   4fc0cee83590 ("drivers: remove get_task_comm() and print task comm di=
rectly")
> >=20
> > from the mm-nonmm-unstable branch of the mm tree and commit:
> >=20
> >   f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to=
 struct intel_display")
> >=20
> > from the drm-intel tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell
> >=20
> > diff --cc drivers/gpu/drm/i915/display/intel_display_driver.c
> > index 62596424a9aa,497b4a1f045f..000000000000
> > --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> > @@@ -389,8 -397,9 +397,8 @@@ void intel_display_driver_resume_access
> >    * Returns %true if the current thread has display HW access, %false
> >    * otherwise.
> >    */
> > - bool intel_display_driver_check_access(struct drm_i915_private *i915)
> > + bool intel_display_driver_check_access(struct intel_display *display)
> >   {
> >  -	char comm[TASK_COMM_LEN];
> >   	char current_task[TASK_COMM_LEN + 16];
> >   	char allowed_task[TASK_COMM_LEN + 16] =3D "none";
> >  =20
> > @@@ -399,14 -408,15 +407,14 @@@
> >   		return true;
> >  =20
> >   	snprintf(current_task, sizeof(current_task), "%s[%d]",
> >  -		 get_task_comm(comm, current),
> >  -		 task_pid_vnr(current));
> >  +		 current->comm, task_pid_vnr(current));
> >  =20
> > - 	if (i915->display.access.allowed_task)
> > + 	if (display->access.allowed_task)
> >   		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
> > - 			 i915->display.access.allowed_task->comm,
> > - 			 task_pid_vnr(i915->display.access.allowed_task));
> >  -			 get_task_comm(comm, display->access.allowed_task),
> > ++			 display->access.allowed_task->comm,
> > + 			 task_pid_vnr(display->access.allowed_task));
> >  =20
> > - 	drm_dbg_kms(&i915->drm,
> > + 	drm_dbg_kms(display->drm,
> >   		    "Reject display access from task %s (allowed to %s)\n",
> >   		    current_task, allowed_task);
> >    =20
>=20
> This is now a conflict between the drm tree and the mm-nonmm-unstable
> branch of the mm tree.

And now a conflict between Linus' tree and the mm-nonmm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/K7fChHFaSC5IPMG5nbYJhn3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRgNkACgkQAVBC80lX
0GylAAf/bfQyPNsgzQXNKIyjBsnW244dYlYPM/tzFEzuDGqbaehzEPaS3D34bcTF
e8vsXPibs1xLSKC0OUgYIy32oibu8unKSj09kjjpJ0Df+ANk1Vfc5Y2oTeM/gbjP
bqqYFfR8vJjznTkfOIfnZJzeDoHLKrbHI8nDzLCRv2Etqv7KChlczOIu6QVGPHPM
PmjRm3Ha3/3ZlXr2lNQRIITylmNnx/2FuaPQVsXkyEm0cXYVgiCnfbZ0Myo/W+lw
4WAV/v0NkePLRsEv5Ut/U7qEgFeZfLXKIFyQm5y/tda8eJBAUcCtk4RgIRNrFPGM
shmpo6Ut5FEwdj2kzdBgURMQ8yWjNQ==
=oxZJ
-----END PGP SIGNATURE-----

--Sig_/K7fChHFaSC5IPMG5nbYJhn3--

