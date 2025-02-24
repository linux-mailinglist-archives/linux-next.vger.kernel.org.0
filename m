Return-Path: <linux-next+bounces-5536-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CF7A41315
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 03:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3881894D17
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 01:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5AB155CB3;
	Mon, 24 Feb 2025 01:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gHgxLdmb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865B315696E;
	Mon, 24 Feb 2025 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740362336; cv=none; b=bhEjNAWh8IUdeH8O0f7V2RWopfmw/Oq0GyleA9ggrUvNKryDToM1o8f+H0dlaAW2J8Crl/eSnEOlgGDo/aPactSb3ZmwHqeD90jP4M5fy05sdbE6h7Uj0bmekStY2Sq6w4Uz4YNRUIfIb4T6GAzK6X8/SYT7Z8ee/JIwl6O7zMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740362336; c=relaxed/simple;
	bh=ORlFFla8sC1IpgaS/KRaD+T3b765e/z0A+g0jIZemO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=naCFaQ1AWYK0G01dE4IPNuPsgxp880SmlQNX6R+nMT2FQXEp2tyuOUDXRticJ3VO5WgTpkqiYPCAhHcbUwalz6YiCbDgcpuo9ZKLraJBC2kg0irDIsLH4w5CpWmM93knSFTiVUR3u5a11h6j85YrFpaL85paGaEZVtLqkW6lbak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gHgxLdmb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740362330;
	bh=QUU/uAf5++LoUnqMdvxhIP8nL0SijKpkWviqlxn7xFY=;
	h=Date:From:To:Cc:Subject:From;
	b=gHgxLdmbp3i4D55NxYZ58AIzLG4Gly+dDXhewUykgAFRYXcTCRTkTNSc2iOs9z8JF
	 l0L61p8HSTWOTEwnus8Mw+RqG+mAAEpONEHAoWZBHbNwSgUVrwnoj08/d8u8jZigDc
	 9e8duQo0eCNEgNp6+Xxg2SRXJ2L/jHgJ+LqVpgdewm0yjt5CuATbTogfn1O6OHa+Bs
	 5DZG0nRSIE0SdL//8+AMVyg/mZ9KEKovcCmxPx1HmQ8svziKqB8eRQBjRkYfcMtOnt
	 o8CDZmWVNFeGnurteO9F3zaJgXNlobC5U/UfRGQ2l8ckFKG9fHH6IyN56r1IZvLCWw
	 3cVNY6tcCm5iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1P6L13zZz4wcj;
	Mon, 24 Feb 2025 12:58:49 +1100 (AEDT)
Date: Mon, 24 Feb 2025 12:58:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sean Anderson <sean.anderson@linux.dev>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250224125848.68ee63e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0UNaU7tt1dg19JS56+g3vVb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0UNaU7tt1dg19JS56+g3vVb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/cadence/macb_main.c

between commit:

  fa52f15c745c ("net: cadence: macb: Synchronize stats calculations")

from the net tree and commit:

  75696dd0fd72 ("net: cadence: macb: Convert to get_stats64")

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

diff --cc drivers/net/ethernet/cadence/macb_main.c
index c1f57d96e63f,5345f3e1a795..000000000000
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@@ -3096,16 -3108,12 +3110,13 @@@ static void gem_update_stats(struct mac
  			bp->ethtool_stats[idx++] =3D *stat;
  }
 =20
