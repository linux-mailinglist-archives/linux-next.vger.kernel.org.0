Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394D2438F30
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 08:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhJYGPw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 02:15:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229841AbhJYGPw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 02:15:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8049A60F4F;
        Mon, 25 Oct 2021 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635142410;
        bh=1qZis4mxeb27C2mr+5w0WJb5S4lHXhhL17bxKjZqLOE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G8fBIrKjA3WGAEm+Vkvrz5BSEzWllT36IGSyKnhhWWdrw1/i0DTakPiJKNi7fsV5K
         pLKsY0axHufOT8r0Bx/oEuswZPTkviy8yW/zQLV1WrK7pxJTVohTqePYrcDcpe47UB
         NQI7C7HrT1vfQwDSL28VVBirmJc37cVUQz4MKZqVhYjzw65sCjLly4rUI5WgupxDyi
         5GWzBTMl71XadY8gX5A0J+Q/BPGeQXy2csyc9qGq4yRPd4r8rAy9Cssa0UX20RKDlR
         Ali1pJ07YjIhWsxA9HHNnzUjE0k4Nnq4x0PCvZNM35oV0fRqOGD6U8zxKCJOuPa80e
         i382VUu9eNAxQ==
Date:   Mon, 25 Oct 2021 15:13:27 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-Id: <20211025151327.00af129d9f876e252b042d01@kernel.org>
In-Reply-To: <20211025153942.0c31bd06@canb.auug.org.au>
References: <20211025153942.0c31bd06@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 25 Oct 2021 15:39:42 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: vmlinux.o(.text.unlikely+0x90082): Section mismatch in reference from the function xbc_alloc_mem() to the function .init.text:memblock_alloc_try_nid()
> The function xbc_alloc_mem() references
> the function __init memblock_alloc_try_nid().
> This is often because xbc_alloc_mem lacks a __init 
> annotation or the annotation of memblock_alloc_try_nid is wrong.
> 
> Introduced by commit
> 
>   4ee1b4cac236 ("bootconfig: Cleanup dummy headers in tools/bootconfig")

Thanks for reporting!
Let me fix that.



> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
Masami Hiramatsu <mhiramat@kernel.org>
