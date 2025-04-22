Return-Path: <linux-next+bounces-6305-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5615CA95D14
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 06:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C49177CEB
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 04:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEE81A5B95;
	Tue, 22 Apr 2025 04:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="caMLxa+y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2DA84037;
	Tue, 22 Apr 2025 04:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745297009; cv=none; b=JeZmnkKfpevIp7n1Ps50FfwQLrf92O8+bhZMTvw2fm+uuLBAcumBVTkH+tU+xRzgpgEc4eYDGjJ+eQOMR1bPxNb4kCUs97fq9T0kYuFMbsa/Qc6BR2wMc5M+78uOuCMu3vMWINqGk2b+QFXc+5624AjNwO9HIZSpJr4nhoBBXDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745297009; c=relaxed/simple;
	bh=cIJNzMEIDKoryJ+eYDRjEgaB0KWn13DZftu4jSYcsDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dLpTat/fMCWAGwMKGgmOmuCIsUFYmg/Wb9F0GNsURJ01DxiAhrHAoZ8BTaeirk9ZpIHjrDOA00ZJuD4Iz/+LX9Jdkbi1nIINnfCumZ4nLmHTsMPAP4WaX55lr9RXuNLFvTMeq4s2fsxzKiv/iBvmUmdKEy/6532gCJoDZzJzdrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=caMLxa+y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745297004;
	bh=x/V8mgLMaM86zSbH6IOCdZUmXJC7Sa7oNTQpygjxKR0=;
	h=Date:From:To:Cc:Subject:From;
	b=caMLxa+yEYNWUGis7sS8V+sue03q5/EPhxJiiQEUYFQTjJs+VPo5wLmf08qPP8FzL
	 gfilNZYZ7UwVoCbC40CcpW28Y0TYd8OWDiAemRO8daKuwWZFt06mEl1z4wOjEaPJs6
	 DHVAaL9RbgonQ28D0ezdTlwILj/wm3WVQCmwn7uwKdmzdSutImIC2qJBbQb7YT5C/J
	 NlPoL03J94JpNQLQF0ysIgxjm4KMU+sDTIdEBXPI3f9oAhwJUtLO1XLmZ6aJSA8Jjf
	 15AQzyHFt8ZeTedcLrpe/9ej1ZFrymeUjpWfkRhPGJLQEXzB8b74sdkvJU0VUpBMpq
	 7zzjFP2fsLrBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhV3t5LRTz4wbv;
	Tue, 22 Apr 2025 14:43:22 +1000 (AEST)
Date: Tue, 22 Apr 2025 14:43:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steffen Klassert <steffen.klassert@secunet.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Cosmin Ratiu <cratiu@nvidia.com>,
 Jedrzej Jagielski <jedrzej.jagielski@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: linux-next: manual merge of the ipsec-next tree with the net-next
 tree
Message-ID: <20250422144321.3879d891@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KAlLMN++vdMLUAeZRmSCexe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KAlLMN++vdMLUAeZRmSCexe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ipsec-next tree got a conflict in:

  drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.c

between commit:

  fd5ef5203ce6 ("ixgbe: wrap netdev_priv() usage")

from the net-next tree and commit:

  43eca05b6a3b ("xfrm: Add explicit dev to .xdo_dev_state_{add,delete,free}=
")

from the ipsec-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.c
index 648a7c618cd1,796e90d741f0..000000000000
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.c
@@@ -473,12 -474,13 +474,13 @@@ static int ixgbe_ipsec_parse_proto_keys
 =20
  /**
   * ixgbe_ipsec_check_mgmt_ip - make sure there is no clash with mgmt IP f=
ilters
+  * @dev: pointer to net device
   * @xs: pointer to transformer state struct
   **/
- static int ixgbe_ipsec_check_mgmt_ip(struct xfrm_state *xs)
+ static int ixgbe_ipsec_check_mgmt_ip(struct net_device *dev,
+ 				     struct xfrm_state *xs)
  {
- 	struct net_device *dev =3D xs->xso.real_dev;
 -	struct ixgbe_adapter *adapter =3D netdev_priv(dev);
 +	struct ixgbe_adapter *adapter =3D ixgbe_from_netdev(dev);
  	struct ixgbe_hw *hw =3D &adapter->hw;
  	u32 mfval, manc, reg;
  	int num_filters =3D 4;
@@@ -559,11 -562,11 +562,11 @@@
   * @xs: pointer to transformer state struct
   * @extack: extack point to fill failure reason
   **/
- static int ixgbe_ipsec_add_sa(struct xfrm_state *xs,
+ static int ixgbe_ipsec_add_sa(struct net_device *dev,
+ 			      struct xfrm_state *xs,
  			      struct netlink_ext_ack *extack)
  {
- 	struct net_device *dev =3D xs->xso.real_dev;
 -	struct ixgbe_adapter *adapter =3D netdev_priv(dev);
 +	struct ixgbe_adapter *adapter =3D ixgbe_from_netdev(dev);
  	struct ixgbe_ipsec *ipsec =3D adapter->ipsec;
  	struct ixgbe_hw *hw =3D &adapter->hw;
  	int checked, match, first;
@@@ -752,12 -755,12 +755,12 @@@
 =20
  /**
   * ixgbe_ipsec_del_sa - clear out this specific SA
+  * @dev: pointer to device to program
   * @xs: pointer to transformer state struct
   **/
- static void ixgbe_ipsec_del_sa(struct xfrm_state *xs)
+ static void ixgbe_ipsec_del_sa(struct net_device *dev, struct xfrm_state =
*xs)
  {
- 	struct net_device *dev =3D xs->xso.real_dev;
 -	struct ixgbe_adapter *adapter =3D netdev_priv(dev);
 +	struct ixgbe_adapter *adapter =3D ixgbe_from_netdev(dev);
  	struct ixgbe_ipsec *ipsec =3D adapter->ipsec;
  	struct ixgbe_hw *hw =3D &adapter->hw;
  	u32 zerobuf[4] =3D {0, 0, 0, 0};

--Sig_/KAlLMN++vdMLUAeZRmSCexe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHHmkACgkQAVBC80lX
0GxfTwf/Tp5JFrCRD3u1I2Gxi6078i2u9lI6bwoUeDXv990pGj636CulyOfb5LAt
ybQbM8HvehnLlEYBb9bydE8jvtXqwilQTO3bcV1GtsS+rfS7ZrEGkA9npTu3my/A
u5GulN8s1pLZy5zdkp58+QYRT8lWblGVFmcdgUx/sbD24dZyNxDkkScJXHsPun0n
DUV0aOVbwXZYP+6r7TBFC0zj1Onmk4I4w61D3HKcQOMtztmLzVZq74uQB5MIbcFS
nbn76ScwIqro5UP/Zse6OH/+14h34UVWulqc7lDJw+FmqjGQ3VWz+WnkL/rR1yWZ
ua1JJL9D8z2zl2LH5/uKh+zqHa8TbQ==
=BrvK
-----END PGP SIGNATURE-----

--Sig_/KAlLMN++vdMLUAeZRmSCexe--

