Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F295DBB21
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 02:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439187AbfJRA4p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 20:56:45 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38441 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfJRA4p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2019 20:56:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id w8so1979019plq.5
        for <linux-next@vger.kernel.org>; Thu, 17 Oct 2019 17:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=piordRZ1nU8k7NcSWkmMDNrtoXqPkolhwk8bUAWjXiM=;
        b=BSDRVgdOVbMgXeh+wBCQNm2nwqNZsUaduoldjj3vYu1tLADexMs8j3VaxJVfmgst+e
         sV8wMsOtkRhLkKnMpzwoXhCs4cRQwA0rVUc93yBpJTk7lhcFKcs5ZBahgS8R6KZbVC7p
         FwvkiLECClqget1obmNExStAR5XqHOQBRifXbjGponSIy951t5Uvk7OrweyfXTKXyXiI
         M9+mK2kWd4yIIfDjvKfvEW17xjLqAfKsFvJ9h5UCSAVxnm8nojzgLizlC9k/UdBVzOy+
         Nj530dsX/dc0jfNbzSB7uO3pUPKbIuLbtmBV9q5JZzMAljIhLX/PRqrshhEhti42jpsH
         l/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=piordRZ1nU8k7NcSWkmMDNrtoXqPkolhwk8bUAWjXiM=;
        b=ZmE5vF7el1pHcsUc8foCUEVdRdJrewHyuu2vKbUGtNJNdmyy2drMCkl5m7I9nqF7qg
         xcG66q8gAvzzKwUbzO38SEK+xKqkEWNygTiLOqWmc+nLYLfJJXMC/Tcl4dkIdQsS58oo
         slwSGsmjqY3xi6LIslnBIZqvSRN9ic8ttUWrUMT14JFzebjMzy5ydRp3D660jhQknfdP
         i074FR7c1lxpxREog+X95T8K9x89iJAr+o+b3OUWBUcJqlsTpNUrenyhG7TgRYhpOWiE
         SSSUEQLbMIqmkwrckhXNSOYyuLiE49wZRLptWcY1iaKDTs05NKieWcZezWWiz8wqAQUl
         FIiw==
X-Gm-Message-State: APjAAAWujlRBDJ7I3y3RFOu8qIIuUlynR/tqYYYNmxKVEvwwhgK5JblU
        8+hHfC8BMZs49bJqw/+8cG4rjgSRLfJrJw==
X-Google-Smtp-Source: APXvYqwn+1Qvz5kkzPB/24j6MgY8cwiKJazXYX9FwNrubcESYGgECbUV+NIUv1VED3o5/6kBL7zYEg==
X-Received: by 2002:a17:902:bcc2:: with SMTP id o2mr7087913pls.281.1571360202876;
        Thu, 17 Oct 2019 17:56:42 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
        by smtp.gmail.com with ESMTPSA id h14sm3884505pfo.15.2019.10.17.17.56.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 17:56:41 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191018115126.6263a3e3@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <5a9bf632-2466-bc73-45d3-104c4bb0245a@kernel.dk>
Date:   Thu, 17 Oct 2019 18:56:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018115126.6263a3e3@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/17/19 6:51 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> fs/io_uring.c: In function 'io_accept':
> fs/io_uring.c:1729:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>   1729 |  addr = (struct sockaddr __user *) READ_ONCE(sqe->addr);
>        |         ^
> fs/io_uring.c:1730:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>   1730 |  addr_len = (int __user *) READ_ONCE(sqe->addr2);
>        |             ^
> 
> Introduced by commit
> 
>    d674c2b9335f ("io_uring: add support for IORING_OP_ACCEPT")
> 
> addr and addr2 are __u64 ...

I'll fix these warnings up, guessing it's 32-bit?

-- 
Jens Axboe

