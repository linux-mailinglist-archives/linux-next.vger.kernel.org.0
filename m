Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2601916C9
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 17:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgCXQrU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 12:47:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:60927 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727382AbgCXQrU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Mar 2020 12:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585068439;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mam0WR1HiPsEyv0fa7dCXxsiI1zo2JaAd8tLMKwZM84=;
        b=SspgN/eSL5wcfmuZVBpLnTm/h5GXNF2tS1CJagrZtpPTDk34YOHfNXqEIE2fcUBCk9wFe2
        D46Th64M8FCuT5UKEClM1CDlAxNWz1xbsidnIo2GPDkM7cCustEd6sZ9JsGWdqlJUFwDVd
        fILR7E8ezA0Aga7Y3NHbKsd25k/NKyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-6o_Gt0a5ObepHe7A6CD7Fg-1; Tue, 24 Mar 2020 12:47:13 -0400
X-MC-Unique: 6o_Gt0a5ObepHe7A6CD7Fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC9B38017CC;
        Tue, 24 Mar 2020 16:47:12 +0000 (UTC)
Received: from treble (unknown [10.10.119.253])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C16C619C6A;
        Tue, 24 Mar 2020 16:47:11 +0000 (UTC)
Date:   Tue, 24 Mar 2020 11:47:09 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Mar 20 (objtool warnings)
Message-ID: <20200324164709.ux4riz7v7uy32nlj@treble>
References: <20200320201539.3a3a8640@canb.auug.org.au>
 <ca0078e2-89b5-09a7-f61e-7f2906900622@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca0078e2-89b5-09a7-f61e-7f2906900622@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 20, 2020 at 10:43:05AM -0700, Randy Dunlap wrote:
> On 3/20/20 2:15 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200319:
> > 
> 
> 
> Today's linux-next gives these objtool warnings:
> 
> arch/x86/entry/vdso/vma.o: warning: objtool: vdso_fault()+0x201: unreachable instruction
> 
> drivers/ide/ide-tape.o: warning: objtool: idetape_chrdev_release()+0x109: unreachable instruction
> 
> drivers/media/i2c/ir-kbd-i2c.o: warning: objtool: ir_probe()+0xdaa: unreachable instruction
> 
> kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x89: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
> 
> 
> all in (4) separate builds (.configs).
> Do you want all 4 randconfig files?

For the "unreachable instruction" warnings, if the configs have
CONFIG_UBSAN_TRAP, that's a known issue.

Otherwise, yeah, configs (and .o files if possible) would be good.

-- 
Josh

