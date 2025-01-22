Return-Path: <linux-next+bounces-5293-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6ACA18B98
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 07:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0958318847A1
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 06:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F48F1990CD;
	Wed, 22 Jan 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uBoNEZOU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660A2EAE6;
	Wed, 22 Jan 2025 06:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737525821; cv=none; b=lHPyeRqBznDBrKH4CqvRj3eto6ecoUA8WCOKZ6mbkDcTAGfNOXjUGRSzRY7DoYWQ7lgzO+YyUC/ZIg/l5MrWn08g7CL6VmUXzRmwh45zHLStmg+EVqbNiR9supOvuiJXmXzjVFn734V7Y0FIylhhEVXG/XsiNIVsyDLPaLGWy8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737525821; c=relaxed/simple;
	bh=hClEMmRB+EQ5xeePCyvLH7PUNoDH9+VxiklgRj5JAa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XxPShGLC8t61jxxFg7Tb5902u0/CPhSFAoqwx/R8QWMNGKc2ECJl5ImI+IcuQotiQQ3YZ/KgghDo/VJIpF7136y/VHUU3CKh9dlw0pK25Y1OVuh9pAwDF3wcZpi29Tr1tv2b2xlRbLO3xlMz81oenuXkjuyNUia11GRcXw2Iad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uBoNEZOU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737525808;
	bh=v5Z14WeYT/Xln+SdkDiHEXyEa25hPLBd7BZOLgY8r50=;
	h=Date:From:To:Cc:Subject:From;
	b=uBoNEZOUZTeFwb0mdo0Up8kchj6Nt6Zr5qPCx1ICjYOZbwyZnDtut2X3gh5QJAUJu
	 q8uAd0f09R5b7BzAI5o4ML4eUUP0E8RtXXMZochqtxk34T53c+xLxtxy7d8oktZmcI
	 n3yYKW5DeCmldE+9UMJxXyv/jLnbvcxw0GeggTXI65fuW7sjy0hAsvlc+dPzFG9JBc
	 pO4Mhdp6JtIhCXqWbYPZFiwHMwDPdpzZ0EDJzJcnyobOtmJ7YetRAxa6AFfLbBpP1W
	 zVumIm0KPYea/aGdifmAU5Er36r+LohVkVdwz2qrSLoNZ/4mZ6nIiC2mdloimQ4ZcM
	 naxDDpZNdeipA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YdD5r05XLz4xD7;
	Wed, 22 Jan 2025 17:03:27 +1100 (AEDT)
Date: Wed, 22 Jan 2025 17:03:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the origin tree
Message-ID: <20250122170335.148a23b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r5nitZ+sefE=9fYqDouMH79";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r5nitZ+sefE=9fYqDouMH79
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (htmldocs) produced this warning:

Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced.=
 [ref.footnote]

This warning has presumably been there for a long time.

I don't know what causes it - maybe it needs a space before the opening
bracket?

Introduced by commit

  151f4e2bdc7a ("docs: power: convert docs to ReST and rename to *.rst")

from v5.3-rc1

I am just going over left over warnings in he documentation.

--=20
Cheers,
Stephen Rothwell

--Sig_/r5nitZ+sefE=9fYqDouMH79
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeQijcACgkQAVBC80lX
0GwfLgf/VSEZTf1wQFXZzUXsNzvXBLVwcjXyb9GrJI4LcZeJ4RNpOM1BcLFd7ZFf
hf9THYFb2wb1ePoWMikC9icV7ZlhwYBrZ3Pv6/F2VFLou+xcQOwzf0DRIv2jqIH5
ULcy+VX1TxIrGLQI6HWYdOkoH57/BHRfpRJOFWFGCKbG/N/Ab74Yr27qx+iiKimB
2A0fCG0aLpLRLnk8uiuwghau9/ClxZpQjK9LlWbImepCOf9pLM8L3l04aMJVrq5u
NCqVS8aJf7Y3PJ3DZQB/5tAlNnA3ShS9TfLX0xClflUvcZxRuoag/sy8to8BT1Jz
Sbq7Fif2ZzSpQlkmaVh6boKh99v/cw==
=7nN5
-----END PGP SIGNATURE-----

--Sig_/r5nitZ+sefE=9fYqDouMH79--

