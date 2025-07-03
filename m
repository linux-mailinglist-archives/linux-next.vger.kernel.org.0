Return-Path: <linux-next+bounces-7315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C6AF6861
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 04:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF4A5227A2
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 02:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CEC217F3D;
	Thu,  3 Jul 2025 02:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MRttt+mN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C6A23BE;
	Thu,  3 Jul 2025 02:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511416; cv=none; b=BSgZvp01TvBTxB2iMzCZtXckB7xmBXk3iS+kuyGjD5gx8ooKZpMjOFNlZuNxeKqmAb99/mVUNsQ0jTifqPpxWVdjs8Jr2tnnP8VA7xqtdQ36NHzet0ultZ9c4wS0gqPHXp+8fqrZyKFSXKpJmuohn3eH9HDxBcg1CGW0mhoecC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511416; c=relaxed/simple;
	bh=fvTb1Naz4/aQKS4k1Ie7/8XwGaOR0S230HZwGnJ8TeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uAL3XY/QzqR9X70ttPundDKt+3Tt0knjQS0bufVcc7G4MjSfQujA+QJnVlwVLJNvbWb9su1eA7h7hEksmAId9wY20RcyskLSfHTnlESWFH1CZ8jTLCrlKUsn+xCi+CSINdMuPmX6MQA+2pzaZGeIweUbjnvAWBixGHN+Uv4dSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MRttt+mN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751511391;
	bh=Ilt3fsEFxzUtz6gFNrQnqtGKY+gocpI7l2q5RJz1u/k=;
	h=Date:From:To:Cc:Subject:From;
	b=MRttt+mNMSVSA1G0W211fef5mPdmAEm3kN2aw8B2dOheZSYTOv8zRzXv32Jo+PDXC
	 mIaAZfhGJJzpP5Ye6hIGEdQg91pbiIhhch0xY8C7WAFmRji04IVvKEIJhJq6Cpnq9h
	 qsDTzBOi/jWLfBGIaDTiQISSM6WvN/EPFLw5p7kN3fB456q+imqRKeMiOMxQIOpVES
	 Pjfz8nxTRHEyzGQbaOXV2Ua5ljxZtMki3vlJG7AmjWqr+7Gb5EG9VyS32WJcUQzasm
	 N1Gn5FBEeM3E0LztEIYUJTsVEiHWC72cK0zkZ/PfNNGU46n9+SR/yK5ax7f7mg+J3Z
	 McA8lCrGTZkKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXhHK4F5Yz4wbb;
	Thu,  3 Jul 2025 12:56:29 +1000 (AEST)
Date: Thu, 3 Jul 2025 12:56:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iwlwifi-next tree with the net-next
 tree
Message-ID: <20250703125649.07adf3b2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K+BUbNwg2+DN7tLYQ2baJFL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K+BUbNwg2+DN7tLYQ2baJFL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iwlwifi-next tree got a conflict in:

  drivers/net/wireless/intel/iwlwifi/dvm/main.c

between commit:

  90a0d9f33996 ("iwlwifi: Add missing check for alloc_ordered_workqueue")

from the net-next tree and commit:

  511b136d072c ("iwlwifi: Add missing check for alloc_ordered_workqueue")

from the iwlwifi-next tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/K+BUbNwg2+DN7tLYQ2baJFL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhl8XEACgkQAVBC80lX
0GzpWwf/Xd1+jEm0jqV4dMp8rKHGR2NAhDCAgj27335Qr0DC/7ovZNHHF06cotCS
gifGojmTqj84LFmx4rgWCsafjjOVr+kUvjBbusTmZkoHApJP4g3Ldy8mxLXYYsA7
WxAR8LC/9ZE+YDBAz/Nb0WkJOrkg/0nJm/GlHU4cdJpLeMdGz0sA8RIm0ZUStrKX
D/KHXLFwIzWWmvLVFxNOm/bwvXH1PHJs3S9du9mWey79MEJnxa4dLvkHugU46ofd
TjHYbXs5AYflFF/GincXmEuHtyYb62U7lwWVB/EKRYtnomWhwU76F7h+HghX3Izy
AjzgrrO+S+lwJQH+sRq3KCcWExoNCA==
=WGpZ
-----END PGP SIGNATURE-----

--Sig_/K+BUbNwg2+DN7tLYQ2baJFL--

