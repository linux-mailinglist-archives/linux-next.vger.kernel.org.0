Return-Path: <linux-next+bounces-6635-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5EAB0DCF
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 10:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76F4CA21589
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0915274665;
	Fri,  9 May 2025 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ctX4i3Cn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CA46B5;
	Fri,  9 May 2025 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780532; cv=none; b=YVu2sVQtYuwATnHNxdAvGfhCczqtgd8xrWQzYFdk3VUjRA0VEmnYIZvLKjOWlWrgprN/9rpgJFKRNfsHpCLeFWmivDAXjeiULcVZQaPE1FTyJyefvebHTX6Q0vM8YP2wl0tyWjvpbvDaYu+iwc0t54AuqelfdjAdZgcpulSX+wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780532; c=relaxed/simple;
	bh=bv170uKQ1BBXhD4hAI7gl4lZVddnMnoN1ipFURE2DbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Sq9Cf5FGQOkxleTjUg4zxzI/iQ/WyxVW/2ij8617ZenGfJcYmvbw04wBb2otQEMd8L/CpwnqLJjXKbdTA05gdEscdoXtYEDw1UXaSsYL5EWyh17L83XlnFjFKP1goFHBbHXFeGp+GNtvGZlqS5dMfy7yLBf14oxQ121868+lQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ctX4i3Cn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746780526;
	bh=OvXX7bbw3cld+X+2U7lrtyZAQTDfNmKkqiJN3NWuafE=;
	h=Date:From:To:Cc:Subject:From;
	b=ctX4i3Cn+BD8qc/AGIbxnUmUrb0xP39fBvNraH354Gi1JXlc/YjDjPKfXL0y4JScF
	 9OZXQgynIVJEq/JQEluYsmWHYve28ZBctX12bqdHzTz3tOuzm3oSmdX8WPX/fLF80Z
	 5g+Po5YdQuTteVXUST4aRnEqxBnrX9Q85Y3iWXWQ7juHSlOUhWL8b5yONiiC5HJUCK
	 SrahXktpJnT6IBdKZJyvgY5fWOlxhe2e++9xyyrxcMxZq+T450YtOmfoOBcWXadF0o
	 utQJZszPceNGaHuQIHMA+dn/F78YCsnWMVMfsFMU99z5dm58k4Zs40V0aUs/cMO+2C
	 AF8O1ThdJTIlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zv2jB4XMnz4wcm;
	Fri,  9 May 2025 18:48:46 +1000 (AEST)
Date: Fri, 9 May 2025 18:48:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kspp tree
Message-ID: <20250509184846.3c7e359a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P0wdm2nMQbS6B8s267=TzVN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P0wdm2nMQbS6B8s267=TzVN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the scsi-mkp tree as a different commit
(but the same patch):

  d8720235d5b5 ("scsi: qedf: Use designated initializer for struct qed_fcoe=
_cb_ops")

This is commit

  d897dae472f2 ("scsi: qedf: Use designated initializer for struct qed_fcoe=
_cb_ops")

in the scsi-mkp tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/P0wdm2nMQbS6B8s267=TzVN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdwW4ACgkQAVBC80lX
0GzAlgf/b3fNypcEnVQ1eWBEhlIpVlZ5Rj7+SdDexoIvLsv0jrri13RBAFqyv6tk
tonbbih2ae4LZmCUIQ/vyMywdau0gH2nZFZpjLUeckXKuoxXlKng8Ih2rANnkfgS
HH66rp8A12BI63SKYiEye8Tnhiaaa8fDTrdIqEqNXF4Cwn5uZ+Mi4QLRRMzhuaWR
bdkAaZgMkWeI4cEYcPK6pEhn6FFLDgQnXeJ6nG6a2Et0TvJdSy1wSYYr6rRmPByJ
lMh2ZtEgtYkdX6MIUoBBMQlyOMGHU3d7mlgRgsqy3amO3xVRlj6SInTWJGDYo4os
YJe+2WXq9Yf1AWSjaAAgWyxzP4oNcA==
=bZhT
-----END PGP SIGNATURE-----

--Sig_/P0wdm2nMQbS6B8s267=TzVN--

