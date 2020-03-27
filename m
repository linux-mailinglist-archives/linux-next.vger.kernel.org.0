Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4BEC195C97
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 18:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgC0RYQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 13:24:16 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:59792 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbgC0RYP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 13:24:15 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jHsiF-0048yr-K9; Fri, 27 Mar 2020 17:24:07 +0000
Date:   Fri, 27 Mar 2020 17:24:07 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        richard -rw- weinberger <richard.weinberger@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 27
Message-ID: <20200327172407.GV23230@ZenIV.linux.org.uk>
References: <20200327190740.7385d4ff@canb.auug.org.au>
 <425b6d83-53da-15bb-8e7a-158f7c44ffad@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <425b6d83-53da-15bb-8e7a-158f7c44ffad@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 27, 2020 at 08:52:47AM -0700, Randy Dunlap wrote:
> On 3/27/20 1:07 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200326:
> > 
> 
> on i386, UML defconfig build fails with: (mostly get_user() variants)

Buggered-by: 1a908babcb144 (x86: replace arch macros from compiler with CONFIG_X86_{32,64})

    If the intention is to check i386/x86_64 excluding UML, testing
    CONFIG_X86_{32,64} is simpler.

Which is not true, since uml/x86 configs bloody well *do* have CONFIG_X86_{32,64}
defined.  See arch/x86/um/Kconfig; and yes, it does need those, as well as
arch/x86/Kconfig.cpu.
