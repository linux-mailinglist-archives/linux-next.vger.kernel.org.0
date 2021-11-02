Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E471344315B
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 16:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbhKBPRZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 11:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhKBPRZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 11:17:25 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD1AC061714;
        Tue,  2 Nov 2021 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=DdGSXX/q8kDFS1dWnx7V8YbNbR2QqrGu8E1YFZRm2l4=; b=zAtDFooFIgpaZsaMrWva8wehQj
        MWJAFhRBNzr90tRNyy+lNsfvzx/7ZdYvkz2M5pGE7CKtWWUeyieSa551xS3MQHPuVtqCVxeQZ0ANE
        VOKsZtCstE9Y4fpH/iSaFG+/X+kZrhg2InCVXYyYzUSKP7rwNsuy51FSrESZZF1MwaUgEuA1ZzOgz
        vf64A3EnvIGggJU1gG9nUtFnjel7fPKbiyh8jJqvdfpETX9B84qiKqSAJKcdQiTWhJRB1A8d3A4b0
        TtP4sqmcaTnSu0WFMFjA6xUUDVobdTARFDyBcumQgYxj4oHPMDqU0CSubcgtVCe366t5MERkhs7eC
        Tvms4K/g==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mhvUu-0026LG-4C; Tue, 02 Nov 2021 15:14:48 +0000
Subject: Re: linux-next: Tree for Nov 2 (drivers/platform/x86/amd-pmc.o)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20211102191553.7467166d@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <caa259b7-0560-647d-80d0-6dd25a6f09d2@infradead.org>
Date:   Tue, 2 Nov 2021 08:14:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102191553.7467166d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/2/21 1:15 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v5.17 related material to your linux-next included
> trees until the merge window has closed.
> 
> Changes since 20211101:
> 


on i386:

ld: drivers/platform/x86/amd-pmc.o: in function `amd_pmc_suspend':
amd-pmc.c:(.text+0x5db): undefined reference to `rtc_class_open'
ld: amd-pmc.c:(.text+0x5ea): undefined reference to `rtc_read_alarm'
ld: amd-pmc.c:(.text+0x604): undefined reference to `rtc_read_time'
ld: amd-pmc.c:(.text+0x660): undefined reference to `rtc_alarm_irq_enable'


Also "depends on RTC_CLASS" ?


-- 
~Randy
