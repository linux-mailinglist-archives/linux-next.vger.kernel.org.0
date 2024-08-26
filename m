Return-Path: <linux-next+bounces-3415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6E95E829
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 07:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B90281773
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 05:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1205D7F484;
	Mon, 26 Aug 2024 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XIzJZajA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA4E7DA95;
	Mon, 26 Aug 2024 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724651964; cv=none; b=tf/BnUJAb1i/OUG8Xq2PmWiFgYbByUSvToobF9fAhVIt33nCaTML+9JI1QNCGrcPlQNE+Dd1xoDYIKMT8Szn1KnuNTa2V7+BSbTdxz2VTOtoS7opdAC6HvdCPAG2EkJvASQZ/P5JRk4ar7KLzsFxEfy/lSTvM4ylCHA8WWqM8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724651964; c=relaxed/simple;
	bh=SYH+Yfd82H6BihSbm6iBeCJdf68+kRAMeg0G+/RU7B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UdeXGqina+4tfzlVCg+CmTtl1FnTrq3emTf6cHezFIK2kduuTJBmbiPGOkjD858wOdc1dmjbMi1Q84Jin3w46UvF/yeO92J1UZchRpErQzpTdtsl1GqeQGaQ8UQnkbTkwW98Pfn/yN/+lhFuyTh0k7ZACVjCsudBGuWjJRs3GvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XIzJZajA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724651957;
	bh=egT1+Aptj7H6Gp1KFP1j9VKIzJYtirXUkyhQwc9e64M=;
	h=Date:From:To:Cc:Subject:From;
	b=XIzJZajAb+xdVDUfCIAArLdpTvZphnrpgdV4pHJAZJSNXZWa/UVj2YLiVoMMV0aAL
	 wvdnmC4RAAFBVacqIVMCnCX1I5STfd0yn/tS2HHdALecmkol4qqvarAq+YmjOiEpdU
	 eAcqg522gjZ41E0WNWTtrNgyFGQU6Rh1Zrb5Vr8Gfy8RFB8vu4eBuGlTsYOLhmWrsy
	 bL6lKi+HtJBlRCWcJJf7ouDESsY9XlfBlR2OnsI+zbsogL8R2FUd53oUODsdzG6gcb
	 /18bCKsVq1DnrGbgtZPNhEkV0fekqhr3BttKm7jS1WnNsYwhcTx+a7kfnJ9st5N3yj
	 GRB+XFwc5y0/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wsg3n31ZPz4x81;
	Mon, 26 Aug 2024 15:59:17 +1000 (AEST)
Date: Mon, 26 Aug 2024 15:59:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Xiaogang Chen
 <xiaogang.chen@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240826155916.59ad7d57@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SiuDbp5m.tSvqms5lgbEnXM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SiuDbp5m.tSvqms5lgbEnXM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2785: warning: Function parameter or=
 struct member 'ts' not described in 'amdgpu_vm_handle_fault'

Introduced by commit

  6ef29715ac06 ("drm/amdkfd: Change kfd/svm page fault drain handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/SiuDbp5m.tSvqms5lgbEnXM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbMGbQACgkQAVBC80lX
0GyI+AgAlQSo2Z5VEbSWgw/folicfeK7sCDhsMtZHtHr3+/vAjNlkwmtB9ZtYjn+
/nn5SYS3jpXiw6HwYyiPfGE7bLKyumdJmyLmZYnm6tz7QcdPouFDS9zmP4Mu2V91
jq3Y+PTvAyHJwhMA3dncGS2HYMhxJPTIlksQlviEoaLDIPzb3KO+6az5gRzq2A95
n7GPZXs6yJmfO9kxoPeoCaw9FXWj/zyMhprs8kNYpN30bToRuVlNytAG2NAX8vqB
aJwT1MK+9STS1zESLfHVVccyRfKHrYn3Vag9AkuXSF1/G9CGLN9mGoSO9/OaSTwl
VmS/080smZ3D2s2QxH/G3GBINfIBZA==
=u5Mx
-----END PGP SIGNATURE-----

--Sig_/SiuDbp5m.tSvqms5lgbEnXM--

