Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD92316094
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 09:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbhBJIHg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 03:07:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:44738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233237AbhBJIHd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 03:07:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 142A564DF5;
        Wed, 10 Feb 2021 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612944413;
        bh=JSySFpnSJmoR8zhZOCgk841D38I73vAelpyUEZpCaBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HRFdIh5hE3dN1iD1xl/OMlhB37JnEH3m3pUw5RgXwf8Voiydu+ZD9P4VgjYSH9xHO
         ldKEGMXuRRrSdD71P1up/uzY9IBOcpYl+rJNna0aa3YYVgxcpeuEOR7U0PlZ6k1/iW
         UqIFvW1sZZQNrhfQNAeQRtD5FaLqh+aOuY1YlqgDqOELhtRjZnAAEiRg6teesQ7oZn
         +Vz9UNBgEWYaLn82L7F9YQBMQATnCv4veyjV+bV7sgbkA9ilQXjPSHjVnJhaW3NGEt
         qd1Rd0J6P7tuifOSLeMGpel4JXrUPc9043/ouveCqWLqKuCrzBkCZAM1hgTotx4ybH
         veT7ed3L0pCKg==
Date:   Wed, 10 Feb 2021 09:06:48 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <YCOUGGJtUJ+Nf0ZA@gunter>
References: <20210209210843.3af66662@canb.auug.org.au>
 <YCKnRPRTDyfGxnBC@gunter>
 <20210210085051.7fb951d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210210085051.7fb951d1@canb.auug.org.au>
X-OS:   Linux gunter 5.10.12-1-default x86_64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+++ Stephen Rothwell [10/02/21 08:50 +1100]:
>Hi Jessica,
>
>On Tue, 9 Feb 2021 16:16:20 +0100 Jessica Yu <jeyu@kernel.org> wrote:
>>
>> Hmm, these errors don't look like it's related to that particular commit. I was
>
>I found this commit by bisection and then tested by reverting it.
>
>Before this commit, CONFIG_TRIM_UNUSED_KSYMS would not be set in the
>allyesconfig build because CONFIG_UNUSED_SYMBOLS was set.  After this
>commit, CONFIG_TRIM_UNUSED_KSYMS will be set in the allyesconfig build.

Ah, that makes sense then. I would get the error on powerpc whenever
CONFIG_TRIM_UNUSED_KSYMS was enabled.

>> able to reproduce these weird autoksym errors even without any modules-next
>> patches applied, and on a clean v5.11-rc7 tree. To reproduce it,
>> CONFIG_TRIM_UNUSED_KSYMS needs to be enabled. I guess that's why we run into
>> these errors with allyesconfig. I used a gcc-7 ppc64le cross compiler and got
>> the same compiler warnings. It seems to not compile on powerpc properly because
>> it looks like some symbols have an extra dot "." prefix, for example in
>> kthread.o:
>>
>>     168: 0000000000000318    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker
>>     169: 0000000000001d90   104 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker
>>     170: 0000000000000330    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker_on_cpu
>>     171: 0000000000001e00    88 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker_on_cpu
>>     172: 0000000000000348    24 NOTYPE  GLOBAL DEFAULT    6 kthread_queue_work
>>     173: 0000000000001e60   228 FUNC    GLOBAL DEFAULT    1 .kthread_queue_work
>>
>> So I suppose this dot prefix is specific to powerpc. From the ppc64 elf abi docs:
>>
>>      Symbol names with a dot (.) prefix are reserved for holding entry point
>>      addresses. The value of a symbol named ".FN", if it exists, is the entry point
>>      of the function "FN".
>>
>> I guess the presence of the extra dot symbols is confusing
>> scripts/gen_autoksyms.sh, so we get the dot symbols in autoksyms.h, which the
>> preprocessor doesn't like. I am wondering how this was never caught until now
>> and also now curious if this feature was ever functional on powerpc..
>
>Which feature?

Sorry, by "feature" I meant CONFIG_TRIM_UNUSED_KSYMS. This config
option was introduced around v4.7. If simply enabling it produces
these compilation errors I was wondering if it ever built properly on
powerpc.

Thanks,

Jessica
