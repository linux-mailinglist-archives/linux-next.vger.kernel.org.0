Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF15A34A3B5
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 10:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhCZJIX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 05:08:23 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15318 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhCZJHw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Mar 2021 05:07:52 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F6GKQ46F2z9tGv;
        Fri, 26 Mar 2021 17:05:46 +0800 (CST)
Received: from [10.67.77.175] (10.67.77.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Mar 2021
 17:07:40 +0800
Subject: Re: linux-next: build warnings after merge of the arm-perf tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>
CC:     Qi Liu <liuqi115@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210326195240.7b937560@canb.auug.org.au>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <c39fe821-3eee-9f2a-3539-6a1f2f415414@hisilicon.com>
Date:   Fri, 26 Mar 2021 17:07:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326195240.7b937560@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.77.175]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Will & Stephen,

Apologies for the mistake.

Will, shall I send a new version v5 to fix this issue or other?

Thanks,
Shaokun

On 2021/3/26 16:52, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm-perf tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> Documentation/admin-guide/perf/hisi-pmu.rst:61: WARNING: Unexpected indentation.
> Documentation/admin-guide/perf/hisi-pmu.rst:62: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/hisi-pmu.rst:69: WARNING: Unexpected indentation.
> Documentation/admin-guide/perf/hisi-pmu.rst:70: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/hisi-pmu.rst:83: WARNING: Unexpected indentation.
> 
> Introduced by commit
> 
>   9b86b1b41e0f ("docs: perf: Add new description on HiSilicon uncore PMU v2")
> 
