Return-Path: <linux-next+bounces-8240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28806B4A0DE
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 06:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83A53AE037
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 04:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A73A2566F2;
	Tue,  9 Sep 2025 04:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Klv5z0jq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAE45945;
	Tue,  9 Sep 2025 04:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757393305; cv=none; b=lI9HboBkhadX4uEDDofv+pS2+bwSHCoIMnW63+3IQxlWHVUR08HssH8YKf6u3t/4pWww+qB0kq/VWSisfcJaDUnjMsVKV5lgkIEK6l1oHnCtSa6zrRS1a6HgnqY+o2AqOt7MMgQrVLZcj9T+QH6afuePfSKk/zpcG/FacyI8xU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757393305; c=relaxed/simple;
	bh=CD59IU9afHSgZGUGL8pUq9AdBsl1qjwrETRIshm+sBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rCBVrw57C67wDM4yDRjsolrciTh/v79PKH421LL5lKZlVLiQOD3VidBRDE7hadzjDsLIFev6SgCVS9OzauQ4HS79bpmEK7XDT60DM6wZlA7jpSYBcJLEo3TPdxbZXuQ+W3SG4BkcK69WKH0zQjYDbhUrAfIg4pOJNgruZrc+r2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Klv5z0jq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757393298;
	bh=xb+UHSmgS/mbK1Z+/cBzOEk1rdVksg4BuW5cWclxix0=;
	h=Date:From:To:Cc:Subject:From;
	b=Klv5z0jqTXnIQykirVTUUsXCjFyi9zLOuyw1982WZT2VLm9Nb4jAutVvpzxc+Enbw
	 qLXMXvCYvTfh1SaTMmNLQAtty58WvsJi8TrTvJmqXsIN9fEXG5xMNYQ9p+sXx1bZgj
	 MADzGvhWRoXRF8gN52q82vVGERkUt/0roQXwROlmDP5m5xAF7kcO0U6zkSmUZ00k0w
	 DnoZKLwFR3rIEx6uFw8tyHaZg24dq2dTRR0nZ0zVptTVald8yv2FLB32ByQGTkTXf/
	 eJenTqBanq6/gr3ZUxR2oxuJJavjeiObFIdIPXrux8Ym2q7khmGt3UQdYm1ENUWP0F
	 M5LJN7LFf3j0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cLWXy4SlBz4wBJ;
	Tue,  9 Sep 2025 14:48:17 +1000 (AEST)
Date: Tue, 9 Sep 2025 14:48:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20250909144816.69b76b2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+o4MfDLTRFLYE.urvvHd8Kb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+o4MfDLTRFLYE.urvvHd8Kb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/linux/blk-mq.h:536 struct member 'tags_srcu' not described=
 in 'blk_mq_tag_set'

Introduced by commit

  ad0d05dbddc1 ("blk-mq: Defer freeing of tags page_list to SRCU callback")

--=20
Cheers,
Stephen Rothwell

--Sig_/+o4MfDLTRFLYE.urvvHd8Kb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi/sZAACgkQAVBC80lX
0GxY7wf/cosrWwkMezr5smM5gylndC0xyNcpSVIRh4mfQnQY/ylbYaX4hzNvY3Nl
4+hrcSYZMHNMjTI4SsCFc0EWijnjmIH1VXmwrGNMrY1fgoTqP23TuNUDSrXAjKjb
hxTK8bemks3Q25urKIAt2WRpDqgcVMyM100RtxZMz2gyhTFjprhalIVphl7y6f4l
xeNgdRIOJ6vUC19lu5QoORQBgCpiu9M4yCzhJfbErBfOloXwp1OIkYJwcKQcFcHK
R3vC4mVPohhr/UhU5OLAFBD/tnHjZZUySopPyBs2lcufu6L4Rp7ZhmdrHTfrCOHb
uouE8usoEjC2nu2J8DxdAllnp1XouA==
=G66r
-----END PGP SIGNATURE-----

--Sig_/+o4MfDLTRFLYE.urvvHd8Kb--

