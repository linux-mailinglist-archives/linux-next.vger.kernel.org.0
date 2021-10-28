Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C66743D8EE
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 03:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhJ1Bx3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 21:53:29 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:50472 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229614AbhJ1Bx3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 21:53:29 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UtxOpaX_1635385860;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0UtxOpaX_1635385860)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 28 Oct 2021 09:51:01 +0800
Subject: Re: linux-next: Tree for Oct 25
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <20211027224231.1634cc6c@canb.auug.org.au>
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <864bbf0b-e6db-1a97-80f5-a92968a4e086@linux.alibaba.com>
Date:   Thu, 28 Oct 2021 09:51:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211027224231.1634cc6c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


在 2021/10/27 下午7:42, Stephen Rothwell 写道:
> Hi all,
>
> On Mon, 25 Oct 2021 20:49:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> There seems to be something amiss with cnosole output in today's release
>> (at least on my ppc qemu boot tests).
> The console output seems to be back today.  I assume its repair had
> something to do with commit
>
>    60f41e848492 ("Revert "tty: hvc: pass DMA capable memory to put_chars()"")
>
hi Stephen，

Thanks for the info, Could you share more details about the issue you 
met? is it about early console print issue?

