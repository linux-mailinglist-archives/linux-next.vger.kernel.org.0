Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B5833F119
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 14:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhCQNXP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 09:23:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:37844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229967AbhCQNWn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 09:22:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6FE564F45;
        Wed, 17 Mar 2021 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615987363;
        bh=Bk8W3Dy0SgZuo9CL2GY88XLxE+aAdJLE3pkoawwo61k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z9SZnXRnpsWB8PrGCnFjQESEShpJHn8pWL9RpOYpEYgXMmaZ29cgmj8B+3pxsgKBG
         S0GDypZhz5whohc8gnoDzUNWHSASdXBVNemeQzO5SBRMMzUi8nXQps14chywxogjv5
         As+ZDk0BE8Uf1vWh3R5qkuLWohQWW2KU+DwTK5byY3B5HDBb7u7Lvp5BTl1lu5QBbV
         NBpinK+HFNE8KZAkY3MUtMutTVMiHhVccv/lsivXDZfCCdy1vRAMuLwLnhlh6YSoKv
         /eBFgX7BRhZ3utGrBKbaeXF1+CeEsoC14bFEpv6TcwI0CX11PhY4GKP461CkOIn3VI
         W/W/SmWa4YKkg==
Date:   Wed, 17 Mar 2021 14:22:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20210317142238.228fb1e8@coco.lan>
In-Reply-To: <875z1qy9un.fsf@meer.lwn.net>
References: <20210315163522.589bc67a@canb.auug.org.au>
        <YFD2Y++LQHmWMx68@google.com>
        <20210317084924.2ba4c3ea@canb.auug.org.au>
        <875z1qy9un.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Tue, 16 Mar 2021 17:09:20 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> [Adding Mauro]
