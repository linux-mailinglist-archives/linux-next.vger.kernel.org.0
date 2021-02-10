Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62468316AF4
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 17:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhBJQRU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 11:17:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:55850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231801AbhBJQRS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 11:17:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82D3C64E76;
        Wed, 10 Feb 2021 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612973797;
        bh=MceN05j1+TlQyLbprwp9gyL6KQQiWCesA6FbckpGeL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HaDleGxgpjxxqGxcoZNwIAkm6r8Pfh+Wxgp8j+d1y5oCEdiC3hUzG+TUVyJRWuBWg
         A4r9QdjZuBi0+0UUu1HuenGtqxYtj2WV8Kts/B/v5vwEOwxsnGdZzuX2BPOOlP5AcS
         JYF1serh1/inqUJPQTb2cAwdbp7QDDoGO93K8ESxNHmNXWXVv5dt/nqG0dYZw5ijdD
         J57xXzyR8RHctuF2iTPCUwc8zLwOO6kxhuCYU1Bqqy71mBoDSc+sG8uii1z3aTFmyW
         Vx6Gq71PPTAafBvVaBhYnDbofdLErAkdft35bwJXr8Xs4cszGkKtbLeW/mP/adGSro
         kTwZdk93lcoqA==
Date:   Wed, 10 Feb 2021 17:16:31 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <YCQG3577G6C+OZPz@gunter>
References: <20210209210843.3af66662@canb.auug.org.au>
 <YCKnRPRTDyfGxnBC@gunter>
 <20210210085051.7fb951d1@canb.auug.org.au>
 <YCOUGGJtUJ+Nf0ZA@gunter>
 <20210210232148.4f9d4a43@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210210232148.4f9d4a43@canb.auug.org.au>
X-OS:   Linux gunter 5.10.12-1-default x86_64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+++ Stephen Rothwell [10/02/21 23:21 +1100]:
>Hi Jessica,
>
>On Wed, 10 Feb 2021 09:06:48 +0100 Jessica Yu <jeyu@kernel.org> wrote:
>>
>> Sorry, by "feature" I meant CONFIG_TRIM_UNUSED_KSYMS. This config
>> option was introduced around v4.7. If simply enabling it produces
>> these compilation errors I was wondering if it ever built properly on
>> powerpc.
>
>Ah, of course.  So for a quick fix, you could revert just the changes
>to lib/Kconfig and all the defconfigs.  That way all the UNUSED_SYMBOLS
>infrastructure is still removed, but TRIM_UNUSED_KSYMS remains (un)set
>whenever it used to be (un)set and that could then be cleaned up in a
>followup patch set per architecture when we know it works.

Hi Stephen,

What's maybe simpler is marking this as BROKEN on PPC64 as a temporary
fix for linux-next until Masahiro's patch (the real fix) is posted. I
think the real problem is that TRIM_UNUSED_KSYMS was pretty much
hiding behind UNUSED_SYMBOLS=y until it finally got removed. Anyway
the main point is that TRIM_UNUSED_KSYMS=y shouldn't be breaking any
builds. I've pushed this change and hope that won't break linux-next now.

---
	
 From 1fa67f8391acb88a54e7defe6b73f8f171450f4a Mon Sep 17 00:00:00 2001
From: Jessica Yu <jeyu@kernel.org>
Date: Wed, 10 Feb 2021 16:59:53 +0100
Subject: [PATCH] module: mark TRIM_UNUSED_KSYMS as BROKEN on powerpc

Commit 367948220fce, which removed CONFIG_UNUSED_SYMBOLS, unraveled the
TRIM_UNUSED_KSYMS config option to be generally available without depending
on CONFIG_UNUSED_SYMBOLS=y. With CONFIG_UNUSED_SYMBOLS gone, this means
allyesconfig will now select this option without being "behind"
CONFIG_UNUSED_SYMBOLS. Unfortunately, this revealed some underlying build
issues on powerpc. When CONFIG_TRIM_UNUSED_KSYMS is enabled on powerpc, the
build would fail like this:

In file included from include/linux/export.h:123,
                  from include/linux/linkage.h:7,
                  from arch/powerpc/include/asm/unistd.h:18,
                  from <stdin>:2:
./include/generated/autoksyms.h:5:9: warning: missing whitespace after the
macro name
     5 | #define __KSYM_.HT_update_self_and_peer_setting 1
       |         ^~~~~~~
./include/generated/autoksyms.h:6:9: warning: missing whitespace after the
macro name
     6 | #define __KSYM_.RemovePeerTS 1
       |         ^~~~~~~
./include/generated/autoksyms.h:6: warning: "__KSYM_" redefined
     6 | #define __KSYM_.RemovePeerTS 1
       |
./include/generated/autoksyms.h:5: note: this is the location of the
previous definition

This is due to the addition of a dot "." prefix to some symbols that is
specific to powerpc, which confuses the gen_autoksyms script.

This is a temporary workaround for linux-next until gen_autoksyms and
modpost gets fixed.

Link: http://lore.kernel.org/r/20210209210843.3af66662@canb.auug.org.au
Signed-off-by: Jessica Yu <jeyu@kernel.org>
---
  init/Kconfig | 1 +
  1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 11b803b45c19..e4504a04b601 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2264,6 +2264,7 @@ config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
  
  config TRIM_UNUSED_KSYMS
  	bool "Trim unused exported kernel symbols"
+	depends on !PPC64 || BROKEN
  	help
  	  The kernel and some modules make many symbols available for
  	  other modules to use via EXPORT_SYMBOL() and variants. Depending

