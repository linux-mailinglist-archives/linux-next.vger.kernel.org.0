Return-Path: <linux-next+bounces-3507-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 356299654CA
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 03:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8A41F23DF4
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 01:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891894595B;
	Fri, 30 Aug 2024 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YuP6RVtv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E267B1D12FB;
	Fri, 30 Aug 2024 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724982168; cv=none; b=KsKNBoWPZkUJLJR6v/XwU//AQuU/3Mj/QWIMjQAlDx/RNUVV7A/helR+REJn1fdn0ojoM66qjOXWB4zyd5jxQx5jCpavKgIO2QJ/N/lpwuQDGkTwU9zJ1i0n6h6VTVksWExl87TIjK9WZJ/b6GELcIzhSyRNEZbSK6bX9qTf06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724982168; c=relaxed/simple;
	bh=rL0kNeA/HYhu1fDTaBUYqXMbprEwvP4CJ2z+ZHgG1eY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VqG7YcFK2RUNpYg1uGJMNjQSPlnKI5HjNhP7pPbGGKOFF1NtHqM4W71TBYPNf/V4DQA3hCVwrDdUeyW0FOC9Ducjv6/yRFSVAbGeayz6iQbUH8fY4SxbyV/URFzPBvnglXXVPz0gInf23impD3QgPMnCcQIJ/2fMDtBEN81CJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YuP6RVtv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724982163;
	bh=ugFv1NHmZ+d49N1SQlBulGJ8Pc66YWIE8D1VkMkC/d0=;
	h=Date:From:To:Cc:Subject:From;
	b=YuP6RVtv44naBOs7Cp0xMbkWfnO46c6LVBgyqfrySn+sG+FT7+yf/EeQcoPPQIqkB
	 SSF9Y5nwOecookoo3VckC+1j2eTxe7LQjrm510IJDSkZQdsz2/QRJhsjB9F+gUGEl1
	 xBkDBAbpuaKzsRtAMsxRd4wH0wiws457kbCKibVR5QxiX7OQdKcRXZt8a465cCeVPd
	 47S/dDDguYpRpv0ssAmODm5O7tc3WtooevyfOu3plsca3PC/QNvVGlTEyl5ItGpUnI
	 335pghhKRBbavC/FmzAUFdBO22gpYuCTmOdZ7ozlUWwiizUGHsTX//hR8JDUDxSeu1
	 0bfSxFWJm5vPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ww19v57q8z4wj2;
	Fri, 30 Aug 2024 11:42:43 +1000 (AEST)
Date: Fri, 30 Aug 2024 11:42:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20240830114242.35b4bc86@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VKU1CTY4VESMe9+5/ozsQnh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VKU1CTY4VESMe9+5/ozsQnh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from net/bluetooth/mgmt.c:30:
net/bluetooth/mgmt.c: In function 'load_link_keys':
include/net/bluetooth/bluetooth.h:276:17: error: format '%u' expects argume=
nt of type 'unsigned int', but argument 3 has type '__u8 *' {aka 'unsigned =
char *'} [-Werror=3Dformat=3D]
  276 |         BT_WARN("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
      |                 ^~~~~~
include/net/bluetooth/bluetooth.h:262:41: note: in definition of macro 'BT_=
WARN'
  262 | #define BT_WARN(fmt, ...)       bt_warn(fmt "\n", ##__VA_ARGS__)
      |                                         ^~~
net/bluetooth/mgmt.c:2858:25: note: in expansion of macro 'bt_dev_warn'
 2858 |                         bt_dev_warn(hdev,
      |                         ^~~~~~~~~~~
include/net/bluetooth/bluetooth.h:276:17: error: format '%p' expects a matc=
hing 'void *' argument [-Werror=3Dformat=3D]
  276 |         BT_WARN("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
      |                 ^~~~~~
include/net/bluetooth/bluetooth.h:262:41: note: in definition of macro 'BT_=
WARN'
  262 | #define BT_WARN(fmt, ...)       bt_warn(fmt "\n", ##__VA_ARGS__)
      |                                         ^~~
net/bluetooth/mgmt.c:2858:25: note: in expansion of macro 'bt_dev_warn'
 2858 |                         bt_dev_warn(hdev,
      |                         ^~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  c858dc985d70 ("Bluetooth: MGMT: Ignore keys being loaded with invalid typ=
e")

I have used the bluetooth tree from next-20230829 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VKU1CTY4VESMe9+5/ozsQnh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbRI5IACgkQAVBC80lX
0GzhCQf/T9cBcV7uwzyMOo6H2QZXl+x3mv2ldLtr7RY/BylPmHJnAPRw3j5aKqmK
XTVY5B0MTp88CI6W2FBcz2KznZhBE0gubg85iuq6+YNSr5secBCMubFLZHbqNw5r
lCF2C0JGvsPc9Bw+DJzuaBPirYpeLRe/JCmNZpDCGUQGkHd2mRaLjoX4/ih99lHo
NDSPacRUnpHZuE5812ye5MPkuL2FtSOvqTYaa8/C3uZyogOdw/zgMD5Rm2p+IICK
rF5qM9oE4t0Wm3vLR68pNvLLSUcwbTFMlYjK6M8+ZBHY0zfCzaA+ssoumrgSbSqP
cPpXq31RJEtnQVzMw7v88KjNcrUySA==
=6CV7
-----END PGP SIGNATURE-----

--Sig_/VKU1CTY4VESMe9+5/ozsQnh--

