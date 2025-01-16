Return-Path: <linux-next+bounces-5239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A6A1444F
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 23:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD7D3A189D
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 22:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9555D236EAE;
	Thu, 16 Jan 2025 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dj02NGZy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040823F296;
	Thu, 16 Jan 2025 22:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737064809; cv=none; b=rovsvecHNLjfeV5uAS70hPWGV9BKSCSkStGF+h9OZSAmFmrNm9rrl5EQLqHnZa4GO2wc4knN7ni53B3jut4t6MmFxnRlmVd5EjVFk6cY5CXtEAKRBDFTXO2+xPzp9B1XneyTUsvgoKbSGhytqYNnnu94q+EwtTC0rLkqYKYCGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737064809; c=relaxed/simple;
	bh=LMdhNGgpoMdpVPVnPBX3BM6SifdnKgk8kMXZqaRKmIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AGuuQBpK34wGXUfDGeruIpSW8JoKHU5kXimkIrGYl4mWtWqWVaadF84JTq/wJqQT0TrXG+io//ixGVWWnRYcadI5VtREAiLMngigHiDFKDD3nRGz+eIAk+rg0A5A9HHgl8Eg512logJGMl96C2cilyTWE4JplaQNgqAmQ8etJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dj02NGZy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737064792;
	bh=UfCRp/85TOkSuLejrmRH713UUoJpeiCnqrPceLBvshk=;
	h=Date:From:To:Cc:Subject:From;
	b=dj02NGZy5bUkJc+xe5iZF0iny96CBvHdOTPrmFYn8vQNPYMS1vfyE0fT54ND2GLeC
	 UAXnrmuf+WouaaUiRPkw/Jgo5lh5ZF030BEHMlFz7ubDByTmJsi9YsvVtGtaqBWVlu
	 VEDajCysptOPKhu1Ic+1ezc+uyYTj/Z6HPXnD7VA4Zn9/2yO5AkwWMC9lNrjIyhVJS
	 ezTvnx6Fk3d7FROQQ2EHAXx4AGQgc2tXOeiJ0dCBOtCwQ8mVNei16V3P3KpFIvB03W
	 xkpWywd3Lag0irrbIdTdcT+FSBB8X6yEwM139mEA80WCbB9JXi95ejr1e2OzWVxU8f
	 RTpprCXdzTISQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYxc809g2z4xQZ;
	Fri, 17 Jan 2025 08:59:51 +1100 (AEDT)
Date: Fri, 17 Jan 2025 08:59:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steve French <smfrench@gmail.com>
Cc: "Paulo Alcantara (Red Hat)" <pc@manguebit.com>, Steve French
 <stfrench@microsoft.com>, CIFS <linux-cifs@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cifs tree
Message-ID: <20250117085958.0b91a98b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4to0jkOCE5bLkDtu2S/zZ5U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4to0jkOCE5bLkDtu2S/zZ5U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from fs/smb/client/dns_resolve.h:15,
                 from fs/smb/client/dns_resolve.c:18:
fs/smb/client/cifsproto.h:32:28: warning: 'struct TCP_Server_Info' declared=
 inside parameter list will not be visible outside of this definition or de=
claration
   32 | extern int smb_send(struct TCP_Server_Info *, struct smb_hdr *,
      |                            ^~~~~~~~~~~~~~~
fs/smb/client/cifsproto.h:79:45: warning: 'struct cifs_tcon' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
   79 |                                      struct cifs_tcon *tcon,
      |                                             ^~~~~~~~~
(and many more like this)

Caused by commit

  42b78fe1919b ("smb: client: provide dns_resolve_{unc,name} helpers")

Looks like a missing include.

I have used the cifs tree from next-20250116 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4to0jkOCE5bLkDtu2S/zZ5U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJgV4ACgkQAVBC80lX
0GzuZAf9G6pZifWMr6+CXs+gwvQDoSJU99fCwRUK2yqDvrH+i0GLlTk4cBpz+qoF
LqWHoQ1qtLaI5xIxmiuUBBZR1veYuHVjPufT7XLoJNQWb6vkKdKiGzt3WmTm/2If
3j8rd61FHJQnXne7wxH0s10Kzm3by7lNkualjlnhGimpmRJd1fzrKEFW5FlL6fG6
7WNwoS0GWw1h3eGPvP2dyjXCY/LeD5kRsv9ijnwoSrieJKaDvl9XbPgCilW/vFrl
S1ds2eNO67oda06GITbQaA/7NvNRwoYa4LKWkcsqv+ehAfMWm2bsNP0plOZJEdi3
EF8E8mZIdfNBe0H/DjxYDn0FF7P4XQ==
=g7iW
-----END PGP SIGNATURE-----

--Sig_/4to0jkOCE5bLkDtu2S/zZ5U--

