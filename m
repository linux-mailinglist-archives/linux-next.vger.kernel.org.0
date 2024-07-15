Return-Path: <linux-next+bounces-3011-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A92930E72
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 09:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 477C82816DA
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 07:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CAC18309A;
	Mon, 15 Jul 2024 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="USh34sGt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F9A13A252;
	Mon, 15 Jul 2024 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721027446; cv=none; b=nDez1+eF105SPDUmBDssu/RPkf7BuWs+2yt9wk9APLpGu8QT8RATfDI6yiir6v0L6j7UsfBZi4arbspYCKH0qEt2BGD/e63dIq7SXY6G0hakdZyiKObLIVD2ejaLZncyemV0Mtyk6bBIDK67ianYfOAPoV7a9q6gD4IuA8mA3SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721027446; c=relaxed/simple;
	bh=pc9M4SiQH7ef7s9blt1LM9ZgWaj33pWP6lmDPl+aMfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t7n9jcsqF8yW0iCuGfAEM+hMGAFyNYBHECsC562X6f0FMM/fJzfCBxtgQXwE802v3voHZgH/1pbDrmBC8EZAwsZ4zccHG+pUQosJmrYpa3/Yg38gKa/NK2N0xuGDi6qLyD9SB0Doa3zYASCW55GajgPvGnS28XU71o2ucq7daFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=USh34sGt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721027443;
	bh=4M+QBkMmXFDIaHLOXw+WEgiy4cJZYGjlhGgeocLqSqQ=;
	h=Date:From:To:Cc:Subject:From;
	b=USh34sGtYHYhzNa2kKAwFx+jw3Wsycocr6Ot8tX/acKhu18hVyQn4Lg2mth6YbOEa
	 j6/4MvpicvQxS5qvu1PWqHr8WSvXv4R5++8T8cLbGhvhUEQQSUbYk2ShJWlNklOPoA
	 uj1l7o+W41MsXx+y8I9UQ4eUtuW/evcryLIL8P3/StIfoWN4k8ofHaguOrUwjtNnk/
	 0Q8Cg+L71X8aoi/y6W3L3mMPvGN9yKRHzH1QNE3DrVHTDyluGBWvuANQhS92DffKYe
	 ykYGz1IkT3UW5b8Mtaao/T+tBw4gqItKDYBFSS5U+rKHlyREiwmLxSB/GtkaO6FwUB
	 7IN/U3DMosjDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMtdZ301Pz4wbh;
	Mon, 15 Jul 2024 17:10:42 +1000 (AEST)
Date: Mon, 15 Jul 2024 17:10:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jiri Pirko <jiri@nvidia.com>, Jiri Pirko <jiri@resnulli.us>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vhost tree
Message-ID: <20240715171041.5d0ec5a1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NSyl7Qj5+4uGG7ULNk35N2=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NSyl7Qj5+4uGG7ULNk35N2=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/virtio_config.h:136: warning: Excess struct member 'create_av=
q' description in 'virtio_config_ops'
include/linux/virtio_config.h:136: warning: Excess struct member 'destroy_a=
vq' description in 'virtio_config_ops'

Introduced by commit

  e6bb1118f6da ("virtio: create admin queues alongside other virtqueues")

--=20
Cheers,
Stephen Rothwell

--Sig_/NSyl7Qj5+4uGG7ULNk35N2=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUy3EACgkQAVBC80lX
0GwwTAf/eREC/+tkDru2APQsAX0OacywbLvxJel5D5wOKp3A0sfe/u9A0BgW3sWe
gwNM6crSUMaJHSsJr7xfSuYdIfUjKTqk1NK/n+4JzR1f4rnxBMfmTLWfYGC3Kd03
LgJbUqGCf8Rn7g7Iyx3fjgy3Ad+3iM5GRjnrF7sHLtF3GqdaRjj+IqpV2M3bMKz3
NFcvAKY/D76FdnAAjhiHQeJ+LRZycVwX1oEEs1jMLviknN/3tYCnsnENaJtSOfSj
aubvnQNQ/Twm3wCyP/7VZfblahlbpjw0F++a+M9IhP+h6RcfNgWPgMaANu925zC1
HFVJJf0zKo7Wiw2lXeMSOB7OinlEAw==
=a1IV
-----END PGP SIGNATURE-----

--Sig_/NSyl7Qj5+4uGG7ULNk35N2=--

