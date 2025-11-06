Return-Path: <linux-next+bounces-8859-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66679C38823
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 01:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 318DD4E43B7
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 00:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9461A9F9F;
	Thu,  6 Nov 2025 00:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RLKBBfiU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173D86353;
	Thu,  6 Nov 2025 00:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762389815; cv=none; b=mQ61BT/KF1c8mB7PdGTbems2BxuGfO4t9/1P8RLdujjxkV0unZiybh6CumR0hiFPIgEVCo1YBiT1BotNt63jcSCxSCuysX6Ak64gr21WI+2FLCpER55KygmB6qSGEhdzr3onkZx2UicZHZEoItv0fUoPkg/tyWO2Sr2bakS4S4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762389815; c=relaxed/simple;
	bh=Vw+NXVMMLvx7GYQX2udxY2m29ubF82y+gjKTEuYazrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e2fHtytIXH0Qds/Q7BYHUQDZknRLmjumBP1OzQLdSgC7Fx04nmuILOpNv8PVCWceb6CSXRddwl1zWWZ2uT+kJ9zNZIxaeHcBez7HZZePROjobNszmO7cWYAI9Rdcif4A92ElJF6vSGiw7jCLK4ADVaOb+79xBqypOBdhv0ied0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RLKBBfiU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762389810;
	bh=57C4tkfHlpV4d6fIuWPqL1GqquhB4VyxQX03V8H/CXE=;
	h=Date:From:To:Cc:Subject:From;
	b=RLKBBfiUee31wtMl7wFiYek4c+uppXApiVjHCPMLUutEIVIYml+prW5clVCCSHH0b
	 FamOd6wuDQzjbS/UGnM+TorFzXyZ1LtBeYop/WzdykHnyKhtfhlZbejaVN82tSCgOs
	 pIuenKBXSZgS/y1HbqM0Iou3axGi95YPWzq8LxaupWSd6EIws51fYwiVha3UepHTPa
	 Ef3p3A5vZqwbgwl9nykIrWF3CmRLSpRE5X8m4RpBfT92jbbbKqMQW04L9mL80WThAL
	 cvgG/Re7Ny8saZknNvnLpnd8v0Vxr8yE2eiHICZ8ZuF+pRp71d5eHyUGHtUspGlSrC
	 6kS6ZrnH7naYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d23Mj1xzsz4w9R;
	Thu, 06 Nov 2025 11:43:28 +1100 (AEDT)
Date: Thu, 6 Nov 2025 11:43:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bluetooth tree with the net-next
 tree
Message-ID: <20251106114328.3d7631f2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wzlOOAyHFixIc1R.aON+uz/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wzlOOAyHFixIc1R.aON+uz/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/iso.c

between commit:

  0e50474fa514 ("net: Convert proto_ops bind() callbacks to use sockaddr_un=
sized")

from the net-next tree and commit:

  8cd02d23dd8d ("Bluetooth: ISO: Add support to bind to trigger PAST")

from the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/bluetooth/iso.c
index 243505b89733,74ec7d125c88..000000000000
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@@ -1022,7 -1034,78 +1034,78 @@@ done
  	return err;
  }
 =20
+ static struct hci_dev *iso_conn_get_hdev(struct iso_conn *conn)
+ {
+ 	struct hci_dev *hdev =3D NULL;
+=20
+ 	iso_conn_lock(conn);
+ 	if (conn->hcon)
+ 		hdev =3D hci_dev_hold(conn->hcon->hdev);
+ 	iso_conn_unlock(conn);
+=20
+ 	return hdev;
+ }
+=20
+ /* Must be called on the locked socket. */
+ static int iso_sock_rebind_bc(struct sock *sk, struct sockaddr_iso *sa,
+ 			      int addr_len)
+ {
+ 	struct hci_dev *hdev;
+ 	struct hci_conn *bis;
+ 	int err;
+=20
+ 	if (sk->sk_type !=3D SOCK_SEQPACKET || !iso_pi(sk)->conn)
+ 		return -EINVAL;
+=20
+ 	/* Check if it is really a Broadcast address being requested */
+ 	if (addr_len !=3D sizeof(*sa) + sizeof(*sa->iso_bc))
+ 		return -EINVAL;
+=20
+ 	/* Check if the address hasn't changed then perhaps only the number of
+ 	 * bis has changed.
+ 	 */
+ 	if (!bacmp(&iso_pi(sk)->dst, &sa->iso_bc->bc_bdaddr) ||
+ 	    !bacmp(&sa->iso_bc->bc_bdaddr, BDADDR_ANY))
+ 		return iso_sock_rebind_bis(sk, sa, addr_len);
+=20
+ 	/* Check if the address type is of LE type */
+ 	if (!bdaddr_type_is_le(sa->iso_bc->bc_bdaddr_type))
+ 		return -EINVAL;
+=20
+ 	hdev =3D iso_conn_get_hdev(iso_pi(sk)->conn);
+ 	if (!hdev)
+ 		return -EINVAL;
+=20
+ 	bis =3D iso_pi(sk)->conn->hcon;
+=20
+ 	/* Release the socket before lookups since that requires hci_dev_lock
+ 	 * which shall not be acquired while holding sock_lock for proper
+ 	 * ordering.
+ 	 */
+ 	release_sock(sk);
+ 	hci_dev_lock(bis->hdev);
+ 	lock_sock(sk);
+=20
+ 	if (!iso_pi(sk)->conn || iso_pi(sk)->conn->hcon !=3D bis) {
+ 		/* raced with iso_conn_del() or iso_disconn_sock() */
+ 		err =3D -ENOTCONN;
+ 		goto unlock;
+ 	}
+=20
+ 	BT_DBG("sk %p %pMR type %u", sk, &sa->iso_bc->bc_bdaddr,
+ 	       sa->iso_bc->bc_bdaddr_type);
+=20
+ 	err =3D hci_past_bis(bis, &sa->iso_bc->bc_bdaddr,
+ 			   le_addr_type(sa->iso_bc->bc_bdaddr_type));
+=20
+ unlock:
+ 	hci_dev_unlock(hdev);
+ 	hci_dev_put(hdev);
+=20
+ 	return err;
+ }
+=20
 -static int iso_sock_bind(struct socket *sock, struct sockaddr *addr,
 +static int iso_sock_bind(struct socket *sock, struct sockaddr_unsized *ad=
dr,
  			 int addr_len)
  {
  	struct sockaddr_iso *sa =3D (struct sockaddr_iso *)addr;

--Sig_/wzlOOAyHFixIc1R.aON+uz/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkL7zAACgkQAVBC80lX
0GwUnQgAm9TUujJYKN+uSbMs0oWj+7GmnL8JUMZ+5Jr/Nsfg3MgE+E/K3lcm4WcQ
TWV6AMsqxxN8OjmP0W3Yh6w3FerO0lWet8Zbd1CXoPgoJBLNJKEF3YaZUVPXcvwK
RQncqtX8nd/f9yuzxZKxoXZ3O0Qfhqrn7S2kDkngaua6MSElwSj9pG7fgN2ctZ3Z
BKPhpfy1tWQ1yDgeqgqVYTpo0/u7Wrq86aSS+n52W18cpthY6uKTRA6dRZ9sIcS4
bM1n3rfFKwNBki2G+oBX1kVJiKQ7ApiNwnT4M5jQMgp7KM4UTyuOXNHtLsy2y3GY
iHMPdwqYtVRbdz6fUCBTc6WtxEKHzQ==
=ZYXF
-----END PGP SIGNATURE-----

--Sig_/wzlOOAyHFixIc1R.aON+uz/--

