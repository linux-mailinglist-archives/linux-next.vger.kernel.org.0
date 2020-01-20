Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 226CB142EDC
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 16:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgATPhy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 10:37:54 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33613 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728712AbgATPhx (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jan 2020 10:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579534672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xBV8jGRs/XA3UVuyMQfvzcPKmplldno4+x7U6B33yFA=;
        b=Ubuw/FFepO4NWU+nLaNVWZE+ZBdHYABO5tM6MADWUCAA4WZFqncV6sTJAI7xHedNQVA3Gp
        cliyrgDmSdebEwy9rXfjcnioctzzN1CHxbX09nFgRExgXjHFDnGPADu01aIG+sU5vHWFZW
        aKanMHcSut7nGZclUg6i3eodhL/Rkbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-6jS4MzZCP-KIuj0-IG5DQQ-1; Mon, 20 Jan 2020 10:37:49 -0500
X-MC-Unique: 6jS4MzZCP-KIuj0-IG5DQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C07CE18543BA;
        Mon, 20 Jan 2020 15:37:47 +0000 (UTC)
Received: from treble (ovpn-125-19.rdu2.redhat.com [10.10.125.19])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6894E5DA75;
        Mon, 20 Jan 2020 15:37:45 +0000 (UTC)
Date:   Mon, 20 Jan 2020 09:37:43 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Nov 15 (objtool)
Message-ID: <20200120153743.z6ws3jbgnsmsjvvx@treble>
References: <20191115190525.77efdf6c@canb.auug.org.au>
 <c49752fe-4b47-2329-2cb8-caad44803e3a@infradead.org>
 <20191115163830.g262y75w3sh535fm@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191115163830.g262y75w3sh535fm@treble>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15, 2019 at 10:38:30AM -0600, Josh Poimboeuf wrote:
> On Fri, Nov 15, 2019 at 08:02:30AM -0800, Randy Dunlap wrote:
> > On 11/15/19 12:05 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20191114:
> > > 
> > 
> > on x86_64:
> > 
> > already reported and Josh supplied a fix (yet unmerged),
> > but this is still around:
> > 
> > kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable instruction
> 
> My apologies, I have a growing backlog of objtool fixes which I hope to
> post next week.
> 
> > 
> > new AFAIK:
> > 
> > drivers/gpu/drm/bridge/cdns-dsi.o: warning: objtool: cdns_dsi_bridge_enable()+0x3e0: unreachable instruction
> > 
> > obj file for latter one is attached.
> 
> This seems fishy.  cdns_dsi_init_link() never returns, it always dies a
> with UD2.  I bet GCC decided that it always does a divide-by-zero, and
> so it forces a crash as a result.  Will try to dig deeper next week...

Hi Randy,

(Digging up old objtool threads...)

This is another one that it would be nice to recreate, so I can open a
GCC bug if needed.  If you can still recreate it, can you provide the
config file and GCC version?

-- 
Josh

