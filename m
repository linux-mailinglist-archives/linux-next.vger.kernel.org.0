Return-Path: <linux-next+bounces-5286-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D55A1863C
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 21:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9B4D1888C09
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 20:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4D91F63CD;
	Tue, 21 Jan 2025 20:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e42JOWBf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04031AF0A6;
	Tue, 21 Jan 2025 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737492474; cv=none; b=MWufS+1PaDkgzoUDilv4o8e+nxKuwbxvocfeHwrKsUzFbichsM94BPyQgt/easq+MvQjDKJThi0oybmBrSnJ8UFUzbBSN1Y4KH0QINef+KcPNxkUsUHx0RagnrJDlUYB4PvLQmIaUnuznz8E/JQj44sJw1qRkGZ6yYA24511iNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737492474; c=relaxed/simple;
	bh=c39fT6NOjBgyxMD3Ovn/tz1w5yBE+hMCubKAH/2aq90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iuutVFXExyuVlfdmLOlkbeSo8DmH0tGLc8SqiDzn5sNzYjbkjP3keo5aIvuiZk6GyTZcc21bLEy9QyBYQnc1gdKyOHFbHktroT2JQmyXepgw5Dkg72KNtW9z65LfuVzni41bNXuOLnt8JPMiFNM2KV/el+cOx4szVJ8/gVVW/YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e42JOWBf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737492462;
	bh=JukZ+aoJUa33YLQBLWb9WzLlChYKxoC+fdUAp9GYVM0=;
	h=Date:From:To:Cc:Subject:From;
	b=e42JOWBfB6sOg73+Lgacry1gvU3MBGG1qNNC+zkZasxtxLduzCe2KBDMKcA8+fCab
	 sSnLwWrJ/BHuHJgiVE7m6jlVtKNT3kJbXED8e47O5DblvTDTgCbgk/vkb/Xv0RQ3zn
	 JR6IncTe8+c8eIEDlrwIRo7+8NoEBDSCsT+KOxdVpBaf7wZ1UzJigfTaKqrc93hsRW
	 ct+gMqP+UgDhnhRoc6HXCL/VNr6s/cYfuLo1FQE9Jg0sg7JB2fqkkBjZAS2Ei6kXKK
	 NWSXp/CDnirJYAY51hGaY2/mks3VDyvRWY2hdkhZhsC/yrTsFManjgm/0ktWnZmDnX
	 849SmK4YWEo2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YczmY4pnSz4x8Z;
	Wed, 22 Jan 2025 07:47:41 +1100 (AEDT)
Date: Wed, 22 Jan 2025 07:47:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20250122074748.00f0034f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r/EIdXgJsSVBcd2M=ohZofr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r/EIdXgJsSVBcd2M=ohZofr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4862e61a0fb7 ("PCI: Don't include 'pm_wakeup.h' directly")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/r/EIdXgJsSVBcd2M=ohZofr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeQB/QACgkQAVBC80lX
0GxXkwf/XySDU9FlN5QQIADwWSij88bEj1UF9xUveulDQQet/uIM/+yslraZFUxP
acOVpfjixCX+DzwFXPmLIaYd0lJXUcWFRWBptluqDShpmc8n4nfl+Nhsalyp6nmi
p0hDpYZJiqb5lQgmIe6fWkkHMMXmeUNEVMLEJ13Cg9TFlbK24TSozWzNB3SNnPRZ
caMX7QHZ5efP/Jla9NqaWojU1LIPZsHCdzoGafPMhmHmmvs32MmYdu3A8Om2TXVq
PmXZzjl+Ke8e2OWinhj7ZKTa4Ke88xCmwSuXTOLaDDvYIr8AjbuUuTFcgiYOUNk1
ZvLDLs2WgibWdJeSLINPQdP5GeWpTA==
=fdSP
-----END PGP SIGNATURE-----

--Sig_/r/EIdXgJsSVBcd2M=ohZofr--

