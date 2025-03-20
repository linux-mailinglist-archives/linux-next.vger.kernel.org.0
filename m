Return-Path: <linux-next+bounces-5912-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56522A6AFA4
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 22:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B841F3B35F5
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 21:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF8422A4E1;
	Thu, 20 Mar 2025 21:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lJrX4Nvu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996A214228;
	Thu, 20 Mar 2025 21:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504967; cv=none; b=qe3ISQGmAQ0REL8B2APwvZXtNRSs3tWThWcJYymEDZeT8PtVoPTlLSjfdhC7miwVYIBcsP13M3x0TYRTHF56ZhPdC+DXtlT+BiaZgYA+mS5CnIsV495+infEuD/FUvP1jha5V6BiOIOvzy1Sb+1CU2qT73ZvObayynln5EszwhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504967; c=relaxed/simple;
	bh=aHUCiz/luza8anYRC+g90cr420DkkPgL53m21zU1PKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MDTzZt1wctzXeauMMTs5ao3m9bUhosZUgKcHocQTA54pCYnCsGk0gPlBCXzfMhUlHP9J0dLF4SQ7qi4/Q1SHTfpVUNNRknXnPmXNcfNNkfKBe4taet4aL4afiiUSqJaiclsBS0nyS53q5teLU4xgL6vqAt1j3NDkPDMs1umvRCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lJrX4Nvu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742504960;
	bh=HiAErZUmmCH5UZ5j5dSg5BWwK6OUolzWIng5mm+7FR4=;
	h=Date:From:To:Cc:Subject:From;
	b=lJrX4Nvub7tlAER2gicrqBE88d+eOdGd68a018oKuWIT1wA1coeyjYcnkxQydJG77
	 U7kp8V6C3tMmiIiP/hDULKPVE1tsJ9154mnDgKhZuxV2XNad0XBUQkzd75nyl1mf1+
	 aJPEWGbe5gauMf7j2d5u6a1IeMDQQCjP7LLnPnUEHKQ1FzdDk/q8F6PPVhj0xA9s5y
	 Ihb9STGiQ+S1HPa0Pjvs0tL3ZHyhGLvnBV8U+L4vxMQo8mObOB3kpQScJ9zW8TmzQi
	 vEKl704jGg+i6zIOFsOsgmNTvIM2sg5t7KPXBMQqK0eVqs3O+mlqNUeQ9BfKFjBWmE
	 IxK+PHC4/qhBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJdVm0hFxz4x5g;
	Fri, 21 Mar 2025 08:09:20 +1100 (AEDT)
Date: Fri, 21 Mar 2025 08:09:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Avri Altman <avri.altman@sandisk.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mmc tree
Message-ID: <20250321080918.1f8b90c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QzDQ3t466VDkT4tZk2NytQf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QzDQ3t466VDkT4tZk2NytQf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  79055e47336e ("mmc: core: Remove redundant null check")

Fixes tag

  Fixes: 737d220bb2be ("mmc: core: Add open-ended Ext memory addressing")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 403a0293f1c2 ("mmc: core: Add open-ended Ext memory addressing")

--=20
Cheers,
Stephen Rothwell

--Sig_/QzDQ3t466VDkT4tZk2NytQf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfcg/4ACgkQAVBC80lX
0GwtEAgAlNf2SQMl5FGDKe2N4I/cW/PCHMTJHrGQFgIJNxaJPBgRwcrTDA2s2Ner
ET3W4Uv8qs8WJnPR9LwM44qTNfjDHA2OiIgsgVJo04IewXfVQukSx0PVCOqFlASe
f4i9fVcs0IZlPj8BjJcWqpcwaJSEHuochRAdTU+6imAYh5xVK5QN2hlKFEHAhfCU
a1kUVf0VciHKHZZIShhq2CjAX6KFeYSHgxmz5LkaWT8+B2SHByVR7np1x6PN6FyJ
itMIy+5SjrcR0Mw5qKmOROuqDuafWe9FZXDSKW3hRGPB3lK1Gn8q0zit6yFUzvh1
W1GwcZG5mB05f3jF1dGSqPjgrGmoKQ==
=kjdW
-----END PGP SIGNATURE-----

--Sig_/QzDQ3t466VDkT4tZk2NytQf--

