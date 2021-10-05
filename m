Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373E442324E
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 22:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbhJEUsu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 16:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbhJEUsu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 16:48:50 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840A3C061749;
        Tue,  5 Oct 2021 13:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=04u3WsEUre5JoPn7YphGqtZyhd7Lgt+VnEthZ3R9VFU=; b=eFRIsc6dkAlQmzKiDNsowjX2Fw
        AdSF71DjCvnbMmpHPYjcCP8p9S4V7GxMTbVL0/UD1aM1CyHDJ5aBQii3NtpUX9GxM/5Qd3Bwexk5L
        RlRMySPXGG9EcS8mf+BXBb0Pvmbw0VwghCJi3xwZoGwQVPneSzEks0DGoQjaQr9AiOHdNCN/7mIw+
        ZDb+8SWH8P7pKKibcGxI7XGBi/kgiYl6y29QacKlECACIRhe0ME8StVYbmKWv8gYGP7y1Y5+cVtnW
        Apk8/p4HjVyXc/g198byJRUmTKjdsGXD+FBUrhTw/PbB6RQZ5QdTR0BjKeMy54YXtybszdZ8QoG3v
        MePQa/qA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mXrKw-00BrXA-6w; Tue, 05 Oct 2021 20:46:54 +0000
Subject: Re: linux-next: Tree for Oct 5 (warnings: a. trace; b. mm/migrate)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>
References: <20211005190628.1f26b13d@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
Date:   Tue, 5 Oct 2021 13:46:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005190628.1f26b13d@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/5/21 1:06 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20211001:
> 

on x86_64:

a. randconfig: KCONFIG_SEED=0xBFBEA13C
../kernel/trace/trace.c:1712:13: error: 'trace_create_maxlat_file' defined but not used [-Werror=unused-function]
  static void trace_create_maxlat_file(struct trace_array *tr,

b. randconfig: KCONFIG_SEED=0xFD1CE406

../mm/migrate.c:3216:22: error: 'migrate_on_reclaim_callback' defined but not used [-Werror=unused-function]
  static int __meminit migrate_on_reclaim_callback(struct notifier_block *self,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../mm/migrate.c:3197:13: error: 'set_migration_target_nodes' defined but not used [-Werror=unused-function]
  static void set_migration_target_nodes(void)
              ^~~~~~~~~~~~~~~~~~~~~~~~~~


(example usage to get the randconfig files:
KCONFIG_SEED=0xBFBEA13C make [ARCH=x86_64] randconfig
)

-- 
~Randy
