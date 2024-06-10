Return-Path: <linux-next+bounces-2505-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133E902B33
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 00:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62F921C21E87
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 22:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA9E12F397;
	Mon, 10 Jun 2024 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="utw4ENKH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B714659A;
	Mon, 10 Jun 2024 22:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718056816; cv=none; b=KFn+hXpRw2FscwRHTzg9nknSrzbz/Mv8+ODEVVCDxXahQhSHiuJMXu8iEjFtzJvDDu79CsFUHiDOQ9LTKX3QknBuAdc3+zcaRcO6aQDrj0ohj6upMb+KFgR9h6YHziTMgLKQXraO35pDBrsJMQKhwGXh/guhMgb/xJKGPnmC3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718056816; c=relaxed/simple;
	bh=2R0NwbqEDeIX5iZBZLyYqdcTiQFsjIqaMwU57bVp+9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kf+le0Ij7GEncCQRtZjxOdV0y+dNaBshQAG+DezHZ7j8TC5c4kiLNABuIIxrqv4P4676+27ODvLJzHO1SfInfnrj0QoXkJlBsURDi6DpLgOtU3hKncj22qrBtBtF51MWElb0BTv3RYsPpdggslCGRg13S27VfA2w2G5MyYApO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=utw4ENKH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718056813;
	bh=2Hv3doo9nIl72RYqk0oaoIQ2eWIQTj/r2hz2Ua9K3Y4=;
	h=Date:From:To:Cc:Subject:From;
	b=utw4ENKHAeSHaAY0n5moAyVLySXp3r87K9YvEhqv5t96Nr/qjTR0QeXo54VpmH3Dw
	 CoCkxxA/HPzou5Jw8P997u7uVIM2FMmVs6i0JCj3yF/M9m6RFj1uGWv2WBiXaug4gg
	 7fiO+LFNBPl7DZpVY/M/Vk9POzhedMVJuRTyuvTZJLfjOwRjxDLBiuCr7EKcS5BzBl
	 uQFSbmpoq+fjo9k9VZ8legjLn9LVejtsnvebuLIOrGS8AQ4JFVM3vVmtCCyR+jXWUs
	 vP+c1TCkffPQ6p566HN49W8r1IW0VoauO3zMFeFACR4KdP+gAc5fO5yRBRzgh762ZV
	 yXI0DwbDVUSUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vym25102Zz4wc5;
	Tue, 11 Jun 2024 08:00:12 +1000 (AEST)
Date: Tue, 11 Jun 2024 08:00:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ntfs3 tree
Message-ID: <20240611080012.79ae200c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dU9eNozOS8tIRrPkM9Pm/EN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dU9eNozOS8tIRrPkM9Pm/EN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  861ed5b28839 ("fs/ntfs3: Replace inode_trylock with inode_lock")

Fixes tag

  Fixes: 4342306f0f0d5i ("fs/ntfs3: Add file operations and implementation")

has these problem(s):

  - missing space between the SHA1 and the subject
  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/dU9eNozOS8tIRrPkM9Pm/EN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZnd2wACgkQAVBC80lX
0GxD1Af/Tas9gTJtmRAAIhFfn9bJwRJWVkOgS97IyTLG2aG9lbwX1JKdnqX3IrOj
f32Gqa6dj6P+Sk/SeRG5m2a7FT4J5wefymrLdl8MMNErxaMgB+wswcCFCxIKd28X
7fQTOs6L//r3N1Vzgc7fVlpRSG0EqFwMEm0R6lPxbmwB5cfj/h0EPJVpiwjw/rTr
T/qBS7FHwogwCiWthj99IcSVTybqCjNiBpRFCj0N92xI02s7WcXXmY7+COyG3Fsr
32ZANMtHm1fzGXH58EdTELYJYcRqJKPG+twOHhV8eWPz9vEjwraW3aYo4TQdvRx6
ZV7JnUIhTSaQ+fFjNC0tAG5KEWTrQQ==
=uw1Y
-----END PGP SIGNATURE-----

--Sig_/dU9eNozOS8tIRrPkM9Pm/EN--

