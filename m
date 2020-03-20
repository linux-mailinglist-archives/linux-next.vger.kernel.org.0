Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04D0D18D620
	for <lists+linux-next@lfdr.de>; Fri, 20 Mar 2020 18:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgCTRnJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Mar 2020 13:43:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51170 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgCTRnJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2020 13:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=eS+NnV6FJoMlcqmhEEwy7k3fo9pqU7mmrHR91RmppDQ=; b=pBExgnhM5X2ow1Ilj9kYwyBh/J
        NNIfsJUhE9ZA6Ojr0SwSHLPArB+BoTlzfydGs0jrAMH9gSANItut4woxN3U7I72StR7GZLpOsRrP/
        XrEY61pVNir/XOZQ75UABnESxtB5Ggrq/UNpLfSbEH+wXCdAWRWPdn4UKQ6+puUmpichYu7HrWZuK
        J5wBP4YLL0xShOZ+M+cXaim38AbP4GOCPw74x+odpbdKx3ClWtzasWOyTJbR4Qnu3b+e8YSXDSv2g
        qkOK5hS7apqTnu4u/md+qkgA0Jh33C2M+teQKjicp4721DyT8XLfOR7JUfPMyVsLhIxtI2B80EkGP
        mRBghRlg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jFLfm-0007Lw-AK; Fri, 20 Mar 2020 17:43:06 +0000
Subject: Re: linux-next: Tree for Mar 20 (objtool warnings)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20200320201539.3a3a8640@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ca0078e2-89b5-09a7-f61e-7f2906900622@infradead.org>
Date:   Fri, 20 Mar 2020 10:43:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320201539.3a3a8640@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/20/20 2:15 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200319:
> 


Today's linux-next gives these objtool warnings:

arch/x86/entry/vdso/vma.o: warning: objtool: vdso_fault()+0x201: unreachable instruction

drivers/ide/ide-tape.o: warning: objtool: idetape_chrdev_release()+0x109: unreachable instruction

drivers/media/i2c/ir-kbd-i2c.o: warning: objtool: ir_probe()+0xdaa: unreachable instruction

kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x89: call to __ubsan_handle_load_invalid_value() with UACCESS enabled


all in (4) separate builds (.configs).
Do you want all 4 randconfig files?

cheers.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
