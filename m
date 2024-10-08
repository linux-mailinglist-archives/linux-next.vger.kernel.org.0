Return-Path: <linux-next+bounces-4131-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6AE993D1C
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 04:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EE471C21119
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 02:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8D9224F0;
	Tue,  8 Oct 2024 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EnL3ZCc0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F225776;
	Tue,  8 Oct 2024 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728356173; cv=none; b=jr81hgSRLf5xoX2yTDy8fWa0FsHLX36r438a7vbKComxYrToP3wLdFyO53977pdlwylOKZghKtCl04dnemzKCUZRwPM6laE0+TCWy/Zy6vAKuEwoxXxq1eyQRj+PM5cB6Yjh15+pH6GLzzzSGRhiiSjfRlVv2FMFh8ooHcQeur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728356173; c=relaxed/simple;
	bh=qDvtI3FBlfsCp+4pG55+Z53hhOF72cax8+07yIKJDBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WRrQUT9k5VUwyDy3wRJ7o+7x6WWA/+CNCTYZ7Oei0ph+9kn/LM3km11lRoOwsREwN6qseq0ZMNuX0iZy+sRLbpIlc/159fxWgQC8VEXVzetGpj9OZLx7L/6HutzWiQdPQtRlumXdSRq1G5RVWB5wiRPCVomVxJMvyg3k5NDcf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EnL3ZCc0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728356166;
	bh=Q9hw3VWnq5n8q8kr84lH2u9PEXoVwQT3hLwaCwDhZKI=;
	h=Date:From:To:Cc:Subject:From;
	b=EnL3ZCc0bae55zUIMqVhuaFcloAUq8aHuL36DvvCGKrFKS0s4U/InyTF6qxcDditY
	 v5h/rhahunZbFzw5rNvwx3avP87fzPpLThMG7CBhKLN3/SnpoH/IglUoNxB+tgCyx0
	 r4AJPwP7WbSYJvHkMjVo6k6n+NxV48A8E5rYOgP8A9l2mSS/BzV99XDL7+kUEJP4F5
	 E9xN+rU5yrtmw4ZVdhqIk7ok1QrWOsTAh6TjbBwNEikqDzgXlENHOhlTmQLkMH+2oj
	 UQKOAMgToJx/dzvECDx6GDi7DgQXyENIk0KvZtj5VvAAgXA4fnlCgf0NsRIYndkgtJ
	 HaUFv5BF3OxJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN0yZ4Khbz4x6k;
	Tue,  8 Oct 2024 13:56:06 +1100 (AEDT)
Date: Tue, 8 Oct 2024 13:56:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Sunil Khatri
 <sunil.khatri@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20241008135606.3e440dd5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V7XMSDD/xJhamB99UW27RQx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V7XMSDD/xJhamB99UW27RQx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmocdonfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 's=
3_debug_store':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5209:35: error:=
 passing argument 1 of 'dm_resume' from incompatible pointer type [-Wincomp=
atible-pointer-types]
 5209 |                         dm_resume(adev);
      |                                   ^~~~
      |                                   |
      |                                   struct amdgpu_device *
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3152:46: note: =
expected 'struct amdgpu_ip_block *' but argument is of type 'struct amdgpu_=
device *'
 3152 | static int dm_resume(struct amdgpu_ip_block *ip_block)
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5212:36: error:=
 passing argument 1 of 'dm_suspend' from incompatible pointer type [-Wincom=
patible-pointer-types]
 5212 |                         dm_suspend(adev);
      |                                    ^~~~
      |                                    |
      |                                    struct amdgpu_device *
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2963:47: note: =
expected 'struct amdgpu_ip_block *' but argument is of type 'struct amdgpu_=
device *'
 2963 | static int dm_suspend(struct amdgpu_ip_block *ip_block)
      |                       ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~

Caused by commits

  982d7f9bfe4a ("drm/amdgpu: update the handle ptr in suspend")
  7feb4f3ad8be ("drm/amdgpu: update the handle ptr in resume")

I have used the amdgpu tree from next-20241004 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/V7XMSDD/xJhamB99UW27RQx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEn0YACgkQAVBC80lX
0GxU4Af9FsOg61ozLF17z9y6mhdh4biPogXYBMQYWkMoSg4xaCIlf0yo2UVS8sfL
J5pqRYSgkaFWYuu7MUuOT7HgvxPjYmwQQj/1m/O8bYdIQtCI9VOy7VK5kOPl9JV4
pUaf6Rwy13hI4Z/1l65ypPPq/+kqAMVDcqPXk3zS0GS1wh2R5XAM1UIdIYJ6Xrwp
zTvERKAJGHVcz2TesaMxCVr4fPhhIcPHTbAk+ovlnZiWvrkxPFvVD8NqqZIZX7dF
OkFhxr8ljR8aZwTyGd0x04vs6EjNEBJPG1WDabrKt7pGTrwm+4STZxtVyI6Nj8lz
S23GWkSpavLX7znNmc2D27uhwcABqg==
=V6M8
-----END PGP SIGNATURE-----

--Sig_/V7XMSDD/xJhamB99UW27RQx--

