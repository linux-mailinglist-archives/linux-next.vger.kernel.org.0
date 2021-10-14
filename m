Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379B542D93A
	for <lists+linux-next@lfdr.de>; Thu, 14 Oct 2021 14:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhJNM0S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 08:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhJNM0R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 08:26:17 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E49C061570;
        Thu, 14 Oct 2021 05:24:12 -0700 (PDT)
Received: from crub (pd95f1d7c.dip0.t-ipconnect.de [217.95.29.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: agust@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DD87A8362B;
        Thu, 14 Oct 2021 14:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634214250;
        bh=QmU2rqEKQ3dXNDZ9x0ZGC5r318El4iF000T+HRihIwI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lwXB7fCcUaPIpC2i0tAyoiToGS1EzjVqtf2ujo0P15lDRdJX8N1wWLvaMiQ4YnrPR
         INGS33DU99OFU+t4h55LOstPHmIkyKQ4WHdTcWQVkYcvmPvjacuZIJ4oWoNcEmbQ1P
         M21hO5M925xsZLiP/KJIndGs6F/doozWP0/x39INafJVxlz/o+GlXEgG8G5mlpzVYM
         Fg5FBLRTrS3te/N/8r6vz27eDimbiKS9wMN5gPuDi3hCjp93pO2YJ9dg0VrGm5WDLg
         nV4GUKw0WZ8HXPvTQdUNjTniP4GWx4X8cXR5/wihocG9fZlluI0xZBKGb5ItgWuuz+
         AkDvumkP4JR2w==
Date:   Thu, 14 Oct 2021 14:24:09 +0200
From:   Anatolij Gustschin <agust@denx.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20211014142409.2b329ff1@crub>
In-Reply-To: <CAK8P3a0yKvZW2-XFJtPORpa=FhG+UJgk=m0O1GiC_yLw+1Pfvw@mail.gmail.com>
References: <20211008164728.30e3d3a3@canb.auug.org.au>
        <20211011082704.3cff4568@canb.auug.org.au>
        <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
        <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
        <20211014001232.3becbe99@crub>
        <CAK8P3a0yKvZW2-XFJtPORpa=FhG+UJgk=m0O1GiC_yLw+1Pfvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 14 Oct 2021 10:44:46 +0200
Arnd Bergmann arnd@arndb.de wrote:

>On Thu, Oct 14, 2021 at 12:12 AM Anatolij Gustschin <agust@denx.de> wrote:
>> On Tue, 12 Oct 2021 16:39:56 +0200
>> Arnd Bergmann arnd@arndb.de wrote:
>> ...  
>> >Grant Likely was the original maintainer for MPC52xx until 2011,
>> >Anatolij Gustschin is still listed as maintainer since then but hasn't
>> >been active in it for a while either. Anatolij can probably best judge
>> >which of these boards are still in going to be used with future kernels,
>> >but I suspect once you start removing bits from 52xx, the newer
>> >but less common 512x platform can go away as well.  
>>
>> many of these boards are still used, i.e. o2d*, digsy_mtc, tqm5200.  
>
>Just for clarification, I assume when you say "still used" that implies
>getting updated to new kernels rather than just running the old BSPs,
>right?

yes, at least some of them. I used v5.4 kernel on digsy_mtc and
tqm5200 last year, and v5.10 kernel is also known to work.

>What are the typical distro release cycles for those machines
>you list: do you move from one LTS kernel to the next each year,
>or are they getting more sporadic over time?

these machines are in embedded systems and do not get regular
distro updates, therefore more sporadic over time.

>Do you expect the machines with the lowest memory such as the
>32MB digsy to stop getting kernel updates before the others?

No. There are also digsy variants with 256MiB DRAM.

Thanks,

Anatolij
