Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372CD48F65B
	for <lists+linux-next@lfdr.de>; Sat, 15 Jan 2022 11:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiAOKTw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 15 Jan 2022 05:19:52 -0500
Received: from gateway24.websitewelcome.com ([192.185.51.251]:46851 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229530AbiAOKTw (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 15 Jan 2022 05:19:52 -0500
X-Greylist: delayed 1442 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 Jan 2022 05:19:51 EST
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 0FEE0878D
        for <linux-next@vger.kernel.org>; Sat, 15 Jan 2022 03:55:48 -0600 (CST)
Received: from gator4132.hostgator.com ([192.185.4.144])
        by cmsmtp with SMTP
        id 8fmmn65UtINxB8fmmnQhtU; Sat, 15 Jan 2022 03:55:48 -0600
X-Authority-Reason: nr=8
Received: from host-79-47-126-144.retail.telecomitalia.it ([79.47.126.144]:34826 helo=[10.0.0.109])
        by gator4132.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bristot@kernel.org>)
        id 1n8fml-001urN-7W; Sat, 15 Jan 2022 03:55:47 -0600
Message-ID: <92e4dd91-8d28-b059-ebd4-3c4e027662ad@kernel.org>
Date:   Sat, 15 Jan 2022 10:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: linux-next: build warnings after merge of the ftrace tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220115152812.32d3ba5a@canb.auug.org.au>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <20220115152812.32d3ba5a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4132.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kernel.org
X-BWhitelist: no
X-Source-IP: 79.47.126.144
X-Source-L: No
X-Exim-ID: 1n8fml-001urN-7W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: host-79-47-126-144.retail.telecomitalia.it ([10.0.0.109]) [79.47.126.144]:34826
X-Source-Auth: kernel@bristot.me
X-Email-Count: 1
X-Source-Cap: YnJpc3RvdG1lO2JyaXN0b3RtZTtnYXRvcjQxMzIuaG9zdGdhdG9yLmNvbQ==
X-Local-Domain: no
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen

On 1/15/22 05:28, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (htmldoc)
> produced these warnings:
> 
> Documentation/tools/rtla/rtla-osnoise-hist.rst: WARNING: document isn't included in any toctree
> Documentation/tools/rtla/rtla-osnoise-top.rst: WARNING: document isn't included in any toctree
> Documentation/tools/rtla/rtla-timerlat.rst: WARNING: document isn't included in any toctree
> Documentation/tools/rtla/rtla-timerlat-hist.rst: WARNING: document isn't included in any toctree
> Documentation/tools/rtla/rtla-timerlat-top.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commits
> 
>   b1be48307de4 ("rtla: Add rtla osnoise top documentation")
>   e7041c6b3c12 ("rtla: Add rtla osnoise hist documentation")
>   29380d4055e5 ("rtla: Add rtla timerlat documentation")
>   df337d014b57 ("rtla: Add rtla timerlat top documentation")
>   5dce5904e3b9 ("rtla: Add rtla timerlat hist documentation")
> 

The Documentation/tools/$tools/ is a new directory to store man pages of the
$tools. The idea seems to be to create a '"book" within the larger documentation 
collection'.

I moved the documentation to that directory following Corbet's suggestion [1], 
but the "book" was not yet created. I think it deserves the hands of a more 
expert person in Docs.

Thoughts?

[1] https://lore.kernel.org/lkml/5796a3d5-ae98-9d28-138f-981a06dab34b@kernel.org/

-- Daniel