> 
> > On Tue, 16 Mar 2021 11:18:11 -0700 Minchan Kim <minchan@kernel.org> wrote:
> >>
> >> On Mon, Mar 15, 2021 at 04:35:22PM +1100, Stephen Rothwell wrote:
> >> > Hi all,
> >> > 
> >> > After merging the akpm-current tree, today's linux-next build (htmldocs)
> >> > produced this warning:
> >> > 
> >> > Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interpreted text or phrase reference start-string without end-string.
> >> > 
> >> > Introduced by commit
> >> > 
> >> >   	 ("mm: cma: support sysfs")
> >> >   
> >> 
> >> Hmm, I don't get it what happened here. Was it false-positive?
> >
> > I get the above from a "make htmldocs" run ... I don't know what causes
> > it, sorry.  [cc'ing Jon]
> 
> OK, this took a while to figure out.  The problem is this text in
> sysfs-kernel-mm-cma:
> 
> > 		Each CMA heap subdirectory (that is, each
> > 		/sys/kernel/mm/cma/<cma-heap-name> directory) contains the
> > 		following items:
> 
> When scripts/get_abi.pl sees the /sys/kernel/mm/... string it wants to
> turn it into a link to the matching ABI entry; at that point, the
> <text in angle brackets> collides with the Sphinx directive and you get
> that totally useless warning.
> 
> I think this is a bug in get_abi.pl. Honestly I wonder if all these
> cross-links are needed at all; if they truly are, then we shouldn't be
> making bogus ones.  Mauro, how hard would it be to make this do the
> right thing?

Actually, we need the "<>" syntax a the output document.

Basically, the script assumes that everything inside the ABI description
is ReST. So, it preserves the text untouched, except when creating
cross-references, which is the case here. The script expects an entry
for every cross-referenced symbol. In other words, something like:

	/sys/kernel/mm/cma/ 

should be converted into:

	:ref:`/sys/kernel/mm/cma/ <abi_sys_kernel_mm_cma>`

The actual output is more complex than that, as there are some special
chars that need to be escaped at the naming part.

You can check the full output of this single file with:

	$ mkdir Documentation/ABI/aa && cp Documentation/ABI/testing/sysfs-kernel-mm-cma
	$ ./scripts/get_abi.pl --dir=Documentation/ABI/aa rest

	Symbols under /sys/kernel
	-------------------------
	
	.. _abi_sys_kernel_mm_cma:
	
	+-------------------------+
	| **/sys/kernel/mm/cma/** |
	+-------------------------+
	
	Defined on file :ref:`sysfs-kernel-mm-cma <abi_file_aa_sysfs_kernel_mm_cma>`
	
	:ref:`\/sys\/kernel\/mm\/cma\/ <abi_sys_kernel_mm_cma>` contains a subdirectory for each CMA
	heap name (also sometimes called CMA areas).
	
	Each CMA heap subdirectory (that is, each
	:ref:`\/sys\/kernel\/mm\/cma\/ <abi_sys_kernel_mm_cma>`<cma-heap-name> directory) contains the
	following items:
	
	        alloc_pages_success
	        alloc_pages_fail
	
	
	.. _abi_sys_kernel_mm_cma_cma_heap_name_alloc_pages_fail:
	
	+-------------------------------------------------------------+
	| **/sys/kernel/mm/cma/<cma\-heap\-name>/alloc\_pages\_fail** |
	+-------------------------------------------------------------+
	
	Defined on file :ref:`sysfs-kernel-mm-cma <abi_file_aa_sysfs_kernel_mm_cma>`
	
	the number of pages CMA API failed to allocate
	
	
	.. _abi_sys_kernel_mm_cma_cma_heap_name_alloc_pages_success:
	
	+----------------------------------------------------------------+
	| **/sys/kernel/mm/cma/<cma\-heap\-name>/alloc\_pages\_success** |
	+----------------------------------------------------------------+
	
	Defined on file :ref:`sysfs-kernel-mm-cma <abi_file_aa_sysfs_kernel_mm_cma>`
	
	the number of pages CMA API succeeded to allocate
	
	
	.. _abi_file_aa_sysfs_kernel_mm_cma:
	
	File aa/sysfs\-kernel\-mm\-cma
	------------------------------
	
	Has the following ABI:
	
	- :ref:`\/sys\/kernel\/mm\/cma\/ <abi_sys_kernel_mm_cma>`
	
	- :ref:`\/sys\/kernel\/mm\/cma\/\<cma\-heap\-name\>\/alloc_pages_success <abi_sys_kernel_mm_cma_cma_heap_name_alloc_pages_success>`
	
	- :ref:`\/sys\/kernel\/mm\/cma\/\<cma\-heap\-name\>\/alloc_pages_fail <abi_sys_kernel_mm_cma_cma_heap_name_alloc_pages_fail>`
	
There are two separated issues here:

1) the cross-reference for "/sys/kernel/mm/cma/<cma-heap-name>"
   doesn't exist. The fix would be to do something like:

	What:           /sys/kernel/mm/cma/
	Date:           Feb 2021
	Contact:        Minchan Kim <minchan@kernel.org>
	Description:
	                /sys/kernel/mm/cma/ contains a subdirectory for each CMA
        	        heap name (also sometimes called CMA areas).

                	Each CMA heap subdirectory contains the following items:

                        	/sys/kernel/mm/cma/<cma-heap-name>/alloc_pages_success
	                        /sys/kernel/mm/cma/<cma-heap-name>/alloc_pages_fail

  This way, the /sys/kernel/mm/cma/<cma-heap-name>/* will produce the
  right cross-references;

2) The get_abi.pl doesn't escape "<" and ">" chars.

  The enclosed patch should do the trick. Please notice that I didn't
  check if this won't cause side effects - I'm in vacations until next
  week... too lazy to do a full test those days ;-) 

Thanks,
Mauro

[PATCH] script: get_abi.pl: escape "<" and ">" characters

Those characters should be escaped on cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 92d9aa6cc4f5..79d195b48652 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -305,7 +305,7 @@ sub output_rest {
 		}
 
 		my $w = $what;
-		$w =~ s/([\(\)\_\-\*\=\^\~\\])/\\$1/g;
+		$w =~ s/([\(\)\_\-\*\=\^\~\\\<\>])/\\$1/g;
 
 		if ($type ne "File") {
 			my $cur_part = $what;


