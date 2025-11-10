Return-Path: <linux-next+bounces-8906-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B562AC44C42
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 03:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF4F63B0084
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 02:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6942144D7;
	Mon, 10 Nov 2025 02:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VlFRbZzw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272613F9FB;
	Mon, 10 Nov 2025 02:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762741448; cv=none; b=oIfLimvnJ9mQDXr1G9ERhmR2/8wPQ6Teo3+/H1K+zz09RI5yPFnETVIOi/zN7hphktDE8C+t989cmdr+nHnVhYToHoWxvwgfMzOSGZQBtQi8bLEAhSZRGjLXjbPLE+B8JW/G0KZSgQ3Zd1hiN5RmZUpAj5UsUtNh/iZ9pkkTBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762741448; c=relaxed/simple;
	bh=Tu5tuMrQ6v/cNgwk/uHcE8VViaJgAYEc+gLgumRk1Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=stiPD5kOmrNjLn9GhF6eI+hKDve1kjOHbzR2P1WBZUh3TsiwNDMwLUHCLw+cB8gllxyg0gU1W3PcebJ3+VFa7x6Gx5HcHiOc5PTY9bpIsuWfMtu7k3CdjrDZ+Ckvvgt2mK6FSy8FXHNTSyAfxLQ8xlLIRHjA5tcQ8VNQZNo9p1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VlFRbZzw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762741442;
	bh=LHo9xZyZFl43ehMl0ZMkiYOE3hBiB5Knu4/aMTJbWzw=;
	h=Date:From:To:Cc:Subject:From;
	b=VlFRbZzwI7/WjBlY+9GcF0tgWXcTBxo+WNierjsKYvkV/lDydnZm6C99E4klu9lLu
	 t7ElulsefqrylQTfDkrnPzGOi0WTDdXdEKZtOwk5Qo1tIBNPcVtk1mgnsyE9sgj9Zw
	 512BRgXcwghaNt8ID/4zNOxgR7+0R+5cA2zEMPzu7u+jRuAK70paGINmqhRPC3/DiZ
	 KGf8g+fL8fGzcl1f3+WN7rMbwBqdUeggqW2qWSzZU0PjLqMfvNv4tlLxiGJq7SJBcy
	 VIPR3vabKlTJkvdrojtAP4UumWtRSsfEAn44UEd2n+NEHF8eoEVtLFgCnpSOR9ywx7
	 tAhftMYXDjkrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4YPt1XDyz4w2R;
	Mon, 10 Nov 2025 13:24:01 +1100 (AEDT)
Date: Mon, 10 Nov 2025 13:24:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Aswin Venkatesan <aswivenk@qti.qualcomm.com>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>, Jeffrey Hugo <jhugo@codeaurora.org>, Jeffrey
 Hugo <quic_jhugo@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>, Troy Hanson <quic_thanson@quicinc.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20251110132401.200d88bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r06Vw_PbOst0fgTV7ucR6je";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r06Vw_PbOst0fgTV7ucR6je
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [do=
cutils]
Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without =
a blank line; unexpected unindent. [docutils]

Introduced by commit

  9675093acea0 ("accel/qaic: Implement basic SSR handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/r06Vw_PbOst0fgTV7ucR6je
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRTMEACgkQAVBC80lX
0Gx0AQf/aMyqvU4OKrj4JQ0OqcT4+SX7cuWhmDfRWeIvq//xRHf+KYZAhpL3W72A
qZx73EtkizpHtAmgfE6JwpwBrmtT0QkueKYqbrhKHJvgj2W8vDePE4833xSlbyTO
ymFIPHMC/K0HCpv6/Bj0hECoCYZgTPlm6CWC9/5i80qaIMlEbRbPf5ubDg1udKeD
Obi6uClvnEPMDjijsAAIvQog88P4grNs6Dc2yutYIYxKkTE+g9sopZ4iRk1ZIPx4
HhuIPsM86aZZp8SChhPupirtjm1XLBZY1Tuk5MLW956DngQPEnskcoBXPqwl/c+h
AeeuTXHEGWpqJCk6sOKXiedd22kyTQ==
=AE2a
-----END PGP SIGNATURE-----

--Sig_/r06Vw_PbOst0fgTV7ucR6je--

