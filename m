Return-Path: <linux-next+bounces-9612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A5D15B75
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 00:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE6C33008781
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 23:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457CC24DD09;
	Mon, 12 Jan 2026 23:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTq+jmBj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LH9d3MoE"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4857223336
	for <linux-next@vger.kernel.org>; Mon, 12 Jan 2026 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258837; cv=none; b=iRtr40b4OM+t4FdLDRRtf2mecfX8drxI6SUpXpgzLJbvK4ThLL+B6EGBwBQD/+0EXTUIxheRK5QOpegQGOB4F/O/pZO+AHGf+WvU9ThootIyRmyoqnfItlzybwVkYyq+eNnKnNWxTdyoMh9njgdIiO5cs1RoONhX4QlEqFHNnXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258837; c=relaxed/simple;
	bh=Nr7sVd63wLOVXqGkxz4Q5NbqEOC1cSAV6vgokcJSJ2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucSSRdcaaznf1DjDGM7v8435bm+Sof3eYDlgCikafw6qddu715PCnwnHo38eLWT1RqX7Sua8UcgPfCEfgyQVOHLjTYFurWNNCZNIj+QzURsrvvLnS1LBRLckNMbw2w3yQNkuc5QntSHaGym2XQte2Rtf9WG+RkKww7H+AhtB568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTq+jmBj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LH9d3MoE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eo0cuDQpLVbMEIubXQBK7BTKxJNjrbw4B4nTbFFJRp4=;
	b=DTq+jmBjE+hp3hGjl0T3JKj8RTyG92FmYA3rfTmhGkv/AZSTp7l8U4/3zQhjhqwtg8LtLI
	iZPhsg+6xoTg2RdjCAVA8rI+brlX5hQzE/Vgs7447brRIXcrq6lkqYkANowzCQ1JKfwK5D
	Sj7EL2rwFOmL6uC+hCovMZ0rOz6m5/Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-5CDjb__tN1aMagJDtZpbsw-1; Mon, 12 Jan 2026 18:00:33 -0500
X-MC-Unique: 5CDjb__tN1aMagJDtZpbsw-1
X-Mimecast-MFC-AGG-ID: 5CDjb__tN1aMagJDtZpbsw_1768258833
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e19c8558so380870685a.2
        for <linux-next@vger.kernel.org>; Mon, 12 Jan 2026 15:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258833; x=1768863633; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eo0cuDQpLVbMEIubXQBK7BTKxJNjrbw4B4nTbFFJRp4=;
        b=LH9d3MoESHpLXnLEa4Ms4vIdgZc0WTpxzRUQjOU+TXoBqFv2551b+1Fc8HswZRdLIc
         /i7Ncop20z3qUWK5W4F2AoT8Ru6RJFFjcGpacz07RyIvkXH/4bKvjeMB7odOhOAspKzD
         e29/eOqoB5ZjrDN/3hAJBllEnZRjYQ/zcz6XWPxrsLaybf6NUqIF7deTHqUzW6ukUWge
         wLOWwvesbCShyF57Ayk9cwS4kYZff36+FKSCFqz2559+mPqvFFkp9Q/jL4p18yqB5d8S
         Vd/fQM8GseJF3HzMNZwRougtTqvEYiOX3wfZjCPK9hYQCU5YNe0aQ6GyhLZAGpxnp6m7
         /oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258833; x=1768863633;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eo0cuDQpLVbMEIubXQBK7BTKxJNjrbw4B4nTbFFJRp4=;
        b=BaoozNGpSEpCmcf7G4/7WPK1K14YUL4Ff/mHbyvVLgdOsLgR5a+FYTlFIi6HDJHcU+
         gNnVK2NZymx3yCnzgPO93nQQoLZS+HD+ZaSaV/2ClpdUhgVOwOLCQXBjkRhfzia/WP0M
         lhgMlXPQVni6MNiUeAMRxtMKMvsIrUXTlOhnDBHkBHQzxauA72A/DmC4w+L3M4zNp2ng
         TcFn7iykdvGQ0UT1mAXm4q7l3bN0KSCdHhEuR/L7IaXBQk/TqUSQsXlsFeoADroqILER
         iSlARvg4q9dnMhxtQ3Yu63fgPZWQPnzKztabxESvvC3kzPUcSmPmeJR5ev9Rg+LJhgFI
         ngCg==
