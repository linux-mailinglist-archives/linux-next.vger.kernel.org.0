Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0EA212353
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 14:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgGBM2S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 08:28:18 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52374 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728954AbgGBM2R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 08:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593692897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=swcKoq59vboi9ezf0VuU3tu2bfV/QH1PM3CqxCFZ+Sc=;
        b=bA6YMORlmvNAfd9uL980k9/XAS4z46f8ZRUs/GU93qbyM7oYFjg3qq86hYzSsZCKdJrmCd
        nqskIwG5//xVSh/8Nwimuh6GBUzcbLJLVMhSlGOn2bNzlo1CWwoqR1g8Qqe+v8jQt2GOI8
        VlDn2cOt8WtTe0vIY+Zd3BUWEla32/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-GE_0POFuOW2XOd1k-zlz3Q-1; Thu, 02 Jul 2020 08:28:13 -0400
X-MC-Unique: GE_0POFuOW2XOd1k-zlz3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D2C7EC1A0;
        Thu,  2 Jul 2020 12:28:10 +0000 (UTC)
Received: from treble (ovpn-117-134.rdu2.redhat.com [10.10.117.134])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6330E2B4CC;
        Thu,  2 Jul 2020 12:28:09 +0000 (UTC)
Date:   Thu, 2 Jul 2020 07:28:07 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>
Subject: Re: linux-next: Tree for Jun 25 (objtool warnings(4))
Message-ID: <20200702122807.axlcxel3tlyhgf4c@treble>
References: <20200625163453.151425b0@canb.auug.org.au>
 <089a3f89-f5f3-1d23-85d1-d17cde2101e1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <089a3f89-f5f3-1d23-85d1-d17cde2101e1@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 25, 2020 at 09:49:51AM -0700, Randy Dunlap wrote:
> On 6/24/20 11:34 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200624:
> > 
> 
> on x86_64:
> 
> kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable instruction
> kernel/cred.o: warning: objtool: override_creds()+0x4b: unreachable instruction
> fs/btrfs/extent_io.o: warning: objtool: __set_extent_bit()+0x724: unreachable instruction
> drivers/scsi/pcmcia/aha152x_core.o: warning: objtool: run()+0x48f: unreachable instruction

CONFIG_LIVEPATCH - adding Miroslav.

-- 
Josh

