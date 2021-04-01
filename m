Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA104350B1D
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 02:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhDAA0I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 20:26:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:39250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhDAAZr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 31 Mar 2021 20:25:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54D2261008;
        Thu,  1 Apr 2021 00:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1617236735;
        bh=Ab/glsGI/Ay+0LKOxR15reT0g9n63sQ4EYBQkme/glk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sMNXmhP3VVvCLhrMsSNFJr93GA4t1FuSeAcAd1dsATz1H1ETHQe+7j1Pn9x5H/7I7
         KilZRTncCp0oluT34j17LH7TKlKo3hOG/jwO5/OgTf0r6WpCiKVo2srh5WLZ5SimbT
         cvcnJYM0EWuv4qhJkCy9N90zSUEazUzCl5hZKj2M=
Date:   Wed, 31 Mar 2021 17:25:34 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yang Shi <shy828301@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>, Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Xiongchun Duan <duanxiongchun@bytedance.com>
Subject: Re: [External] RE: kernel warning percpu ref in obj_cgroup_release
Message-Id: <20210331172534.4ea75eda7e7accd166eef8b4@linux-foundation.org>
In-Reply-To: <CAMZfGtVhL14_mLKKcPA+QFbKUDBSwKRR_srrGODk0nhcVH6KoA@mail.gmail.com>
References: <20210329205249.6b557510@canb.auug.org.au>
        <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
        <4419611b-3282-2197-884c-332025cdada8@de.ibm.com>
        <CAMZfGtUaTdmpcw1dr_rWQZTz3UTh9ZFavr0WBSa_obENPasgFw@mail.gmail.com>
        <7c27fc2e-5cea-5a17-6e30-8ae1cb291274@de.ibm.com>
        <CAMZfGtV9w24cJAwYsQuhvVpdLiYssjdfwfXApNK51zacr31c3w@mail.gmail.com>
        <179f84ad-7b98-4bc5-f895-c19faabbb311@de.ibm.com>
        <CAMZfGtVhL14_mLKKcPA+QFbKUDBSwKRR_srrGODk0nhcVH6KoA@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 31 Mar 2021 22:45:12 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> 
> Hi Andrew,
> 
> Now we have two choices to fix this issue.
> 
> 1) Send a v6 patchset (Use obj_cgroup APIs to charge kmem pages)
>     to fix this issue.
> 2) Send a separate fix patch (Just like above).
> 
> Both ways are ok for me. But I want to know which one is more
> convenient for you.

Either is OK.  2) is easier.
