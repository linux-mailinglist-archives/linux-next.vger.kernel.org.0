Return-Path: <linux-next+bounces-2027-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C6C8AF8FF
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 23:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66C12B2A39D
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 21:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED687143882;
	Tue, 23 Apr 2024 21:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hV+LMIhL"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1471020B3E
	for <linux-next@vger.kernel.org>; Tue, 23 Apr 2024 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713908434; cv=none; b=TwFIIUHM2dqx+a/uuSHaRprAwa0qV2T4d3AH3eY/vNxrK4wu/02prfBytksD1ANOceGLkb+w2e47C8U/I8yafomEpYOTmuDwjeG/z55DX2ABwl49xQ30xYMrnvRjhOMv8I2100jQG+A4k4cwFKy/rlskkat3Xfz2ns0ycSHUoPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713908434; c=relaxed/simple;
	bh=wnpyAme8jrGRa/6eoPDE5p77nCJISkL4t+hFGeR1EJI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNP27H5I7X6NlWt/K609DsxmZytR/d7y9yeela1q/s4R5fdwBHVIkFQ+3zj+BxRnP391Bj+VNxD3y3ZUYv5z+/hAW6tMGYPcFZUdFzcPV+X0C+qNYqVnxBu4c/mQpTzr1T0OFBT/UmU7ZMDT7EiO2SjiKXgMr6p9z7l7iDbpp9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hV+LMIhL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1713908427;
	bh=wHYxct6asNImlbeupPEFHpTTxlZt2liy9+CRSPwAYVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hV+LMIhLeShhLbbuSeOQACQUCwvMaCJajbPMaBmdA1nt+3efGfvv5XCRRWY8QMgMH
	 h/z9n6gMxzzNDZk+vrohsItjtT7IdFrtiItiPC4IcPOSVZc6jjCalCsQaBei0LSK9Z
	 6EsFkhmhhCIRVO5HUYy410IA1L/+j4HxWmloflDGyobq4t6fKkPuzHU9rEO5H2rset
	 dffwhCAjvSs5MXtDNrt9jsUyaFa11FtPz4Ck2IGwisQx2GLust2FpoThSHcYuQX0N8
	 FvC+wALA+kYwqHw9gL+JbvVpQPdaXVS1hhX/Cvc53h6ClgrTN94djyP+NRM/J7s+iT
	 8/j9cFPP+S9gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VPFsQ4vX0z4wc5;
	Wed, 24 Apr 2024 07:40:26 +1000 (AEST)
Date: Wed, 24 Apr 2024 07:40:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, kexec@lists.infradead.org,
 sourabhjain@linux.ibm.com, bhe@redhat.com
Subject: Re: Please add powerpc topic/kdump-hotplug branch to linux-next
Message-ID: <20240424074023.43932cca@canb.auug.org.au>
In-Reply-To: <87bk60ji79.fsf@mail.lhotse>
References: <87bk60ji79.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ATeAZrrv2EJbPtCU7.6+XEM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ATeAZrrv2EJbPtCU7.6+XEM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, 23 Apr 2024 23:56:42 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
\> Can you please add the topic/kdump-hotplug branch of the powerpc tree to
> linux-next. It contains a series that touches generic kexec code as well
> as x86 and powerpc code.
>=20
> The hope is to have to get it merged for v6.10, so it should go along
> with the powerpc next branch in the merge order.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=
=3Dtopic/kdump-hotplug

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/ATeAZrrv2EJbPtCU7.6+XEM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYoKscACgkQAVBC80lX
0Gyc/QgAoeBb/nq8jS4FDhTR1whXCAYnYtDtBfITZ+rhVw+j8iIMfMNpdjWIuHKp
EmcHHvC6tkE3aFbNIALtDH3oHVmGD9GNJBnkWvJxefymoLOGxaNH44ld2o+lX3WJ
chIyEnZzqcf7hO+CdtobArpLdPkrfRX7FU+yIsNCCdJYYhzPcdUvnvBE7ZJgZHGB
sgrCoMjOEMDfQO3ZYUw7AYbZiZt5imEq/UH0pIf6CK5qXfnrtc9iXA0GoA1/Pg14
aF+B1RX24/4Tk+lkvnOsT/YGk7bFzhodDuQvnMUb5Ht13MbyQZQj4749q2BUg5L8
DVcqvB/sysHxdGcFJjM0dQKNjpf3Zw==
=IxtL
-----END PGP SIGNATURE-----

--Sig_/ATeAZrrv2EJbPtCU7.6+XEM--

