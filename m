Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144F730A83E
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 14:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhBANFU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 08:05:20 -0500
Received: from foss.arm.com ([217.140.110.172]:59424 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229736AbhBANFU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Feb 2021 08:05:20 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE47B1042;
        Mon,  1 Feb 2021 05:04:34 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1C6C3F66E;
        Mon,  1 Feb 2021 05:04:32 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: qemu boot failure after merge of the tip tree
In-Reply-To: <20210201200918.386682c5@canb.auug.org.au>
References: <20210201200918.386682c5@canb.auug.org.au>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/26.3 (x86_64-pc-linux-gnu)
Date:   Mon, 01 Feb 2021 13:04:30 +0000
Message-ID: <jhjv9bcym5d.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 01/02/21 20:09, Stephen Rothwell wrote:
> Hi all,
>

Hi Stephen,

> After merging the tip tree, today's linux-next qemu boot test (powerpc
> pseries_le_defconfig) failed like this:

In case you haven't seen it, Dietmar did the dirty work and fixed my fail
at

  http://lore.kernel.org/r/6000e39e-7d28-c360-9cd6-8798fd22a9bf@arm.com
