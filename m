Return-Path: <linux-next+bounces-7601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F27B084B2
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 08:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788FC581C64
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 06:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13A51FCFEE;
	Thu, 17 Jul 2025 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V8+TY+rG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39ED86348;
	Thu, 17 Jul 2025 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752732955; cv=none; b=cp6g2h/3FQ9R0IOrjVM6acbCuOr0UnOMQ+tUjPmMIkb+Kvy9/WCNUorhmrY+2C9lH9PgmWYJiRibF8jRttRSj/pYRSWxX0Uum/G/AiElZm0jAQLG+KPaBpE5DFSmcAoyM3Rk14nu3vvNVsv7t7gRoDRlANMXDOYlrdq6gfvm2uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752732955; c=relaxed/simple;
	bh=Rs3PQs9UhDCFrFotyWbNQEWehdMmELxoeAVZOl53eXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eW4sDUFr3xs5eNkmqbTumG2IFGWY57XrL3OmqfIqnlQe8aeTmSpyO1UUJeTdAm81p5LBytU/w2jNsjXV6MltSNXAxHf0oycuUoTPle0+coQp7ZS17gfdtpxJ7c2iuGEAoOYKI0Yf03YZGqnggUj4A6ezhX8stflPAhQ660BQ188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V8+TY+rG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752732826;
	bh=K3xgEak+/uBJv4EPnVQgmEJ/TuEh2d0PsQc0FFVJjB8=;
	h=Date:From:To:Cc:Subject:From;
	b=V8+TY+rGeaATwRvwoGurD6pIyTJV2WDsUDY2Dd52xhR6Qbs5wK7neR5emKTUYOfAs
	 luKckmAryvJ0GJ+oWHDwfEO+UpT+F2wMZx7CodgmglfxuI7sRYu5SBcrab6xIdwPcH
	 o8edBDW29NGWvTNck6i6mBYjrWpctsCuIWC4aKIbu+IIRpP7x10JoVkKeNRqY6ldl/
	 uUsBbuKcj2Imh36XqeaugNwu6yVbXZsb/ga4jdm8vh8lNE00Je3vvyE7QBRi8cSZ5s
	 Zq2fnmEVkMJGLOQ6B32Odpn4ulVhQNLGKbDQia2YsTOG7r3QPvxafaO5QYjnReymH0
	 4CaTXICuKZM1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjN0T2LH2z4xPd;
	Thu, 17 Jul 2025 16:13:45 +1000 (AEST)
Date: Thu, 17 Jul 2025 16:15:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vhost tree with the net-next tree
Message-ID: <20250717161546.52ab1a3c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K1gPLhNMBx1BU9YXcX/evGE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K1gPLhNMBx1BU9YXcX/evGE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got conflicts in:

  drivers/vhost/net.c
  include/uapi/linux/vhost.h

between commits:

  333c515d1896 ("vhost-net: allow configuring extended features")
  bbca931fce26 ("vhost/net: enable gso over UDP tunnel support.")

from the net-next tree and commits:

  3206300e7af0 ("vhost: Reintroduce kthread API and add mode selection")
  3f466fdc0b91 ("vhost_net: basic in_order support")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/vhost/net.c
