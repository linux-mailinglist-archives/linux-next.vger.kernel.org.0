Return-Path: <linux-next+bounces-2533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B9905FD8
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 02:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0EC71C20E05
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 00:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7319473;
	Thu, 13 Jun 2024 00:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JTY1cOt+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6103944E;
	Thu, 13 Jun 2024 00:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718239998; cv=none; b=mj01gUkbPey0rMV/sViUgiQhNeYsJNgOUn0kIxXt6Jlh8pvTyB1mNA5hQcIY3atkWy4V04QHxNzw/fZZXrH963RfnnY568Twj9rDbWPx0rkb9F45D1gCzNvSECoKvx41fD4n+y+AVX7fYxsfSd5C+47l1RHBqR5I/R7y3imczyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718239998; c=relaxed/simple;
	bh=hrWpxgImsbkvPDpav8ZLRn5s4wKsE7TA5N9fLVAeAns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fuykjd89fBY8S2ltnactHJtmCm0+8U79uzMDRdbokZq26wa9RQ30t1OaR8pFT72kCC4P5K9P4V4+GYh7pY4y0Zz5iG0G+Xwm2n1Vvg83QV+QWpywCGTd38trUp8/HF1md1jNBU7F5k5gM3RiWIzaCvXYOS7wFmFGSta7/YF5GSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JTY1cOt+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718239995;
	bh=uvc30u0D6bGIogYQyIX5E3C9FdL9Pw20UYK3PgxnxfQ=;
	h=Date:From:To:Cc:Subject:From;
	b=JTY1cOt+w5Ry5zEYAmDeRh3NZlR8Qa/JlVDbxkhcN9XQfhLlkpEFdZ9v8HTkJ/8Cn
	 0iZ2AYLNGreLDwfLuenUUfIg7FqvM5FzQF7ZSfYGEcaTgs6zRoasGg5zE8RpcWoxRD
	 GRfdM+nLA7TWFk9ncoQ4Sd2AO03PFBr9iAICD+E7fKoxNP3kD0HKjHsPDfdZudUJeb
	 1EG277zaGpOxQF61S2xkplmWxIVDdab9yFz5RlnCHtatqOtef4gQnWG6PdKqxq1kow
	 lqalHWwQRFLap+aLr4zWrWz+QdQOwRoF+7Vmy9rdHmTPUdOQ7g8RVrNd3VDhLrjiWM
	 YNswAWWX9SNbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W03mp6CNsz4wc8;
	Thu, 13 Jun 2024 10:53:14 +1000 (AEST)
Date: Thu, 13 Jun 2024 10:53:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240613105314.13d15f94@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XkyCGhbASgwMedqsw21./Po";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XkyCGhbASgwMedqsw21./Po
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  04ac7662d391 ("Bluetooth: L2CAP: Fix rejecting L2CAP_CONN_PARAM_UPDATE_RE=
Q")
  5fe0be8868aa ("Bluetooth: fix connection setup in l2cap_connect")
  9dff76b7f8bc ("Bluetooth: hci_sync: Fix not using correct handle")

--=20
Cheers,
Stephen Rothwell

--Sig_/XkyCGhbASgwMedqsw21./Po
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZqQvoACgkQAVBC80lX
0GxqPQf/XKMPnKQohcWKo8vO68v5aK0xgW6ztnEVH6eyCrUBjscfKW4YRH8DYW3V
7CClI0cDisipPUTOMQDGN1HQdF6JMOtvN+Yng8ETAAi0lg6sH29P50gabnH7u9pP
t/gPEe5ZLlk2KvNeZsC/3vUruDzBZqTvWhRImYZ75zQ66cBby3gCh7r65Ys5au73
ELvNNIbKtpHRUS4WnwfZA9m9RRC/G5zVO+sdVEHrFf6v3zDjuLJ6b1M6BUCQ9p9v
TNclnl+prUKz+DrKixiSX46CzXzApx5u8f210edj+4dk1+F1eL0EiOJirstIVNRO
WGcro3DW6CSkHfEH93qIFNgtOcENag==
=j4xD
-----END PGP SIGNATURE-----

--Sig_/XkyCGhbASgwMedqsw21./Po--

