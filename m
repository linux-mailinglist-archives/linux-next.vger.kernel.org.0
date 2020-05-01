Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFDD1C0CE8
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 05:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgEAD4v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 23:56:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37697 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727889AbgEAD4v (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 23:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588305410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bXalt8zK+YdFYaEr91Rzg8c48giwHyBf2CnOS3ryAnE=;
        b=g4HrP8BqXk4dZFfJBE4sewsZrQNTx3zDynKz+bmqCUXCLKdCyQby8RbRFVYZToHIssirNt
        SLskPdBPVzJEjv4244XsBahZkvIrX93fbYkXRy2Afa9oBC2QMz4y7CLR+/mGdVCrbWckc4
        F6KhmNSTJlB9WeqBJgFt387GuFrENYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-LWnWZ9qkMw6JQyRYU5-6Mw-1; Thu, 30 Apr 2020 23:56:48 -0400
X-MC-Unique: LWnWZ9qkMw6JQyRYU5-6Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45077186E6F9;
        Fri,  1 May 2020 03:56:47 +0000 (UTC)
Received: from treble (ovpn-113-19.rdu2.redhat.com [10.10.113.19])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B583579A5;
        Fri,  1 May 2020 03:56:46 +0000 (UTC)
Date:   Thu, 30 Apr 2020 22:56:44 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 30 (objtool warnings)
Message-ID: <20200501035644.i7woe5bpyxqwjpwh@treble>
References: <20200430174019.417e5f3e@canb.auug.org.au>
 <8eedaa40-c93d-428e-47aa-ee1e6b6d69e6@infradead.org>
 <9005add6-3b90-f9f0-eb56-6e309853eb7f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9005add6-3b90-f9f0-eb56-6e309853eb7f@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 30, 2020 at 07:40:52AM -0700, Randy Dunlap wrote:
> On 4/30/20 7:31 AM, Randy Dunlap wrote:
> > On 4/30/20 12:40 AM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20200429:
> >>
> > 
> > on x86_64:
> > 
> > kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x2e: unreachable instruction
> > kernel/cred.o: warning: objtool: copy_creds()+0x278: unreachable instruction
> > net/core/skbuff.o: warning: objtool: skb_push()+0x9e: unreachable instruction
> > 
> > 
> > Full randconfig file is attached.
> > 
> 
> oops, forgot to Cc: Josh and Peter.

These are all related to -flive-patching, for some reason it reduces
GCC's ability to detect local noreturn functions.  I had some patches
for these (and more) I'll need to dig up.

-- 
Josh

