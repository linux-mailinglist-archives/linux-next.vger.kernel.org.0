Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A60C313F10
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 20:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbhBHTdK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 14:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236245AbhBHTbr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 14:31:47 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854E0C061794;
        Mon,  8 Feb 2021 11:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=lrgqOKNknR+sLY0n8CGSF6ungfUTkTVpy/CuLtzfFh8=; b=ZsQptNDR9Lsn6zQLWJHxb2wVkG
        +mey80lXUtZeEnQqulC6uCtB8PO4bWKqCAzxiGiAv6y3fJqCp4hsivesaOWqyJe3wQtN6Gqaf6IRA
        B0ZbAF8BX0SG4p5P1Flq6ls7HZSKno0W1N2/nmfAXyW8RIkIw1HMqbE50qkv4zhjPSrbrPYo7vVnI
        TPiElrEGS/+EvdzihM42mbvTOuWoBdXkb2n9TGJwHjl5vInLUvd4V/p54o7ZpmZmgtEgFBTH1G/XR
        hoDKEkPCgQmuSRvAAMGpqReKEfBR/zmIiQxTPvZl26MT0EKg2pH8UxoxafrJF1noEZBQwwkGvUoiy
        K3HwRXJQ==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9CFS-00072j-Kt; Mon, 08 Feb 2021 19:31:02 +0000
Subject: Re: linux-next: Tree for Feb 8 (objtool: warnings: 5)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210208235246.01cb4daf@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
Date:   Mon, 8 Feb 2021 11:30:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208235246.01cb4daf@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/8/21 4:52 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210205:
> 

on x86_64:

objtool warnings: (from 3 different randconfig builds)

drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()
~~~~~
fs/select.o: warning: objtool: do_sys_poll()+0x8e9: call to __ubsan_handle_sub_overflow() with UACCESS enabled
lib/iov_iter.o: warning: objtool: iovec_from_user.part.12()+0x2db: call to __ubsan_handle_add_overflow() with UACCESS enabled
~~~~~
vmlinux.o: warning: objtool: do_machine_check()+0x7ee: call to queue_task_work() leaves .noinstr.text section
vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section



What would you like from these?

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
