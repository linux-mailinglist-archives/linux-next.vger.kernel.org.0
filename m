Return-Path: <linux-next+bounces-8048-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B00B2E894
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 01:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 248F04E57F7
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 23:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A682DCF79;
	Wed, 20 Aug 2025 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kzT5dxLv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8836F2DC35F;
	Wed, 20 Aug 2025 23:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755732009; cv=none; b=DcrKbsVUbHrjhJIOYuDIds+a2N2j8Y9gMURX2pWsILuDkTaU5G3zU6hFbtE3eJi6PmZuCDa8KwImMymsxdP7iqoMAmPXynwfidutIyBJKiC0ir9ERAhquoKE9wLbmWJqDz3onL/MhMvo55mhbm9rOnOn1v/zCoPooooodchBqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755732009; c=relaxed/simple;
	bh=7MXF6UHHnZAnb9ZSjj3ajc3FzjX7Lce3Zy1R1QMAs2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ixxo4NzIAUWCN8mGRnTXOqOC+y5AXQErVnm8o9mQ3YATkcWbfiWXBqJce4QlT24BQVS8Y5qGykTHkMztaN7ZB11NmAe1BJIyl+6h5Yft+0q4zHD+cPTUfDvyqeB8kfXMCfHR2Ju/OcT6TNRb0kYw064P96P/c7FnFPzyi6QfNow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kzT5dxLv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755732005;
	bh=YCQ3Y9INpwYs0WJhsNpvgwsuOp7ToH9IUiIcwYvCwYo=;
	h=Date:From:To:Cc:Subject:From;
	b=kzT5dxLvAH18fONs2gCKmzTBlGmFSOHsTFqlDscTC/S/mus0EZ7j1wNTL+orJMDRW
	 oJ2M8CyjS4cXccLsvX5fAs24LcIj5LFpUFp3YPQHW4vl2rZw7lDG7o61DhgjGBeQx+
	 14L5nkX+l392Nm3g9GYpOO71rCDztgg1tQwNjbdcdW3Pq8k9VIdnCORAFWJnmRTSlZ
	 lDeEQ50xJZlFMrDrMf+FCKON6gfl0Y1t4uSZ1kA8LQf3VzVH8CeM5DA3g+wz+rcrTf
	 fHNfFTu2wsTbd/j+eoud/92JXdtItH8rFiTEft4AMGh7Q7LAVuXW2anojy8ruDIdYi
	 pUABgB3bp9B/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6j915vGxz4wbX;
	Thu, 21 Aug 2025 09:20:05 +1000 (AEST)
Date: Thu, 21 Aug 2025 09:20:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fuse tree
Message-ID: <20250821092005.64bbc5ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gHOpFTDSB6j6CN1QbtTs5NV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gHOpFTDSB6j6CN1QbtTs5NV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  53ad50232e9f ("fuse: keep inode->i_blkbits constant")

This is commit

  542ede096e48 ("fuse: keep inode->i_blkbits constant")

in Linus' tree.

This duplication is causing an unnecessary conflict in the merge of the
fuse tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/gHOpFTDSB6j6CN1QbtTs5NV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimWCUACgkQAVBC80lX
0Gzd0AgApHkOMlI/1rTL084BtooVhNP5WxMr2eMvJIGkQDtF2uajRxg/f1tf2R11
bUVak6pKM8zwPLXqcxVveu2/SMU1W2Wp7NcJecQWhrumJIddhGQx40kUnAqZLOUr
5+3h0ZnziJ3K3KUhdi528B7SaxdoANAl6XSpcBOqfvfUpL7qC+br3HUR9mff5YWp
QQDN4251eyryiZsVgnNwetNWgdAfIJFsiwIJFCN9opk0O6+zD7pjIO0XCNF21jax
EJM8cNBN0lziHabUTDJLvMt3dmmVTAJ5HnVi/FXdKmKVBrcyyzoXPp3FbLSMgsgq
YzJ/S6TjPb8at+9EgkkRc4N7KAOrBA==
=bhVm
-----END PGP SIGNATURE-----

--Sig_/gHOpFTDSB6j6CN1QbtTs5NV--

