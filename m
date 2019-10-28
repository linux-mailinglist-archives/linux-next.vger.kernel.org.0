Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CECEAE7CF8
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbfJ1XfU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:35:20 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:36782 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731790AbfJ1XfU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:35:20 -0400
Received: by mail-pf1-f170.google.com with SMTP id v19so8093310pfm.3
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3VXFQrHhUbVpnTUUDfMjYmNjQanI7sU+UVDySJMMuUo=;
        b=YhBeSD8p9J8Ijenp5jXcFTnsV6VvnVCavgRI8kGCh7JlNomjnD1JdbtJwI8tYMsyLA
         H5T/rpoZYpYjnQooxuj7nSyrgbdxirdaAfS62qNEBcjKV/48g5YwMsPzNv9BBEo7MFy1
         8Tzow+7Rf6eM8KVFJQFMXb+eWfk+N0RVXC4vP7g6SSzwfZzDLIksPF5BakSxnf5y2hJ6
         bJx/OPAPhb0joqtHTCn2YHU/qtDd+EmFW4+dC7TnlpI7K/H0++szni9i4bVmVGJcVLrm
         sTrBZAzKHcZ7ukl7nsSRIF/522EEjAPgfpHI0KZT2yxMsk5XZZqIE2V3Qc/Ofzc6+RGj
         phSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3VXFQrHhUbVpnTUUDfMjYmNjQanI7sU+UVDySJMMuUo=;
        b=ajoA/yxTeXl2wdX6uhFcolft/iTvEchhl5REzp3He4cEq2YYSDahDzl5gaFcozXa/l
         ow/8egyTRtRpnZk2LY1lYV6vvBOit18vYxE5OooTdZKt5rdGhXJZuYZu31CXWH52+xAb
         cAdQUU2ebUlcKYSNX0J5EMeY0XMsFmPKE2jkaqSX0Mch0dlvgTM0T9/Dn+UGWCgoUHj6
         VIrR5OtXH5pHrmoOZjg0YJMxUeJt0n5oFZquOKwB3Ndogr9/fb1bU81GCQB9zzGznP4O
         yiev2qsSI7k/7/ywlrtzSWCfsXDJjJdce2HBLqjviGuCyyw5vuJto5tdGiuJQLPGixxZ
         9HaA==
X-Gm-Message-State: APjAAAXXMoIF7vU88cHYzRqOL6LYVvyYTJfTeb5BN4y7VB73Sboe0Ez/
        nNJJBH520PlcYOy73OOV6yRJry4kM3jxug==
X-Google-Smtp-Source: APXvYqxAr6xdlhEhjLfXzwOOK24Df+Vrr+2Nv02uzdmQrIqbRdyIhBeSKQ3/w1/F4WrDh63FxiAc4Q==
X-Received: by 2002:a17:90a:d205:: with SMTP id o5mr2455112pju.46.1572305719294;
        Mon, 28 Oct 2019 16:35:19 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
        by smtp.gmail.com with ESMTPSA id c16sm609901pja.2.2019.10.28.16.35.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 16:35:18 -0700 (PDT)
Subject: Re: Coverity: io_wqe_worker(): Program hangs
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
References: <201910281605.8F6E7C376@keescook>
 <d45aef08-1bff-08b7-fa43-e8e04a9e5650@kernel.dk>
 <201910281629.5F6B1D038@keescook>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <7fdaef1a-6c7a-46df-f84b-4d05cca16fca@kernel.dk>
Date:   Mon, 28 Oct 2019 17:35:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910281629.5F6B1D038@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/28/19 5:30 PM, Kees Cook wrote:
> On Mon, Oct 28, 2019 at 05:27:59PM -0600, Jens Axboe wrote:
>> On 10/28/19 5:05 PM, coverity-bot wrote:
>>> Hello!
>>>
>>> This is an experimental automated report about issues detected by Coverity
>>> from a scan of next-20191025 as part of the linux-next weekly scan project:
>>> https://scan.coverity.com/projects/linux-next-weekly-scan
>>>
>>> You're getting this email because you were associated with the identified
>>> lines of code (noted below) that were touched by recent commits:
>>>
>>> 46134db8fdc5 ("io-wq: small threadpool implementation for io_uring")
>>>
>>> Coverity reported the following:
>>>
>>> *** CID 1487365:  Program hangs  (LOCK)
>>> /fs/io-wq.c: 349 in io_wqe_worker()
>>> 343     			io_worker_handle_work(worker);
>>> 344     		else
>>> 345     			spin_unlock(&wqe->lock);
>>> 346     	}
>>> 347
>>> 348     	io_worker_exit(worker);
>>> vvv     CID 1487365:  Program hangs  (LOCK)
>>> vvv     Returning without unlocking "(*wqe).lock".
>>> 349     	return 0;
>>> 350     }
>>> 351
>>> 352     /*
>>> 353      * Check head of free list for an available worker. If one isn't available,
>>> 354      * caller must wake up the wq manager to create one.
>>>
>>> If this is a false positive, please let us know so we can mark it as
>>> such, or teach the Coverity rules to be smarter. If not, please make
>>> sure fixes get into linux-next. :) For patches fixing this, please
>>> include:
>>
>> It's a false positive, lock is dropped on non-zero return.
> 
> Does that happen in the caller side? I'll see if I can figure out how to
> teach coverity about that... Hmmm

I was trying to use the right incantations of __release() etc to shut up
the checker as well. So if there are things I could be improving on that
side, do let me know.

As mentioned in other emails, the linux-next version is somewhat outdated
at this point. My for-next branch has the latest version.

-- 
Jens Axboe

