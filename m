Return-Path: <linux-next+bounces-5683-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493EA55D29
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 02:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 532C83B39C0
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 01:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95DB1474DA;
	Fri,  7 Mar 2025 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aTJpFd7k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D962218027;
	Fri,  7 Mar 2025 01:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741311410; cv=none; b=lr/ogFFPIlkxOVLBpRr/bg9YKXnCPUsZ86FU2XjU/JV9Ci2uVslRleiLJrmOQfOdJ03f8Fv36OJTTwO51BsptOqrzUUKsQ+jEdyxzg0ZcOhoXEvsVLtEzhnAvPjPvPEddorK+IKYCYSoENb8zFp3o+amOtZxXNsx6K45HQyf/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741311410; c=relaxed/simple;
	bh=sMicyA3DZAQnh3mQ1qXIhlE/wZCIuBGWM+EIcSkQ/60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PMrFDXl052WUcYSnOXrW1Aa+QoZRd9Xx+QVLgirGJ55l+d1C+0WrWaeoK7CY5I7DMECBv+6nld025FqJVSMLyCppFdR0ctPvSLtLHJPd/llBz/yj5xvCDsgn0dF41Qq+NvPHeqFMN6hjikhLWKyW2tHEiWo9j1qDVGn5+0P3eJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aTJpFd7k; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741311406;
	bh=Z31cvTy1mlHiKcI84r45XQdhWWjcPTtuLIpm6urbfcc=;
	h=Date:From:To:Cc:Subject:From;
	b=aTJpFd7ktDxAbvfwlV3apvABz6hCQbuuoJK8hQeF90Hxzwe+xhWzxdup+ZzavOeTe
	 DIvHFJXwG9QjK41f02/jJU9yvvJ76bI6CiV/yevUTTIkCy3mOHde6mbGJ9cs7c8iBZ
	 DgjhWNApdT93g5kaqODBYeGIxJ+GW8GywA2t7Fe03n/rgIJwewsf8mNbX6uqy6kiqQ
	 itcdBw5YX4xo5oRc9eBoOe7DrCDKBSAyJJrsb2wdLilQDmOisUeOBmGUC4vuDh5r2u
	 V5BhPE9olkNFhkFLdWLdKIaOaHbIW8KrMu3qPgFgl6mCG91ca57Ttegz90j4qBXP/t
	 +SSsWoQxR+qlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z885n65gzz4wyh;
	Fri,  7 Mar 2025 12:36:45 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:36:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-msm tree
Message-ID: <20250307123645.07564e19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nO5klOrI2TJKIC9ZyaOnKke";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nO5klOrI2TJKIC9ZyaOnKke
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-msm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:235:18: warning: 'wb2_format=
s_rgb' defined but not used [-Wunused-const-variable=3D]
  235 | static const u32 wb2_formats_rgb[] =3D {
      |                  ^~~~~~~~~~~~~~~

Introduced by commit

  69d02730431e ("drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/nO5klOrI2TJKIC9ZyaOnKke
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKTa0ACgkQAVBC80lX
0GzcRQgAle7Fh06hQ44vuQSAtNPY+ocUnG/uTJ0BWdfzR7qWe60hlcfhZIsCVGZ4
JuJGGJTcfZZY0+SMvRGXaq4abbCIuSarGAVgz59/p4ymXxMzCOFyROBu0QMZad2i
yhPuqiIMYt2N25s5LoCZGR7N8UhzwfWzN6Myzlxyx8UC3Yb6vG6+81AK6a6CJ5hN
FmO2I6fYfWEy1px6F/ytn/BlxYRCuP6gI282O1vGHCJRwTTB7gYytdkyQEmTUobv
CzmAy/nUqm1bPhIy7rCB5Y6/505gN6xN2mvnvxyg6guHXYVu/GJyGQ20FeZYzGGx
YscCVMY3v3zzt3fQ4Iiq0MdLZd0riw==
=gWgE
-----END PGP SIGNATURE-----

--Sig_/nO5klOrI2TJKIC9ZyaOnKke--