index bfb774c273ea,8ac994b3228a..6edac0c1ba9b
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@@ -69,14 -69,13 +69,15 @@@ MODULE_PARM_DESC(experimental_zcopytx,=20
 =20
  #define VHOST_DMA_IS_DONE(len) ((__force u32)(len) >=3D (__force u32)VHOS=
T_DMA_DONE_LEN)
 =20
 -enum {
 -	VHOST_NET_FEATURES =3D VHOST_FEATURES |
 -			 (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
 -			 (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
 -			 (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
 -			 (1ULL << VIRTIO_F_RING_RESET) |
 -			 (1ULL << VIRTIO_F_IN_ORDER)
 +static const u64 vhost_net_features[VIRTIO_FEATURES_DWORDS] =3D {
 +	VHOST_FEATURES |
 +	(1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
 +	(1ULL << VIRTIO_NET_F_MRG_RXBUF) |
 +	(1ULL << VIRTIO_F_ACCESS_PLATFORM) |
- 	(1ULL << VIRTIO_F_RING_RESET),
++	(1ULL << VIRTIO_F_RING_RESET) |
++	(1ULL << VIRTIO_F_IN_ORDER),
 +	VIRTIO_BIT(VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) |
 +	VIRTIO_BIT(VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO),
  };
 =20
  enum {
diff --cc include/uapi/linux/vhost.h
index d6ad01fbb8d2,e72f2655459e..c57674a6aa0d
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@@ -236,10 -236,32 +236,38 @@@
  #define VHOST_VDPA_GET_VRING_SIZE	_IOWR(VHOST_VIRTIO, 0x82,	\
  					      struct vhost_vring_state)
 =20
 +/* Extended features manipulation */
 +#define VHOST_GET_FEATURES_ARRAY _IOR(VHOST_VIRTIO, 0x83, \
 +				       struct vhost_features_array)
 +#define VHOST_SET_FEATURES_ARRAY _IOW(VHOST_VIRTIO, 0x83, \
 +				       struct vhost_features_array)
 +
+ /* fork_owner values for vhost */
+ #define VHOST_FORK_OWNER_KTHREAD 0
+ #define VHOST_FORK_OWNER_TASK 1
+=20
+ /**
+  * VHOST_SET_FORK_FROM_OWNER - Set the fork_owner flag for the vhost devi=
ce,
+  * This ioctl must called before VHOST_SET_OWNER.
+  * Only available when CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL=3Dy
+  *
+  * @param fork_owner: An 8-bit value that determines the vhost thread mode
+  *
+  * When fork_owner is set to VHOST_FORK_OWNER_TASK(default value):
+  *   - Vhost will create vhost worker as tasks forked from the owner,
+  *     inheriting all of the owner's attributes.
+  *
+  * When fork_owner is set to VHOST_FORK_OWNER_KTHREAD:
+  *   - Vhost will create vhost workers as kernel threads.
+  */
 -#define VHOST_SET_FORK_FROM_OWNER _IOW(VHOST_VIRTIO, 0x83, __u8)
++#define VHOST_SET_FORK_FROM_OWNER _IOW(VHOST_VIRTIO, 0x84, __u8)
+=20
+ /**
+  * VHOST_GET_FORK_OWNER - Get the current fork_owner flag for the vhost d=
evice.
+  * Only available when CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL=3Dy
+  *
+  * @return: An 8-bit value indicating the current thread mode.
+  */
 -#define VHOST_GET_FORK_FROM_OWNER _IOR(VHOST_VIRTIO, 0x84, __u8)
++#define VHOST_GET_FORK_FROM_OWNER _IOR(VHOST_VIRTIO, 0x85, __u8)
+=20
  #endif

--Sig_/K1gPLhNMBx1BU9YXcX/evGE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4lRIACgkQAVBC80lX
0GyKwgf7BygJxuuUgUzyl5GogIMXHVgZArO64PurUH7IJEE8ZQ4zRZ7/88n/tQSm
/udTpezjmA/F5Jy9sKsCvKPc2ivEU6wQppo7ki+Q9AtGgU9LDe6srp4ea/mCG2bg
bDOd+JR5kzVZHdjP0KSri+JRuqCUbC37hEmhRXr3fgX+toD7iuHEAOLksxAMZfCg
zfSznaGe9aUCLetwITuuwgPOW9KjQL2N1O3ttl8fNDXbeZUfRid1VROugESTEduE
PP+6npFcQ6MXd00nfnHFhtBfnHBKzwOvut7DmooTiMxkh5jAdQH7dtpt1+N2TT0E
K03LE5/DdY++guCqKjtzFY6FODmq9A==
=ctr3
-----END PGP SIGNATURE-----

--Sig_/K1gPLhNMBx1BU9YXcX/evGE--

