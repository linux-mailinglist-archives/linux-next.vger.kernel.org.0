Return-Path: <linux-next+bounces-4531-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EC9B58EF
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 02:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2211B22970
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 01:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23095770F5;
	Wed, 30 Oct 2024 01:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g9yqBDQP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78EB3C14;
	Wed, 30 Oct 2024 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730250336; cv=none; b=TugpjQhKXTL3dd9qXQFWFquuyitQjhyYjKyojVzrfzmfGS0oeOQ1pSi+ZxJv9/IoF9WcKFEQOXt/NuSe0VVbyZS9+A8/stPtfcg4btkLRij8e1s+TKNFH/EaqTuGN9eJjD0ebIyid2FnIRVIrXnbds7oGhltEY2AJGqanGyX8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730250336; c=relaxed/simple;
	bh=O3eyHCxMcdQ467ALRIumPj1rNupJxrZMOTcaSjzwyvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XLPo5YOg6rIxR+1X85aOioCtNybE+w66jCT03mfOlBNRCxTbIFl/FuJCWpzkK1wx3xZ4T7nU+kfx/k6e3ZgVV7EV8+oAEZd3Jp2hSDEdH3iiiDd9+Y+iIBMUi/jDEJuH3QrYKqnj35O66JBxUlcYOuG3gupgV+sLeJ9FhP0gRJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g9yqBDQP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730250326;
	bh=rJ+zeOXAOkv0gwsLv1luKB4UBmUC3jKRnaMznn+sZ54=;
	h=Date:From:To:Cc:Subject:From;
	b=g9yqBDQPWwHheAUZ1cogWboY7xJXsw0x2PmCquxMdLczVOBfdPD73Ost6vd7EQpcF
	 2fmWJ1esTB317UqFZQ6c6MbFa72Z/uAir43LY2oMfy43sw5H/+vSQd8WtgCpQOosoU
	 gQUj40PmZ+2q8kIL/Xxd0kMUCyvu+sZsE7rN56uWWy3u7U4HCyQ6MgpCMF+S+8ktHs
	 WBYeIZnYLKLZi7K61dsJ92CnsXNYrR4uj96oqZ5WzF5OS90hjNmaJHTbWeoibGJXPy
	 XWliswlp3jibsoaqpSF58fn3p2puWWx6SkwKiWCx12UMzu8/H2z3ZMaSOENShyNBO8
	 XXQ1mGBuV/dpg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdTSj0Xl7z4xFt;
	Wed, 30 Oct 2024 12:05:23 +1100 (AEDT)
Date: Wed, 30 Oct 2024 12:05:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Arkadiusz Kubalewski
 <arkadiusz.kubalewski@intel.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Yochai Hagvi <yochai.hagvi@intel.com>, Yue Haibing <yuehaibing@huawei.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20241030120524.1ee1af18@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qQcC7M9W10_+AKldn1crROG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qQcC7M9W10_+AKldn1crROG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/intel/ice/ice_ptp_hw.h

between commit:

  6e58c3310622 ("ice: fix crash on probe for DPLL enabled E810 LOM")

from the net tree and commits:

  e4291b64e118 ("ice: Align E810T GPIO to other products")
  ebb2693f8fbd ("ice: Read SDP section from NVM for pin definitions")
  ac532f4f4251 ("ice: Cleanup unused declarations")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/intel/ice/ice_ptp_hw.h
index 6cedc1a906af,656daff3447e..000000000000
--- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.h
+++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.h
@@@ -400,11 -402,10 +402,11 @@@ int ice_phy_cfg_rx_offset_e82x(struct i
  int ice_phy_cfg_intr_e82x(struct ice_hw *hw, u8 quad, bool ena, u8 thresh=
old);
 =20
  /* E810 family functions */
- int ice_read_sma_ctrl_e810t(struct ice_hw *hw, u8 *data);
- int ice_write_sma_ctrl_e810t(struct ice_hw *hw, u8 data);
- int ice_read_pca9575_reg_e810t(struct ice_hw *hw, u8 offset, u8 *data);
- bool ice_is_pca9575_present(struct ice_hw *hw);
+ int ice_read_sma_ctrl(struct ice_hw *hw, u8 *data);
+ int ice_write_sma_ctrl(struct ice_hw *hw, u8 data);
+ int ice_read_pca9575_reg(struct ice_hw *hw, u8 offset, u8 *data);
+ int ice_ptp_read_sdp_ac(struct ice_hw *hw, __le16 *entries, uint *num_ent=
ries);
 +int ice_cgu_get_num_pins(struct ice_hw *hw, bool input);
  enum dpll_pin_type ice_cgu_get_pin_type(struct ice_hw *hw, u8 pin, bool i=
nput);
  struct dpll_pin_frequency *
  ice_cgu_get_pin_freq_supp(struct ice_hw *hw, u8 pin, bool input, u8 *num);

--Sig_/qQcC7M9W10_+AKldn1crROG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmchhlQACgkQAVBC80lX
0GzxWQf/Z3ukUS5tXbrpV+AFp0cF9uL7oxqvq3A/tmSCOBBFnBT8GrbSPyn9Iggq
RBgNBOnMX3dc3gCxF62IQphDRwMm/OXHtW568uRhJPdMKC/BVtXXD9/GbUo907il
IwqOBo9Bhk9iZrFnr00kYTwMfj4f5lyLcfxW9lInXioyGttMhDnotthzwrTxNHsZ
HPB7vHmK0nVLxdEXHM52jdnzQdDpfYYnkRsThm8lSujvvJaulgeew0teZkc7Yr7e
986Wa5x1kNd24bbX1Ma3RxkAUsLB2WIqBit36maNIHgyCk+Hi8NWvVrwfpFI10do
vmFQ+s2oOKvDF4n4/NBMaCb08l8QMQ==
=n2/n
-----END PGP SIGNATURE-----

--Sig_/qQcC7M9W10_+AKldn1crROG--

