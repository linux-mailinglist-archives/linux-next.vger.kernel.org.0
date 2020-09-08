Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B14261B44
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 21:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731214AbgIHSlU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 14:41:20 -0400
Received: from foss.arm.com ([217.140.110.172]:56838 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731170AbgIHQIC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 12:08:02 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85A861045;
        Tue,  8 Sep 2020 09:07:44 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A7613F66E;
        Tue,  8 Sep 2020 09:07:43 -0700 (PDT)
References: <20200908205659.361b0a1b@canb.auug.org.au> <ddc76403-4b00-66ba-43ea-7889b9a32bb5@infradead.org> <CAKfTPtB-br6iKAMnofbPEmPVF-fpQpjkbXtfTcNkNzbc1Kdtug@mail.gmail.com> <jhj4ko86zk4.mognet@arm.com> <b6e6f676-d61b-5109-759f-4b4f2c24bab1@infradead.org>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>
Subject: Re: linux-next: Tree for Sep 8 (sched/topology.c)
In-reply-to: <b6e6f676-d61b-5109-759f-4b4f2c24bab1@infradead.org>
Date:   Tue, 08 Sep 2020 17:07:41 +0100
Message-ID: <jhj363s6ylu.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 08/09/20 16:50, Randy Dunlap wrote:
> Sure, here it is again.  And
> CONFIG_SMP=y
> CONFIG_SCHED_DEBUG=y
>
> thanks.

Okay so I can reproduce that with GCC-10.1, now to figure out WTH is going on...
