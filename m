Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDB62EBCDE
	for <lists+linux-next@lfdr.de>; Wed,  6 Jan 2021 11:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbhAFK6d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Jan 2021 05:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbhAFK6d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2021 05:58:33 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B58C06134C;
        Wed,  6 Jan 2021 02:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=W1Ut2eYyC7pQ33k5nKMwEcqdAcJufI3T+WM63fnfNuA=; b=S7A8/nWrMpPVvmDDCaI7Oyrg5g
        2zRJfAAppJKw5RiNQw9nqiKfIefF1Cg7I/Hh1/wXrIWhU9FKt2KsRB/7x1sg24SmAYTEf90XnIOUH
        XlT6HWfQdu1guwI8Qf+xodKbMbLwzHpvyDl7mLqL/sKdw6+v5hbsmAvXogIG4D1byTFCtB1RO9okW
        Oqb1/xKUeM6Aa/dsSMHQ87meUxU7jO1LQ/OnqwFsBMeZl06c8rl9RFOp23XJqk89ebQ2Zp9mChC/4
        zSTmrZDnVEjSpiS+aau+QG7p1GA/h8eOwjdI40NBAgQ+DAv3f0f8TqTtUMzb/PGewtEHUuxDG0BxM
        znH2EW4Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1kx6U8-002G1Y-Km; Wed, 06 Jan 2021 10:56:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CBCEE30015A;
        Wed,  6 Jan 2021 11:56:09 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6CAC62029F4C3; Wed,  6 Jan 2021 11:56:09 +0100 (CET)
Date:   Wed, 6 Jan 2021 11:56:09 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Tree for Jan 5 (objtool: 3 warnings)
Message-ID: <X/WXSVdqLsX3JE9Z@hirez.programming.kicks-ass.net>
References: <20210105135007.0c5d549e@canb.auug.org.au>
 <8e050360-ca95-acde-31bd-1afe97dc652b@infradead.org>
 <20210105225228.vtg2zbpn4oud4qth@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105225228.vtg2zbpn4oud4qth@treble>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 05, 2021 at 04:52:28PM -0600, Josh Poimboeuf wrote:
> On Tue, Jan 05, 2021 at 12:48:20PM -0800, Randy Dunlap wrote:
> > On 1/4/21 6:50 PM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20210104:
> > > 
> > 
> > on x86_64:
> > 
> > vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x47: call to syscall_enter_from_user_mode_work() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0xc7: call to sev_es_wr_ghcb_msr() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: lock_is_held_type()+0xb: call to lockdep_enabled() leaves .noinstr.text section
> > 
> > 
> > Full randconfig file is attached.
> 
> These look like legit noinstr warnings.  Thomas, Peter?

Aye, let me get on that.
