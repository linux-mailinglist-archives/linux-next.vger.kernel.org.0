Return-Path: <linux-next+bounces-5270-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC0A174C7
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 23:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F54D169DC2
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 22:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A493C1B6D01;
	Mon, 20 Jan 2025 22:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UCUkwMFF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762A31B4237;
	Mon, 20 Jan 2025 22:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737413197; cv=none; b=M+vu1P/hh6E9R8/K1yM04asyK3rnjOMOao3+zR3RdHLXtcHjbOgd4TjNY9JdatLjtmyQAjyN1+K5kslewdQ9MEoaLp1JuFFGNmH6Eui5xhUu2CHUWZ8GZ+0bAZSA+Zpsv+7IkFk7NtO1HBn0nDaA8jHg4Ex+Utfn3x2/r9SXyqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737413197; c=relaxed/simple;
	bh=mCtAF5mcmoFVlwZYLhkafFn9isSxyLbixpF9EuSaI78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VVMIJAUf+C2spmpXgln10ez2sKYmgG1vXuqv5fpR7BxqguK73fxGbtu23s0quIDIcA+340kQi4tRBRaLOkeUakGxagGOm6jSZek15DRbWE/I3l2ASPWOP6ZwSUcqBlPx7Pme+08Xq0qmWghpCBQIN7BOJQmlqlSCClmAaNI/1w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UCUkwMFF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737413183;
	bh=NsBaSedlbk0qyRy5AsPWl3MrGma+kkncm7TiRvZGnTs=;
	h=Date:From:To:Cc:Subject:From;
	b=UCUkwMFFbqzZ4paud/c3LoP/3IOOecC8xENbpuoNEVPwvOFdM9CaKAHvejwuycGJD
	 zp3wp/obdglNBjOPnYqVks5wDElvtitHobt5VNzvO5U6gEaG/enUCFfwdY3homC+30
	 qWcHOn1myCr3zJWbigDBR6aECQmL7rSQ4y5cyp1TJZjXe6eTvNqv03PaQOh10hU3R1
	 vxPeC1cKx1vG9yG/ZxmCUf6aooNII6bqCDoTCo2rB3aOBfHxkvWWLxHolUqkXD4+ne
	 U2jF/A89M+S6qusgJs7Poz6KW0nrl6iPdpBHAEll9FAKsxb/CcSTYOryBL0XiBru7R
	 6yRkjkF02lOzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcQRz3y2jz4x1V;
	Tue, 21 Jan 2025 09:46:23 +1100 (AEDT)
Date: Tue, 21 Jan 2025 09:46:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250121094630.37174e85@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Fg/ts4rxpfCnMFu/YyKuls";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8Fg/ts4rxpfCnMFu/YyKuls
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  14130ea40a06 ("btrfs: selftests: check for correct return value of failed=
 lookup")
  180202da387d ("btrfs: don't try to delete RAID stripe-extents if we don't=
 need to")
  6d77069b6a74 ("btrfs: fix front delete range calculation for RAID stripe =
extents")
  86fb92c8863a ("btrfs: selftests: correct RAID stripe-tree feature flag se=
tting")
  8c6fc94caa9a ("btrfs: fix tail delete of RAID stripe-extents")
  977b638c0381 ("btrfs: selftests: don't split RAID extents in half")
  9c60a09f4ded ("btrfs: don't use btrfs_set_item_key_safe on RAID stripe-ex=
tents")
  e9d15fd383dd ("btrfs: assert RAID stripe-extent length is always greater =
than 0")

--=20
Cheers,
Stephen Rothwell

--Sig_/8Fg/ts4rxpfCnMFu/YyKuls
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeO0kYACgkQAVBC80lX
0GwCxAf+NHnbDNO5oEilQlSOqAUkQ4G3dgQNoUwlBdkqd2M+mmTuFb7jQkctUMof
AdRoJ0h+WmU58g+mSYEm96YnRWBgxdzynY7CVhaEpwMM+WoAb5wfqb7gvxrzAsiI
BTPGM5SoILHjL1DMkqtPI0UkRQ+RFms1fXBWt0sBYudCb+qj0bNxFKLIG8BUXoQP
/sVqgra3J4BxpenAU2ugfyBHuL7jl1x3Hj/A36UZU0dMPlgCN8ANzVvh7aczsU85
/urxZLfXJ05X4oEGqmsQrr2u+3zMP/ujL+VHHDxHy62YDOV3FnBKUW7bjaskmzTw
9YmhWPRR6Qbg9P9ZRK+zjodbizQBlw==
=z1TV
-----END PGP SIGNATURE-----

--Sig_/8Fg/ts4rxpfCnMFu/YyKuls--

