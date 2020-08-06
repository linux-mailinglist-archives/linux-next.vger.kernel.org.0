Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27FB23DC9E
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 18:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729679AbgHFQxc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 12:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgHFQu7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2020 12:50:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8720C0A889F;
        Thu,  6 Aug 2020 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=C7mDjirUH0CxtHZlI1BoAJQsb/U9YG0YsZtlAVvm1Qw=; b=rcU+IgX43aspgYAYN1zcfhG3fV
        h2u5zd+2/s8BzvboULXvhysrHIDIYXzV2x4O6w2VIcm+jPfO9GdmAUoXYpAj1fcPPFrBFEYpVmeXp
        Tgcg1bJpF3lBBOf3LQElHVvDqGxer7ejCE1k8eU8teIEmQLrF+uDU0O9rPHO9HdsVznnxfC65lQ/a
        q3QHnkKDV7iUNUrGuSgzYW1Z2f69xzrPg7sESW/jmWlBfMYYcN/fWPZSYTA9GARiB+daxyvQvVPu8
        JHgKyKWg9iVjpyGstyox1cLo1rVj1aGAZ4lCbi0mYVqcTUz0LosgHtrY7WZ4WliBUIMRFHScDRf/S
        ry+ogeCg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k3hDo-0006fy-M6; Thu, 06 Aug 2020 14:50:21 +0000
Subject: Re: linux-next: Tree for Aug 6 (mm/migrate.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200806162116.1d033db0@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <85e9276d-1747-b265-53be-a33ab6203045@infradead.org>
Date:   Thu, 6 Aug 2020 07:50:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806162116.1d033db0@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/5/20 11:21 PM, Stephen Rothwell wrote:
> Hi all,
> 

on x86_64:

when CONFIG_MMU_NOTIFIER is not set/enabled:

../mm/migrate.c: In function 'migrate_vma_collect':
../mm/migrate.c:2481:7: error: 'struct mmu_notifier_range' has no member named 'migrate_pgmap_owner'
  range.migrate_pgmap_owner = migrate->pgmap_owner;
       ^

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
