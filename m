Return-Path: <linux-next+bounces-7071-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C0ACF146
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 15:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3DAE3AB7C8
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 13:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317B7272E6A;
	Thu,  5 Jun 2025 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LxqEvHXJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE45266B46
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131459; cv=none; b=i8eUY5avB/0wPt+F2AdJlp3+/aXkmwWTSwcEnvpUPfj/SP2X7rC6u5udIWuxPEpp55QLPXuN44g1GVqypG/MY5T1a7b4oBEkbFI38hhjBts7ZNINtPzYq8A3/ShLBvW9dAi/ZV/Skk/tNYrTRRHtc8YEn+hI6GkLIjfFm6FAQ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131459; c=relaxed/simple;
	bh=pGhX/wVZN0RGvBVwSNXI+HlZVCiN3e9tQXYEg1OIFho=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6js6o7F2lRGuTjr+LmWf/MEF8LMYpaZVpBLrtzJMQmVYJ7KjXYtddPb7uTqiHTGLss7SJQoiJ0ySk6PekfavcjKJcjR6lwPWIMPfzjeBQU91fuH1Uvtj3u/gGxfZzcAwiVZkd0+OCkdApoXp3cK93vaVqm1mmjcR8kbz31MKTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LxqEvHXJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso2016268a12.1
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749131455; x=1749736255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ggZCkgQEfMCBTbPPekOLvTIApHTIQLiYr/IDAMWkO24=;
        b=LxqEvHXJLYk18bGojUrSLXq17kg7fltNrkO3UaA1AFcH2GbiI1eui22s/l6ekjeMX8
         U0qiCZZ6Ay6LrYnyuJ18iuQIjZiF1vEGuBGankf8vkdBZBk7qTNO247haDL0jwUL3eHP
         XwHc5Vmw1tP5pTDCkmXFqM1n6FgPz7L3mZ0K9Ml001YWaGW2J7ZvrkwCPV0nkoWv93Vl
         y5sDrPL27oxg/hg48BoYip8H+7oMpFWmjev4Sy/HjqKfVSH1VXZel+0/77VX3/KsMhzm
         45eBu4xreuHYW5V4Ondzg2e32GjHi4AN+GfEpP2z02zBOwvGxWGrwegzkPz6tvlSNwek
         KjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131455; x=1749736255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggZCkgQEfMCBTbPPekOLvTIApHTIQLiYr/IDAMWkO24=;
        b=CRgFaTXWLojI9KDydqsvebkdJJS427FNiBx1HOvVxNe+jzjHVmpSCipLYiPyn5C7Y2
         +upcH3rcfAfJ1rTFAdhZnXK02DRfjp3OFAgYoUf0ksDJDbAD8lma65r3h05mt03NvZPV
         g3KWy8LrPxujMX2h0oG8XCOgwrBf8n2lG0MQDfwg0x7WxtBYAjG+WOnAXP4bVqekzGRP
         LW3qNApaW8Vmenl6G8rRSj8rr4g46g2vm6k88X68NeIvQkfX2Vz1m6t+G6gVvj3DbCYz
         tnScTrtgHfrEtF3wCbBPYaoNx6Mwo265x8tMW3AcokN7nk6mD73hue34l0B/F3qkaAww
         QaYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqbbgZc6SAKOhGTI0f9eSijSHZ+mHJJUgZVnZGGjircUJISmM2AO+UkUkNo5QL7QUxTCj6zqStugwA@vger.kernel.org
X-Gm-Message-State: AOJu0YzjovngEP4VcXiyob3x91QiEbx0rsVZM1fSsPDHkVW+ywAGfhV8
	cRj5Kb4MZQ2lQX+06OfAjIgne+DRH3bC14XoMc/pxe6zUOoJgRt8F8vPQmi58eLyv1Q2crTtjMN
	9BrlhLT4=
X-Gm-Gg: ASbGncuaOL7zoJo0b9UTDrNEroVwEReX7EH2GwWBuBzJrq0qKZfkC5exnwRKl+/EoGK
	D33Cvvhuyy8W/AQ1nRxcKIQz70/djcYVybgTxM8clk3PTlOU1fWZ3vz4ZZ/jQGgUGAAnm0lK9a0
	tYkJOIu/6QdBoahX9yxfeTVtMF+mt9LTLKBierygu4sn+cr+eTdXr4MPmPT9zlHvJ+obcmLEw9+
	xUwfbFQ34yD1yWF4GNZPvaZvrhrfoC4uTbzb4T417s18ODxtuVI9v5vICK6lR0Y9YaO/iH3MhHX
	cXtFdumC34q/tYeUD9YpxzfCDrB542RziQS9YfOunlMQD0kNhhn/wGAmbLFisJOqT3Kj0sWmu6C
	J2GNHGKMjDKzoA78UWx5Mf25lmyowWcefSj/sXyzZ8VI=
X-Google-Smtp-Source: AGHT+IGsZK01GTgeXRGvrF2f+PIjoQHuluhsLAHTkeb0wTJPNILx+jwsb/VHsmQ9utQ5doDtE/qnrQ==
X-Received: by 2002:a17:906:7951:b0:adb:41b1:feca with SMTP id a640c23a62f3a-addf8ff443cmr600103066b.61.1749131454652;
        Thu, 05 Jun 2025 06:50:54 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e760sm1275872866b.52.2025.06.05.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:50:54 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 5 Jun 2025 15:52:31 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
Message-ID: <aEGhHy7qPyIjG5Xp@apocalypse>
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
 <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e88587d-f426-4841-b370-b46917822212@broadcom.com>

On 20:06 Wed 04 Jun     , Florian Fainelli wrote:
> 
> 
> On 6/3/2025 10:01 AM, Randy Dunlap wrote:
> > 
> > 
> > On 6/3/25 12:00 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Please do not add any material destined for v6.17 to you rlinux-next
> > > included branches until after v6.16-rc1 has been released.
> > > 
> > > Changes since 20250530:
> > > 
> > 
> > on i386:
> > 
> > ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
> > clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
> > 
> > caused by
> > 	/* must sleep 10 pll vco cycles */
> > 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
> > 
> > 
> 
> Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!

Sorry for the delay, this should fix it:

@@ -754,7 +769,7 @@ static int rp1_pll_divider_set_rate(struct clk_hw *hw,
        clockman_write(clockman, data->ctrl_reg, sec);
 
        /* must sleep 10 pll vco cycles */
-       ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
+       ndelay(div64_ul(10ULL * div * NSEC_PER_SEC, parent_rate));
 
        sec &= ~PLL_SEC_RST;
        clockman_write(clockman, data->ctrl_reg, sec);

should I send a new patch with this fix only (against linux-next or stblinux/next?)
or Florian is it better if you make the change in your next branch directly?

Many thanks,
Andrea

> -- 
> Florian
> 

