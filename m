Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910E73A26FE
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 10:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhFJI3t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 04:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhFJI3s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2021 04:29:48 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C63C061574;
        Thu, 10 Jun 2021 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=6TvJO2oYls+R8jWRS4i4KOvvEnoQ3DX4aWw/H7lp6EI=; b=IQC3/25TPj17jL1ANdginWA0MG
        UKAFMiqm/tb94fmRrIIhXB1xMTFlR5IhwdOtfl+Sfo7ZWuiLIdX0Z7lltFVWPRFFUMBkZWEcmOwDB
        U7oUesIeoG1TUVtdFsaszcA77oqhsU8Fvl6H2G4wL5b4CHqjn/fcd0y2I1ldxtgzXR+t3IQ7wwx9O
        MVeFLJc+eiVPrNvkCLo/2lthMPADHByKZiEJ41BKasz1zPUd8yZG1PEMDWktSY/Qsu/W9MecX7YHa
        9P3AkpHpDuqbjjNRRXNtll9GAnmbbxRFubyhqrrrDeS7EZ9njPPx4yEPFxBusAcJAzTIFh7f4IRiz
        vwkJIwjw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lrG1Q-001Osm-7A; Thu, 10 Jun 2021 08:26:43 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A2F5A300258;
        Thu, 10 Jun 2021 10:26:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4E1C82BFA6774; Thu, 10 Jun 2021 10:26:39 +0200 (CEST)
Date:   Thu, 10 Jun 2021 10:26:39 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <YMHMv0huf6D0PZjD@hirez.programming.kicks-ass.net>
References: <20210610180825.2aa4435f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610180825.2aa4435f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 10, 2021 at 06:08:25PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> Cannot find symbol for section 255: .text.opal_int_set_mfrr.
> arch/powerpc/platforms/powernv/opal-call.o: failed
> 
> and many more similar.
> 
> Caused by commit
> 
>   9e419de4c678 ("recordmcount: Correct st_shndx handling")

Argh.. lemme try and reproduce :/