- static struct net_device_stats *gem_get_stats(struct macb *bp)
+ static void gem_get_stats(struct macb *bp, struct rtnl_link_stats64 *nsta=
t)
  {
  	struct gem_stats *hwstat =3D &bp->hw_stats.gem;
- 	struct net_device_stats *nstat =3D &bp->dev->stats;
-=20
- 	if (!netif_running(bp->dev))
- 		return nstat;
 =20
 +	spin_lock_irq(&bp->stats_lock);
- 	gem_update_stats(bp);
+ 	if (netif_running(bp->dev))
+ 		gem_update_stats(bp);
 =20
  	nstat->rx_errors =3D (hwstat->rx_frame_check_sequence_errors +
  			    hwstat->rx_alignment_errors +
@@@ -3134,9 -3142,6 +3145,7 @@@
  	nstat->tx_aborted_errors =3D hwstat->tx_excessive_collisions;
  	nstat->tx_carrier_errors =3D hwstat->tx_carrier_sense_errors;
  	nstat->tx_fifo_errors =3D hwstat->tx_underrun;
 +	spin_unlock_irq(&bp->stats_lock);
-=20
- 	return nstat;
  }
 =20
  static void gem_get_ethtool_stats(struct net_device *dev,
@@@ -3188,17 -3192,19 +3197,20 @@@ static void gem_get_ethtool_strings(str
  	}
  }
 =20
- static struct net_device_stats *macb_get_stats(struct net_device *dev)
+ static void macb_get_stats(struct net_device *dev,
+ 			   struct rtnl_link_stats64 *nstat)
  {
  	struct macb *bp =3D netdev_priv(dev);
- 	struct net_device_stats *nstat =3D &bp->dev->stats;
  	struct macb_stats *hwstat =3D &bp->hw_stats.macb;
 =20
- 	if (macb_is_gem(bp))
- 		return gem_get_stats(bp);
+ 	netdev_stats_to_stats64(nstat, &bp->dev->stats);
+ 	if (macb_is_gem(bp)) {
+ 		gem_get_stats(bp, nstat);
+ 		return;
+ 	}
 =20
  	/* read stats from hardware */
 +	spin_lock_irq(&bp->stats_lock);
  	macb_update_stats(bp);
 =20
  	/* Convert HW stats into netdevice stats */
@@@ -3232,9 -3238,154 +3244,155 @@@
  	nstat->tx_carrier_errors =3D hwstat->tx_carrier_errors;
  	nstat->tx_fifo_errors =3D hwstat->tx_underruns;
  	/* Don't know about heartbeat or window errors... */
 +	spin_unlock_irq(&bp->stats_lock);
+ }
 =20
- 	return nstat;
+ static void macb_get_pause_stats(struct net_device *dev,
+ 				 struct ethtool_pause_stats *pause_stats)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct macb_stats *hwstat =3D &bp->hw_stats.macb;
+=20
+ 	macb_update_stats(bp);
+ 	pause_stats->tx_pause_frames =3D hwstat->tx_pause_frames;
+ 	pause_stats->rx_pause_frames =3D hwstat->rx_pause_frames;
+ }
+=20
+ static void gem_get_pause_stats(struct net_device *dev,
+ 				struct ethtool_pause_stats *pause_stats)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct gem_stats *hwstat =3D &bp->hw_stats.gem;
+=20
+ 	gem_update_stats(bp);
+ 	pause_stats->tx_pause_frames =3D hwstat->tx_pause_frames;
+ 	pause_stats->rx_pause_frames =3D hwstat->rx_pause_frames;
+ }
+=20
+ static void macb_get_eth_mac_stats(struct net_device *dev,
+ 				   struct ethtool_eth_mac_stats *mac_stats)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct macb_stats *hwstat =3D &bp->hw_stats.macb;
+=20
+ 	macb_update_stats(bp);
+ 	mac_stats->FramesTransmittedOK =3D hwstat->tx_ok;
+ 	mac_stats->SingleCollisionFrames =3D hwstat->tx_single_cols;
+ 	mac_stats->MultipleCollisionFrames =3D hwstat->tx_multiple_cols;
+ 	mac_stats->FramesReceivedOK =3D hwstat->rx_ok;
+ 	mac_stats->FrameCheckSequenceErrors =3D hwstat->rx_fcs_errors;
+ 	mac_stats->AlignmentErrors =3D hwstat->rx_align_errors;
+ 	mac_stats->FramesWithDeferredXmissions =3D hwstat->tx_deferred;
+ 	mac_stats->LateCollisions =3D hwstat->tx_late_cols;
+ 	mac_stats->FramesAbortedDueToXSColls =3D hwstat->tx_excessive_cols;
+ 	mac_stats->FramesLostDueToIntMACXmitError =3D hwstat->tx_underruns;
+ 	mac_stats->CarrierSenseErrors =3D hwstat->tx_carrier_errors;
+ 	mac_stats->FramesLostDueToIntMACRcvError =3D hwstat->rx_overruns;
+ 	mac_stats->InRangeLengthErrors =3D hwstat->rx_length_mismatch;
+ 	mac_stats->FrameTooLongErrors =3D hwstat->rx_oversize_pkts;
+ }
+=20
+ static void gem_get_eth_mac_stats(struct net_device *dev,
+ 				  struct ethtool_eth_mac_stats *mac_stats)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct gem_stats *hwstat =3D &bp->hw_stats.gem;
+=20
+ 	gem_update_stats(bp);
+ 	mac_stats->FramesTransmittedOK =3D hwstat->tx_frames;
+ 	mac_stats->SingleCollisionFrames =3D hwstat->tx_single_collision_frames;
+ 	mac_stats->MultipleCollisionFrames =3D
+ 		hwstat->tx_multiple_collision_frames;
+ 	mac_stats->FramesReceivedOK =3D hwstat->rx_frames;
+ 	mac_stats->FrameCheckSequenceErrors =3D
+ 		hwstat->rx_frame_check_sequence_errors;
+ 	mac_stats->AlignmentErrors =3D hwstat->rx_alignment_errors;
+ 	mac_stats->OctetsTransmittedOK =3D hwstat->tx_octets;
+ 	mac_stats->FramesWithDeferredXmissions =3D hwstat->tx_deferred_frames;
+ 	mac_stats->LateCollisions =3D hwstat->tx_late_collisions;
+ 	mac_stats->FramesAbortedDueToXSColls =3D hwstat->tx_excessive_collisions;
+ 	mac_stats->FramesLostDueToIntMACXmitError =3D hwstat->tx_underrun;
+ 	mac_stats->CarrierSenseErrors =3D hwstat->tx_carrier_sense_errors;
+ 	mac_stats->OctetsReceivedOK =3D hwstat->rx_octets;
+ 	mac_stats->MulticastFramesXmittedOK =3D hwstat->tx_multicast_frames;
+ 	mac_stats->BroadcastFramesXmittedOK =3D hwstat->tx_broadcast_frames;
+ 	mac_stats->MulticastFramesReceivedOK =3D hwstat->rx_multicast_frames;
+ 	mac_stats->BroadcastFramesReceivedOK =3D hwstat->rx_broadcast_frames;
+ 	mac_stats->InRangeLengthErrors =3D hwstat->rx_length_field_frame_errors;
+ 	mac_stats->FrameTooLongErrors =3D hwstat->rx_oversize_frames;
+ }
+=20
+ /* TODO: Report SQE test errors when added to phy_stats */
+ static void macb_get_eth_phy_stats(struct net_device *dev,
+ 				   struct ethtool_eth_phy_stats *phy_stats)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct macb_stats *hwstat =3D &bp->hw_stats.macb;
+=20
+ 	macb_update_stats(bp);
+ 	phy_stats->SymbolErrorDuringCarrier =3D hwstat->rx_symbol_errors;
+ }
+=20
+ static void gem_get_eth_phy_stats(struct net_device *dev,
+ 				  struct ethtool_eth_phy_stats *phy_stats)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct gem_stats *hwstat =3D &bp->hw_stats.gem;
+=20
+ 	gem_update_stats(bp);
+ 	phy_stats->SymbolErrorDuringCarrier =3D hwstat->rx_symbol_errors;
+ }
+=20
+ static void macb_get_rmon_stats(struct net_device *dev,
+ 				struct ethtool_rmon_stats *rmon_stats,
+ 				const struct ethtool_rmon_hist_range **ranges)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct macb_stats *hwstat =3D &bp->hw_stats.macb;
+=20
+ 	macb_update_stats(bp);
+ 	rmon_stats->undersize_pkts =3D hwstat->rx_undersize_pkts;
+ 	rmon_stats->oversize_pkts =3D hwstat->rx_oversize_pkts;
+ 	rmon_stats->jabbers =3D hwstat->rx_jabbers;
+ }
+=20
+ static const struct ethtool_rmon_hist_range gem_rmon_ranges[] =3D {
+ 	{   64,    64 },
+ 	{   65,   127 },
+ 	{  128,   255 },
+ 	{  256,   511 },
+ 	{  512,  1023 },
+ 	{ 1024,  1518 },
+ 	{ 1519, 16384 },
+ 	{ },
+ };
+=20
+ static void gem_get_rmon_stats(struct net_device *dev,
+ 			       struct ethtool_rmon_stats *rmon_stats,
+ 			       const struct ethtool_rmon_hist_range **ranges)
+ {
+ 	struct macb *bp =3D netdev_priv(dev);
+ 	struct gem_stats *hwstat =3D &bp->hw_stats.gem;
+=20
+ 	gem_update_stats(bp);
+ 	rmon_stats->undersize_pkts =3D hwstat->rx_undersized_frames;
+ 	rmon_stats->oversize_pkts =3D hwstat->rx_oversize_frames;
+ 	rmon_stats->jabbers =3D hwstat->rx_jabbers;
+ 	rmon_stats->hist[0] =3D hwstat->rx_64_byte_frames;
+ 	rmon_stats->hist[1] =3D hwstat->rx_65_127_byte_frames;
+ 	rmon_stats->hist[2] =3D hwstat->rx_128_255_byte_frames;
+ 	rmon_stats->hist[3] =3D hwstat->rx_256_511_byte_frames;
+ 	rmon_stats->hist[4] =3D hwstat->rx_512_1023_byte_frames;
+ 	rmon_stats->hist[5] =3D hwstat->rx_1024_1518_byte_frames;
+ 	rmon_stats->hist[6] =3D hwstat->rx_greater_than_1518_byte_frames;
+ 	rmon_stats->hist_tx[0] =3D hwstat->tx_64_byte_frames;
+ 	rmon_stats->hist_tx[1] =3D hwstat->tx_65_127_byte_frames;
+ 	rmon_stats->hist_tx[2] =3D hwstat->tx_128_255_byte_frames;
+ 	rmon_stats->hist_tx[3] =3D hwstat->tx_256_511_byte_frames;
+ 	rmon_stats->hist_tx[4] =3D hwstat->tx_512_1023_byte_frames;
+ 	rmon_stats->hist_tx[5] =3D hwstat->tx_1024_1518_byte_frames;
+ 	rmon_stats->hist_tx[6] =3D hwstat->tx_greater_than_1518_byte_frames;
+ 	*ranges =3D gem_rmon_ranges;
  }
 =20
  static int macb_get_regs_len(struct net_device *netdev)

--Sig_/0UNaU7tt1dg19JS56+g3vVb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme70lgACgkQAVBC80lX
0GzbMAf9F8infYGSg4z0wZAzJCJEQ1EV7KmE16Urixg/tsmekjzPWR3ychvF5jVs
ATEQMkhDA7WClxQVLQuu1IwsJDPCgLMgzPg6BAL5NbwqNiruSWZJBD221rFo2qrb
dQcbQj109sK2W0d9mukf2wPyauDJFsWH6bht549/qDDV5IvfiP+g/mwTyFoPtXil
McK4L4hPiIcV1y8v7oxbEWqgNzVetFjxUasZCwMIYzus9aDVvS+K37hk4gCg07YJ
xLRy3a1T/zJSulbvJOr9E1O5aPc0bIOCL4gOcymMNvPsKu8XxRWLadEzw99Ofhqa
w+gNzSLV6+IFRGzKkz1jitI7UHapJw==
=pAt5
-----END PGP SIGNATURE-----

--Sig_/0UNaU7tt1dg19JS56+g3vVb--

