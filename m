Return-Path: <linux-next+bounces-6017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07705A71008
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 06:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B34043AACC8
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 05:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62C11632D7;
	Wed, 26 Mar 2025 05:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="On4q/s/Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236F4A29;
	Wed, 26 Mar 2025 05:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742965375; cv=none; b=uqvYa6kpVFqgcgQH/9pwKkbTAeZJkM/UKghLPo8O5MZmJs2rKwwLo8huvE9UIp7w+DHqhNwAvA7E7WkuGMJAb8LSgWe2PRVIKf2L/E1UKnzvmI05QIC3MZlep8g1EefDXECtqw4M6HIdnGyOguRV8C0dZQVmF5/k6snDjkcm9iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742965375; c=relaxed/simple;
	bh=1/eixUtO7StpSNpPsc6AgOnKAijXXEr4+Q5e+zCnsVc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKMPfTNwa7+R7PhCHBkrAaAgt6TT/4XpgBn+HjHOj3Z82mu00DZcMCmoHCSC/G/lGJpQq9gpHIgOp2WEvcnLQ8rRawo7aMwjH1qIUWvKaz8EgO0rB6ckgTqZadp4DMzxyyD0dtttc7yR2rXTLkqWnp91DsKkT7D4wLEUGABgecA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=On4q/s/Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742965369;
	bh=MGp42LgOjmNmRuG5IfUDJVETvK0HfrBLslq5K6Y5Mho=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=On4q/s/YjnvWF2gA9OiHYJuogvwWs67FMq4Yt6+tdFGx57KSdvqwSGKc5CKxqxjZe
	 ZQhZPl1d11bDMI4F6JldgCFYq0jeTf+r2dXnn7tYpsslyuObvIZWkHg6YKiROm0XiU
	 e4KLGZUCIvoyO2UClDetuc9Zb+GMTjdapkmI9dqQbAzcJF+xUKEl4WRi/nSHUhWKRO
	 o1IPwpd5LDJtQuuC+3zCCohh04r4kIOielKp4i5UJymWK/WNgtXpPIFu2O08aMWsVa
	 xPV3oLqdMDFzhffG1YpQt7uDO9YbX4kZ0KvHeYXqja4x1wEZNWHoBXWbqm5+LssFO8
	 CEZBH+GoanSiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMvmn0VP1z4wd0;
	Wed, 26 Mar 2025 16:02:49 +1100 (AEDT)
Date: Wed, 26 Mar 2025 16:02:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20250326160247.23651946@canb.auug.org.au>
In-Reply-To: <20250313141253.0c5a7520@canb.auug.org.au>
References: <20250313141253.0c5a7520@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Unl2nueOgRxsjh.WrOW/t02";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Unl2nueOgRxsjh.WrOW/t02
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 13 Mar 2025 14:12:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/i915_pmu.c
>=20
> between commit:
>=20
>   87b593d79864 ("drm/i915/pmu: Drop custom hotplug code")
>=20
> from the drm tree and commit:
>=20
>   82ad584eed8b ("drm/i915/pmu: Switch to use hrtimer_setup()")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/gpu/drm/i915/i915_pmu.c
> index 69a109d02116,0ce87f188d11..000000000000
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@@ -1155,8 -1264,8 +1155,7 @@@ void i915_pmu_register(struct drm_i915_
>   	int ret =3D -ENOMEM;
>  =20
>   	spin_lock_init(&pmu->lock);
> - 	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> - 	pmu->timer.function =3D i915_sample;
> + 	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_=
REL);
>  -	pmu->cpuhp.cpu =3D -1;
>   	init_rc6(pmu);
>  =20
>   	if (IS_DGFX(i915)) {

This is now a conflict between Linus' tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Unl2nueOgRxsjh.WrOW/t02
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjincACgkQAVBC80lX
0GwpWQgAhUOHtN1AycWApCP38/IDZMeCwsMkZtHV970mt0gAEysZr6/Eh9w0GVZI
HrWj5Js4Y5mZZkcR98mtLlvV0s8Ql4Ex1Xzb6BojdS7CSI1nu33l1y/6AcpVTgM/
MWHuX38imAEagTjcRBD6xS4EMLx9MgHLSBGxbR5ILjrdC7kyZgymLtwVUND0s644
LDhvXA4hCEsrJL33wX+iHEio5v74S6aDm8nj2JqjRDLlLv09F3IdNa45YidgsiKs
sETH6B4iZP0EZiemCH+2c+NaVAsEcoWot7X6rResv4PrzZPAy+ogqSOqEd4j9bCC
lkzRjdQdVI7mVgB/DWjpPDVPPS0R2Q==
=ho/x
-----END PGP SIGNATURE-----

--Sig_/Unl2nueOgRxsjh.WrOW/t02--

