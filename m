Return-Path: <linux-next+bounces-6298-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF5A959CE
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 01:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DADD3B06FB
	for <lists+linux-next@lfdr.de>; Mon, 21 Apr 2025 23:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20871EB1AC;
	Mon, 21 Apr 2025 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GRLELfN0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29FC2ED;
	Mon, 21 Apr 2025 23:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745278721; cv=none; b=th7tNiQNDUqz0a3NB/I+OM7MqE0i1m2KtBQindMW68kdZT+fm5XCjYuIVk9lytM71VAErDJOZJLiY/6ce2bBtrz5km5JST/kCaHjHY82rID2b5HrxvFR6SzJeoqJlHEsIO28e86gNEiyWC+lk5d/tKos6yZxAjp5eBg1YKcQRaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745278721; c=relaxed/simple;
	bh=PPqxRTJ65Zns3K16whP09vVXKH2agHmSTpJ8QVMw6/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fX5eBicNLTOXwdvAhCz3RnYlaffUAwKJR2W6xVc3zDm5+xC5qsd5UaJgh0Nb0BLBb6Gr0ctS7GDaXk908JY/jfVubOsmgtxUYPF3kJxzavxZE8mGet80FehOwdXQCgYayygpPY8YwArlrlsMNW71ns2N/skQzNLQ13rp1YReCdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GRLELfN0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745278715;
	bh=k5asuIGqHKFn+L4tpxLhkdInQrn88qIrrHJdrM8/ae4=;
	h=Date:From:To:Cc:Subject:From;
	b=GRLELfN0B02Jg/77nV82weTy6032cnZFDgGynjmzHNg9JALF7jBcyfh3VEdiGNT47
	 a8RuJEufoG2lIfn4V8fD6+imwLDZ/NC/DmkF9w+Vn2Q25qsKe6BTfPAWpxsu1acDvI
	 pIRrmZxaTG0MZn+mFhHBu2EEQICsU/kKfQCh0rpVTrhNtp73W3ZZRtBobDASBQjTUG
	 daRY/8RozLCdyZ06DRatZuYZ0bapf3KyZikC1edjRUs1Y94XIrHC0il+VJPYcGReCB
	 ZUvxFkdtfx6UrRa6ulnvirbthINNEuQYUXGxfaSKxezhVFBHQA/o9ztSHAV3nfy0U4
	 utEp2INrExNxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhMJC3kpJz4x3S;
	Tue, 22 Apr 2025 09:38:35 +1000 (AEST)
Date: Tue, 22 Apr 2025 09:38:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the paulmck tree
Message-ID: <20250422093834.57e9e9d0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CcftWz4Zid/hKtcoCJHP/Dt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CcftWz4Zid/hKtcoCJHP/Dt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9e13e90127fb ("ratelimit: Reduce ___ratelimit() false-positive rate limit=
ing")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/CcftWz4Zid/hKtcoCJHP/Dt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgG1voACgkQAVBC80lX
0GzdsQf/bN4huI/Atgq8Zxm9bC95FcArzo8Szp4F3F3uEFCuRA5weXu0eLqfQHxC
cB6jYmbphZjWmbh5sTEScJLWwOuVhpTy+CkRE1i+wfEXdGv+GHuoAaZ0Fh5EuAVE
HNpB+s2gjdRu5ZYo9PKk2KLmsQP0VbVCc3SQrewNgQEq8tuqkuu3pAK5TON2Liss
mh6FrOqc7rbd09GGzo6Xz71dyoe2+ZDW0vPX0yHY8E69OYP+S38rlaOU9BafQzYn
zPkrEDW3fvhtwRWV2a8plrwiGBXbWuIc+av4XQJ+ED6p5t9dbvO5TdHT7PGhR5eF
3aA4LAzEczsni8YvXBurrAOrkdzRDg==
=TGr7
-----END PGP SIGNATURE-----

--Sig_/CcftWz4Zid/hKtcoCJHP/Dt--

