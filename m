Return-Path: <linux-next+bounces-4327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC79A3253
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 03:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E238FB21DEF
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 01:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A8745027;
	Fri, 18 Oct 2024 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sHaariLp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8A137C37;
	Fri, 18 Oct 2024 01:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729216619; cv=none; b=k+hk4eKtuQaYGOad/HUXRPKUzCa0gxcBYbm0gNoAHdFdnhZ4iG3Di/dxP/M9gvklxC57j8mbH0M3VivtYq5Y/FKXyzGYeXk2Jj75QKxdW0vAlepcCZfnI6o2SPi7pfotO3Je4BAvVQrURwNogLJ4NBM/UF4o/su4S2mVH/+a464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729216619; c=relaxed/simple;
	bh=KHLe/J8E4e88INRBMpAtjQgG958iJ6/6UhvhQlARA90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ti85KDYM1pkITzSWggFRL9S7UivIsRU27X64YiXuBqfv0rMf3N1ySiXaTGCZHcwIWbWJa7IeTW6NmhbVacjzv3E9iKKLWibM83rQTA4Geh57RfSzpNE52uV70dInZFOCmruZaydvqCU7txifideBqMvcmdRPQo2sIxJfvlWt1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sHaariLp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729216610;
	bh=fv5TdDOtmjmY3nCw0vNFC8sXNVF3YhtQ6Nu/cO8upnc=;
	h=Date:From:To:Cc:Subject:From;
	b=sHaariLpZATKLtYKBTpSdCLHBYCSkF79Knk87lw2aaaHHJTYvDxtpLgwYlCE30MOs
	 2EVMyuO64mr1ZGBtTfJMrkukE1MLnjyjq7BOPjiQqX6wCUt9Ne+2zoUqfGeaCbOBBn
	 w7WdKlB1SLC5WFgSJtoyaNstDCoP6KZZauT9CKLYKRha5NZyBbYjqc6OdJNBTGIXsk
	 J5jQgesy6JhlCszoS4mbdhouJvmJ/jNfQudISkJRwfCuur98WS8nZEBTwZKKxfjVmE
	 6jhwK6tIAPB5ImqGyEB0w9a2NqjKA4mTnCVHR66ckMlt2ji58qaIlBBlehqeDIkepb
	 k8SNZiNNaRmUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XV79X65rGz4wbr;
	Fri, 18 Oct 2024 12:56:48 +1100 (AEDT)
Date: Fri, 18 Oct 2024 12:56:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Imre Deak
 <imre.deak@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <20241018125649.4475512d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/COgixQydqsn1b56oW9SrweM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/COgixQydqsn1b56oW9SrweM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  69b3d8721267 ("drm/i915/dp_mst: Handle error during DSC BW overhead/slice=
 calculation")

from the drm-fixes tree and commit:

  f2e2092a979c ("drm/i915/display: Use joined pipes in dsc helpers for slic=
es, bpp")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/display/intel_dp_mst.c
index eeaedd979354,4765bda154c1..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -147,19 -156,6 +148,19 @@@ static int intel_dp_mst_calc_pbn(int pi
  	return DIV_ROUND_UP(effective_data_rate * 64, 54 * 1000);
  }
 =20
 +static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector =
*connector,
 +					    const struct intel_crtc_state *crtc_state)
 +{
 +	const struct drm_display_mode *adjusted_mode =3D
 +		&crtc_state->hw.adjusted_mode;
- 	int num_joined_pipes =3D crtc_state->joiner_pipes;
++	int num_joined_pipes =3D intel_crtc_num_joined_pipes(crtc_state);
 +
 +	return intel_dp_dsc_get_slice_count(connector,
 +					    adjusted_mode->clock,
 +					    adjusted_mode->hdisplay,
 +					    num_joined_pipes);
 +}
 +
  static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *enc=
oder,
  						struct intel_crtc_state *crtc_state,
  						int max_bpp,

--Sig_/COgixQydqsn1b56oW9SrweM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcRwGEACgkQAVBC80lX
0GwsUgf9ECD2mr/mFq+fMgD2By0ridFlFYOWazFyUXl8dCBFmYk+CgKOo9nNJhp7
5GZnvHQVR9dSTrM0GLo1QuUHzfU/XKh9sQSB9KdRg5K4wLVt8QX3k84mMxUb3VzW
PBNIWN7foKxYLTh4Vuc+47P5+2T/cgdQ5xc9uwu8U9nD7ZkIGe0RkW1oetRzMpFb
MQuhoo4iINAqmOnPBIvDVeHFf7Dy5h7eRD4rv/KXPOozt5VhttDZNx1yEvjLTRqR
2ephN5Mc/Yndrzy00orrVlQRRsyhDdianq+EnvqHZ9KClmJKXRJlLzu4hKA+XCqn
rZQhnrOXGGAln2/8hxXjokxDzhVD0g==
=UKhi
-----END PGP SIGNATURE-----

--Sig_/COgixQydqsn1b56oW9SrweM--

