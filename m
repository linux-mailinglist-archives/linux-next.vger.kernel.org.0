Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42571E6678
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 17:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404436AbgE1PoY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 11:44:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41550 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404499AbgE1PoY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 11:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590680662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=w7CshrItXz8vvevX1N6Q7Vo4dM7itnMloFYSakyyKRo=;
        b=Ht1YZFsdUpss9kCb+aOE7ut7Vx1rIIU5xO3ln8g1SrinLpjiJkMwkWpbF87BWRlkeCZyAB
        xDiMetn2pvZZw+K89eWMj/yjq4q9zWeIwzqE8zexUy+EnL4hvrtsX6bMvqK7YIwFHDTbHe
        mxAVik8bV69KPvQgRWBC33JP5U4OQ8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-r6aIwrs2O8OkeoNKBHkEfg-1; Thu, 28 May 2020 11:44:20 -0400
X-MC-Unique: r6aIwrs2O8OkeoNKBHkEfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E13F1855A26;
        Thu, 28 May 2020 15:44:07 +0000 (UTC)
Received: from treble (ovpn-117-65.rdu2.redhat.com [10.10.117.65])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id F0BFA5C1B0;
        Thu, 28 May 2020 15:44:05 +0000 (UTC)
Date:   Thu, 28 May 2020 10:44:04 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Tree for May 14 (objtool 2/2)
Message-ID: <20200528154404.74sjv4bdj3myacn6@treble>
References: <20200514210716.30b416ee@canb.auug.org.au>
 <742521db-1e8c-0d7a-1ed4-a908894fb497@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <742521db-1e8c-0d7a-1ed4-a908894fb497@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 14, 2020 at 09:04:36AM -0700, Randy Dunlap wrote:
> On 5/14/20 4:07 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200512:
> > 
> 
> on x86_64:
> 
> drivers/ide/ide-tape.o: warning: objtool: ide_tape_discard_merge_buffer.constprop.7()+0x4e: unreachable instruction
> drivers/scsi/sd.o: warning: objtool: sd_pr_clear()+0x1e: unreachable instruction
> drivers/scsi/sd_zbc.o: warning: objtool: sd_zbc_update_wp_offset_workfn()+0xec: unreachable instruction
> drivers/target/target_core_xcopy.o: warning: objtool: target_xcopy_do_work()+0xdd6: unreachable instruction
> 
> 
> randconfig file is attached.

Kees,

More UBSAN_TRAP fun.  This randconfig has:

CONFIG_UBSAN_TRAP=y
CONFIG_UBSAN_ALIGNMENT=y
# CONFIG_COMPILE_TEST is not set

-- 
Josh

