Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15FB2174C4
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 19:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgGGRJs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 13:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgGGRJs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 13:09:48 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3CAC061755;
        Tue,  7 Jul 2020 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=VtiHUiyb//SGj+Knq/KKD/eti2VKeoJokjedgU/YeUg=; b=grkkg2ykASxwgIiR9hCOu8VyVB
        luCeI/4DGM7lP9G1rzIe56CVDGNsPbKQRQHpTZKpWWU2qcrqxyIo/Q+9oftiHMxLefGbwwJ9BPP2T
        qWgIJoM8FAUPh3yEzK3dFS9CYkdqkttmeAeX/7fg2peF4hP7i7r4Hk79r8OzaOePp6/wriR1hV50Z
        6fD9IVf8M4RYyJQ2+OKU5N8Csl1fWshvLyOBxVs4NSKWR7subyzR1oMzd/Jz9xlf11L6a7MMG8szu
        rcJop5hpipPC7ujHyI8UZy9c+/hEMu8vgXFnpHIkKj/I5bBalu4fscdSPpFi2wEabQBFcqMPNgD1y
        KLuuf7NA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jsr6G-0001M1-T6; Tue, 07 Jul 2020 17:09:45 +0000
Subject: Re: linux-next: Tree for Jul 7 (scsi/lpfc/lpfc_init.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        James Smart <james.smart@broadcom.com>,
        dick kennedy <dick.kennedy@broadcom.com>
References: <20200707180800.549b561b@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2f85f3c4-a58b-f225-a533-86e209a4651c@infradead.org>
Date:   Tue, 7 Jul 2020 10:09:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707180800.549b561b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/7/20 1:08 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200706:
> 

on i386:

when CONFIG_ACPI is not set/enabled:


../drivers/scsi/lpfc/lpfc_init.c:1265:15: error: implicit declaration of function 'get_cpu_idle_time'; did you mean 'get_cpu_device'? [-Werror=implicit-function-declaration]


The cpufreq people want justification for using
get_cpu_idle_time().  Please see
https://lore.kernel.org/linux-scsi/20200707030943.xkocccy6qy2c3hrx@vireshk-i7/



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
