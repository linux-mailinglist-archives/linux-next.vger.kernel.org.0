Return-Path: <linux-next+bounces-2310-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6E8C5F4D
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 05:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FB19282291
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 03:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052A537142;
	Wed, 15 May 2024 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QC9Qne1q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035BEBE;
	Wed, 15 May 2024 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715742103; cv=none; b=Ex+nSlQaFKVOztMqzmf6bx5bycUX2J8OhtPLeF1uy9SKWkCpKIrQihWWuIQn9rcdxjIouo8bb5ROnZG9po7eNSKmHnoE/ilplhQ4JzpMaO5fOeXM5xwocru1ld2DlqPH9tTzEFamMA4Qf1efacRwfk+qx0T8BK7WK8xzES1utO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715742103; c=relaxed/simple;
	bh=TFpUKjm2KQMOFGqP3Ii1R6bJBU7YiuKVyiKvtntFSFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G96ZbmcJLVqolik66fLY0Cb+/h+vKVe7juLT+pQw7yfgDwIJG81oG+HKQtLCI2w/51A7CeBujWkzhr/DxyYlSVByiy+C57FyaNFGL2mmO3hpaCL0sV4Y/PgUFZh8qtkuAtLMJwJwV27QY5uZuq5FaCre777sJslI0rnPH78MLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QC9Qne1q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715742100;
	bh=BFkqFI5o0BLG54rrGKzsZF252OOPOBuIwFR06/FINbg=;
	h=Date:From:To:Cc:Subject:From;
	b=QC9Qne1qEAYOsOAhqxlrkr7BuJSvqCBNLeM8WiUrJcBjolj3xx89M2J/B6M8UuXC5
	 GO27M5PhA2EOEH1Eqp7qtRiAKC2MZtprkYAMDzf1bJNICnghY8jbSWxzpHKKmKZ7rk
	 g8+8Q5Y6IzRlECqOhHdWZKWAARhoqmQ5KPY9QhI61XVu1PMBbtTuR9HxzpkeveObn/
	 civzBDIpYV3Mv1dCabxKsnnVwry690bFzlGZ8lTXwl2yvzGBEX/Udc7v2YOYCb9znR
	 nq6Y9WHoZjnAcrAxi8pm37rZLcbWH6/kycQ5+cbi2HwFfSkhIJawRFSgU9kozKf/sP
	 do1g5BGTLbCtw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfJ0N0FwFz4wc8;
	Wed, 15 May 2024 13:01:40 +1000 (AEST)
Date: Wed, 15 May 2024 13:01:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5?=
 =?UTF-8?B?xYRza2k=?= <kw@linux.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the devicetree tree
Message-ID: <20240515130139.2da899c0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oU49Y5wj+bzkszgbDReCbsn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oU49Y5wj+bzkszgbDReCbsn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the pci tree as different commits
(but the same patches):

  15be4f7ce5de ("dt-bindings: Drop unnecessary quotes on keys")
  28081ebd17fb ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'oneOf'=
 sub-schema")
  649bad67d4b1 ("dt-bindings: PCI: microchip: increase number of items in r=
anges property")

These are commits

  d7890a80e037 ("dt-bindings: Drop unnecessary quotes on keys")
  301e978b9eb7 ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'oneOf'=
 sub-schema")
  247edade4b4b ("dt-bindings: PCI: microchip: Increase number of items in r=
anges property")

in the pci tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oU49Y5wj+bzkszgbDReCbsn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZEJZMACgkQAVBC80lX
0Gz8dAf+OBoYqX2Yi1xhE6Qg4aaIjOUvPPVaypzXJ76/1Q6VQkeSWOYULLokZVJp
o3NF4BsbBY/LU9T/UuRiY0h6W0WI8fd5lDwzuuMY8uO2S2NGl30r74YX8qGWJlML
D33e5/Q9eZoOoSjy3p5JJH3GLgylkMhYsekW22NOyrSQ3iq2FZEz/8tTItwhF/gI
L5kiK2QTz8opBzXHlo2PUbFnyMCyStaG/aAZ5P/z1+j63YRmxN5SZykrg+jBR5ss
/1hQOgZYBf6tKMnQ7cFDMLEFkvMFa7maqzZQEfzsNmSRFwnSr62rr0i/7eRuu1Yo
hrVfjEeXd7mpyOGPLbceIDGzXrvq8A==
=RhQz
-----END PGP SIGNATURE-----

--Sig_/oU49Y5wj+bzkszgbDReCbsn--

