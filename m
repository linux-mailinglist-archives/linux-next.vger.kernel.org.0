Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D842C6906
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 16:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgK0P5t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 10:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgK0P5t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 10:57:49 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A51C0613D1;
        Fri, 27 Nov 2020 07:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=aPA7vZc5skp5m9teFGxFcm65W4URoc1y/rCUFO2P2SY=; b=JT/TYvGtAZWEOa9U3G48Y7U04o
        G4tiR+bG9B+xlpesJoXJNCZk3xc4ZbDMhnPEAdto1HyhXKo0HQY0vpYl0BZKXzZbtJ3TiyZOuQydI
        20khW2WFD/zKCOPO34baicit2aPjI8HWnQhxMJklEu/Wzfd1OiElJoi7AepIN1IDAEB3jHWl21+Cd
        bJNLpSVwTKgV6MiviOkWVuHyr5s0pgKvOiUmaxz4k7rf/hSeheSFrDiGL5sx6wHXyamOQvcP6qLT5
        XdNg7B3wWX5+bHdvyXble2XbHt0pEIfKdPYcAn4samygafyeW+DcDqWLxAqSwED++2B8nLZwOhW+L
        dT/Az4dQ==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kig7y-0004XT-Tz; Fri, 27 Nov 2020 15:57:43 +0000
Subject: Re: linux-next: Tree for Nov 27 (drivers/idle/intel_idle.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <lenb@kernel.org>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0a6cc4c9-c48d-dbc4-6044-3b22cd133b76@infradead.org>
Date:   Fri, 27 Nov 2020 07:57:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127200457.1ffb6aaf@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/27/20 1:04 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201126:
> 

(This looks strange to me.)


on i386 or x86_64:

# CONFIG_ACPI is not set

../drivers/idle/intel_idle.c: In function ‘intel_idle_init_cstates_icpu’:
../drivers/idle/intel_idle.c:1510:7: error: implicit declaration of function ‘intel_idle_state_needs_timer_stop’; did you mean ‘intel_idle_init_cstates_icpu’? [-Werror=implicit-function-declaration]
   if (intel_idle_state_needs_timer_stop(&drv->states[drv->state_count]))
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
