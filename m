Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E80C45B209
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 03:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbhKXC3M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 21:29:12 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:49297 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbhKXC3L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 21:29:11 -0500
Received: from fsav413.sakura.ne.jp (fsav413.sakura.ne.jp [133.242.250.112])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 1AO2PqEd056881;
        Wed, 24 Nov 2021 11:25:52 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav413.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp);
 Wed, 24 Nov 2021 11:25:52 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 1AO2Pp6e056877
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 24 Nov 2021 11:25:52 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Message-ID: <b5d2fbb7-5bc6-f0c1-0869-1c3e7096677e@i-love.sakura.ne.jp>
Date:   Wed, 24 Nov 2021 11:25:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: linux-next: manual merge of the tomoyo tree with the block tree
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211124113825.2d9de813@canb.auug.org.au>
 <cbeb57ae-5a87-9959-689f-d9d73baf6ee4@kernel.dk>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
In-Reply-To: <cbeb57ae-5a87-9959-689f-d9d73baf6ee4@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021/11/24 11:06, Jens Axboe wrote:
> 
> Why does the tomoyo tree have loop commits is the question?
> 

I'm testing patches using my tree until maintainers respond.
