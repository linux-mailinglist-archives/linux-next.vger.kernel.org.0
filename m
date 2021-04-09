Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143C3359C96
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 13:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbhDILEj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 07:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbhDILEi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 07:04:38 -0400
X-Greylist: delayed 479 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Apr 2021 04:04:25 PDT
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4038C061760
        for <linux-next@vger.kernel.org>; Fri,  9 Apr 2021 04:04:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 06C683FA1B;
        Fri,  9 Apr 2021 10:56:19 +0000 (UTC)
Subject: Re: linux-next: build failure after merge of the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210409201316.6c9295a4@canb.auug.org.au>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <1d2feb6a-43a0-45b5-1c5f-50e23bb399be@marcan.st>
Date:   Fri, 9 Apr 2021 19:56:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210409201316.6c9295a4@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 09/04/2021 19.13, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm-soc tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
[...]
> Caused by commits
> 
>    7c566bb5e4d5 ("asm-generic/io.h:  Add a non-posted variant of ioremap()")
>    89897f739d7b ("of/address: Add infrastructure to declare MMIO as non-posted")
> (and maybe some others)
> 
> I have reverted 86332e9e3477..7d2d16ccf15d for today.

This is fixed in ea9629283839 in the soc tree, which went in a few hours 
ago. Sorry for the noise.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
