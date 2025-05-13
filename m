Return-Path: <linux-next+bounces-6730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E2AB4CDA
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 09:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC723A3564
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 07:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBFC1AF0BF;
	Tue, 13 May 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DkCR0Nt7"
X-Original-To: linux-next@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82617A31D;
	Tue, 13 May 2025 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121775; cv=none; b=FHNRAr7xmwhYADnn8FaTP9ZP8pJJdUVBo4ySYBl2D74ERt9/pAFNyjrngQrTxTVdSvnNZ2UDe1tsSUp5WKa0QbzhpMcIPJ5SvVknThvqzz6E4zx/zaSgp+/JwscSvsLHzUIUHn6fbRETXM5Gy4TDFHtLIv2T4IVEyXZiOkfRqgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121775; c=relaxed/simple;
	bh=sZHU5QjkSNrgCtm1qMTPexRaxS1MRJeA1ka6Gvbtt1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C0T44qxr91wZrThcgeQzZlMl/bcFlc/T9cy1TNHfoKBxsBl/E6BsUwQK1QRv7EwJiFnft5AIG5h85YUSz6PaT1O1S5tvgA5kAeNR0lW0E8zLFFDiayyfHOEEAmPEzkDhGIMorO/xpXU79vBMh04t566GUKUYuw9a49pML6gOyvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DkCR0Nt7; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D32501FD43;
	Tue, 13 May 2025 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747121771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QmMQ3Gsmj4zj5inC2TIsuWDdN7USydi5Z/GROHFAck=;
	b=DkCR0Nt7T91yNE4NSOYYOzZdb/0BaxGy/U8XcGg2UCoW30CaOR6GvdMXTyX/DyBewL/AKK
	BLiGBKVQewLp8GgQRuIjYYFnDm7QQzkmA4DwMqJck0Z5LtSggEKazgcUyIsVdmy9EGuZx8
	y6TTMOGXI880rEYGRUrnZEcQ+KlDf+lHdVXyo33JBlS5aVQvL/RM8PqVHzYsRO/QmWGDD1
	FeERqWz8MBhfvKMXRufNJrDrP2Nxy775D7Nx7tw4iIUfhDMMmSklTXHuL9Mv47l9IQHjHy
	lC+LDF8NcT1Luxpbtpvv6UyQyI31OCQEEX8T8k1RQdvisZvrh4BtpGCF57aBcg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,  Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the mtd tree
In-Reply-To: <20250513085211.3921178e@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 13 May 2025 08:52:11 +1000")
References: <20250513085211.3921178e@canb.auug.org.au>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 13 May 2025 09:36:09 +0200
Message-ID: <878qn1ezdi.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheprhhitghhrghrugdrfigvihhnsggvrhhgvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Stephen,

On 13/05/2025 at 08:52:11 +10, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:

> Hi all,
>
> Commit
>
>   38719f8046b2 ("mtd: core: always create master device")
>
> is missing a Signed-off-by from its committer.

Strange, seems like I messed up with b4 shazam. Thanks for the report!

Cheers,
Miqu=C3=A8l

