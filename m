Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531451E88E9
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 22:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgE2UbU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 16:31:20 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46269 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728206AbgE2UbU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 16:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590784279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DELp0njxEcWNpbww3vjjRkIi4xfUazdSHq+PORFCme4=;
        b=HZ+o7JMsjxhOi9gloMiMvGUEYfjE4N1CwQz2LszILkbxq1KsDPgBxuY2L1UrA3exYB93w7
        TzwO1xnNRF6mYAcyhBI6JKH7KMN8Qj/ksj85LfgvsCwmecEuPTCYv4ozbtGheu8bsOQAmr
        7ZEL1TIt2xUagdpoOC4Ob1KoiXXOGG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-6DQQQKTMM-mx4ge5kiyJpg-1; Fri, 29 May 2020 16:31:15 -0400
X-MC-Unique: 6DQQQKTMM-mx4ge5kiyJpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A92800688;
        Fri, 29 May 2020 20:31:14 +0000 (UTC)
Received: from treble (ovpn-116-170.rdu2.redhat.com [10.10.116.170])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id ECFB76ED97;
        Fri, 29 May 2020 20:31:11 +0000 (UTC)
Date:   Fri, 29 May 2020 15:31:10 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Tree for May 29 (objtool warnings)
Message-ID: <20200529203110.fex73r7lh6slzamq@treble>
References: <20200529215624.5e52c341@canb.auug.org.au>
 <27c0f44b-f61f-a545-25b0-747f1a6dd7e9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27c0f44b-f61f-a545-25b0-747f1a6dd7e9@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 12:43:59PM -0700, Randy Dunlap wrote:
> On 5/29/20 4:56 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next release on Monday.
> > 
> > Changes since 20200528:
> > 
> 
> 
> on x86_64:
> 
> crypto/drbg.o: warning: objtool: drbg_hash_update()+0x2a6: unreachable instruction
> drivers/clk/clk-si5341.o: warning: objtool: si5341_synth_clk_set_rate()+0x129: unreachable instruction

More UBSAN_TRAP, this should be fixed by Kees' new patch.

-- 
Josh

