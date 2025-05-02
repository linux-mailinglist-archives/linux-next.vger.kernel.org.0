Return-Path: <linux-next+bounces-6502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56856AA6E49
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 11:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6019188DBBF
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 09:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F84122E3FD;
	Fri,  2 May 2025 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d7GiNJH+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96CAD24;
	Fri,  2 May 2025 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178635; cv=none; b=ndauSUtYuqfzYv7rDpacsTwhmQAfWuKGOPHx4wiQk5S2frmvrePElzYt7Drc4c+e/F3RnpIMQr4YwIU+tza8yDdKPd3I0HUkgzoawNhebMxqQBG/ixSrthraafblxD+P/xeWJhd6/D+bh6e+mnKrmTBrBeU6weJ67XO01GM/NF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178635; c=relaxed/simple;
	bh=jovtptrEGeHU8Uh+ORr8rtGF8VlX1JF4VpT6y77Xhd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sLkADyd6Wh1S8/bHNdjTMxXb1zOzm3hACNEKTjl0I7pSR47iBFqX6QvP2Tj/G7CEyL/Siz3fi0ppfV+RwI6xKgGyIhHC577Rvy94fTl1RDtdl2G8YfLXN07hLWOAi2vhygFDMtnqaQu3Ie89+GFwYKjbGUzVdO1fWQ/AuGMNmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=d7GiNJH+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746178629;
	bh=0jThxcg43rzZCPnIqcWLWu5e6kqgevnJSlPyibcdspo=;
	h=Date:From:To:Cc:Subject:From;
	b=d7GiNJH+0ltD52uDGt8zuL0l92v+8U1R0gujWuyeeXtuSAe/3gLMWheTAohfneLTy
	 frJbReQG782DvVACw2ogrDhra6BdF4BoAy2AqwTOPurXBcCOy62ShXBK4IhDRk539D
	 ywZwbt0S6Sw9aiM5tf2moEyuNbkYvE6gFYn70QwJRj8DdTJsmfgx5KTYTHKOVHIBYd
	 ufAhhJht5zhs7Ch5i0ndfWhEy1Xqat/5zNPnxqSeOBmXIYuMHnyD6b6W8mKUliWGFV
	 XZsp4akpYqF5ZP3JOr+0zc1JuyDg5hieiSY0ZTIU2H412IKlwnlxzdgV/LPxbAStkk
	 CDi8DYkGU+NCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zpm6F2Dhkz4x3S;
	Fri,  2 May 2025 19:37:08 +1000 (AEST)
Date: Fri, 2 May 2025 19:37:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scmi tree
Message-ID: <20250502193708.62e01d11@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mO5vVHKwjvBk+/rtpbIR+0Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mO5vVHKwjvBk+/rtpbIR+0Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scmi tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/firmware/arm_scmi/quirks.c: In function 'scmi_quirk_signature':
drivers/firmware/arm_scmi/quirks.c:208:24: error: implicit declaration of f=
unction 'partial_name_hash' [-Wimplicit-function-declaration]
  208 |                 hash =3D partial_name_hash(tolower(*p++), hash);
      |                        ^~~~~~~~~~~~~~~~~
drivers/firmware/arm_scmi/quirks.c:209:18: error: implicit declaration of f=
unction 'end_name_hash' [-Wimplicit-function-declaration]
  209 |         hash32 =3D end_name_hash(hash);
      |                  ^~~~~~~~~~~~~
drivers/firmware/arm_scmi/quirks.c:211:9: error: implicit declaration of fu=
nction 'kfree' [-Wimplicit-function-declaration]
  211 |         kfree(signature);
      |         ^~~~~

Caused by commit

  81ce8d705821 ("firmware: arm_scmi: Add common framework to handle firmwar=
e quirks")

I have disabled CONFIG_ARM_SCMI_QUIRKS for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/mO5vVHKwjvBk+/rtpbIR+0Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgUkkQACgkQAVBC80lX
0Gy+BAgAhTaaSwWaWi82VD3pc+h9qgBRr2dlqAtkR2ZvflkvS4guTVyGd+WWsqSs
H5QwgJ8EKaw6lWO2dcJVImaEwpGEiaxEwTY/ciRYe3hsemWdxHEbpfxPM+e+et92
XFYDxTAZ/ALnEL93rXsHpcmoxpfrTMkIFYxUNwDsheg28Z8lkPqiKhlrfsxQitQW
nnnB2/tSGw419WRuEy5GFTk2nqc63GsybkPJQxTqprcT878wXSsIns5SRg9QbtuQ
3WfqMYsbISR8PYa40hcSjcBQUIFboFpj6JHD2mfDl8FfB00vg5DUIee9j80Jvwoj
EuJgG7Uwidebm5P8MmNIlaIpwSEwbA==
=MXvZ
-----END PGP SIGNATURE-----

--Sig_/mO5vVHKwjvBk+/rtpbIR+0Z--

