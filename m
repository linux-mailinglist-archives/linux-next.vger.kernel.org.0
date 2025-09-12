Return-Path: <linux-next+bounces-8267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE8B53FE1
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 03:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4792AAA15A5
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 01:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3464131E49;
	Fri, 12 Sep 2025 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f86JG/uv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815913DDAE;
	Fri, 12 Sep 2025 01:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640338; cv=none; b=Ww9HvdqbSrmaFvVTX4U5JK9ZupyvauiKa8okREfEXaZckz9bKOOIXtOvEzY8JoP2932UgfqOHUn3le3wrtJ4PgC3ijjHGitt78Ir1IPj1/0ZsK3zpL4hzywv9Z6geWB8KsImPpsBxVILTN17He1z30QabrL3uR0jXv8xPgX0s3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640338; c=relaxed/simple;
	bh=3YmaqxnuqcxgCvWd/QJ6kWVnfUcuSMAyIHeszBTQ/ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Of6LS+cS7Wieb/oFtEIflf9jbjC+GcyA7/AuPqJpJblvJ9RWQ4H9GF/WIfheYGzdFdy01OfDIwk4Z5yE5zwOPgMoXui7+iQ7SYlTlRx3dWZrDnsd5UooUR3/YvydZl+kodLKpksBWUX6D7ybOsmJAc2RwGOVpJdT0eA3uHJxeGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f86JG/uv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757640327;
	bh=IafyWMUW1UQ/vXdF1tZUL5MaLfxOcMPBhfUqkFXNiwE=;
	h=Date:From:To:Cc:Subject:From;
	b=f86JG/uv9FB4d/DY991GKj+DPYOK5s+QeL1Sh7RcoVAb5FcL2Fhr2ulW8769ykUtw
	 /TWIXbi22VjJSoxwsFMoHiUGAcWiKaRUPxnA05iZPWgsapmO3dOgrCs7vf0dYqDAD+
	 jX1YTebOTimgkBBQp9FPKK4M8uweH9waQn0ZLC7wEbvAM7ekz0wXC5AP4XEAyTWyBm
	 zVk+Jbo3xGpOYPjaO/qYB4ktn99JYO5ngOOHHopEZBlf/1Iam1qrQZWMtNiEBZX7TH
	 k9bjeHApDhLAFWO2wTxOWgiyeswgSNNGdhKG3ZUFzycfCGpUIMVuBpspYBj5Zwr6Gh
	 FtA7E8btbqPCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNGvV29pCz4w9Q;
	Fri, 12 Sep 2025 11:25:24 +1000 (AEST)
Date: Fri, 12 Sep 2025 11:25:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Florian Westphal <fw@strlen.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Matthieu Baerts
 <matttbe@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250912112523.4914c6bf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FyeqAwhVQ+VVDIWRtAYgROf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FyeqAwhVQ+VVDIWRtAYgROf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  net/netfilter/nft_set_pipapo.c
  net/netfilter/nft_set_pipapo_avx2.c

