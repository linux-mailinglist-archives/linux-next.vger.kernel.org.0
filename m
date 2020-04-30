Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C2A1BFED9
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 16:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgD3Ok7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 10:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726971AbgD3Ok6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 10:40:58 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB57C035494;
        Thu, 30 Apr 2020 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=pnWhDAfjfLVTId8Ay3vzQ/puu4PeGShE2HFHEDX8dLg=; b=YZknJvr3MoyCvDg5cpjuJDk2jM
        e2Gzh/U6obY8E8UiDdUu8vMNT19eQscdM7cBy1kbqckqsXJxLcyIy09ymk4Hu5ZKCDBJYIANgoD0B
        lFhxexVYKbL/7ox18ri+2NXwLMso+rO+gEp8sGE1NURJO3fG8645o0N2m5GS+FSKCYTJw/9obFn7O
        q6kCdUvt5ct5v9x3GPbeBRmf8AS0f4trE7cbxz2jdLy2peZ3IA8PYtpfOB6iUQ+ABa6S/Hc6HKg7J
        vIhypqrbQ5ODI45SU+8QquZvZ7O+V8v022hXdWZnrWwUbfx8Ud9SsUlXPq1cW6cmgFexWzUL4vda3
        GsMpEJnw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jUAMw-0002tT-10; Thu, 30 Apr 2020 14:40:54 +0000
Subject: Re: linux-next: Tree for Apr 30 (objtool warnings)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20200430174019.417e5f3e@canb.auug.org.au>
 <8eedaa40-c93d-428e-47aa-ee1e6b6d69e6@infradead.org>
Message-ID: <9005add6-3b90-f9f0-eb56-6e309853eb7f@infradead.org>
Date:   Thu, 30 Apr 2020 07:40:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8eedaa40-c93d-428e-47aa-ee1e6b6d69e6@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/30/20 7:31 AM, Randy Dunlap wrote:
> On 4/30/20 12:40 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200429:
>>
> 
> on x86_64:
> 
> kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x2e: unreachable instruction
> kernel/cred.o: warning: objtool: copy_creds()+0x278: unreachable instruction
> net/core/skbuff.o: warning: objtool: skb_push()+0x9e: unreachable instruction
> 
> 
> Full randconfig file is attached.
> 

oops, forgot to Cc: Josh and Peter.

-- 
~Randy

