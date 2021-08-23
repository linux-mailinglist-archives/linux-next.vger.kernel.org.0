Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F04F3F4866
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 12:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236091AbhHWKPH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 06:15:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233145AbhHWKPG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 06:15:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27BED61246;
        Mon, 23 Aug 2021 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629713664;
        bh=ri5Gc1dGzEg01uUB2aCCRxd2yrfrIqSic3J6GtQpDGM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=a1PQ/0F39an3U3T6ntGqRGFIzFFAExQh4LviUNVrWHyCrMNjgEDD6SRhaBa9NRX9u
         EIN7X413kJtx9Qo1f7h3w0rltn3JbyF71AhNzjkTGSwcqJGud0+yUUHwcreSWi4DSi
         o2vPchQP9N+xKYdvcW23KwCEsT9VX6BkOJnetCzsdfQXhwmy9BGZAJVgBUV4UvV1F7
         b/iK7Wi18TIozEUmz3rS2XaAfM5uV/Ule5krKsH+C1naQnGcV3JfpACKmuPRljQzCW
         FBKFEPdekBB1C0ZWrR5n3GeT3Npi3BP7ccrtRCr7d83eO7MQB3gsRr8B3yOv50FOK0
         1yAT2P7ap4YCg==
Message-ID: <934008823b152cbe9bf170c866d2c0aa8552e61e.camel@kernel.org>
Subject: Re: linux-next: build warnings after merge of the file-locks tree
From:   Jeff Layton <jlayton@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 23 Aug 2021 06:14:23 -0400
In-Reply-To: <20210823101941.20ba89c3@canb.auug.org.au>
References: <20210823101941.20ba89c3@canb.auug.org.au>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2021-08-23 at 10:19 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the file-locks tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/remap_range.c: In function 'remap_verify_area':
> fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-variable]
>   102 |  struct inode *inode = file_inode(file);
>       |                ^~~~~
> 
> Also from the arm multi_v7_defconfig build:
> 
> fs/locks.c: In function 'fcntl_setlk64':
> fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
>  2509 |  struct inode *inode = locks_inode(filp);
>       |                ^~~~~
> 
> And from the x86_64 allmodconfig build:
> 
> fs/9p/vfs_file.c: In function 'v9fs_file_lock_dotl':
> fs/9p/vfs_file.c:322:1: warning: label 'out_err' defined but not used [-Wunused-label]
>   322 | out_err:
>       | ^~~~~~~
> 
> Introduced by commit
> 
>   3efee0567b4a ("fs: remove mandatory file locking support")
> 

Thanks Stephen. I'll fix those up.

Cheers,
-- 
Jeff Layton <jlayton@kernel.org>