between commit:

  c4eaca2e1052 ("netfilter: nft_set_pipapo: don't check genbit from packetp=
ath lookups")

from the net tree and commit:

  416e53e39516 ("netfilter: nft_set_pipapo_avx2: split lookup function in t=
wo parts")

(and maybe others) from the net-next tree.

I used the resoution provided by Matthieu, thanks.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/netfilter/nft_set_pipapo.c
index 793790d79d13,4b64c3bd8e70..000000000000
--- a/net/netfilter/nft_set_pipapo.c
+++ b/net/netfilter/nft_set_pipapo.c
@@@ -539,7 -562,7 +578,7 @@@ nft_pipapo_lookup(const struct net *net
  	const struct nft_pipapo_elem *e;
 =20
  	m =3D rcu_dereference(priv->match);
- 	e =3D pipapo_get(m, (const u8 *)key, NFT_GENMASK_ANY, get_jiffies_64());
 -	e =3D pipapo_get_slow(m, (const u8 *)key, genmask, get_jiffies_64());
++	e =3D pipapo_get_slow(m, (const u8 *)key, NFT_GENMASK_ANY, get_jiffies_6=
4());
 =20
  	return e ? &e->ext : NULL;
  }
diff --cc net/netfilter/nft_set_pipapo_avx2.c
index c0884fa68c79,7559306d0aed..000000000000
--- a/net/netfilter/nft_set_pipapo_avx2.c
+++ b/net/netfilter/nft_set_pipapo_avx2.c
@@@ -1241,28 -1226,75 +1226,74 @@@ next_match
 =20
  #undef NFT_SET_PIPAPO_AVX2_LOOKUP
 =20
- 		if (ret < 0)
- 			goto out;
-=20
- 		if (last) {
- 			const struct nft_set_ext *e =3D &f->mt[ret].e->ext;
-=20
- 			if (unlikely(nft_set_elem_expired(e)))
- 				goto next_match;
-=20
- 			ext =3D e;
- 			goto out;
+ 		if (ret < 0) {
+ 			scratch->map_index =3D map_index;
+ 			kernel_fpu_end();
+ 			__local_unlock_nested_bh(&scratch->bh_lock);
+ 			return NULL;
  		}
 =20
+ 		if (last) {
+ 			struct nft_pipapo_elem *e;
+=20
+ 			e =3D f->mt[ret].e;
+ 			if (unlikely(__nft_set_elem_expired(&e->ext, tstamp) ||
+ 				     !nft_set_elem_active(&e->ext, genmask)))
+ 				goto next_match;
+=20
+ 			scratch->map_index =3D map_index;
+ 			kernel_fpu_end();
+ 			__local_unlock_nested_bh(&scratch->bh_lock);
+ 			return e;
+ 		}
+=20
+ 		map_index =3D !map_index;
  		swap(res, fill);
- 		rp +=3D NFT_PIPAPO_GROUPS_PADDED_SIZE(f);
+ 		data +=3D NFT_PIPAPO_GROUPS_PADDED_SIZE(f);
  	}
 =20
- out:
- 	if (i % 2)
- 		scratch->map_index =3D !map_index;
  	kernel_fpu_end();
+ 	__local_unlock_nested_bh(&scratch->bh_lock);
+ 	return NULL;
+ }
+=20
+ /**
+  * nft_pipapo_avx2_lookup() - Dataplane frontend for AVX2 implementation
+  * @net:	Network namespace
+  * @set:	nftables API set representation
+  * @key:	nftables API element representation containing key data
+  *
+  * This function is called from the data path.  It will search for
+  * an element matching the given key in the current active copy using
+  * the AVX2 routines if the FPU is usable or fall back to the generic
+  * implementation of the algorithm otherwise.
+  *
+  * Return: nftables API extension pointer or NULL if no match.
+  */
+ const struct nft_set_ext *
+ nft_pipapo_avx2_lookup(const struct net *net, const struct nft_set *set,
+ 		       const u32 *key)
+ {
+ 	struct nft_pipapo *priv =3D nft_set_priv(set);
 -	u8 genmask =3D nft_genmask_cur(net);
+ 	const struct nft_pipapo_match *m;
+ 	const u8 *rp =3D (const u8 *)key;
+ 	const struct nft_pipapo_elem *e;
+=20
+ 	local_bh_disable();
+=20
+ 	if (unlikely(!irq_fpu_usable())) {
+ 		const struct nft_set_ext *ext;
+=20
+ 		ext =3D nft_pipapo_lookup(net, set, key);
+=20
+ 		local_bh_enable();
+ 		return ext;
+ 	}
+=20
+ 	m =3D rcu_dereference(priv->match);
+=20
 -	e =3D pipapo_get_avx2(m, rp, genmask, get_jiffies_64());
++	e =3D pipapo_get_avx2(m, rp, NFT_GENMASK_ANY, get_jiffies_64());
  	local_bh_enable();
 =20
- 	return ext;
+ 	return e ? &e->ext : NULL;
  }

--Sig_/FyeqAwhVQ+VVDIWRtAYgROf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDdoMACgkQAVBC80lX
0Gxumwf/YUdfjbXO5iL21/gdeV9CU0TX7SMx1QlfckWoArWzPXIFrt9TEKsHeIV4
SZSA/DKPEMWEKH7v8XHnBgPwwZzohwFyNXDbE5pfyBz8OmDoq80b+2cDUQFmhle0
JaOAAJEdMKtdO3CzOyvMZ1VqMgJJCMSkmN/FJNpziOqnISPQ4fjSE9B2Z7BGQY2M
/H2i9MB3kiHq35o78oJiQi1GMCCrPoeVLcVz/3NfrHK8aP6TkRj4rzFxUXQgbJsp
5WP5w0swdLBlxgQVgxzGSSbWWiellb7l3CUS2772a3jcd9Ma4s0tYTdHwIipiE+z
N/ksECtHTJGElVC+LpmObZx845Sm6A==
=hziR
-----END PGP SIGNATURE-----

--Sig_/FyeqAwhVQ+VVDIWRtAYgROf--

