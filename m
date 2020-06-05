Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4F51EF343
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 10:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgFEIjT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 04:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgFEIjT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 04:39:19 -0400
Received: from merlin.infradead.org (unknown [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5213FC08C5C2
        for <linux-next@vger.kernel.org>; Fri,  5 Jun 2020 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=z7/5EgUyF3mJk2uYpKWw1hwisxcoMuF8j2/nPdApsw4=; b=g1wIiLjRosxxXPRZRjOXXEv0lU
        H5ZkfH9qURiuOO9hOsBxFwJg7DNG5Yapqc1H7v3DXnoU7arDyTfJ6kJOYfWsuGciAyxKHgokHyZfm
        QhMTSAgj9DtQEdYv3a9cPUkoZKWWCQegclKiU+3uxtnVnTV8upFp6OoKjeHMn9rqK3aLoT8/XsYOc
        vtXvV5EUDk+CYEFku7u1Ntk3AuMtabWdaTSZA1QY5CMgNHnqQID+8vYrRIHxvv8KUEMhX22IMvV3z
        jw6n5YGTChkMpHfOKAlmXQ5/14bSuh9ioJHgsRVTLYxrRaTFp9zAgzIStDAPLWAMGHXerh6Rs2Y/T
        I5jGtPRQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jh7sQ-00034o-9Y; Fri, 05 Jun 2020 08:38:58 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5C7BC301ABC;
        Fri,  5 Jun 2020 10:38:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 059A8214D7C32; Fri,  5 Jun 2020 10:38:55 +0200 (CEST)
Date:   Fri, 5 Jun 2020 10:38:55 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ingo Molnar <mingo@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>, linux-next@vger.kernel.org
Subject: Re: Fw: next/pending-fixes build: 162 builds: 2 failed, 160 passed,
 2 errors, 109 warnings (v5.7-8671-g086779e58c68)
Message-ID: <20200605083855.GH3976@hirez.programming.kicks-ass.net>
References: <20200605115213.2836fccf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200605115213.2836fccf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 05, 2020 at 11:52:13AM +1000, Stephen Rothwell wrote:
> Commit
>=20
>   a148866489fb ("sched: Replace rq::wake_list")
>=20
> added
>=20
> BUILD_BUG_ON(offsetof(struct task_struct, wake_entry_type) - offsetof(str=
uct task_struct, wake_entry) !=3D
> 		     offsetof(struct __call_single_data, flags) - offsetof(struct __cal=
l_single_data, llist));
>=20
> in kernel/smp.c.  This seems to be failing - at least for gcc-8 (I
> haven't seen any failures in my linux-next testing).

CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy

working on it.
