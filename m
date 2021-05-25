Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6EB3907F4
	for <lists+linux-next@lfdr.de>; Tue, 25 May 2021 19:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhEYRkv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 May 2021 13:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231981AbhEYRkv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 May 2021 13:40:51 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433EAC06138B;
        Tue, 25 May 2021 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=5ekpP0XygexUJbGSJEGJvxYqb4EXTuK7yUfqKx7P93Y=; b=eLce87e2ew0MHu46aHbJU/Sjik
        BdrCZN8lmcy4NQY6for2m6/qUPDo8863yHIzQcEtFt1wpo9uYOHt7/vKT9nvPb2qgUo55IOQTzOYF
        uo4Rc9aPKg1odDWgWlsowq78rG/duiOyDTu9wBFNrpNCTqwh/xrWKCy19uzIQn8n4CDq5Y7qxwhB2
        nCCw30tdFuihdJlsRvHPtK1PaKg12CA1jT7nBhjDHK3Kv00ZISVRWcKwKIAgW2tYUK6Aki0uxu9DX
        ucelTHT8PBD2z1QjelI+Rqgz/SeRikwye3eDExaNO/Kk8pblltgrneFSojouoPFmo1ZAjPtWUkKpT
        mtEopdXQ==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1llb1U-006xDX-Ky; Tue, 25 May 2021 17:39:20 +0000
Subject: Re: linux-next: Tree for May 25 (x86: NR_CPUS undeclared)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
References: <20210525163932.785c1a2a@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e76d764e-9ed2-b11e-cf0f-53e7172745d4@infradead.org>
Date:   Tue, 25 May 2021 10:39:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525163932.785c1a2a@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/24/21 11:39 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210524:
> 

on x86_64, there can be +/- 100 build errors like so:

../arch/x86/include/asm/fixmap.h:103:48: error: 'NR_CPUS' undeclared here (not in a function); did you mean 'NR_OPEN'?
  FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_MAX_IDX * NR_CPUS) - 1,
                                                ^~~~~~~
                                                NR_OPEN

Fix is here:
https://lore.kernel.org/lkml/20210521195918.2183-1-rdunlap@infradead.org/


This is from 10 x86_64 randconfig builds:

$ buildsummary.pl -t build*.out
build-r9544.out: totals: error/warning files: 4, errors: 145, warnings: 2, Section mismatches: 0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
build-r9547.out: totals: error/warning files: 3, errors: 109, warnings: 1, Section mismatches: 0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
build-r9552.out: totals: error/warning files: 3, errors: 46, warnings: 1, Section mismatches: 0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- 
~Randy

