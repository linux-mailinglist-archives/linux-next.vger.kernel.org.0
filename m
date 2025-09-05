Return-Path: <linux-next+bounces-8210-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69252B45B49
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 16:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33B81CC1311
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 14:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680892F7AA4;
	Fri,  5 Sep 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CiQiM12/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC092306B3E
	for <linux-next@vger.kernel.org>; Fri,  5 Sep 2025 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084170; cv=none; b=JYbwN6m7apkw9zPCu50gkGA8knlEOPFJ4hBswRMT6/q4q556I+UXe44G78TdH31YKndxT5Ncfkc9HBt2bi1LOqUMqNfUrqriaKUzmynEmwzcdH8xUtSptMLRc+1SDKN9yzRf2jit9g1cnW7nbZSao4gjKxyGO51ztPlpnsRRpgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084170; c=relaxed/simple;
	bh=YyGcLjwB4eKKLaUwFGWGYdpNROyD7L6Y0x2ghjvT0s8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kpm/EByvQf6t85gpKNP33za2iTNA3cMMN+Sbg5N9KMlO0gKBaXn68w042uDAdRb1KalryJYwzA3yirdLIQXMBG7HNFBJNoGOhrnyXa0ggbsbMzsrUReuFhWmbuFU1r4STH9OAHAAlfx9ZRKkAAxSflaFSz9TlC1JRuN4czUegJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CiQiM12/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6175E4E40BD9;
	Fri,  5 Sep 2025 14:55:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3923B6060B;
	Fri,  5 Sep 2025 14:55:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7327102F08F5;
	Fri,  5 Sep 2025 16:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757084158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qdhTArbNaDMxsjs34Ef1EAsaB5kOJ8TTb3Y4r3qV6wk=;
	b=CiQiM12/7wbT3hOLdnc+4lAZfLnMPcXqtjySzbnkibZBYF4z1Rr+5HIb7gD14lAvjpBtBw
	ZXK9+4J4TtSJjJBCK71g+8Zj7csxK3YvgsodgqaWt/11hf0m7e1A0/wl/zE/EaQhMR6vrH
	wPecGbGX8KfR+mNSgZKI28uRAIkhfIv3Mml/OzwxKrh4cgL3WoWnwpVE0MYY2DsVhOSpUv
	vTS9QJOAlBS9K3y2DCMxXtiVUUuxsWGWZNuxvIjHlPKTUZbFOEglH+KmMtkkPfCiZug6Vn
	2KV6Fhor3/dVnm6x/FqbZGJvp6ReuXpLH+QGAgYRaqgymitZVY74AeT9iB9UTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Amit Kumar <amit.kumar-mahapatra@amd.com>, linux-next@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250902082539.126099-1-miquel.raynal@bootlin.com>
References: <20250902082539.126099-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/2] mtd: concat: Set virtual concatenation to tristate
Message-Id: <175708413736.334139.7652849015516021898.b4-ty@bootlin.com>
Date: Fri, 05 Sep 2025 16:55:37 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 02 Sep 2025 10:25:38 +0200, Miquel Raynal wrote:
> There is a circular dependency where the MTD core calls a function from
> this driver and this driver calls a function from the MTD
> core (add/del_mtd_device()).
> 
> One solution could have been to extend mtd-y with this Kconfig symbol,
> but at the same time there is not reason to force =y on this driver, so
> just turn it into a tristate which solves the situation.
> 
> [...]

Applied to mtd/next, thanks!

[1/2] mtd: concat: Set virtual concatenation to tristate
      commit: c64295ea28808590b15341f4f8065c886a2bb372
[2/2] mtd: concat: Fix Kconfig typos
      commit: e7f970e5740eb21b67421d981bac5dff88e8ad14

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


