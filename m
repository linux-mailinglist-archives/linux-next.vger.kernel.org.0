Return-Path: <linux-next+bounces-5913-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63216A6B091
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 23:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D2888148E
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 22:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806F822CBEC;
	Thu, 20 Mar 2025 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BefyprBK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929222B8CF;
	Thu, 20 Mar 2025 22:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508725; cv=none; b=K9Tn20YKjAXifbiNmpAjNd6ck8uibESNuQd6VE6NIMgoan16Qb9KL4pkPfzSgav25GlAk+6LW0pQ3IM8RiGXZtPuaaDlTZN7vd4mCQECH51Pnkhhn8ICeO31whR7lM2OjJt0//NRb4T8OGyictyF2BlI4FUsjvhagVTmZdCMuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508725; c=relaxed/simple;
	bh=g5WhN1kaJc3DZrVUcAVFbCSMm/AF4jRsxs4A6kF4qyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Uwv18nQZ9fta0pSQziGO6z66VVf8vmzu0OuUxq5K/owkT4p3zW6m0PszQLBL+476xbY8JbnrbE5a76jpCz9exYAf7wd771Fhb8ObguOOxiV/OgvbwTjBzkZGpbzwDf/XBbSLswKiUJoMregoQ8teDwcGjZRpJLM4u10o15WaYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BefyprBK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742508713;
	bh=OOMeDXo90kI2nkrrwrVdw5XdOncRSe/tkf1VEuf51PM=;
	h=Date:From:To:Cc:Subject:From;
	b=BefyprBKB0OtCuRaXhK29kCKYtgDdkb89Ya+XllMfxmbXleuwb0sTBE3jmNtiOUY/
	 Uc+EGKaMaSg9wwc/PNwM63Dv9hjXWaRQPyMYgRXI1hohrr4SmTi7OkGdALy1Cc1QWD
	 3w4Jz4wz9Dn7zrN/EAxQe5NtnETJH7oLWiWcNrPrIBHSlQKTDhEFm5XpzdNcs9326R
	 1pj09DfY+jQSXmUHgsvO6DRGU3WNMY9osi+RzRHhwSymi9KLk8B8yw39bLdZgFwwck
	 FrCuwOr9Rz8t7/AEgQrEKaexeRtnEIqqxice21KvSQjE4qYiAcO4CuSCkJl3CwcFDs
	 dwT4zy/EmzMQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJftx1nNmz4x5k;
	Fri, 21 Mar 2025 09:11:53 +1100 (AEDT)
Date: Fri, 21 Mar 2025 09:11:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>, Trond Myklebust
 <trondmy@gmail.com>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>
Subject: linux-next: manual merge of the nfsd tree with the nfs tree
Message-ID: <20250321091151.2fd07db3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pt/SlpRsCD7HOeNW+SSr8SO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pt/SlpRsCD7HOeNW+SSr8SO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfsd tree got a conflict in:

  fs/nfsd/nfs4callback.c

between commit:

  11a149e09d58 ("sunrpc: make rpc_restart_call() and rpc_restart_call_prepa=
re() void return")

from the nfs tree and commits:

  6c1cefb84b3d ("nfsd: lift NFSv4.0 handling out of nfsd4_cb_sequence_done(=
)")
  f049911b5b98 ("nfsd: only check RPC_SIGNALLED() when restarting rpc_task")

from the nfsd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/nfsd/nfs4callback.c
index 654bee80acef,ec6539cec0fe..000000000000
--- a/fs/nfsd/nfs4callback.c
+++ b/fs/nfsd/nfs4callback.c
@@@ -1381,41 -1384,42 +1384,43 @@@ static bool nfsd4_cb_sequence_done(stru
  		fallthrough;
  	case -NFS4ERR_BADSESSION:
  		nfsd4_mark_cb_fault(cb->cb_clp);
- 		ret =3D false;
- 		goto need_restart;
+ 		goto requeue;
  	case -NFS4ERR_DELAY:
  		cb->cb_seq_status =3D 1;
 -		if (RPC_SIGNALLED(task) || !rpc_restart_call(task))
 +		rpc_restart_call(task);
++		if (RPC_SIGNALLED(task))
+ 			goto requeue;
  		rpc_delay(task, 2 * HZ);
  		return false;
- 	case -NFS4ERR_BADSLOT:
- 		goto retry_nowait;
  	case -NFS4ERR_SEQ_MISORDERED:
- 		if (session->se_cb_seq_nr[cb->cb_held_slot] !=3D 1) {
- 			session->se_cb_seq_nr[cb->cb_held_slot] =3D 1;
- 			goto retry_nowait;
- 		}
- 		break;
+ 	case -NFS4ERR_BADSLOT:
+ 		/*
+ 		 * A SEQ_MISORDERED or BADSLOT error means that the client and
+ 		 * server are out of sync as to the backchannel parameters. Mark
+ 		 * the backchannel faulty and restart the RPC, but leak the slot
+ 		 * so that it's no longer used.
+ 		 */
+ 		nfsd4_mark_cb_fault(cb->cb_clp);
+ 		cb->cb_held_slot =3D -1;
+ 		goto retry_nowait;
  	default:
  		nfsd4_mark_cb_fault(cb->cb_clp);
  	}
  	trace_nfsd_cb_free_slot(task, cb);
  	nfsd41_cb_release_slot(cb);
-=20
- 	if (RPC_SIGNALLED(task))
- 		goto need_restart;
- out:
  	return ret;
  retry_nowait:
- 	rpc_restart_call_prepare(task);
- 	ret =3D false;
- 	goto out;
- need_restart:
- 	if (!test_bit(NFSD4_CLIENT_CB_KILL, &clp->cl_flags)) {
- 		trace_nfsd_cb_restart(clp, cb);
- 		task->tk_status =3D 0;
- 		cb->cb_need_restart =3D true;
+ 	/*
+ 	 * RPC_SIGNALLED() means that the rpc_client is being torn down and
+ 	 * (possibly) recreated. Requeue the call in that case.
+ 	 */
+ 	if (!RPC_SIGNALLED(task)) {
 -		if (rpc_restart_call_prepare(task))
 -			return false;
++		rpc_restart_call_prepare(task);
++		return false;
  	}
+ requeue:
+ 	nfsd41_cb_release_slot(cb);
+ 	nfsd4_requeue_cb(task, cb);
  	return false;
  }
 =20

--Sig_/pt/SlpRsCD7HOeNW+SSr8SO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfckqcACgkQAVBC80lX
0GyHsQf/a82OdNJhslNGCmWKz0sdUJknuoSrNbCxI3HEpKyHez/TKE8LhDp4WIrQ
9gY18K7KBWKAzLnlLXng+4yLUX9BBderkWBn57wZ5mgceue0uzv4j27RS9c4oeN4
qpHVs19SBSOPOQMtLbDaxzLqZH51qSnCW/sK4pDBVrQmc7cOvRnpye4/ouNzp+jJ
l0aG4Brt4gN5D2donK7I2cy/DA7RiAiHRYNbfJ/+qqPb2AmRPaZuLCyxZIvM7ru1
j/Nb+rDr1DG5tt4tQ/GhKToVy76c9DhCwnWUdDq8zGFUsTAtGcq2jSJESn/oksHf
5ECloZ3tiTXTZuAb+zIoP7o9ZXJCHA==
=gBQ5
-----END PGP SIGNATURE-----

--Sig_/pt/SlpRsCD7HOeNW+SSr8SO--

