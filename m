Return-Path: <linux-next+bounces-8387-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC0B89871
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 14:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B856205C5
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 12:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F083C237707;
	Fri, 19 Sep 2025 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBefYxC7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57AB226D0C;
	Fri, 19 Sep 2025 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285952; cv=none; b=LO3KrXByppicRBXq1sKByWdUksEin1LNf9x5JJDnlmge1fZETm1H9OWhB0cZ3lMPrrMx1ieGoKXILYkGIiFJC9ja1XqN2KDOBlBeU+4iuYNJk5WHIjyoGUk9Ezw5mMER5rxz1LOYcC2sORCI4ReIW8ank6aR0b1AqzWtYtl6HV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285952; c=relaxed/simple;
	bh=hLgN36Vmop0pX03tZn5+phL+l55fyPTTzrn9wKdIW8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2GxLAURFTnNbqFZIscG5KkgyNH1+vvgnK7khG4VmuLInh5S1GUWi4yQyArNdaM+h0AbN3lZoAmjHm9BEAWMyjjfxge2J+TSFKohiLvU7JxxUifrDSUiKcuk7WHBRwsAVYHMKhKcjvjNk+MgbcIcvyxgBxwXgrwF/+a3X+veoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBefYxC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A45C4CEFB;
	Fri, 19 Sep 2025 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758285952;
	bh=hLgN36Vmop0pX03tZn5+phL+l55fyPTTzrn9wKdIW8g=;
	h=Date:From:To:Cc:Subject:From;
	b=OBefYxC7UxYF71jqkxsGstzmHXzIrlfGP+kwca4ApZmxQko2EQPHokXO7G074MTGj
	 CvYrVSexgayHGXuf87Q6qpoZpN1YqkMS2npesokB+MKryim6pzuVDV+mGzLgU0c6Yb
	 63GkFYkrr5cbyc41Q/zcdMwWm9/PHdk83SN9hS0qqP0KYuGW1RZUKZQPnXhN1rOTt6
	 Rv838BO+99BNsIfaDqwB2NNCMthO3Vu+CIXuyaGbTejrsfnwUjcwlxXHa9DmL1SH+F
	 nL/k26aGOp8EqihZtEUR7ZXJg0GTXDUM9t1J+s3a6xwdbrFGTcVtOQo0k0tN2ICi6x
	 7k7ZYV/lDYgiw==
Date: Fri, 19 Sep 2025 13:45:47 +0100
From: Mark Brown <broonie@kernel.org>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>
Cc: Anantha Prabhu <anantha.prabhu@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Saravanan Vajravel <saravanan.vajravel@broadcom.com>
Subject: linux-next: manual merge of the net-next tree with the rdma tree
Message-ID: <aM1Qe17qO6zCxkpS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kVAAyrlqOOWrZAjP"
Content-Disposition: inline


--kVAAyrlqOOWrZAjP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/broadcom/bnxt/bnxt.c

between commit:

  217156bb70afb ("bnxt_en: Enhance stats context reservation logic")

=66rom the rdma tree and commit:

  48e619627832c ("bnxt_en: Support for RoCE resources dynamically shared wi=
thin VFs.")

=66rom the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 872c361700b73,d59612d1e1760..0000000000000
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@@ -9690,8 -9703,8 +9703,10 @@@ static int __bnxt_hwrm_func_qcaps(struc
  		bp->fw_cap |=3D BNXT_FW_CAP_ROCE_VF_RESC_MGMT_SUPPORTED;
 =20
  	flags_ext3 =3D le32_to_cpu(resp->flags_ext3);
 +	if (flags_ext3 & FUNC_QCAPS_RESP_FLAGS_EXT3_MIRROR_ON_ROCE_SUPPORTED)
 +		bp->fw_cap |=3D BNXT_FW_CAP_MIRROR_ON_ROCE;
+ 	if (flags_ext3 & FUNC_QCAPS_RESP_FLAGS_EXT3_ROCE_VF_DYN_ALLOC_SUPPORT)
+ 		bp->fw_cap |=3D BNXT_FW_CAP_ROCE_VF_DYN_ALLOC_SUPPORT;
 =20
  	bp->tx_push_thresh =3D 0;
  	if ((flags & FUNC_QCAPS_RESP_FLAGS_PUSH_MODE_SUPPORTED) &&

--kVAAyrlqOOWrZAjP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNUHoACgkQJNaLcl1U
h9D4tgf/dkG+5cUsYK+z4xkb9V2+U/NrThKn/Iwb/fb4x1S9nFFhLDsalRwsOK5U
WrpkNQ7XBVgRJ3b19960vtysKLzv9NoGl5SIq8C7n4vNImKUO8orzoKSmxvM/4eX
+3oSLPzWjqx2lSZNvKXAdPXFj+CMMd5DuDZoAGScBZbG4GNVH739wVaeQxQesAWD
xhgMg+UkIi68IUfj16u9cB3ZeOg4vDyb719DbuyNd+LKT4sM6C0QU9sQK+zba2v2
ZX3Oo/qb1IRiudKEBHBji2CoEtZJYmho0sL2AYPdHP2s5dcivXGoYNPj0S/m/hRP
W5hp+qEXDZcps2K7XLkyXv1/9fUWww==
=Ijnt
-----END PGP SIGNATURE-----

--kVAAyrlqOOWrZAjP--

