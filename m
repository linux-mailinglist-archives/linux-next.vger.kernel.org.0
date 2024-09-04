Return-Path: <linux-next+bounces-3577-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E5696AECA
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 04:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01B88B2323B
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 02:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557182562E;
	Wed,  4 Sep 2024 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vz9NeF1k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A893EEC5;
	Wed,  4 Sep 2024 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725418333; cv=none; b=LlnaIF7MYad2slgGFRnZe4KKtjd90ZG/UJmVbN8XtH+m4RdIPFoLXV2n0FAI91I+4lOHjhfil0Yb7F8KAR9F6IQPhHQqSKncmqxuxvf2APUoa5QayzmxKK4k2gLCqhT+/pdqVuwqH+x1FIBJH+sAWQ7buFKbS41kt6PrJwxyQSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725418333; c=relaxed/simple;
	bh=H8D2OHa/pzbqlSE3f9cIwv67vpRfQKQD1ffrU2UwdQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hw9WWAf8ML4szBbnj0BSv2bwGsLnuESFdzqVHVVGq5SSUkfkJ11rCgragieuVD4lrN7PtrGckFDhhQvaUPVpuwlAl3YhjW/4dKEX3o0QwjPGXE1y7eEHa/G1VjRfpgK4qy3QDr0Tf8uq19ooE+gOuLKOfkCGWcL1T/tMR+usM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vz9NeF1k; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725418328;
	bh=NzWDHpGMK1Y5E0oz7UeF25ek17MMwteEO3aXp+BCVGQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Vz9NeF1ka9bu3HoIhkFGPTQNuBKEjakXrVKpsicmqd57gN5wIGM/mUmVa5QMXxm9k
	 7vn6Ib9dLX981y5Jx+XizpScPtZUswAQzPY0ZNGPfrHwQZEsQCMs1lIw0sqrbbRElT
	 SsFVRPaWihUmUKTzrpkOMCo2hlyDiO0TY+GTuqKwGudZyGJy0DnSbOhWSvB+ExtOF3
	 9z30dbr1Np7xWqvlxMifqSibzmN1ZJGGPf/zvHaWVU+ArtvKDhWy/dabbnt2E6YLD2
	 iAVd5GGSEpXluRcLB6GsfrtZO9EhQ2IYed0gC6uCRqlzNaOYAwwAEsHZC0BiQgJok+
	 uN6XxqMxINI5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz6Tg3ydkz4wb7;
	Wed,  4 Sep 2024 12:52:06 +1000 (AEST)
Date: Wed, 4 Sep 2024 12:52:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Robert Foss <rfoss@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240904125206.6708daff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tY=/3VqKgcvxgAczf1kyZYF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tY=/3VqKgcvxgAczf1kyZYF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_enable':
drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of fun=
ction 'gpiod_set_value_cansleep' [-Wimplicit-function-declaration]
   31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_probe':
drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of fu=
nction 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional=
'? [-Wimplicit-function-declaration]
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~
      |                          devm_regulator_get_optional
drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: 'GPIOD_OUT_LOW' undeclared=
 (first use in this function)
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                                                                 ^~~=
~~~~~~~~~~
drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifier =
is reported only once for each function it appears in

Caused by commit

  a15710027afb ("drm/bridge: add support for TI TDP158")

I have used the drm-misc tree from next-20240903 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/tY=/3VqKgcvxgAczf1kyZYF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbXy1YACgkQAVBC80lX
0GwPLAf/YK0VC0D4tm5AcYS+9x10tmjpiL72Yckx9Iww5RIpOL8aT4NLnS7bvZ7u
UoXUDuS5JRKsGz6ut0qYYo+ppNmhfHfrtiLnWpcsEF9vTAPLRexw3lKqG4LCaheU
jt0j2G11VfCi+qosaPDjy1QoTYyyCG21HngnAQabMtNZzgamt8PLY+hQd4pAtJwt
IakY/Xc/vcJBaHxdlxtmKOAN0JDbDVw6GhDNPsl/4NGD8cxxU4cbpGsj6EYR/uS8
qQ9Q59XmAF55XHTv7+8oCSLbLkiJq51uzNplF1KhY+6jPKeUdjvcIuG5O+OVKXBX
XpeGatv2OW5Z8XEDfxpttOt4hrjuZQ==
=FIp0
-----END PGP SIGNATURE-----

--Sig_/tY=/3VqKgcvxgAczf1kyZYF--

