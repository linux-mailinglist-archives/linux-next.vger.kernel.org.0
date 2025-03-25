Return-Path: <linux-next+bounces-5992-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E6A6E98F
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 07:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B11167F01
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 06:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2D51F9A95;
	Tue, 25 Mar 2025 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ULxusYX/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EF19007F;
	Tue, 25 Mar 2025 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742883819; cv=none; b=NUN3enMU3Cj/oz3QG4ry8E/aTmFtKO/l+Wg96xgIodKj7L9/7tehqP1VnKjts3yCXCyRmNe5Ys+sY6oluyb7oQY5TJwYo0M+5B1qlqo+5x3v5DSmBh1rYfAo4db/1ulwNAI+Pw9xv77D5HVJdjtn9HHvjFLAFiPMbk4gb9gg0lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742883819; c=relaxed/simple;
	bh=ugviu+windeDqvpWj27qLJ1R5TGl129RD+lI8a3yhv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jDeeUyOXeMVM9vjrYVaAahuTBlqfrrSoBGnlFAYBB1k1PJceeXvGZSlxe3Ubrihck7EIR/BHAiJ0jkW8sNLpB0IiWAu8da3XP8bhMhdbmYH0GXJuHlL388FuUd9o2io+kCjWKuvp08Ks2HRBNtt4ZVsbGk+XeUUkD2u5xiv10SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ULxusYX/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742883808;
	bh=P08jozBVUdPG/cdW+fzyIFM8WVYkNow3mLQ2a/LYFp0=;
	h=Date:From:To:Cc:Subject:From;
	b=ULxusYX/sfe+27gxchuz/WVHOl7GNBLP4+SO1rPhrtzuNAlkpWpPlG+xYmuFHQg4l
	 QQ76X1amwjnKPUhOZIA2KgqfxZDN7/3LhDGsStPStW/BBW9jRnJRTXp22IK4xOhuKZ
	 Nw16ov22k9B8a1yoSgLTxPCFA2PkCu2rtGlTo/iMjwLPJLRN+QXDNHkCZI5MlUYM4j
	 BX9tiJ1a75eAzLNdLHHoZZdBTIryjLLdFv+qBzUli7SusbUIWpiMhrhG9PJ1bcsxI/
	 xuBkAwH/LBBlZT72+zQ3cLSIcc0kInEWZu8LQDv6HsiF7piNAHQFm2sYmt2R1Fb22l
	 MdjskycnBG+rA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMKcH5fmVz4wbp;
	Tue, 25 Mar 2025 17:23:27 +1100 (AEDT)
Date: Tue, 25 Mar 2025 17:23:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the drivers-x86 tree
Message-ID: <20250325172326.2037bd6c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_uMizZpgas0yLZO72K_QGLA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_uMizZpgas0yLZO72K_QGLA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm-nonmm-stable tree as different
commits (but the same patches):

  96b8f4658b70 ("platform/x86/amd/pmf: convert timeouts to secs_to_jiffies(=
)")
  b3e8dc1143b9 ("platform/x86: thinkpad_acpi: convert timeouts to secs_to_j=
iffies()")

These are commits

  8ba1b428cf1a ("platform/x86/amd/pmf: convert timeouts to secs_to_jiffies(=
)")
  66644d80a4f9 ("platform/x86: thinkpad_acpi: convert timeouts to secs_to_j=
iffies()")

in the mm-nonmm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_uMizZpgas0yLZO72K_QGLA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfiS94ACgkQAVBC80lX
0GycgwgAj6BOGuFrCAXWwic6QB/K6Lq14t4Tj1qR72iIQFKPB+3ZscZFhbK2qJbY
Saip0ri6epbaOGiJozKlp8/drKtkJAiLGwU1XOVnUG4BSxkoygSR/tcRc43CSRWa
swwUo+KDcfrEKsH/T+PgoCUm3EZdKvebniIcFMsjuIKxegy9OqpCuFoPOTRQiM3H
iQH47ScefLhbnYhsv3FYIyH2MWh9mn7AS/KRqCbYAbW95gRXQd8NldZ7kUYp/Hvd
/bip3B1/Lttbhd5L553kydb+Xo7EPxHWjAMv+fQiKtoRs7qMQDtcHiCMpgIA2JsF
CzWYCBwCHk0CZLSHj7OmendRezLkKA==
=gS3J
-----END PGP SIGNATURE-----

--Sig_/_uMizZpgas0yLZO72K_QGLA--