X-Forwarded-Encrypted: i=1; AJvYcCXyI9ATA75XI+6VdHBo/FcY6Q6jxUMiUoPDTNEkjrA4zy1q80lgSmYBGYd9CJsszA9vihbpwWjaAGL8@vger.kernel.org
X-Gm-Message-State: AOJu0Yye17AZmt7VXqetag9/W+XHI3yB2uD+quRxPRkQKny71SjtNyuf
	t+UmQqp4BTWsSvjapqkTiMdw57KfVfu7ijphc8z4u0J8/TuP9v7BqwYEo6okMNSxiRN7oSGYYq5
	AHb49qOvW8mqfmlVvwAOekCYiYZfXwMIurPxagFxx+2bolruTSuu5nsecbuZ5CUk=
X-Gm-Gg: AY/fxX6I+MJg0XUkrCu82+ynzT1t36K37cRSb9Gkr60q3+CPVrokTuIhtYGFcI3GQcp
	rx0C6Jo/r+KVJ1D8i9ZCWnQMDUgOTl99OKzrhWfdiPD64z9aeN+ryzrCzKWhZHSwZt0gV/O8vMS
	uk2Ugpl/Z8LGMBJTG7uGs+JtttPpXRX5dKL3H9DZLZ2xdBMb2Xt4BL8ib2digx5szmB4iAthJdl
	QiASvB4BqGtc5E25Zv4YP5dHJTvAXd0bmRMQ/kXhjeT7qTOKvaqql62ECRwQXMp50bIFdVTzLJQ
	h428myniL/guWaGrhKJTMx7b1UIvVgCl6qeapvLH0i1EDsDH5mUL6IcgbaoIABbmWFjSgGFRfJo
	EnAqix3DQx0MyJmighfiuqNPZvH2jC3+bpLSGfN4PnDbw
X-Received: by 2002:a05:620a:170d:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c389369a24mr2844224485a.16.1768258828311;
        Mon, 12 Jan 2026 15:00:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZSOksfpn3NyPnIvRzJHFG2BcaiZtRT/9QOAP5dITSFIg0RBODQZS8GqrebcvVBlE4K8IJSQ==
X-Received: by 2002:a05:620a:170d:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c389369a24mr2844168785a.16.1768258823136;
        Mon, 12 Jan 2026 15:00:23 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530f99sm1592077285a.36.2026.01.12.15.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:00:21 -0800 (PST)
Date: Mon, 12 Jan 2026 18:00:19 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <aWV9Az3SuQgvSBQ0@redhat.com>
References: <20260113080606.07743e2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113080606.07743e2b@canb.auug.org.au>
User-Agent: Mutt/2.2.14 (2025-02-20)

+ Bjorn and Konrad,

On Tue, Jan 13, 2026 at 08:06:06AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   35a48f41b63f ("clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()")
> 
> Fixes tag
> 
>   Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Also, the subject in the fixes tag is the same as the fixing commit,
> so I have not idea which commit was intended.

I missed up my Fixes tag on this commit that was applied to the qcom clk
tree:

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=clk-for-6.20&id=35a48f41b63f67c490f3a2a89b042536be67cf0f

The Fixes tag should be:

Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")

The SHA is correct. I just have the wrong commit description.

Bjorn: How would you like to handle this? Do you want me to repost a new
version of that patch, and you can drop the current version? Or can you
rebase your branch with the correct Fixes tag?

Sorry about the extra work. Copy and paste error on my part.

Brian


