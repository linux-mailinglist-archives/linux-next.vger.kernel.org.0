Return-Path: <linux-next+bounces-3646-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229396EE7F
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 10:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1E2DB22CE2
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 08:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E483F8BFF;
	Fri,  6 Sep 2024 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FjlbIAXF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03C1591F3;
	Fri,  6 Sep 2024 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725612378; cv=none; b=DfDiaI4omlzf7KG6FVPywTBMB9rmvEmGFWXin1L5AzwRZFEs7j00pTNiVeEeztDsh7J6qKPhMPyRDNeMVygq1qwXG5oqnjPjrBDiN1T+tUO8G9XirWBV1luFXaB5ReMcYYinCHTskQYOJ6z+hthsnx9djTE7/eV17cCDfAQ0ooY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725612378; c=relaxed/simple;
	bh=O5DUB2wip5XrhdqUVR2m8DZOWOUqsiq+8p/Nbj7L0Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDpnINU2neE9MLVnKa0JdDHC+eLsfd77hU7t57MC7nFSYg0WQbRNaPNMzPcuQDiVgE+ODxA5gPo/GKNdGlS4RTludBq8ygVR4xi3Wl/k/evNx3zw4k9btuc2nXOPRgvXTFUq2orgn0M/gXxVKy5taY7LUVOVeffSVLLqPkeMy2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FjlbIAXF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725612374;
	bh=kPQRkujHjDffzDJZFt3hXOa/dO2qonvCF68KlA30AZs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FjlbIAXFWVH+qqzJgpxHcAIFtGfvOxKSZy+L30pxWpsG53Iem0MxQy3P6FXu29PXk
	 ekLGWC3foZjPptGDp7C01e+0g04nTgQ5zeVVzvU7MQRoiX+SRqomguZh6cOSdrjML9
	 RYgzEYnkTNK81XUvhcpyd2nMEOp/zjhBL5rsQMt3wyEe264dsveX5Fwihfr3KWx3VX
	 6z/RSyf3mD4VNZQIdouzeJmiQHz1CIaQwyWDCO2jfZXZj9m8+OPcjY/p1REhAywf3T
	 ExHyUhu0ui/v9VPKGAx5N/FW8gUnrOCNwj9YdLjuac+qEdP1u0MnhRqKR3K9gbMPnH
	 /ZzPYj4m9UGzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0VFK64Qzz4x7F;
	Fri,  6 Sep 2024 18:46:13 +1000 (AEST)
Date: Fri, 6 Sep 2024 18:46:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Xiaogang Chen
 <xiaogang.chen@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240906184613.563fa358@canb.auug.org.au>
In-Reply-To: <20240826155916.59ad7d57@canb.auug.org.au>
References: <20240826155916.59ad7d57@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j/4oTsPNqvAJkdewQyCZWu2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j/4oTsPNqvAJkdewQyCZWu2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 Aug 2024 15:59:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2785: warning: Function parameter =
or struct member 'ts' not described in 'amdgpu_vm_handle_fault'
>=20
> Introduced by commit
>=20
>   6ef29715ac06 ("drm/amdkfd: Change kfd/svm page fault drain handling")

This commit is now in the drm tree and I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/j/4oTsPNqvAJkdewQyCZWu2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbawVUACgkQAVBC80lX
0Gw2Xgf/QKgd4S5X0bjWTxl3iXMYZKPeb8s7uCht/dQN038tqdkTPfPw5HsBsx2r
yjGAel+1qqLWARKoNcHcV7N/888LIyceJ3p33K7nfNixXLTLoNtS0gx6oJe3HxuF
eHE97yEEuEJzKRs9Nii29fiUrGqHYn4vL3ywSdAAm0lzYqlQIwVLav0Svvs/Jtgg
1DJ85c/pT8y10cNzowq8ZUCBn504F5JoskACHYfhQSmmWdjAo1YM278YDH1CXUaO
ObNp7VagW9WFyN1Qpm/qj/IpDoy+lvAmg2aM0WET62SznbUs+DVFAlcz3VkXcvbc
NLb80X9oxy2z96DfQqBsfZRvhCD/ZQ==
=0cSw
-----END PGP SIGNATURE-----

--Sig_/j/4oTsPNqvAJkdewQyCZWu2--

