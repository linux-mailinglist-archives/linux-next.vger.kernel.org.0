Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01A2613979D
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 18:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbgAMR0H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 12:26:07 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:42973 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbgAMR0G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 12:26:06 -0500
Received: by mail-io1-f67.google.com with SMTP id n11so10644320iom.9
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2020 09:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OBo5QAcEDxGNV5JO3U4yYbvOSrdNw7cnut5xbdJ0JFY=;
        b=ErBcpsTU/dY0+ucL8Uvl71+Q0Jk2VPys6QfyJacCBO+HF19I22Nm6DMlWCBiFbLH4e
         IMP7y0aHE2NbLhKAAn+aTDPvMpxQ98DPcC1NAJaavpOAQ9hbVjwXElO9x42lJ3YSnsVs
         Swmun/yCXm5RQDS1N5Pdj2dRwbuBxO+4JFIfQG8C83azOFwBdCaleRcnq8WjVk2F2gvg
         A1aVxd7IfY8o+gKQYZFBW9VTVOrpws0v0s+dy9vHy7U4MGMGe0tJat/7tIoMNy/DkWJZ
         n6CrVFyoQx+cMLzp4n1xUBrxTY/iWW1P1hy9w/Qq8jlj0m87ebLqu5uWSQvFOkqqKGka
         4c7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OBo5QAcEDxGNV5JO3U4yYbvOSrdNw7cnut5xbdJ0JFY=;
        b=OYL5fPnx9tps9GZTs21bkKzVzDDqnrzfOIx3md2wSj79mf8BrGvdh8ST+JAkj2nwAj
         wdNYSSzVz6JGlTtShnoU4BaT170iT/rrATmDI1n0u7C1kO3iezSN2VkRr5SIl6zT46lZ
         +5gKn8u63IAu+2EaxIKsF2ZQ7yzAdOgSmZjCpP6ZPIkHjdmRIYrIQ4g8mtYzSrshTyLK
         p/sOdjtrOgsELN6BwVbyuWsydkH+IMAMka5GaPqz0KsQM68KDowUHnW0EqPJWOD7vHZD
         fYfAPT3I+bj47K9tJbN7SqR/gkhSZ9ygdJg58FsMVl8G0HK6oM4D0yVZSdgpJ+GLoXvZ
         uqAQ==
X-Gm-Message-State: APjAAAV56G2NQhnmFHuj5HTisXSzJyy5gxWlkNWSP6AyZHgZs+ejNMoy
        lo2GZkXopN72+EJvT2uubcEpcA==
X-Google-Smtp-Source: APXvYqwrd/2oigoHJfTKGhXRWXCkcVDoRwthNe9zY4vrGrg95oL2IbJ4U7OdT/i61M1Q9zStL3lXnw==
X-Received: by 2002:a5e:a906:: with SMTP id c6mr13023272iod.244.1578936365987;
        Mon, 13 Jan 2020 09:26:05 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id h85sm3988412ili.22.2020.01.13.09.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 09:26:05 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the block tree
From:   Jens Axboe <axboe@kernel.dk>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
References: <20200106123027.1a162197@canb.auug.org.au>
 <e9a87175-64c9-46da-4737-72987a53e836@kernel.dk>
 <20200112183235.GO8904@ZenIV.linux.org.uk>
 <b177c427-ca94-bbbf-b09d-6f2faef4121c@kernel.dk>
Message-ID: <889551c4-c4a7-dc49-c3b2-7c5ff5c8c0e7@kernel.dk>
Date:   Mon, 13 Jan 2020 10:26:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b177c427-ca94-bbbf-b09d-6f2faef4121c@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/13/20 10:09 AM, Jens Axboe wrote:
> On 1/12/20 11:32 AM, Al Viro wrote:
>> On Mon, Jan 06, 2020 at 09:04:01PM -0700, Jens Axboe wrote:
>>> On 1/5/20 6:30 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> After merging the block tree, today's linux-next build (arm
>>>> multi_v7_defconfig) failed like this:
>>>>
>>>> fs/open.c:977:12: error: conflicting types for 'build_open_flags'
>>>>   977 | inline int build_open_flags(const struct open_how *how,
>>>>       |            ^~~~~~~~~~~~~~~~
>>>> In file included from /home/sfr/next/next/fs/open.c:36:
>>>> fs/internal.h:127:12: note: previous declaration of 'build_open_flags' was here
>>>>   127 | extern int build_open_flags(int flags, umode_t mode, struct open_flags *op);
>>>>       |            ^~~~~~~~~~~~~~~~
>>>>
>>>> Caused by commits
>>>>
>>>>   4e9e15c9426e ("fs: make build_open_flags() available internally")
>>>>   3bba3e571bc8 ("io_uring: add support for IORING_OP_OPENAT")
>>>>
>>>> interacting with commit
>>>>
>>>>   0a51692d49ec ("open: introduce openat2(2) syscall")
>>>>
>>>> from the vfs tree.
>>>>
>>>> I have applied the following fix up patch for today:
>>>
>>> Thanks Stephen - I'll pull in the VFS tree and rebase the 5.6 io_uring
>>> bits on that. Then I'll send it out for review again, haven't heard from
>>> Al on the non-block open change.
>>
>> FWIW, I don't believe that your approach is workable.  First of all,
>> *ANY* transition out of RCU mode can lead to blocking.  You need to
>> acquire several references (mount and dentry, at the very least).
>> Suppose the last one fails (->d_seq mismatch).  Now you suddenly
>> have to drop the one(s) you've acquired.  And both dput() and mntput()
>> are fundamentally blocking operations.
>>
>> It simply does not work.  You could cobble up something that kinda-sorta
>> works, if your added flag had
>> 	* caused hard failure on unlazy_child()
>> 	* caused hard failure on unlazy_walk() with any symlinks in stack
>> 	* caused hard failure on unlazy_walk() if it would've been required
>> to grab root
>> 	* made unlazy_walk() go through very careful dance if it's just
>> about nd->path; I'm not sure how well that could be done, but theoretically
>> it's not impossible.
>>
>> But for open() it's not going to work at all.  Any open for write => you
>> will have to wait if you run into fs freeze.  O_TRUNC => you've got IO
>> to do.  Worst of all, once you've dropped out of RCU mode, *YOU* *CAN'T*
>> *FAIL*.  Because that means blocking operations.  So you need to verify
>> that you won't run into a blocking ->open(), IMA deciding to play silly
>> buggers and read through the entire file, etc., etc. _before_ dropping
>> out of RCU mode.
>>
>> do_last() is messy enough as it is; adding _this_ is completely out of
>> question.
> 
> Thanks Al, that's useful! Sounds like the lookup is doable, but the open
> part is just a wasp nest of "don't even go there". For now, I'll drop
> the lookup change and just have the io_uring open punt to async. With
> that, I don't need any non-blocking guarantees. That is workable for
> now.

Forgot to mention, I'll implement your addition for the lookup part,
since I still need that for the statx addition. But the open itself
will not use any of that, I'll leave that as-is and just go async.

-- 
Jens Axboe

