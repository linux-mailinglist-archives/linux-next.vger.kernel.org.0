Return-Path: <linux-next+bounces-2778-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA491E96D
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 22:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD49283C3C
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 20:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933A916F8F7;
	Mon,  1 Jul 2024 20:18:38 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F416DC09;
	Mon,  1 Jul 2024 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865118; cv=none; b=rHLzx7quX62jXe64NJsgKjcEfT/nfdvscqqsDf1Wu3Yu+43F0DEWu65djC7G0NGFU9Ww2hs4zSLaVFxkJ1mNpOakj2AmOdDZFHpcqEUm8y2mCQlcmVAZE20YPQPr+Az+B2ym4Z4QgyOL5/jMNGGYFx42Pvwh0mowVif+bDOgkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865118; c=relaxed/simple;
	bh=NI3s/o+bmWnBqE1CDXLmYzm0L/oZ7olInnCwBeLctks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHWSggGiG9by3SEL6yntqAsWHp5osP9mAE0ky3a32bcllT43p+EVjLC79mCFBhdK2SptQ5K6IvxSGsa383XNeTejDOwOI2z4VLbrhyq/olbMxdT5EgPkFsSFnHQb+RDcDt7GofvFKcBO36fCIuzybdHXao0a2wddylmz4gD2p44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso2255988b3a.3;
        Mon, 01 Jul 2024 13:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719865116; x=1720469916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBP9MZWwypSl48wuanJ156LEJMBL9eDePs7yiGtO0QU=;
        b=TCI04qaPntPob3N2H2ATz07MpzcCpTuIGlY9ZuTu6py3VHRBuetf5EAh4kELRZPzse
         S63XQ9NOynKF8YMh86bHoucRvKmeIlvCD8wVaglpKZU10NmA+PNBxCkaZFjyTYRe/N5f
         wecfp/n5ooqt384Zx5c2uPopYbs68WjS/o/a0uK7gmSrh5t5qWuTr3I+kEo5DAc0Zl8T
         r+hJyMlMb4JbM/m+PUMx038YETud/HwMsow0h0TGsMEv22/SnPCtzM1sWM4HyRikynO1
         U5AHpxt5brcfy/yKiKKIVCwNH3YUEnNmqZ81lCKH7f2GVNxgXBYRFRmX8K3KSekOWmw9
         dCGg==
X-Forwarded-Encrypted: i=1; AJvYcCU52yui2TA8mNC99VcK5jDEY1Qz/QFrgE0LIq/grqyoW4I0AwwQFQ6wYmNdWGRBuRyqzJKFCSpMDtSa0lWBXoW9Kru0bcFinHgBIzj8BCWi2PfJ9eMMWsfFLVOFMy5N9LVtayH1Tf2ARQ==
X-Gm-Message-State: AOJu0YzyKdZVtnU7TBKHZfUEBj7bupUoRmeLVS3lbvk18j9CJh02m0Td
	+I7tN8p5Q2L92f4wnyFdEvUKOJqw94jMHlFanSSu1B7KaDcKX/pA
X-Google-Smtp-Source: AGHT+IH03CePmzk1psec6WUUuqlPcFSVADz4yd+sY9YqIgXU1EOQbZzVSg8PHibHKrP5s1o2BSgYkg==
X-Received: by 2002:a05:6a20:840e:b0:1be:c2f7:275 with SMTP id adf61e73a8af0-1bef6245512mr5931315637.50.1719865116131;
        Mon, 01 Jul 2024 13:18:36 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce6e7easm7243671a91.25.2024.07.01.13.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:18:35 -0700 (PDT)
Date: Tue, 2 Jul 2024 05:18:33 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20240701201833.GB272504@rocinante>
References: <20240701091320.64ea6091@canb.auug.org.au>
 <ZoJg_k2En6bqQzA4@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoJg_k2En6bqQzA4@ryzen.lan>

Hello,

> > In commit
> > 
> >   aaf840725904 ("PCI: dw-rockchip: Depend on PCI_ENDPOINT if building endpoint mode support")
> > 
> > Fixes tag
> > 
> >   Fixes: 9b2ba393b3a6 ("PCI: dw-rockchip: Add endpoint mode support")
> > 
> > has these problem(s):
> > 
> >   - Target SHA1 does not exist
> > 
> > Maybe you meant
> > 
> > Fixes: 728538f5e806 ("PCI: dw-rockchip: Add endpoint mode support")
[...]
> The branch was rebased so the SHA1 changed.
> 
> Perhaps the maintainers could update the Fixes tag.
> 
> (Personally, I would just squash the small fix with the commit that it fixes.)

I will squash the patch that adds PCI_ENDPOINT dependency with the rest of
the series, and then drop the Fixes: tag afterwards, since it would not
longer be needed.

	Krzysztof

