Return-Path: <linux-next+bounces-3131-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885593CB72
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 01:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72951B21491
	for <lists+linux-next@lfdr.de>; Thu, 25 Jul 2024 23:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82084144D2B;
	Thu, 25 Jul 2024 23:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jfVFR9/w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145C73BBC2;
	Thu, 25 Jul 2024 23:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721951458; cv=none; b=UT27zJIoPAhVgndYwyZyPundEt+NDBuqywa3kYDYDGgpQxqzS/DsmY2zZoTUyZ25v7SaeneECdqZtcy8k0Ca8Hw+gPUsOBd5QoBa5mol9zz5c8sHs67gtvuFt3AVsO7vo5Oc4dNsyEkj6BrjBi8ggzRevotDOkkV16ZJo7JiN6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721951458; c=relaxed/simple;
	bh=5mTgnLNQAjqokLrk+b0YIfuAAL+qqc0ZCalCMELUX04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NFlu+NQcG/5y+78Fa1HYaJfCKUrOX4bpZrajmvbSWU3kNETBUOgC54b42kz97ybP9A0oaJCgOuREWvnSEapDo/6bRlUpD1eStiftTxkYBz7/FpPGZDCKCo7BGOqlV39KsmuUXhhcSJbN39+g9LnMmL2sKemPUDzkdvkUPOYU+eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jfVFR9/w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721951450;
	bh=xV9s9VhPCNJX5eUa5IINXLlasFcDLkOU6qSLV3egVhw=;
	h=Date:From:To:Cc:Subject:From;
	b=jfVFR9/wFEfmBeFyREsqk3xd1zkC8El9ungovvcvMRRyd8ofkPIGvvClXuyb3jySD
	 0DlVI0s2Nn50wXxPUxy6HiKMKJlsjpo9ofmBwPPfejp0SosAIvLDFfZMPBvwCILhkd
	 ifN8qUZCGreXG8xeyewrbdrlCKWk1Z8irFqsWT1clhGxyFzNyY4M0+DkrlirjZBSZi
	 DVHPlTWx4VcZDR5SHShBehkqDNuV2MsrwcP5HTD6ifjoQhCqCX4znpbzSvhHKrQO52
	 ZSwWxspa75o2ze4uteaVvUD73CjmIaBISlFHnhEV3FDmQ8ZPKDy1zvGVeM7abZd2i3
	 LAkwkg0ZK8Dvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WVSLy1wTYz4wcK;
	Fri, 26 Jul 2024 09:50:49 +1000 (AEST)
Date: Fri, 26 Jul 2024 09:50:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20240726095048.7fe74896@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XVWNE7fJm/g7+7w4b6TzMLl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XVWNE7fJm/g7+7w4b6TzMLl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btfrs-fixes tree as different
commits (but the same patches):

  26222b620296 ("btrfs: tree-checker: validate dref root and objectid")
  51fa404bd419 ("btrfs: fix corrupt read due to bad offset of a compressed =
exte

--=20
Cheers,
Stephen Rothwell

--Sig_/XVWNE7fJm/g7+7w4b6TzMLl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmai5NkACgkQAVBC80lX
0GySLwf/fzMoqCADM1+yyFsitp9DvtSYxoJn5aAgzDi09CVL7unAUgXgYEcoSRLQ
3ayovCMyz3bv+1UtdRAcSeeWhaZ1kzN/BDjFWL8vVefxUcko0kNbpc6ulp5VbXVW
pT6ghJvSKoa231ZhSbudp4oU/UpgwiKK04BB8OIor5VuFO69LA+fZ0paX5qaIGul
ZM0xpfJvIU+Y7W+3hNybgM6z25q8Rr3/j4mLjrNLHCcEGmRHa6PlggIgFECARbUr
eSvSlK8V8JUZkk9b69bluLYAqYOnttOEnttIqgihHxeph0nasT4Rjf2epU+xJ5LQ
Q3tsbUk7eZKiEeRmLL69eqpxAHI6Zw==
=Q9GK
-----END PGP SIGNATURE-----

--Sig_/XVWNE7fJm/g7+7w4b6TzMLl--

