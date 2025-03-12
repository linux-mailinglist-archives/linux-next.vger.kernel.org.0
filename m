Return-Path: <linux-next+bounces-5756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D6A5D450
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 03:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 546FB7AA587
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 02:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039B613C8E8;
	Wed, 12 Mar 2025 02:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoBygWKA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD003A31;
	Wed, 12 Mar 2025 02:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741745666; cv=none; b=qvS3iN9ZGT7nv6KwPanGuOGcgi7mBQxSVAEs3BUGgkvSi6iSeqxLFIY7ZjhPKT77fgPinlr8mZyvWiqj+Tami9EqGcD9B0saj6cnTXiF+o5DG616LFbE6CnFF6q3NMkpBwFb7JHvwXTLb+hlH591zxoaJTOtwDtg6U1Qk1avsUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741745666; c=relaxed/simple;
	bh=Jgrd0IOFwXKx5cNRpIxdOiA/PFUhH1ns7IDEhYrycpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZxG+TlYyWBp8jqWFbuslmUakOAQWsThD7LMugk3KaXHv+9ebXy20fB/77JST9tupbQBXlHdQSZ3Jki+jZJo/Aej/Amus7ObWTy1Jv640PZrX464IkfVjTNv9KaHpRBJTg4TVCNdFBCqdPoUNMB0S53RCLXaOBmKW7QKD5c8tDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoBygWKA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1264862766b.3;
        Tue, 11 Mar 2025 19:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741745663; x=1742350463; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTiXVRvMHChmcGEHZioU5jJb39saCQAlzyWRmTIBmcw=;
        b=GoBygWKA6v5Sbq/V1JWXUKIBU2wZV4bqXzLGa5jXClLVOj+LIrQbApoQdv3QV5Mycj
         D/1eZLZaXYdbLeQI4/6GYSGWUQKltgWr5rwyhcuPlZu2pQ3LRxBNY9VyqFEZuRfvI9m2
         FEdBTUmI2zfS+cy/eFHLHCTi4h/LRAPHM5M8JkL3RaCjHn0/IwCBzhXxyK5bYTua2hp8
         u6RjwAnPqGNTw/sAWzZvMNsqS+Flly5XlfwPu14Xb76Bs3HjNVV6Zyz3FJQ/OQu4YsgM
         NrrWSuCX0H78KyjyyQlTkdHs+U3i9eki98yPsxtKAdVUpCznhvTx6JIWzAMy4y4Wsvtk
         9aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741745663; x=1742350463;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uTiXVRvMHChmcGEHZioU5jJb39saCQAlzyWRmTIBmcw=;
        b=BU3ozLuJ1T1KNh3T2haSxhedrInvrwMab97jh32C9sWVzMqm77+wVqk3nJpmxP8x/H
         t3lt+THzBq1JB8QRMXDEDqdVRqXWmP3mIzACUWQvfVuh+wf/QKdu8daMFbLW05CN5dsh
         CVtctdhofbgDePtTBGB8dievhrw9mdfiZqk5KEiF0JscuXhX/ikn0pwPgqFd1ohY1eVp
         cSTEKcUr/QGtqdAy1yzq9W3DtIecc7Hwdd5LZ+qCwdQv+m78Wkblxg6ld8XGpaY58pBh
         zli2TWXaemdv+8R/ZcYAuNreoILRqaoT3hAjyaUITo6Q3KqXQ3/xZpub88jO7UdxQSNT
         8U1A==
X-Forwarded-Encrypted: i=1; AJvYcCX4ADvUBuZrDp+K0SYQw8n6d3ZPVjEHtN9O1jfg6aeqsNZziKWWFLIrUojwfD5RXQZEr6MpmwCUMBmEwHE=@vger.kernel.org, AJvYcCXH5oVWDgiWtEiUtUIRuR1WyMc+r4XV76avizEuVEdQkQIBiBTiTXPY3k3Kc+aCOREjBQJ+9GeLWhgtiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAmmzUM2w/CEaAhgf65OXQFBxbSCKitRw2H7r45FLKf9LHNuZ
	+burl+zbaEMjQmuxctxnknAEu0YTCeCzVeHNF6b22mAr1fliOrpx
X-Gm-Gg: ASbGncuqqlI/T4HnscZoto3y6J4YjtNtC4v3nyiX4pCY0AA/QKTRhSlSsvj3fWUblqZ
	clDyztjMuFFQKbJbwIDix0JePNt/2PUvQdl4XdA0Sw1scX7Xwx6CfdCmhmegsISTtnDQHNLihhS
	utQMoq0hJs0g9KqaIO2GJMfaCx2GFrj6ht2dw6s8ca7dtz+pLmp2qZegemswrble25krXKQ/fOm
	XxiLEWXNAvrNVd5Akwi58/Ob3teVM/LJqFCv5Uj8QCrGORDF/T741Qt/922AJahm87g8lwsZ65y
	e93zJPuAFhnTvAdkupJUapyTinOhvSRVcX21fyfrnEQo
X-Google-Smtp-Source: AGHT+IFpuckntFRU94gzQKS40CPGh7+LcQhV5oVsN1Pw4hkYEpjcbn2x+WlJs/tRiExwspesuWqOQQ==
X-Received: by 2002:a17:906:4fcd:b0:ac1:e1da:8744 with SMTP id a640c23a62f3a-ac2b9ea197amr708883666b.38.1741745662847;
        Tue, 11 Mar 2025 19:14:22 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac287653e64sm564607566b.136.2025.03.11.19.14.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 19:14:21 -0700 (PDT)
Date: Wed, 12 Mar 2025 02:14:20 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20250312021420.nvkahcd3enlt3i6s@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250312113612.31ac808e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312113612.31ac808e@canb.auug.org.au>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Mar 12, 2025 at 11:36:12AM +1100, Stephen Rothwell wrote:
>Hi all,
>
>After merging the mm tree, today's linux-next build (native powerpc perf)
>failed like this:
>
>In file included from arch/powerpc/util/../../../util/pmu.h:5,
>                 from arch/powerpc/util/pmu.c:5:
>tools/include/linux/bitmap.h: In function 'bitmap_alloc':
>tools/include/linux/bitmap.h:83:69: error: unused parameter 'flags' [-Werror=unused-parameter]
>   83 | static inline unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
>      |                                                               ~~~~~~^~~~~
>cc1: all warnings being treated as errors
>
>Caused by commit
>
>  351b9e493b09 ("lib/interval_tree: add test case for interval_tree_iter_xxx() helpers")
>
>I have applied the following hack for today.
>
>From: Stephen Rothwell <sfr@canb.auug.org.au>
>Date: Wed, 12 Mar 2025 11:03:37 +1100
>Subject: [PATCH] hack for "lib/interval_tree: add test case for
> interval_tree_iter_xxx() helpers"
>
>Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>---
> tools/include/linux/bitmap.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tools/include/linux/bitmap.h b/tools/include/linux/bitmap.h
>index 8166719178f7..d4d300040d01 100644
>--- a/tools/include/linux/bitmap.h
>+++ b/tools/include/linux/bitmap.h
>@@ -80,7 +80,7 @@ static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
> 		__bitmap_or(dst, src1, src2, nbits);
> }
> 
>-static inline unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
>+static inline unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags __maybe_unused)
> {
> 	return malloc(bitmap_size(nbits));
> }

Hi, Stephen

Thanks for your fix. It looks good to me.

If it is ok to you, I would like to merge this into the original commit.

>-- 
>2.45.2
>
>-- 
>Cheers,
>Stephen Rothwell



-- 
Wei Yang
Help you, Help me

