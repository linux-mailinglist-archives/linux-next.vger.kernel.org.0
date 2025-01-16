Return-Path: <linux-next+bounces-5223-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE3A131F5
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 05:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16C7A164D55
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 04:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812F813B280;
	Thu, 16 Jan 2025 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iNvRYd96"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448CD78F47;
	Thu, 16 Jan 2025 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737001471; cv=none; b=IfXkak7P/QBqtzruSx0PdZV6iv09EwPnd6lwxL+VhNlV5YLg3ppuTSjn8oTeAQMQZntye7fCURn//ZOMVI5e4JaMtPW0A+dZqCdLYrpNbdwFPCMuzrEZtgGAFm0NvzW5qJsFr9w8ORo++UNpaUJAhRA5OS/asJYU3qaSBczBAsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737001471; c=relaxed/simple;
	bh=PSUfWU5j6X403z2BTEGH9XKY32SvmFl/ta8/6TsEa2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FnmSXKLUo6InZFmC3myn0x81rnLOLUITwFGW9HV/JRzn0CDLnskWzP5LTwI6uJogFzA4N3K56AbtB0Vo321Vza4S9zF5qD2yQ4dY5EssCdo7VKGxzOnyIymoDtPuL009zy+4mhqr5DT1ULV3UYc2TZT9aCxUfm0pjdaTsN/QBB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iNvRYd96; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737001455;
	bh=I7RUaPG7YLzrdzeG/rERDcKQ6KvvqGylhFvt4vFuXhs=;
	h=Date:From:To:Cc:Subject:From;
	b=iNvRYd967GAr0Rm7B9IK4W/GsWL/uAD9+8gl/qx6pVUaxLVUWD6Wwl5twWiV/g1uz
	 r9fkhlDVjcWnEooFBCP6YgTU3bwXFp5QQ0qc22yXcND/kiFHs6qgA480y2ooghMMf3
	 J5UnI0fiVnOwVO9NcJ+SIAeOpgWfqUbqrlsVn0OIcdxwpZb4QoqjX5CP2JGUFOqz8L
	 wwqQeELYJqc/Q9YkbhaQXeIEUL0VunOCt7feDKCgfD32XMnOM3rHoLO1VbxXZy/D3H
	 BA9agtLVSj/FUpswNTHBHL3ySges+5y70/dHPg1wemp8vZks15enFPnzsJ6T1OoudJ
	 7sHYZlBj9Y8iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYVB66Yc4z4xRj;
	Thu, 16 Jan 2025 15:24:14 +1100 (AEDT)
Date: Thu, 16 Jan 2025 15:24:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the leds-lj tree
Message-ID: <20250116152421.5a0ce881@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/st.PC=nomYdeyqvhuqNbXRv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/st.PC=nomYdeyqvhuqNbXRv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mfd tree as different commits
(but the same patches):

  599b92fd0efa ("dt-bindings: leds: Add LED1202 LED Controller")
  132e6687a118 ("Documentation:leds: Add leds-st1202.rst")

These are commits

  0fffcd4e7cfd ("dt-bindings: leds: Add LED1202 LED Controller")
  b1816b22381b ("Documentation:leds: Add leds-st1202.rst")

in the mfd tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/st.PC=nomYdeyqvhuqNbXRv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIifUACgkQAVBC80lX
0Gw4Wgf5Ac3rQqlGtMCFtHYrgYfFSwjpGKuV/dw8QWR30kAcbnOaIg1whZiq8jgK
7Vvo+dVgihCQWBxrAnoZu1Tu6lrT79nasfCiD1Z1fmM5qSQAvBtt7UPQq13FjOy2
QpQIm6hmnEbTWCGmgzJJcAm3Kesl7e7ZWKBw7svLQdXC0fIM/WN3WnXBxjqlfOL5
Jyru9soYU0HeGDkkBdUODB8+ECKuqSLequ1uc+o5Fao7gEOELtfhUiFX6nqOjiWh
4enHXF1npCiSd/ZYC3BknE+48fNGgr04M7X07aLhBDqd2QX8L79v9F56MyijK+XV
ES7ctZhAdNR4GFBXqG7P16Nvl5fBAA==
=RJMq
-----END PGP SIGNATURE-----

--Sig_/st.PC=nomYdeyqvhuqNbXRv--

