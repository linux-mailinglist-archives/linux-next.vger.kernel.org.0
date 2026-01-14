Return-Path: <linux-next+bounces-9650-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED0D1BF49
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 02:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C60A30142E7
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 01:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF72A2E1F02;
	Wed, 14 Jan 2026 01:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lGsEtsir"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7B2BEFFE;
	Wed, 14 Jan 2026 01:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354677; cv=none; b=HGrI/0kTjY+SySNva6p6ha340z+BPW4vr87fEQhCMg7c0Vkk05xdpu8sBzksiAAmQEypEIjS+A91tL6cfeVxmsg1XVbYws+bH6emdy7MIIzg+rF5FNXKUA0djYrtZQjLLU5BMoN0ISkoLYauO7K1ua/h17o4W0Esc/EazyAf1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354677; c=relaxed/simple;
	bh=k1uE3SEGqbo4yoyeKo0NnC1tqeIV2uVYnuAMec2N9VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BzKL/mc7r7lWO0rVCs7+UloVSL2ttwySA5FkTDCiEjDbI0hmYAfmkCULwrfJiimiWIOqj5UWFFpGmHWGb9yIgVYb0U1g2QNr5Gnz2CcZvUNX4YeD9xOUEgSxTGe7wXUPjGxTioJw7mhzSRI4SLRaZhQhub2M24/lL8/kzTcAXLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lGsEtsir; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768354673;
	bh=IQeDIqj8yqDMuZVPm/CJmcBQw60eLG8uKw9keDCBPIc=;
	h=Date:From:To:Cc:Subject:From;
	b=lGsEtsirMdeLQUpunQ9wsqkP5IrpNH+eDs+23H2jK+GGZ55lr3rswgJlDRem7wOYL
	 Orjz3AJQ8e9tN8GEx7wQhvmJBDwDeZMf+X//IlHybwavrKr35UaRcG/dBnLhHhjz7K
	 4ppy0C4gmENzwsOLX9lgeCqzQ+Jf8rijpR9vbAQv3EeN2mW4RmqwuWX+sntbYNY4qh
	 OZEiuKbz6FFG52dD2r5u40HQ1PPe0ysJoOhkZDtkjk4cBRLV8foRxZ21sV2mQUNou9
	 8U4ZGob5SmeZzcZVMa5a9Kljp0R+cbPD/XX1OcS7F1qxe7FnrY9DQ4A6HYFT65BpYC
	 N6P5H/YJJb6HQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drTJc5KJCz4wRG;
	Wed, 14 Jan 2026 12:37:51 +1100 (AEDT)
Date: Wed, 14 Jan 2026 12:37:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Ripan Deuri
 <quic_rdeuri@quicinc.com>, Yingying Tang <yingying.tang@oss.qualcomm.com>,
 Ath10k List <ath10k@lists.infradead.org>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the ath tree
Message-ID: <20260114123751.6a208818@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6tXw03ZjMuYvongKlANEsNe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6tXw03ZjMuYvongKlANEsNe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/mac.c

between commit:

  31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")

from the ath tree and commit:

  c26f294fef2a ("wifi: ath12k: Move ieee80211_ops callback to the arch spec=
ific module")

from the net-next tree.

I fixed it up (following the directions in commit 31707572108d, I used
the latter version of the above file and then added the following merge
fix patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Jan 2026 12:34:25 +1100
Subject: [PATCH] fix up for "wifi: ath12k: Move ieee80211_ops callback to t=
he
 arch specific module"

interacting with commit

  31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")

from the ath tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wirel=
ess/ath/ath12k/wifi7/hw.c
index 1f5dda73230d..8ac06b2fc18f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -705,7 +705,10 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw=
 *hw,
 			return;
 		}
 	} else {
-		link_id =3D 0;
+		if (vif->type =3D=3D NL80211_IFTYPE_P2P_DEVICE)
+			link_id =3D ATH12K_FIRST_SCAN_LINK;
+		else
+			link_id =3D 0;
 	}
=20
 	arvif =3D rcu_dereference(ahvif->link[link_id]);
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/6tXw03ZjMuYvongKlANEsNe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlm828ACgkQAVBC80lX
0GyDnQgAnw6XDBK7GRcPCnBeN6hNRB9efKv+FrXoh5Mn3RvCmgwzdsEi5ZCwVKB3
1S9jNtU7B/O0VM/dML9ICSL7gp3w5vNIlqAhuGh+jkgGsoDQ47LZzsc7gA+AtWQ3
r7VIAM8zzjx8rfvMQ2P4UadqmtQjg14WipeoquPbJrGcQnKWKOM23jjggvObxjBA
kjOHYxpeB7iM8Ccz4T4UCv8e+s37nIJsoO94I25roM/UUMaddbhgpiWiUTGWFKtO
jacJBCHR4ACkNwsPcYzsfszLb4quZ9rY2W+WwEbo4zeM9qQkVg9iYQ/e4EW+iCFS
0EphceDTlbEYtLHjTl59nRcx825ugg==
=seMT
-----END PGP SIGNATURE-----

--Sig_/6tXw03ZjMuYvongKlANEsNe--

