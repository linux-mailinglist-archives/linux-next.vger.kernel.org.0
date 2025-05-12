Return-Path: <linux-next+bounces-6687-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9FAB3114
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 10:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF293A68F1
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 08:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E276257432;
	Mon, 12 May 2025 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XfcpP+8u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F02561B8;
	Mon, 12 May 2025 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037283; cv=none; b=L++g5scJZs1qni1ZYKj9v1f4FIlQoW1sMmtDP5ugycT35HB0ELrpaPUbixHV0juABJISqkRdekGMPGLJSvsOUtHg2YvnZ9j+PqaX1RRMkT1yhuKRHDWFvsWvRuY2YXkoWRwRSdrcqTU5uCI1EFqZsfgiRJUvpqRCy9yi6iuw5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037283; c=relaxed/simple;
	bh=A2stEFFTyjCo1kwOBEy50M2t1+vj64LTf8/SATGT/5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eMBupjwqaOPYEcV05jSZslpKkO+/e5XSonhDWtyRPhtDLd41eukcHzTWAJdirU2xpXcl4PyCQHAHfMHsl8GynCi5IIdxhxcBYFc13QyBIxLGttGn5gOgQAVMroIaC2iWy6PzkknQ3EJcp7oHpyPzAovGsnGGYrvNy8BTbruQDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XfcpP+8u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747037276;
	bh=eDk/RBPxp7qiD91+5iU7Pf/RaVAHsmLMufawATiRJ9M=;
	h=Date:From:To:Cc:Subject:From;
	b=XfcpP+8uvTFT9MKgwaHhvtTiEOiLlsmUNyIZ4AsgAL8+/slpQxUSUgb3jkmnMZXnG
	 CnbpjbVTS/WGcWKRO0uywjrezEs7GUC5Jz9i8/YLOc+ky82qXnHkZg/pFYhkrRc7UG
	 TTMVEyPdVfWe/wFHtHS0G4SF6/U2BfcubS/EUNjWLcFChXLqRGkq43IFSDtC6AC79m
	 UalwWjhQH92efmw6ytzejKr7tLOAWo+YQf1VEWa2l3HkIxCKq++8en50MeyCH2fnA0
	 A2WY7P3k41trmTLc/xd/OBkWfIXa7CjI1ULkMOhjFgqwtGgY/ESp7C9Vl3v2soflvc
	 0BnPWNdNgRnwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwsfh1CnNz4wbr;
	Mon, 12 May 2025 18:07:55 +1000 (AEST)
Date: Mon, 12 May 2025 18:07:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the cgroup tree
Message-ID: <20250512180753.2e6a5249@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=GX3OkrjU5kcXB7.2hO8KI/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=GX3OkrjU5kcXB7.2hO8KI/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-bauner tree as a different commit
(but the same patch):

  c8e7e056366a ("include/cgroup: separate {get,put}_cgroup_ns no-op case")

This is comit

  79fb8d8d93e4 ("include/cgroup: separate {get,put}_cgroup_ns no-op case")

in the vfs-brauner tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/=GX3OkrjU5kcXB7.2hO8KI/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghrFkACgkQAVBC80lX
0Gy6bQf4/kA/eyiH/NaEpHpOfGljoUEGVqAmftNbnF1kauB6U4MVJWctwR8UkDwN
GMjj8UucTMMinfZIYqe1yTsAM/xHMSzKSesHO2dyEI23xF+sJVXSicWY6FG3QLOB
sV+bKuCfBjAqulwuom/Rgzo9YssmZryCdI8E6onrtVyIYVwLbxYqmLpDICMvLllK
mxjkEfGpXp46HJbfMgfJV6VCmP/k8Lj+6staT69LjO1rufTbwDW4QWBlvVlVCj9u
TXyjhhFNzHXDurc+1AxoZ0TeDDg1pn+GdC9EiHMfg+bbTC8YTkd0X2ePEfmF8/Oh
+InS1+TBF5DhW6gwW4a7uv8RLJoN
=db6c
-----END PGP SIGNATURE-----

--Sig_/=GX3OkrjU5kcXB7.2hO8KI/--

