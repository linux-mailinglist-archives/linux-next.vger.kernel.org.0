Return-Path: <linux-next+bounces-5635-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC49A4DB88
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 11:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3BC1886772
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 10:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4751FDA7B;
	Tue,  4 Mar 2025 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Us5aj1z2"
X-Original-To: linux-next@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1791FCCEA;
	Tue,  4 Mar 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085872; cv=none; b=Vo7dlzEPH3Qu1kn7m3yTpRfVUHKW8ZlLEG+RqCzA2xVQqFRpIS0zIYinIaorvI57TqB60CLUV8rKp8n9qajXkEkmKgKmD7CI07LodL8vyQUQ5GQPl3DX+qmDMPajN8A9rtFKBwbKJtlHr8eIcOp/TuVIf5IgAp6Vu5EnQUbmpZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085872; c=relaxed/simple;
	bh=hHi+DwXG7UY1lv/g3bg0cqOZrXqu9QgvgEgWrYe2IQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NUUftWYnSBbAH+biFBz317EzS1dIxnuxLS5ZPWkrVgiv5BmAADdk49Oae0wUd86RDEZC5oqYvSFtDQFMiSek+EAUMxtR3ZjT8pkzyujashG0/Z3dfWaoDOXuQCW7DKBXpRuwZR8SdtOhJR3J8qMrhjrAkfPz1a01NP1bf+u2NEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Us5aj1z2; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 874EA43292;
	Tue,  4 Mar 2025 10:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741085868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSbJA+yNi3J5I6jliaV/COu/d+wQ6yPnmnbAhuYtN4c=;
	b=Us5aj1z2NVdXZ+AQFLhrUFulk/YiLOQDxY90slcpX2HvvfYBomzJBuuUGIB6cANN2+sINv
	wlGFk3elUTwPZMc+ra+RIC5LVUGtpKg1I1cDOIR8Evn3LPIfkbCAn8GMRbso6NuoFWAmDU
	o2qav7grSATWc5I1Ttlti0tbpB/Z5x5N7jzSuz/TM8Xof6hogBLQOYoHJVoeyoA8zQnExN
	FAANNKa4srCXPFG+JtJOTpQ1cb5D+DypbyPkD+IkZRbBYKanw41UjgbT4/A2ivg/8jv6Qt
	wUh7YYXXNPSoR3pVc+QV+EuxsyfkualDQmL33sF/vnj64QSIjsKzgVB67yzJ0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
In-Reply-To: <20250304132821.57c8d996@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 4 Mar 2025 13:28:21 +1100")
References: <20250304132821.57c8d996@canb.auug.org.au>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Mar 2025 11:57:45 +0100
Message-ID: <878qpl2hcm.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddukeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepsghorhhishdrsghrvgiiihhllhhonhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegthhgvnhhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigt
 hesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Stephen,

Thanks for the report.

> After merging the nand tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from drivers/mtd/nand/spi/macronix.c:11:
> drivers/mtd/nand/spi/macronix.c:190:63: error: expected expression before=
 ',' token
>   190 |                      SPINAND_CONT_READ(macronix_set_cont_read),
>       |                                                               ^

I fixed the commit and pushed -f to fix the build failure.

The fix I made is not super nice so I will send a follow-up patch to
improve the style as the mistake comes from another unrelated patch.

Thanks,
Miqu=C3=A8l

