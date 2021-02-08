Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44793141A9
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 22:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbhBHVYn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 16:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45001 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232925AbhBHVXe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 16:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612819322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7rPLQAElgHees9+1oAOIuOVL0/2tuTufKerlPtBFQmU=;
        b=UoJhOfj3YYNlJom5YNtz+YJdTRM+plrcfjlYz6PwBuizVG2u4od6iuaXGJigj1bmQQBkIl
        SdLthbVKLwck17AxEeboA2cm2jRouFg6qAJsEubvhzfFqXu7foDg0mzI9bWBKsrr6HgotD
        oaFvoO7YKn6JcMX1T5lm0eNyNsFVdfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-PhagjMyaO0Czeap8eyEjTg-1; Mon, 08 Feb 2021 16:21:58 -0500
X-MC-Unique: PhagjMyaO0Czeap8eyEjTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5318107ACE3;
        Mon,  8 Feb 2021 21:21:56 +0000 (UTC)
Received: from treble (ovpn-120-159.rdu2.redhat.com [10.10.120.159])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id AD4AF1346F;
        Mon,  8 Feb 2021 21:21:55 +0000 (UTC)
Date:   Mon, 8 Feb 2021 15:21:53 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Feb 8 (objtool: warnings: 5)
Message-ID: <20210208212153.vs2v7k2c55a3syvo@treble>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 08, 2021 at 11:30:59AM -0800, Randy Dunlap wrote:
> On 2/8/21 4:52 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210205:
> > 
> 
> on x86_64:
> 
> objtool warnings: (from 3 different randconfig builds)
> 
> drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()

Randy, can you share the .o?  (you may need to gzip it, still waiting on
corporate IT to allow me to receive .o files)

> fs/select.o: warning: objtool: do_sys_poll()+0x8e9: call to __ubsan_handle_sub_overflow() with UACCESS enabled
> lib/iov_iter.o: warning: objtool: iovec_from_user.part.12()+0x2db: call to __ubsan_handle_add_overflow() with UACCESS enabled

Peter, we need the patch to prevent UBSAN with gcc7?

> vmlinux.o: warning: objtool: do_machine_check()+0x7ee: call to queue_task_work() leaves .noinstr.text section
> vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section

Peter?

-- 
Josh

