Return-Path: <linux-next+bounces-7004-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B16ACB92F
	for <lists+linux-next@lfdr.de>; Mon,  2 Jun 2025 18:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A103A311B
	for <lists+linux-next@lfdr.de>; Mon,  2 Jun 2025 15:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BE3221F1E;
	Mon,  2 Jun 2025 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WacSPkqT"
X-Original-To: linux-next@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BEB70814;
	Mon,  2 Jun 2025 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879837; cv=none; b=CyS6imAw+Wp6xbaHqfkNhnigKMikIThXGsu0RS4U0nu6SQv0/IavBEsK/us24PKUDvAiT2PephMg/Q6v+gwFXT4TrUyvdTX8o1pLkXDbPdeXX/3dUXDadDtk4hcdgZ6Akj7CQOFM6qFRpVQNAN6uyfJAJpf0f5Q6aVe5uDl1Bao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879837; c=relaxed/simple;
	bh=Z6lTBV/TUYQTEVACUHiDucb8pf6EfGXIjpAhGSb6Qcw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqXgfmtikM7vf6D/PsGd5EYyYo8jyj2Qzt8p7kD+vLdX+C0ElRmpNtY3jQ/efILwOOdDE/VxP5nBtx0IVwEoq2FBfOL3HefJ8evIBJTnqHpEQzV9dDzle6baV2kzx/ifLi2frQ4ULbP4As0KkTTO119UqInuse1eICIrnQg2aSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WacSPkqT; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2E9442D83;
	Mon,  2 Jun 2025 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748879833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0YGq1biihEXyf/jpPz4mx9vQDFp/CPUDwD9fQG7AXaE=;
	b=WacSPkqTLTV9iTRTAdJJSuVmHSVJKwbGbKPc3be9c/vdLmZP0oMCjUw8vK0Jz1XJLey0kD
	vNcHJ3M0ksmgT5P+AL8/FBTEx8obUg1O7hh/uahF066C8hHgbuKdg5Q+fX5VDogj7yF6UI
	Spuekh7H5Amu0m0eqzCxZzHh1RpsdHDigr30WO/hZ8vpWUIN3vh2Wh8VF8ZLX6YUnoocqA
	n5nf1iQiHwsY+nlm9q0vw9FFVD+YOCldi9iK6ycKPiseNsLGEy+Oer0LbF4FedFH+Q3pZI
	pL9cScK4Z08/+zl6v8nMa8TyGF7NMLq7o7wfkef9YofAcTXu4RzwYmW1Vq2kNA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Wolfram Sang <wsa@the-dreams.de>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Date: Mon, 02 Jun 2025 17:57:08 +0200
Message-ID: <5203152.31r3eYUQgx@fw-rgant>
In-Reply-To: <aDrwb1YvwFKQB8x1@shikoro>
References:
 <20250428104905.2b54643f@canb.auug.org.au> <3352024.aeNJFYEL58@fw-rgant>
 <aDrwb1YvwFKQB8x1@shikoro>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4843312.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkedtleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeejhfeujedtffetgeevudekkeevfedthfehgffhleduueffjedvtdetjeelkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopeifshgrsehthhgvqdgurhgvrghmshdruggvpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepm
 hgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlseigshegrghllhdrnhhlpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart4843312.LvFx2qVVIh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 02 Jun 2025 17:57:08 +0200
Message-ID: <5203152.31r3eYUQgx@fw-rgant>
In-Reply-To: <aDrwb1YvwFKQB8x1@shikoro>
MIME-Version: 1.0

Hi Wolfram,

On Saturday, 31 May 2025 14:05:03 CEST Wolfram Sang wrote:
> > Below is the resolution I came up with.
> 
> Linus solved it differently [1]. I think he is right, but those
> interested please double check.
> 
> [1]
> https://lore.kernel.org/all/CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3d
> oGJg@mail.gmail.com/

Indeed Linus' resolution is correct, the mutex destroy line should be:

    mutex_destroy(&it.rxport->aliased_addrs_lock);


Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart4843312.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg9ydQACgkQ3R9U/FLj
287RJQ//dCf4ktUacENgy4w+i0niTR8B+ykeEW/eAK9UsZ9aoBcW9I1p2CUOKLTb
XlYJw3RNwiWoVsC1mTKi4VnSEN+HTO+7pxTNOMGg7O32hOeO/dOIrzHZDdbBrAMs
kT+5qX+0zWz6iFTGREcpDKPed+dKT0MVedOHy75nc6v+83zZSWgC5gRvH81b3B9r
oL1/K+ExmsqBUUHNO40xvPNjgGHmw15SY1R9VRkzqz/gOwyrkt/HmRv+O3j5/DxC
RRmJRYCUMt2O6gKqkddetVBXj13HNglL5ri7UhmvrOHgJf+KcZkdeD4M+pey9cu8
PtAa2qwyRQB3SzH9qEZbrgBt9oZCELdwdk0t0rwcd5hNmAUalJe9hV+YoCjRtK9C
nfb536xTJgAuYUrq7kHOAXQqhsnCwlxkBoqmBy69+5EmPL2ae6BoVoLfl80t8b/A
tE4xTEI/wPlyeBDgV2Z6jJVCft0PI1Arcutp9IKnXGVL3qMowBVln5RMZl7VnRNi
n9kxnSZ44lkuYyZfVnszC+Smjg660SU98njunTV7ogG7bFKTg9S0XE+tBBPT8emP
kWcFEh9VzqQD5Y2bSUAV0fU9VkZznhK+KmcaH0iK0TaU0x02GqdXI+1TJnfEAUQh
75hJdEQCj1older7B2euOyn3/4uqy7REXbND72/7YciJTYGd3VA=
=9KN6
-----END PGP SIGNATURE-----

--nextPart4843312.LvFx2qVVIh--




