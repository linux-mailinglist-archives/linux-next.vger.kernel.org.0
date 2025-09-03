Return-Path: <linux-next+bounces-8172-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA909B41228
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 04:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CD884803BE
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 02:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE8B1E3DDB;
	Wed,  3 Sep 2025 02:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IIzfkBcW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61B1B960;
	Wed,  3 Sep 2025 02:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756865447; cv=none; b=J1C0+vJ5+hgHAYwh8d9CZ/p/c6eoei9Hv0K6HWGAKEDEXqMB5vhz149g3iRCM6Cl6IRvdGK3xr1kStMsJef+o3ZY1p/0lZcohA66EcfFuSnSeXv5rEY9SE5frlupzcObL5ExP2T0DJSGy94GwhpbiPN6G5A3OjTxXphKZDabtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756865447; c=relaxed/simple;
	bh=VEcbFWC3TyEIhUAmbZq5KBdR84MR1IxxcrSuk6txlko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XXdov6jG68AuwvdfXflV0j6OPDuGIc6CYKNsBxzuAtTbRRPL1yqgJrN1+TL+ZVujgo/L9N0WApibVQ0dPsmjj5U0zotLaY2nOwpTuYF5UreUpIgPnUtA67FWnaaffrkEM06rV8lXFO9XBCBJ5SABWHfm8u55fRsziMJQoZgYxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IIzfkBcW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756865433;
	bh=DbR+fyOSivo7XBB7vYIdmMiqychmiY+4HsP6Bu2B39s=;
	h=Date:From:To:Cc:Subject:From;
	b=IIzfkBcWkcXu/X+koAskhmznDSdOVEtTE+yFklufTsTvBGsknlLEBp3fiCD0PsfjS
	 2tJb7QtyEA9pfDxlIOk6+uGGvNwpyfHehN4lf+1nj9K1eMs7RkdsJBB0FP1xevNMwp
	 gzt7zfUpVRxmLbkb4hnf9ZGaq4/t4ze/EJxmHbBkwvN829S1fbQO31UWIr7W05eBcb
	 4WLtNcIqrRcj53Wiek+c1a2TbEBQRhurtDAT9AvaePUi6kAtMrM6KUYlmEhxyYQxUE
	 Dpsnij9bMjmB0YZSEkyNIVgLJFmtSU0iFRxuHd7zXb2wn2/uasO6aWgLm4rilVS9mx
	 hTXflnth8PaAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cGmKh5CqCz4w9S;
	Wed,  3 Sep 2025 12:10:32 +1000 (AEST)
Date: Wed, 3 Sep 2025 12:10:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Johannes Berg <johannes.berg@intel.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iwlwifi-next tree with the net tree
Message-ID: <20250903121032.744f5a30@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vFA.+KUkmTY1Y.hYLt71GnT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vFA.+KUkmTY1Y.hYLt71GnT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iwlwifi-next tree got a conflict in:

  drivers/net/wireless/intel/iwlwifi/fw/uefi.c

between commit:

  1d33694462fa ("wifi: iwlwifi: uefi: check DSM item validity")

from the net tree and commit:

  f53f2bd8fc5f ("wifi: iwlwifi: uefi: remove runtime check of constant valu=
es")

from the iwlwifi-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/intel/iwlwifi/fw/uefi.c
index 99a17b9323e9,44c7c565d1c6..000000000000
--- a/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
@@@ -742,17 -744,6 +744,12 @@@ int iwl_uefi_get_dsm(struct iwl_fw_runt
  		goto out;
  	}
 =20
- 	if (ARRAY_SIZE(data->functions) !=3D UEFI_MAX_DSM_FUNCS) {
- 		IWL_DEBUG_RADIO(fwrt, "Invalid size of DSM functions array\n");
- 		goto out;
- 	}
-=20
 +	if (!(data->functions[DSM_FUNC_QUERY] & BIT(func))) {
 +		IWL_DEBUG_RADIO(fwrt, "DSM func %d not in 0x%x\n",
 +				func, data->functions[DSM_FUNC_QUERY]);
 +		goto out;
 +	}
 +
  	*value =3D data->functions[func];
 =20
  	IWL_DEBUG_RADIO(fwrt,

--Sig_/vFA.+KUkmTY1Y.hYLt71GnT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi3o5gACgkQAVBC80lX
0Gzy9gf/SyE2EGxHKdHy25k2cH215YWFWPLaTY+u6fafMOJM2Fu4lLMJD9cjrFCb
mVXA/yWF4rNRCVUn3iMu3fqVKysUycGocYXEdSI7BBpcyd9jiIJqxTrD7kwsM/x/
m8pWcS4IdeIMsyxq0CTA6a2YmhElo9FERRFjXHtkJhOuuZdqWQWpRumKykpRJNOa
IFNzh6HYh8YVqMKOwM43Gav5aGXYm9tBkuuqE6OfG/hBpLChk1lv5ynVBiW6PNI5
KPJ2lNPI9+33bBm8PXhNcqu1dMDzSkQkmFL1rGu6tdpTIPjP0S9DQxR+Syt7B0YE
BM/7HLT6HpiCRZFP3rWq/09l1E+5jA==
=mhim
-----END PGP SIGNATURE-----

--Sig_/vFA.+KUkmTY1Y.hYLt71GnT--

