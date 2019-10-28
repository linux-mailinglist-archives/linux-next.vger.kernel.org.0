Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4E72E7CDC
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730436AbfJ1XaY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:30:24 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:32801 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfJ1XaY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:30:24 -0400
Received: by mail-pf1-f175.google.com with SMTP id c184so8095004pfb.0
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IigOx+ibhVy6G9eR8AVt3BpdeL/75L/6DoVLQSCaldo=;
        b=QVeFbOpUwbrEJ/bxmnhECPPqQXPHuahsOtxs/7v9iRPZcadRJZYvrHIQoYy24frMOO
         lOoOWsBKi28rIPfi5kWVGrdGgchsqdjIl8XASmVHIagtdfNx7SRU99bv3Va92e4Ia0Sl
         Da6njo35eaEMqRg14U+4pjW7D03+6HovlmSUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IigOx+ibhVy6G9eR8AVt3BpdeL/75L/6DoVLQSCaldo=;
        b=STSLwgOJBqZ7upgINA2vTu8qOA7bViTEF3yrs4gM8tvChecaPAveBU7s7ZUixFeWdq
         zgZ8KinQVWnXc5mdAoK6tVH7Ozdi9ckxXN9neXVY05+gwj9vCZUAJxVIgVGkbz58N9rS
         +iDFovc2PO1ppue84dFXZKaJsmDHoLKla7EElkrtJ4W56pfJ8nEoAWLV2rSvNdfkqB5h
         rF1sGAtHn2DhfZ8o6C6vyWBuKKsRGeM2USuP3bnnxOcv604435iLY5dD8EEcomocM8Xq
         rmvcYzNStFH02ZXrnjdl12vUomEYz0Us5W22pdYnCSCgt3bMcHn17uOaCYx+4NA6rL82
         YWmA==
X-Gm-Message-State: APjAAAWUonk5HFQX7zmJfbU4eNh3u3EMq7wg3gBVlZfUWruh/THBZnYn
        xRIu+cxKHVyIOFkNfyXUAlNopLtXDfc=
X-Google-Smtp-Source: APXvYqxAKwOy4skGaFlD+AwM7H6usGWWDPTx4rEIR4aomqdcq3FG5puPlwx3AOUKM/DWOmbBr7e6lg==
X-Received: by 2002:a63:cb0f:: with SMTP id p15mr23250552pgg.81.1572305421722;
        Mon, 28 Oct 2019 16:30:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y36sm11222770pgk.66.2019.10.28.16.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:30:20 -0700 (PDT)
Date:   Mon, 28 Oct 2019 16:30:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: io_wqe_worker(): Program hangs
Message-ID: <201910281629.5F6B1D038@keescook>
References: <201910281605.8F6E7C376@keescook>
 <d45aef08-1bff-08b7-fa43-e8e04a9e5650@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d45aef08-1bff-08b7-fa43-e8e04a9e5650@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 28, 2019 at 05:27:59PM -0600, Jens Axboe wrote:
> On 10/28/19 5:05 PM, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191025 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 46134db8fdc5 ("io-wq: small threadpool implementation for io_uring")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487365:  Program hangs  (LOCK)
> > /fs/io-wq.c: 349 in io_wqe_worker()
> > 343     			io_worker_handle_work(worker);
> > 344     		else
> > 345     			spin_unlock(&wqe->lock);
> > 346     	}
> > 347
> > 348     	io_worker_exit(worker);
> > vvv     CID 1487365:  Program hangs  (LOCK)
> > vvv     Returning without unlocking "(*wqe).lock".
> > 349     	return 0;
> > 350     }
> > 351
> > 352     /*
> > 353      * Check head of free list for an available worker. If one isn't available,
> > 354      * caller must wake up the wq manager to create one.
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include:
> 
> It's a false positive, lock is dropped on non-zero return.

Does that happen in the caller side? I'll see if I can figure out how to
teach coverity about that... Hmmm

Thanks!

-- 
Kees Cook
