Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFD72EB588
	for <lists+linux-next@lfdr.de>; Tue,  5 Jan 2021 23:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbhAEWyI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Jan 2021 17:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26619 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbhAEWyI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2021 17:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609887162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xXUaAFMgoKk24xlYzQjwQ3SyRpimuzcTQudeRZ3UcvQ=;
        b=dsQHrfk6M2/A83r0euNNYNcBEyzhjUmyyYZVBbb3U9Vueq3gaCNMJNX/+cu2WRoTwpddHL
        kapwOTdofkUCZNRtOkK93oJ00z3/he1AdUSW9PCuq4HTivHupvOqHQ/2bq2i8dlcjXmhQK
        oBN7dBB5noNL6kDw63kbTjaW91bf4Pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-nqy92AhoNdqcwp4WWTLeAw-1; Tue, 05 Jan 2021 17:52:34 -0500
X-MC-Unique: nqy92AhoNdqcwp4WWTLeAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85764800D53;
        Tue,  5 Jan 2021 22:52:32 +0000 (UTC)
Received: from treble (ovpn-113-48.rdu2.redhat.com [10.10.113.48])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 820CB60C04;
        Tue,  5 Jan 2021 22:52:30 +0000 (UTC)
Date:   Tue, 5 Jan 2021 16:52:28 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Tree for Jan 5 (objtool: 3 warnings)
Message-ID: <20210105225228.vtg2zbpn4oud4qth@treble>
References: <20210105135007.0c5d549e@canb.auug.org.au>
 <8e050360-ca95-acde-31bd-1afe97dc652b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e050360-ca95-acde-31bd-1afe97dc652b@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 05, 2021 at 12:48:20PM -0800, Randy Dunlap wrote:
> On 1/4/21 6:50 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210104:
> > 
> 
> on x86_64:
> 
> vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x47: call to syscall_enter_from_user_mode_work() leaves .noinstr.text section
> vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0xc7: call to sev_es_wr_ghcb_msr() leaves .noinstr.text section
> vmlinux.o: warning: objtool: lock_is_held_type()+0xb: call to lockdep_enabled() leaves .noinstr.text section
> 
> 
> Full randconfig file is attached.

These look like legit noinstr warnings.  Thomas, Peter?

-- 
Josh

