Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB18E8C76
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 17:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390369AbfJ2QLQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 12:11:16 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:40592 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390313AbfJ2QLQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 12:11:16 -0400
Received: by mail-pl1-f177.google.com with SMTP id p5so2683527plr.7
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K043xz0Vszn7bisvpkqXmmrMMx96NxyTN0WYxmdA9SQ=;
        b=jvNbR3VqZjW6HHsPSPFcFCgCXpsOAW/23GU+j7Qi1UUvwZorABiEW3DYVcn73EZm02
         WT7j1KcoHnvgRtEtDBx429J0552nYFx+s+Q9Mx+YQSoE85H0Z7kxWy1jT+EKoQD8hu/Y
         gYeoNH/G49de/VLcoB3dzMRGt1Dkr4d4rFuEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K043xz0Vszn7bisvpkqXmmrMMx96NxyTN0WYxmdA9SQ=;
        b=TGBNB3gGBw3UIAw06wpg1DRlwm1u/1ukbqCY7z/LXN2SEcPpVDOzQOCepTCzBgu9Op
         CXGzvnbFRyhQSimnDMeRegtnVeytPpez0hySBzpKl8+vBc9HzywhAUtO+HHN8acbJVk/
         01oYQJ73BQV2D6fpiBjiA25BMJBKhQpJlcHIs4H/UWnrAKsMW4z1ERv/2FPE1rJ3DkEW
         FUJ3aHHrqgwRIO1jwB8uwO5eLmiJXTggFiLXMOeEljfG9lOvQMvlYDy9E9yJEAy6XNde
         tiDlvZWD9l6BjcS7Ar2Cj8puvooRHe67meBq+wppcL1uUzftlQ8yCSrcyfdJD1cCsSP6
         vVcw==
X-Gm-Message-State: APjAAAXVieNBd2woO4JsxQrlfQ56qAfR9t4BU2Eu4G5UGBDKKzN9GLs8
        ewjkW9oDFNuGMMBU9GtJymSQTQ==
X-Google-Smtp-Source: APXvYqyNZuk8JM5f6Ya04f+JYxid0lthc3obi4hWFUZ6Et/aYN/qdkC5d/9OCauo0zCwP5TDVcjJSw==
X-Received: by 2002:a17:902:868e:: with SMTP id g14mr3041858plo.182.1572365475629;
        Tue, 29 Oct 2019 09:11:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q33sm14344924pgm.50.2019.10.29.09.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:11:14 -0700 (PDT)
Date:   Tue, 29 Oct 2019 09:11:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: io_wqe_worker(): Program hangs
Message-ID: <201910290910.29320BE326@keescook>
References: <201910281605.8F6E7C376@keescook>
 <d45aef08-1bff-08b7-fa43-e8e04a9e5650@kernel.dk>
 <201910281629.5F6B1D038@keescook>
 <7fdaef1a-6c7a-46df-f84b-4d05cca16fca@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fdaef1a-6c7a-46df-f84b-4d05cca16fca@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 28, 2019 at 05:35:15PM -0600, Jens Axboe wrote:
> On 10/28/19 5:30 PM, Kees Cook wrote:
> > On Mon, Oct 28, 2019 at 05:27:59PM -0600, Jens Axboe wrote:
> >> On 10/28/19 5:05 PM, coverity-bot wrote:
> >>> Hello!
> >>>
> >>> This is an experimental automated report about issues detected by Coverity
> >>> from a scan of next-20191025 as part of the linux-next weekly scan project:
> >>> https://scan.coverity.com/projects/linux-next-weekly-scan
> >>>
> >>> You're getting this email because you were associated with the identified
> >>> lines of code (noted below) that were touched by recent commits:
> >>>
> >>> 46134db8fdc5 ("io-wq: small threadpool implementation for io_uring")
> >>>
> >>> Coverity reported the following:
> >>>
> >>> *** CID 1487365:  Program hangs  (LOCK)
> >>> /fs/io-wq.c: 349 in io_wqe_worker()
> >>> 343     			io_worker_handle_work(worker);
> >>> 344     		else
> >>> 345     			spin_unlock(&wqe->lock);
> >>> 346     	}
> >>> 347
> >>> 348     	io_worker_exit(worker);
> >>> vvv     CID 1487365:  Program hangs  (LOCK)
> >>> vvv     Returning without unlocking "(*wqe).lock".
> >>> 349     	return 0;
> >>> 350     }
> >>> 351
> >>> 352     /*
> >>> 353      * Check head of free list for an available worker. If one isn't available,
> >>> 354      * caller must wake up the wq manager to create one.
> >>>
> >>> If this is a false positive, please let us know so we can mark it as
> >>> such, or teach the Coverity rules to be smarter. If not, please make
> >>> sure fixes get into linux-next. :) For patches fixing this, please
> >>> include:
> >>
> >> It's a false positive, lock is dropped on non-zero return.
> > 
> > Does that happen in the caller side? I'll see if I can figure out how to
> > teach coverity about that... Hmmm
> 
> I was trying to use the right incantations of __release() etc to shut up
> the checker as well. So if there are things I could be improving on that
> side, do let me know.
> 
> As mentioned in other emails, the linux-next version is somewhat outdated
> at this point. My for-next branch has the latest version.

Yeah, I think I see Coverity's confusion: this code is the work queue
runner, IIUC, so the locking is pretty special. I'll try to see if there
is a way to improve this.

-- 
Kees Cook
