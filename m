Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E16E7CD9
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730494AbfJ1X2E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:28:04 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:42070 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfJ1X2E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:28:04 -0400
Received: by mail-pg1-f172.google.com with SMTP id f14so8079494pgi.9
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7JxZAA9g0BbwTfSZ1fhfFZAb8t3RcHpltFHP44pWJnA=;
        b=xD2gBYFZSaSkO+Ejofoj5FQOfC0xzVmHpBIPwdi2o7ZcmOsTFtGZNGLWcSsf107mXz
         VPo2bCVD3GbOLGcKvKbzQyWHWt9Uo4rzl+NYVcQbAJrueQA8I7FSNeAii7iA3Pevn4bh
         3TjD4cAvfcAe9SNCZCDOaNHuXuDrS3yPKGqQ4FPD9nR1gYLGpBzCSgBkMQ6thZvzgVhO
         emKhYv5QDuxcO2qpkENs0L0wPVOnuyKg+apg413QToE/UcjWsuz2cpFdNu0wZhzdAZEW
         K+CMeqAwnTP7JMncHAsF/9TjpCuquUN3PPOqUnV0WcGO1Ap9XR1+GYSbck5Mu4qaqRt3
         2mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7JxZAA9g0BbwTfSZ1fhfFZAb8t3RcHpltFHP44pWJnA=;
        b=opNXhK0otOiUwfw8cNP26ZqsUMUeABlqqUtgdB/NVBJnGE4HJ03K8B+pjUOY3vTlPn
         calQNcYnVE1cUgod9S21tKzpnQ0zdlFCUPBMs9uCWrNK3WafY8io3ynwBu6/e4BMn09K
         fwvftm+NAcw9UerKk3n2Qr/xGzrs0mY+lIQ4cfN8Hvacmp2sDLjyoZSS16V5sXErcbYU
         a5ujiyjbBA5toujhxQzRnZljF8e/8M8nDfBScNM5cwsLFIfu3yfgGu7v5/grXyw0wEu0
         JEN+0hWZGkTBdE1Uuro2/hA8lNCE5/3bpEwPipWlT9IF2XuI7m3bLqZ4y76X3owxlDoA
         YLLQ==
X-Gm-Message-State: APjAAAWj7NKjS68U6/rh/UiPq1mSgVQ2QdSYxnxVKTnWctWz/J2bNU42
        r4/KkuCNPOhk2bbwKhRvAJEwoSFSQzFalQ==
X-Google-Smtp-Source: APXvYqxnCGuFVtNnwAm1U8KMbc9SOxB9wIRCyQvqUHopctauXulVsHJZNEYtqoNeZQpBJ+18g3oANw==
X-Received: by 2002:a63:5125:: with SMTP id f37mr12269425pgb.98.1572305283302;
        Mon, 28 Oct 2019 16:28:03 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
        by smtp.gmail.com with ESMTPSA id c26sm11132518pfo.173.2019.10.28.16.28.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 16:28:02 -0700 (PDT)
Subject: Re: Coverity: io_wqe_worker(): Program hangs
To:     coverity-bot <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
References: <201910281605.8F6E7C376@keescook>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d45aef08-1bff-08b7-fa43-e8e04a9e5650@kernel.dk>
Date:   Mon, 28 Oct 2019 17:27:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910281605.8F6E7C376@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/28/19 5:05 PM, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191025 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 46134db8fdc5 ("io-wq: small threadpool implementation for io_uring")
> 
> Coverity reported the following:
> 
> *** CID 1487365:  Program hangs  (LOCK)
> /fs/io-wq.c: 349 in io_wqe_worker()
> 343     			io_worker_handle_work(worker);
> 344     		else
> 345     			spin_unlock(&wqe->lock);
> 346     	}
> 347
> 348     	io_worker_exit(worker);
> vvv     CID 1487365:  Program hangs  (LOCK)
> vvv     Returning without unlocking "(*wqe).lock".
> 349     	return 0;
> 350     }
> 351
> 352     /*
> 353      * Check head of free list for an available worker. If one isn't available,
> 354      * caller must wake up the wq manager to create one.
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include:

It's a false positive, lock is dropped on non-zero return.

-- 
Jens Axboe

