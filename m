Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8D77A0B03
	for <lists+linux-next@lfdr.de>; Thu, 14 Sep 2023 18:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjINQvn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Sep 2023 12:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjINQvm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Sep 2023 12:51:42 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98228CE
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 09:51:38 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c1ff5b741cso10467495ad.2
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694710298; x=1695315098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwWvVl8aOTD5MluoXekdmrqRM+dRNHxbE45XnwaB2gw=;
        b=C9zntzdFcoblYjLzyZqQ2T3AWK08feI2T3ILWTxEU1Y1hRewCdrVgsthJ1PEy4aaUq
         vVFf5NSTTJQ+/utw1HYaYBUFHYGQ9FUJl++YOz83Ao20/TrNqTim/rqGTSUKrA8afp6y
         h/T8eUpHOwKArCSF7aPgJOhK+fOzWnLjASZQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694710298; x=1695315098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwWvVl8aOTD5MluoXekdmrqRM+dRNHxbE45XnwaB2gw=;
        b=SIrmjTO4AGlefL+ZHPPcilejWINkxzYdjyACoRM3HbBNA6kywhz9iWC9YshQnx0q0q
         g1HgxS3ENqeYuwv9+ncb/9ZTyT22k+GA+JobDVbQWxKkXgvOWH4aghS9OE+ePEbU2Rrg
         sKVfNxKfzurI8ED/B+Wg2xkD6faUv6tILBm/Nom2to3gbwcWIr6nbIbI0D2VURgEwirk
         tfm8lZVe1Ey8oukEd3hNM8ps4hfb7F7D/1oh18Z+reuY5RFU5CZj4jyuHOp9ddax1+IW
         ulyUuyabwQK69pdTB9WxKYdAda0d5nOI143BxMCvb+w+ZGxdBzrQlCzvtLyUb7LNOxHA
         Zh3w==
X-Gm-Message-State: AOJu0Yyy14nh7uGlZukuXFof0fqLTw+IW0cfA9s9guZgXzrhVtPvw72Z
        JP5wQTTcMA7lmrZFdH6nrJwPj5SlMfbvNk3TK00=
X-Google-Smtp-Source: AGHT+IENvFzKbwvG52UCB+3+11WvzZEDrnoeO9yw/RS4+FeRTRUqvTGWRBdn6zOo+KywzJ4NOuL2EA==
X-Received: by 2002:a17:902:650d:b0:1c3:d9ed:d16e with SMTP id b13-20020a170902650d00b001c3d9edd16emr5531650plk.39.1694710298093;
        Thu, 14 Sep 2023 09:51:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001c322a41188sm1817053plc.117.2023.09.14.09.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 09:51:37 -0700 (PDT)
Date:   Thu, 14 Sep 2023 09:51:36 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Sep 12 (bcachefs, objtool)
Message-ID: <202309140951.F73B5557D6@keescook>
References: <20230912152645.0868a96a@canb.auug.org.au>
 <d60dac60-1e38-4a8c-98ad-a769ab1dfccd@infradead.org>
 <20230913210829.zkxv6qqlamymhatr@treble>
 <202309131758.208804F4@keescook>
 <20230914135144.udwf3lmhh5zael5e@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914135144.udwf3lmhh5zael5e@treble>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 14, 2023 at 03:51:44PM +0200, Josh Poimboeuf wrote:
> On Wed, Sep 13, 2023 at 06:01:42PM -0700, Kees Cook wrote:
> > > +++ b/fs/bcachefs/buckets.h
> > > @@ -180,7 +180,7 @@ static inline u64 bch2_dev_buckets_reserved(struct bch_dev *ca, enum bch_waterma
> > >  
> > >  	switch (watermark) {
> > >  	case BCH_WATERMARK_NR:
> > > -		unreachable();
> > > +		BUG();
> > 
> > Linus gets really upset about new BUG() usage (takes out the entire
> > system):
> > https://docs.kernel.org/process/deprecated.html#bug-and-bug-on
> > 
> > It'd be nicer to actually handle the impossible case. (WARN and return
> > 0?)
> 
> Sure, see below.

Looks good to me; thanks!

-Kees

> 
> BTW, I'm about to go off grid for 1.5 weeks, so there will be no v3
> coming from me anytime soon :-)
> 
> ---8<---
> 
> From: Josh Poimboeuf <jpoimboe@kernel.org>
> Subject: [PATCH v2] bcachefs: Remove undefined behavior in bch2_dev_buckets_reserved()
> 
> In general it's a good idea to avoid using bare unreachable() because it
> introduces undefined behavior in compiled code.  In this case it even
> confuses GCC into emitting an empty unused
> bch2_dev_buckets_reserved.part.0() function.
> 
> Use WARN_ON(1) instead, which is nice and defined.  While in theory it
> should never trigger, if something were to go awry and the
> BCH_WATERMARK_NR case were to actually hit, the failure mode is more
> robust.
> 
> Fixes the following warnings:
> 
>   vmlinux.o: warning: objtool: bch2_bucket_alloc_trans() falls through to next function bch2_reset_alloc_cursors()
>   vmlinux.o: warning: objtool: bch2_dev_buckets_reserved.part.0() is missing an ELF size annotation
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  fs/bcachefs/buckets.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/buckets.h b/fs/bcachefs/buckets.h
> index f192809f50cf..211f054bf83d 100644
> --- a/fs/bcachefs/buckets.h
> +++ b/fs/bcachefs/buckets.h
> @@ -180,7 +180,8 @@ static inline u64 bch2_dev_buckets_reserved(struct bch_dev *ca, enum bch_waterma
>  
>  	switch (watermark) {
>  	case BCH_WATERMARK_NR:
> -		unreachable();
> +		WARN_ON(1);
> +		break;
>  	case BCH_WATERMARK_stripe:
>  		reserved += ca->mi.nbuckets >> 6;
>  		fallthrough;
> -- 
> 2.41.0
> 

-- 
Kees Cook
