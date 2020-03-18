Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4073818A0FB
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 17:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbgCRQzo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 12:55:44 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:20817 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727144AbgCRQzo (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 12:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584550543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Gw8dSJcxAXn8cbdNXnASK9oycQDUpTjvTj4lA80tno0=;
        b=RERh36mNVaH9Si4IhaY0isL0WIpGI43WeXDQ4FikbkHeAM7Ms5y7O1QTuKNkd5+AfpUCS+
        dXBRSFe5ZWlYSgiueJSR6D4M1FK/yNPAkz3XKy392TRGWJapTmRS5trBMiLDbXvHa26esO
        9hh8g47LBo2J5dOUxMPMgpzxiVpnqgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-I5vSD3jsM3ifT26mfsHPPQ-1; Wed, 18 Mar 2020 12:55:41 -0400
X-MC-Unique: I5vSD3jsM3ifT26mfsHPPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4914D800D4E;
        Wed, 18 Mar 2020 16:55:40 +0000 (UTC)
Received: from treble (unknown [10.10.110.4])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 321225D9E2;
        Wed, 18 Mar 2020 16:55:38 +0000 (UTC)
Date:   Wed, 18 Mar 2020 11:55:36 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200318165536.5cz4mzgb7xyxvjop@treble>
References: <20200318220920.48df2e76@canb.auug.org.au>
 <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 09:48:01AM -0700, Randy Dunlap wrote:
> On 3/18/20 4:09 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200317:
> > 
> 
> Hi,
> 
> For some reason, the attached .config file generates over 350 objtool warnings.
> There are all "unreachable instruction" warnings.
> 
> Here is a small sample:
> 
> mm/page-writeback.o: warning: objtool: __set_page_dirty_nobuffers()+0x25b: unreachable instruction
> kernel/sched/fair.o: warning: objtool: load_balance()+0x54c: unreachable instruction
> kernel/power/process.o: warning: objtool: freeze_kernel_threads()+0x115: unreachable instruction
> mm/readahead.o: warning: objtool: read_cache_pages_invalidate_page()+0x1b5: unreachable instruction
> kernel/power/suspend.o: warning: objtool: suspend_devices_and_enter()+0x101f: unreachable instruction
> kernel/sched/rt.o: warning: objtool: dequeue_top_rt_rq()+0x67: unreachable instruction

WTH.  This looks like the BUG "double ud2" problem we saw the other day.

I wonder what changed.

-- 
Josh

