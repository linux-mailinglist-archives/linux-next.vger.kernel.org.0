Return-Path: <linux-next+bounces-5737-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D434A5C079
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 13:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87BB17AA86B
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 12:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF58125487A;
	Tue, 11 Mar 2025 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="GqYb6bsJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NPJWyz8l"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72F2566CE;
	Tue, 11 Mar 2025 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695188; cv=none; b=ZZ30sn3L4l9bgBIfQWdevO6B1UXKl7lbL1zktZsvIUh1ZqdQLSwGxOgBaZIlZeGVU0zwUnZmp90FNvUMBAw6XACGS0c+cajqyyUcha7KTXyGWkjUiFQJcSZ7FzmwI7CZuj3vg4xNo+tkVcHHCz18mgvxbYeKWD2nMbZpq1fRfF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695188; c=relaxed/simple;
	bh=+k3q52EoqcvtqGv2M5AyIbDO/KKx1hnebaimGmGMPto=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ISlcdbYkX2FW9C7uZHOjqotJSzyNZFQ2E5bRz1p3jySpCA987ocPYIDMMMNV1XBSdozSl1TdkIAU424UsRWa4H/Vtyu184I5doWDLQVEqxF1dUzh/uodjAZ/nw4v0KD3w0wUuWXFjMK35DuMSgl4aQSRrrT25BgGhZQzkic6K20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=GqYb6bsJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NPJWyz8l; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id ACAA21382D3C;
	Tue, 11 Mar 2025 08:13:04 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-06.internal (MEProxy); Tue, 11 Mar 2025 08:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1741695184;
	 x=1741781584; bh=N9k2geTZznb7unSBRl52sG1fsJRfFqOnHSENCpmQupI=; b=
	GqYb6bsJG/XDec6cqMgYuwqBkLNwqIbUfcVt82v7UYZZdStk5efYoxFdQry4AnUY
	piOmCbPrnHM1aUa/5Kf7ZRyTCOkmQHJSKfkdmiw69V4WLk1J83J496i+m2QB8uM7
	877XpFm3wCkLNKR6mAK0sLbOtTjxYnp4axIE3ENabXQrbnCR+UIOFt3kjrEKvZ6o
	71yL72DwFU2yS5GuQoODgBGShkUgZcoxaWRa39rsOX1YqSokPBwz592ilyiXMURi
	bwfUkwKNeZUpMYut3JORQb9WUE+DLo2W64SDINl1AZ91ZvBjg6d12QwOd84uDcmg
	VwyKQ+bICpaX5ItEqsLObA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741695184; x=
	1741781584; bh=N9k2geTZznb7unSBRl52sG1fsJRfFqOnHSENCpmQupI=; b=N
	PJWyz8lvu4yPLD+haZwKOTRW3fFe/KG/d++IxMYYzgEu4ev0yBN94QY3FYF8jy9E
	6c/XHZTwNWT/coEDBxg3BUhe/GOa1dBsI99oI9Rz04wpoFL6sQKm75viF4ePS+aM
	Ak0dcnk3B9CwV55wMoDSpL/OBemdE3onWlWM7HNeZBYg1YR/+sY9CKmIDJb1rgbF
	q72CfM30EuRtVEpZGBzsQX1DEuuedofDq49Or/afXO0X+GeYVDx1lXdNhUSKeEfL
	lAAS84e51pGkYMv9O6SnSpT9v9q83DLuFAoBtskOkhqXOmMOIVicpPcmOPWCYlF1
	mJmuA4lz3tuQcH6GXWLbw==
X-ME-Sender: <xms:zyjQZzGqo-wU_Y-tooqMiGJyD8Quy1J-8qHGH_9dSP2SRruDg2u8Ow>
    <xme:zyjQZwWZuXcPOdes61Z_pSpfHTM3PEd5ytL7aWrVHfZY8MrRSBLqrSQsQ-mZcYSr3
    MX5lgJ5NJBqk8XUELA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeeh
    tdehtdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphht
    thhopeifihhmsehighhurghnrgdrsggvpdhrtghpthhtohepfihimheslhhinhhugidqfi
    grthgthhguohhgrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhn
    vghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:zyjQZ1L9fBcUf_r4M78cN7rw3f5_TGyY6ctLYGLxOAKhkq8YWW-KIQ>
    <xmx:zyjQZxH0SjR0xUyeSBfvyV3y2dqXhVzXucVuMKmadArUJF-uGYU7uw>
    <xmx:zyjQZ5X1IJUx1XgrxHRL97AaZZ5wPGo7hvh8rcRzi0XzuJJsdJDa4A>
    <xmx:zyjQZ8MK7zesPTlwto_pP63yDp49VdRi3CW_aGzzw-EyeI_dzHnOYQ>
    <xmx:0CjQZ3f49f1j6zYKE0mqWyCVXIuflxAbhyhcgL7Qv6NLwHnflLt9QmgG>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ED28F3C0066; Tue, 11 Mar 2025 08:13:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 08:12:41 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Wim Van Sebroeck" <wim@iguana.be>
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Message-Id: <3da76007-31f0-404a-a324-dd3068e339c5@app.fastmail.com>
In-Reply-To: <20250311210305.3c5a2313@canb.auug.org.au>
References: <20250311210305.3c5a2313@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Stephen,

On Tue, Mar 11, 2025, at 6:03 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the watchdog tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/watchdog/lenovo_se30_wdt.c: In function 'lenovo_se30_wdt_probe':
> drivers/watchdog/lenovo_se30_wdt.c:272:31: error: implicit declaration 
> of function 'devm_ioremap' [-Wimplicit-function-declaration]
>   272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, 
> SHM_WIN_SIZE);
>       |                               ^~~~~~~~~~~~
> drivers/watchdog/lenovo_se30_wdt.c:272:29: error: assignment to 
> 'unsigned char *' from 'int' makes pointer from integer without a cast 
> [-Wint-conversion]
>   272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, 
> SHM_WIN_SIZE);
>       |                             ^
>
> Caused by commit
>
>   c284153a2c55 ("watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo 
> SE30 platform")
>
> Somewhere alogn the way a change to some include file means that
> linux/io.h is no longer implicitly included.  I have added the following
> patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 11 Mar 2025 20:50:05 +1100
> Subject: [PATCH] watchdog: lenovo_se30_wdt: include io.h for devm_ioremap()
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/watchdog/lenovo_se30_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/watchdog/lenovo_se30_wdt.c 
> b/drivers/watchdog/lenovo_se30_wdt.c
> index f25429da0cec..024b842499b3 100644
> --- a/drivers/watchdog/lenovo_se30_wdt.c
> +++ b/drivers/watchdog/lenovo_se30_wdt.c
> @@ -5,6 +5,7 @@
> 
>  #define dev_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> +#include <linux/io.h>
>  #include <linux/dmi.h>
>  #include <linux/delay.h>
>  #include <linux/iommu.h>
> -- 
> 2.45.2
>
> -- 
Appreciate you getting this done so fast - it was on my todo list for today.
Apologies for the build break.

Change looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

