Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F69430E90C
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 02:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhBDA5g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 19:57:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:39934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233517AbhBDA5e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 19:57:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90D0164F5C;
        Thu,  4 Feb 2021 00:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1612400213;
        bh=2evgH3cwpV+uX4bnldOOCTxIf92IkxhfWnoLz+01pTI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MUCJJTspl+Bo3DwHzyghSUdDdHc5XqH61o7cUjmZkKqx0bEs6f5vQgrn0i/1yQlCQ
         bf1CkqK8QxKNZ3lWzgBl5BL+OtZSTxs224pKQKSlvTQU/WCF2+nLkjCpM2UsFiy9xC
         Uh8ONzLA+rSShQ0iE9w5lh8JarYQg6N7hjr0UaBU=
Date:   Wed, 3 Feb 2021 16:56:51 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>,
        James Morris <jmorris@namei.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [next] mm/gup.c:96:10: error: implicit declaration of function
 'is_zero_pfn' [-Werror,-Wimplicit-function-declaration]
Message-Id: <20210203165651.2aa462f33e0f1ad1bc82dcea@linux-foundation.org>
In-Reply-To: <CA+CK2bD1TMKXgiHZJju8HDMfcr27aXLi_eFSFYOuxkGiRDHKYQ@mail.gmail.com>
References: <CA+G9fYszbxo4giipD0_sV3XHKaq2zVq97rXoyjWf18k5oYEX4Q@mail.gmail.com>
        <CA+CK2bD1TMKXgiHZJju8HDMfcr27aXLi_eFSFYOuxkGiRDHKYQ@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2 Feb 2021 10:03:47 -0500 Pavel Tatashin <pasha.tatashin@soleen.com> wrote:

> The same problem as fixed here:
> https://lore.kernel.org/linux-mm/CA+CK2bBjC8=cRsL5VhWkcevPsqSXWhsANVjsFNMERLT8vWtiQw@mail.gmail.com/
> 

We're seeing a number of build errors from this series, all of them
confusing.

I'll drop this version.  Please ensure that the various build errors
(including
https://lkml.kernel.org/r/8bf42bd2-1175-f26b-20b2-99b8c4a56aef@infradead.org)
are resolved after applying each patch, so we don't create bisection
holes.




