Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C36243F58
	for <lists+linux-next@lfdr.de>; Thu, 13 Aug 2020 21:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHMThl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Aug 2020 15:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgHMThk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2020 15:37:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD34C061757;
        Thu, 13 Aug 2020 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=IODJshfpTM1XsW9BHVqe/s7asLOIvIqCZkJTIuAQFZs=; b=VG6q7s2F3otZwNLaM0WobbwFVk
        cCL/TBAJDfW7F35NMTmtJA39tF0AGKW91DUPJQWYxnminO7w6RDQTh7/AHGxuvrrBY9kGfGovSipJ
        ZsurcXEw/dcDiAqtg0155yA1n5I3+U8QOdL4ygLt+vcqyPyrT78fVu7hC0sAzcZrps/vyPZYNUwZl
        KJclcXnOlsjGONvcXU5H4QoZlzr5fWy2/dry0FvqYHmEZBS3ufk1S3ojZRG1Ke9QQmJ7x/q8XDAyg
        vMego03XF+/jM9FQ5aMLpEkZTaa0tSpUKdv7mQU4zU1zp5Ggq5NlDVAmW5GVlSMNvRUUcg0EYlI+6
        M/rwiu8w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k6J2c-0005T8-4P; Thu, 13 Aug 2020 19:37:34 +0000
Subject: Re: linux-next: Tree for Aug 12 (x86: xen/pci)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20200812142211.1fde2a46@canb.auug.org.au>
 <013ba445-7970-99c2-5639-44dcb5867340@infradead.org>
Message-ID: <7ff3c83c-81d7-9a06-b3ce-74e3f7098a4a@infradead.org>
Date:   Thu, 13 Aug 2020 12:37:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <013ba445-7970-99c2-5639-44dcb5867340@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/12/20 7:57 AM, Randy Dunlap wrote:
> On 8/11/20 9:22 PM, Stephen Rothwell wrote:
>> Hi all,
>>
> 
> 
> on x86_64:
> 
> ../arch/x86/pci/xen.c: In function ‘pci_xen_init’:
> ../arch/x86/pci/xen.c:410:2: error: implicit declaration of function ‘acpi_noirq_set’; did you mean ‘acpi_irq_get’? [-Werror=implicit-function-declaration]
>   acpi_noirq_set();
>   ^~~~~~~~~~~~~~

(still seeing this one)

# CONFIG_ACPI is not set/enabled.

> 
> Full randconfig file is attached.
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
