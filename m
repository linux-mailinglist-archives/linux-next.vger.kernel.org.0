Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4E33FFC7F
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 11:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348437AbhICJBd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 05:01:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234865AbhICJBc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Sep 2021 05:01:32 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 404C861051;
        Fri,  3 Sep 2021 09:00:33 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mM53n-008oEi-7J; Fri, 03 Sep 2021 10:00:31 +0100
MIME-Version: 1.0
Date:   Fri, 03 Sep 2021 10:00:31 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the irqchip tree
In-Reply-To: <20210903164723.176c889e@canb.auug.org.au>
References: <20210813194457.445205e6@canb.auug.org.au>
 <20210903164723.176c889e@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ee143a532bf2441b36da947b9b2cb57b@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2021-09-03 07:47, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 13 Aug 2021 19:44:57 +1000 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
>> 
>> After merging the irqchip tree, today's linux-next build (htmldocs)
>> produced this warning:
>> 
>> Documentation/core-api/irq/irq-domain.rst:178: WARNING: Inline 
>> emphasis start-string without end-string.
>> 
>> Introduced by commit
>> 
>>   991007ba6cca ("Documentation: Update irq_domain.rst with new lookup 
>> APIs")
> 
> I am still getting this warning.

Thanks for the reminder. Fix now queued.

         M.
-- 
Jazz is not dead. It just smells funny...
