Return-Path: <linux-next+bounces-8757-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA6AC1DE9E
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 01:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECA784E4F1C
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 00:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC981D5ABF;
	Thu, 30 Oct 2025 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IdLEkiY0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBCB1BC5C;
	Thu, 30 Oct 2025 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761784242; cv=none; b=u9DbtVaaneTt4pG6BkGe0oRdN/cllTXUFYdZFJU1m+59BCgAcxZ276i1tqTkLVSbODYGoXZp1xa9T9iLkn6g0K3LQSkcnlM6i9qCyznkSjP0q3fGRZ72DY0kdA8nB4A8aT2p0I2+M16MQIiXnCU8kSWExGGvL90PiO9HCoDzlss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761784242; c=relaxed/simple;
	bh=Txnr89VXikYYaxDOzCqXxJN03Ls2E4x46dgPoc9oWf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PaZyxXu1JibiZl91fMrYsZgd+8offq9Md5dQUPJmaNPJeFT2fxIRjzt/vgoDh+K2GoTgF8JmuaVsYDvcR5t+6/J5sXf2FsfMsMELlKxko3yDV0u++UWtvVV+fIZ9GAVJZrAXrHEJZzYIMB1T2kUtMmL78kQqsRg+vEx+HoIT69c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IdLEkiY0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761784238;
	bh=2WeXajEOg+HIBucEauDzL6tvQXFBWPQg9mkWjCQUjfc=;
	h=Date:From:To:Cc:Subject:From;
	b=IdLEkiY0cjzKQKrEi8Cm6UIa8sWDg4YBXsZj0sdfWjkh5JFcJSlr4XQgVzKOYl1vz
	 NQWoI6PY9bvUyFWi1W6ph5bwQfCmyLMmx5gHM8X0ZZEqkjxrpM9iZ3MFkrxHjQhg2o
	 +pZf8gMplWZqgA5LpEDdDePLvW6vsq1QBJPLLCPcrdWlJdRqzOwWBT640S/FOoPOh7
	 19XkUVuCkWm/TJ6H8k4Tvg/tl34liT2kUkXT9NCpXvJLBRi6gJRjQznHLuwYKLyyCi
	 HoH7BUaqt0PUx1+rNgzqS90g/IDP0VQhp1QfxNqly8QXjoHunWbzkOK87kj5RBTjJh
	 1k3VfU3/RD/uA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cxlQ600vPz4wMB;
	Thu, 30 Oct 2025 11:30:37 +1100 (AEDT)
Date: Thu, 30 Oct 2025 11:30:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Ath10k List <ath10k@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Maharaja Kennadyrajan
 <maharaja.kennadyrajan@oss.qualcomm.com>, Miaoqing Pan
 <miaoqing.pan@oss.qualcomm.com>
Subject: linux-next: manual merge of the ath-next tree with the ath tree
Message-ID: <20251030113037.1932c6d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6.h=RHeyuNtqfndL6hyggW3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6.h=RHeyuNtqfndL6hyggW3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/mac.c

between commit:

  9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save confi=
guration"")

from the ath tree and commit:

  6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to av=
oid stale beacon")

from the ath-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/ath/ath12k/mac.c
index db351c922018,e79d457e3c03..000000000000
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@@ -4209,7 -4286,7 +4267,8 @@@ static void ath12k_mac_bss_info_changed
  {
  	struct ath12k_vif *ahvif =3D arvif->ahvif;
  	struct ieee80211_vif *vif =3D ath12k_ahvif_to_vif(ahvif);
 +	struct ieee80211_vif_cfg *vif_cfg =3D &vif->cfg;
+ 	struct ath12k_link_vif *tx_arvif;
  	struct cfg80211_chan_def def;
  	u32 param_id, param_value;
  	enum nl80211_band band;

--Sig_/6.h=RHeyuNtqfndL6hyggW3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkCsa0ACgkQAVBC80lX
0Gz9fwf9GUdRyyXnRqEaf8BfJNwgY3rYVLwA4zH6WV0jAKSwjaaptX2XRiSMKzJ7
ZWW+MCDS03Xxbkex1H2Boja2rDNDq+tXAdsMQMPKj8pTYnAdc6xxWDuPsuL3J1Y8
A1B/hLF24zy9HRWfpqNBXIKwrMF+jJ6Ff2iEnNJa2W+E5APVlNwo711gQbx9Opml
oNAx3ciJiEWDukO26VUFa0EXd/gLYDOxRdacuNtr+UL+ieiAZ3gdM0teFAYLno7L
lL6Uhc5MSdWxrkCUs9puwzdraY3c3jcDcMGum1UYetizLXQOhWJ6jbeCq9tZt//6
uDTJ9xvdfYeBF677VqYti1q8SuzaUw==
=3JsI
-----END PGP SIGNATURE-----

--Sig_/6.h=RHeyuNtqfndL6hyggW3--

