Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53B63158A32
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 08:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgBKHGK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 02:06:10 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46262 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgBKHGJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2020 02:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=2m3bJGcjxT5w2At1D6gwWee6qZSAoYez4Br/b+/pfLg=; b=BdxaDYVl1q7FXFALHROLjfbP2X
        rnmeYPRJzn21xXVs0qg+Nw3pnX+VvQMBc3jRB+6TYRLy0OQY0AifZwyD3jyxjIoMXoYW6s7XJp6uD
        XepOs/4dcpSjTOsRj3KVDQohqS7C0a4b8gTJ7IdhZCCes29UJgpJpor8I5puhD0ly6/M5HaEwzM/f
        VcpEidrvaJu0Kp/gJXRoVVVyZTIO8MUalO43SKXxdu2qpAjA89d5OSXz0TgRQzErLFemrE0pQ0JYn
        NR/4OjXKTOOwzaK8nRCZbE8zsfY1jSckC1dtIlLgzYKeVZn0SKfvDmArZKIsABcUsBRJQOnbQ17PD
        B7F9r7iA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j1PcX-0002HA-5y; Tue, 11 Feb 2020 07:06:09 +0000
Subject: Re: linux-next: Tree for Feb 11
 (drivers/platform/x86/intel_pmc_core.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Vishwanath Somayaji <vishwanath.somayaji@intel.com>
References: <20200211130054.001bfce9@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f0d576b6-7204-0caf-1ca8-aae6c82d3b8d@infradead.org>
Date:   Mon, 10 Feb 2020 23:06:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211130054.001bfce9@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/10/20 6:00 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200210:
> 

on i386:

Function args are reversed (offset and status);

../drivers/platform/x86/intel_pmc_core.c: In function 'pmc_core_resume':
../drivers/platform/x86/intel_pmc_core.c:1329:43: warning: passing argument 4 of 'pmc_core_lpm_display' makes integer from pointer without a cast [-Wint-conversion]
   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
                                           ^~~~~~~~
../drivers/platform/x86/intel_pmc_core.c:977:13: note: expected 'u32 {aka unsigned int}' but argument is of type 'char *'
 static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
             ^~~~~~~~~~~~~~~~~~~~
../drivers/platform/x86/intel_pmc_core.c:1329:53: warning: passing argument 5 of 'pmc_core_lpm_display' makes pointer from integer without a cast [-Wint-conversion]
   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
                                                     ^~~~~~
../drivers/platform/x86/intel_pmc_core.c:977:13: note: expected 'const char *' but argument is of type 'int'
 static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
             ^~~~~~~~~~~~~~~~~~~~


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
