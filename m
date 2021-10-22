Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62703437F51
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 22:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhJVU2E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 16:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbhJVU2E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 16:28:04 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E83C061764;
        Fri, 22 Oct 2021 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=yJUQGZL4e2STxDZm0pZwpMRWUfeTfstNIaev+eEoaKs=; b=A0OV3FXpdqLoPcndlGopdUao7g
        Xv5vYELg7S3zPwA1lJocuFoxsm1hfIAPhwCNRgQp5OktVladtfWlgKoIOv/RqKf6xnqsYiBqDu9Zn
        W5QvP7seoBTBIv7+X2t5WHkDm+CgUtTWGnWrHPTiSpxcs3T8BRUFTpV6oLuk77gR+f3+W2GSj7brZ
        kKvi5LOr7KjOZHhvdqxgC3va4GIG83TLtDfS7CosQjSsABrtG0oNcWN2NWqeRxECqgfWaab31Dijm
        o/YeaaIWxk4FHe7Xif/6aUTdhQ9ykvRdquITNfMZ8YOio+JDVHErYaOpe7MXsSEJWgWZyVBE8UPXU
        4B5y5J+Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1me16k-00Bwhu-7Z; Fri, 22 Oct 2021 20:25:42 +0000
Subject: Re: linux-next: Tree for Oct 22 (sched...)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>
References: <20211022201533.6085b17f@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fcb0c32f-efcf-961c-2226-85a5121c7c09@infradead.org>
Date:   Fri, 22 Oct 2021 13:25:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022201533.6085b17f@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/22/21 2:15 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20211021:
> 

on i386 or x86_64:

Lots of errors referring to sched->plug when CONFIG_BLOCK
is not set.

E.g.:
../kernel/sched/core.c: In function ‘io_schedule_prepare’:
../kernel/sched/core.c:8331:13: error: ‘struct task_struct’ has no member named ‘plug’
   if (current->plug)
              ^~
../kernel/sched/core.c:8332:25: error: ‘struct task_struct’ has no member named ‘plug’
    blk_flush_plug(current->plug, true);
                          ^~
../fs/fs-writeback.c: In function ‘writeback_sb_inodes’:
../fs/fs-writeback.c:1896:15: error: ‘struct task_struct’ has no member named ‘plug’
     if (current->plug)
                ^~
../fs/fs-writeback.c:1897:27: error: ‘struct task_struct’ has no member named ‘plug’
      blk_flush_plug(current->plug, false);
                            ^~
   CC      arch/x86/kernel/cpu/capflags.o
../fs/fs-writeback.c: In function ‘wakeup_flusher_threads’:
../fs/fs-writeback.c:2295:25: error: ‘struct task_struct’ has no member named ‘plug’
    blk_flush_plug(current->plug, true);
                          ^~


-- 
~Randy
