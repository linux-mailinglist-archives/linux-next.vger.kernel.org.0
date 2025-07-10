Return-Path: <linux-next+bounces-7455-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5EAFFC7F
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 10:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6321B7BAB8D
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 08:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FEE237162;
	Thu, 10 Jul 2025 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AcihvwXk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F59235079;
	Thu, 10 Jul 2025 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752136496; cv=none; b=lYbQsdZPGTYgzKC1y1lO5PfjaAjFKc4+BDDP8FwoH72hWyRxOdiwq7xKBxa3Cp87ZASVaTLScJBuE0KZXvqNhk+lyP3RhQtX4B/uRg0nMwGPyaKz689rirBU7O9MnIpnV0U/EtiwikJ2ogxGpiE5Ldjaoik/32MnXMicBXRVj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752136496; c=relaxed/simple;
	bh=4w9bAD7kRVzLGrlMK5wZBQXa2LlBBSXRgGR9avgSRgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YanPEoob8SlCF8V5k/nqM7BliK0u5uW457YXiLPBBYDuVbMLTo7RjtEbSwbus5mbX038skQfe5KgjjFRQ5O9C3tRJWB4TKroJYGroTT03bXJ9nH45cKok5XtdVDpysWGjw3LHfvjyIo7mfqZOdBW4HUGaHvbvTU1sFp7QAiY2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AcihvwXk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752136418;
	bh=EeWxg/nvKySYKwpqe2eAMVbkXBtKKgH6rXSG4Nx0n8I=;
	h=Date:From:To:Cc:Subject:From;
	b=AcihvwXkdtOWdTSg+d/efhwAGG0PLv5VSwha3xsHUi5SZp2Nx5C9Omle5yxLhTR4d
	 PN0kTTPIFvDdBxa048cZWF0+xCIE0zWxqJGtS3LZK+9RschKZoKrZtRNgJTKUtFJ8d
	 vujp9ItQ7edgNhC7ZsXgydl1rsQcvRGFouAFP9P89YwiNlkYngTaEWG8pUtj06owZh
	 Kkmvvm7WtFcV3rFSwb8p3wWZuEmD3YfelKhAUNbT995ysWia5negoLfU3VpbX5uHVu
	 CKOMBOU/b9oHUCm49qsO2xJCRejhEBxErDlXD/ghVoHwcspwngDTzxI6IP8P+3pCv+
	 bGlxP0ZLK1R6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bd7R60PCbz4wbb;
	Thu, 10 Jul 2025 18:33:38 +1000 (AEST)
Date: Thu, 10 Jul 2025 18:34:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Ben Horgan <ben.horgan@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bitmap tree
Message-ID: <20250710183449.20e255b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Yw2brhMS_2l5m0CB6I13d3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8Yw2brhMS_2l5m0CB6I13d3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bitmap tree, today's linux-next build (arm64 defconfig)
produced this warning:

arch/arm64/kvm/sys_regs.c: In function 'access_mdcr':
arch/arm64/kvm/sys_regs.c:2654:17: warning: ignoring return value of 'u64_r=
eplace_bits' declared with attribute 'warn_unused_result' [-Wunused-result]
 2654 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  f66f9c3d09c1 ("bitfield: Ensure the return values of helper functions are=
 checked")

--=20
Cheers,
Stephen Rothwell

--Sig_/8Yw2brhMS_2l5m0CB6I13d3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhveykACgkQAVBC80lX
0GwS+wf+K33WVuzBsMv+/ZcwiS9Nr9vy0vWZnZ71aJ2nw/gyivMq+KyS9lZT4//V
opIygndGhrp7LVXhxopTj0peOVAbCUmHFF0g2wVCFuUjR53zIMlBTmubvmoZQD3u
B+SR9JIz0HcKodGTTHRiX0+YdgX3I8wt6Jil5KVZ7zMAn+wuPsMaKuP8qutU+0JO
x8aUyG6LSzODJm3XELH7Wj/YVpVmw+IAgonINCB+3W9kWXmr8/wldXlCn7y46J/v
jbS/gOabQHzJbAhuund/fkUqfkn20RmR2UzMx24jsDKr8Syh/0ocEPbV2dbUhuxs
QCl5CSb/pMabyExZA90996Fkxw+Cow==
=KxUw
-----END PGP SIGNATURE-----

--Sig_/8Yw2brhMS_2l5m0CB6I13d3--

