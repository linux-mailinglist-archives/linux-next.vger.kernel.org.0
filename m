Return-Path: <linux-next+bounces-9231-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B140EC8C63C
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 00:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A65184E2CE5
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 23:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB4C3009C8;
	Wed, 26 Nov 2025 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XSyCVcI5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23F12F7446;
	Wed, 26 Nov 2025 23:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201297; cv=none; b=L+ZBO8N69i6xOaof8o8QKlt9X8S32r4JzCDKE3ZWaTc9C6sLZhExSziNB1/rf5RLyh3JCrQDi2V72plRg3QlWhwqSrgLcBNb+iNZsyIiBrRS2Z4rIXNKw7z7+CvNL9zVXD4sGQlRrO5DqI8gK1oIOHC+NELpW0mDg0NGS9MN2NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201297; c=relaxed/simple;
	bh=UO9rrjLu/3nGllgpQPfy1ArB9Oggq5rKnHVwzO2DQQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o4+M4EzQL6muaWPbKw+ExFtvjyYBalwRwkHdc+TwQePlnrKeP58O5/+PWSVRN8kRBzBtm+wd/fehPXWXnNw3OjsYfJf1TF9YZKugx06ogwr0DZ/m/6ek1+Hw/XpC5a0xMmT1wA0stLHTxKfHc6iEYtBlIt8EZZ4dPxBX7EkMO6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XSyCVcI5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764201293;
	bh=gdWCdQKLrZ1IKe2k159kqNewkt3Qx9O7dc2xspuSE2w=;
	h=Date:From:To:Cc:Subject:From;
	b=XSyCVcI5QX0+OnVd6vqNNhMrWgQOPPw5rwmOA0AIGAa798Sf0JO0ErBQZEF10Xzte
	 e3hbz9UfxdvGpDMQnIbBgFGLDMy2Xn5FE2+QfeGPqosMO38AMdzfqmZYOdE/Kx/zVW
	 Jhm7cwK160THKXQpzTLqjVkP/nXieCUa1ZpO9eE7Dv2ufgL/Er7KgTbNJQ7+20eQuH
	 hQHA5yri0JvPxL4N8DcezjkFqlK1hLvOxRViTQNqQW73GFqXKllvbmWB4qnsRN154u
	 OKPktpRqIxZC7I5oZtQKUahcbgJ5bs9qQRe/EX8Sf3hN2LlDceCXeDdCO24g9vMc5x
	 7d3qealYFxtmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGxHw3JsQz4wCk;
	Thu, 27 Nov 2025 10:54:50 +1100 (AEDT)
Date: Thu, 27 Nov 2025 10:54:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, Jason Xing
 <kernelxing@tencent.com>, Networking <netdev@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20251127105450.4a1665ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oi75ACJbygayEf_J=mfveHd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oi75ACJbygayEf_J=mfveHd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/xdp/xsk.c

between commit:

  0ebc27a4c67d ("xsk: avoid data corruption on cq descriptor number")

from the net tree and commit:

  8da7bea7db69 ("xsk: add indirect call for xsk_destruct_skb")

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

diff --cc net/xdp/xsk.c
index 69bbcca8ac75,bcfd400e9cf8..000000000000
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@@ -591,43 -560,50 +590,42 @@@ static u32 xsk_get_num_desc(struct sk_b
  static void xsk_cq_submit_addr_locked(struct xsk_buff_pool *pool,
  				      struct sk_buff *skb)
  {
 -	struct xsk_addr_node *pos, *tmp;
 +	u32 num_descs =3D xsk_get_num_desc(skb);
 +	struct xsk_addrs *xsk_addr;
  	u32 descs_processed =3D 0;
  	unsigned long flags;
 -	u32 idx;
 +	u32 idx, i;
 =20
- 	spin_lock_irqsave(&pool->cq_lock, flags);
+ 	spin_lock_irqsave(&pool->cq_prod_lock, flags);
  	idx =3D xskq_get_prod(pool->cq);
 =20
 -	xskq_prod_write_addr(pool->cq, idx,
 -			     (u64)(uintptr_t)skb_shinfo(skb)->destructor_arg);
 -	descs_processed++;
 +	if (unlikely(num_descs > 1)) {
 +		xsk_addr =3D (struct xsk_addrs *)skb_shinfo(skb)->destructor_arg;
 =20
 -	if (unlikely(XSKCB(skb)->num_descs > 1)) {
 -		list_for_each_entry_safe(pos, tmp, &XSKCB(skb)->addrs_list, addr_node) {
 +		for (i =3D 0; i < num_descs; i++) {
  			xskq_prod_write_addr(pool->cq, idx + descs_processed,
 -					     pos->addr);
 +					     xsk_addr->addrs[i]);
  			descs_processed++;
 -			list_del(&pos->addr_node);
 -			kmem_cache_free(xsk_tx_generic_cache, pos);
  		}
 +		kmem_cache_free(xsk_tx_generic_cache, xsk_addr);
 +	} else {
 +		xskq_prod_write_addr(pool->cq, idx,
 +				     xsk_skb_destructor_get_addr(skb));
 +		descs_processed++;
  	}
  	xskq_prod_submit_n(pool->cq, descs_processed);
- 	spin_unlock_irqrestore(&pool->cq_lock, flags);
+ 	spin_unlock_irqrestore(&pool->cq_prod_lock, flags);
  }
 =20
  static void xsk_cq_cancel_locked(struct xsk_buff_pool *pool, u32 n)
  {
- 	unsigned long flags;
-=20
- 	spin_lock_irqsave(&pool->cq_lock, flags);
+ 	spin_lock(&pool->cq_cached_prod_lock);
  	xskq_prod_cancel_n(pool->cq, n);
- 	spin_unlock_irqrestore(&pool->cq_lock, flags);
+ 	spin_unlock(&pool->cq_cached_prod_lock);
  }
 =20
- static void xsk_destruct_skb(struct sk_buff *skb)
 -static void xsk_inc_num_desc(struct sk_buff *skb)
 -{
 -	XSKCB(skb)->num_descs++;
 -}
 -
 -static u32 xsk_get_num_desc(struct sk_buff *skb)
 -{
 -	return XSKCB(skb)->num_descs;
 -}
 -
+ INDIRECT_CALLABLE_SCOPE
+ void xsk_destruct_skb(struct sk_buff *skb)
  {
  	struct xsk_tx_metadata_compl *compl =3D &skb_shinfo(skb)->xsk_meta;
 =20

--Sig_/oi75ACJbygayEf_J=mfveHd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknk0oACgkQAVBC80lX
0GzYbggAk84eCYL7uvzEU1Gylfx5tugEcwva4YL2ReQxB8RfjWZ4H8ypwZ07LCXq
gSEcJpRS3uGheLUgnjsqBOXjyo792uvxKTFzAHo6XW392hVvGmHwxtCSf3lCyGTK
ZRDo0qciu8J3ey2k06ggYSwxuYlXdOGOWlNtFQv8N0WedwnrW4LQEPJ/Zufs5Cnb
4sU5UngixFCNKMA/UDQZZSIYiQfsNpELEEMTarObaJUQeaqRxHxqdIf3fTBulFw7
psQtM4xB0Y6F+9S4s/wmm+ZMm2/0qDqmf8nhZ+XSyMJEocUWC6uJ2Ygi+8GfdVJ+
OTbKeAON0HW8AfPC3Uy89ee9/iOfjA==
=HAxk
-----END PGP SIGNATURE-----

--Sig_/oi75ACJbygayEf_J=mfveHd--

