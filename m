Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25E6133717
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 00:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgAGXLJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 18:11:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:41004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgAGXLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 18:11:09 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64DE020715;
        Tue,  7 Jan 2020 23:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578438668;
        bh=tuPmCu90zgY/Lg0Zip32BcqyCPU+otfTFLuVtgPx5L8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2OkV4fnXvCtPmGfWJeH/yCkLdg6koye0+5LS0pSQR8Tmlg3VTaikg40tSihpVlBbJ
         XezwkOOTfmdti9PMWVuMkuG3YFJ+EuBsBlOsQ+HuVF046/mHCIlj0i91d0h/T1R7nF
         O0nlk1Cuq9bjcqXEMrapD2RRSuBFItWQXlat7oKE=
Date:   Tue, 7 Jan 2020 15:11:07 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-Id: <20200107151107.1ffae482a8663ada2bbc3bd3@linux-foundation.org>
In-Reply-To: <20200106170744.5b6ca678@canb.auug.org.au>
References: <20200106170744.5b6ca678@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 6 Jan 2020 17:07:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> arch/x86/mm/dump_pagetables.c: In function 'ptdump_walk_pgd_level_core':
> arch/x86/mm/dump_pagetables.c:403:1: warning: the frame size of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>   403 | }
>       | ^
> 
> Introduced by commit
> 
>   710fae4f03f2 ("x86: mm: convert dump_pagetables to use walk_page_range")
> 

(gdb) p sizeof(struct mm_struct)
$1 = 1664

yup, that'll do it.


