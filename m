Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C96342A691
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 15:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236961AbhJLOA2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 10:00:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53458 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236917AbhJLOA2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 10:00:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id DAF981F43A49
Message-ID: <495d088b-3428-f96f-9932-57d944c5d966@collabora.com>
Date:   Tue, 12 Oct 2021 10:58:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: linux-next: build warnings after merge of the tip tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211012212005.4e8fecdd@canb.auug.org.au>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <20211012212005.4e8fecdd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Às 07:20 de 12/10/21, Stephen Rothwell escreveu:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> Error: Cannot open file kernel/futex.c
> Error: Cannot open file kernel/futex.c
> Error: Cannot open file kernel/futex.c
> Error: Cannot open file kernel/futex.c
> 
> Introduced by commit
> 
>   77e52ae35463 ("futex: Move to kernel/futex/")
> 
> $ git grep kernel/futex Documentation
> Documentation/kernel-hacking/locking.rst:.. kernel-doc:: kernel/futex.c
> Documentation/translations/it_IT/kernel-hacking/locking.rst:.. kernel-doc:: kernel/futex.c
> 

Thanks for pointing that out. I posted a fix:

https://lore.kernel.org/lkml/20211012135549.14451-1-andrealmeid@collabora.com/
