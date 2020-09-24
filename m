Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF7A276628
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 04:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIXCBF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 22:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgIXCBF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 22:01:05 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EB0C0613CE;
        Wed, 23 Sep 2020 19:01:05 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kLGZ8-004w53-GJ; Thu, 24 Sep 2020 02:00:58 +0000
Date:   Thu, 24 Sep 2020 03:00:58 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20200924020058.GT3421308@ZenIV.linux.org.uk>
References: <20200924114050.3b6f82b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924114050.3b6f82b4@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 24, 2020 at 11:40:50AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> lib/strnlen_user.o: warning: objtool: strnlen_user()+0xf3: call to do_strnlen_user() with UACCESS enabled
> lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x188: call to do_strncpy_from_user() with UACCESS enabled

s/inline/__always_inline/ in those two...

Will be there tonight; they should've been inlined anyway on any sane config...
