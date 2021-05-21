Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9866838C013
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 08:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhEUGyl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 02:54:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4713 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbhEUGyh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 02:54:37 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FmcgQ33Nbz16QGQ;
        Fri, 21 May 2021 14:50:26 +0800 (CST)
Received: from dggeme703-chm.china.huawei.com (10.1.199.99) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 14:53:13 +0800
Received: from [10.174.176.110] (10.174.176.110) by
 dggeme703-chm.china.huawei.com (10.1.199.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 14:53:13 +0800
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
References: <20210521153956.7c3e98dc@canb.auug.org.au>
From:   Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <f8106f9a-6832-e724-7edd-c758d6477e0a@huawei.com>
Date:   Fri, 21 May 2021 14:53:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210521153956.7c3e98dc@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.110]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021/5/21 13:39, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> mm/swapfile.c:1039:22: warning: 'scan_swap_map' defined but not used [-Wunused-function]
>  1039 | static unsigned long scan_swap_map(struct swap_info_struct *si,
>       |                      ^~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   c9ea6b99df3c ("mm/swapfile: move get_swap_page_of_type() under CONFIG_HIBERNATION")
> 
> # CONFIG_HIBERNATION is not set

It seems that scan_swap_map is only used by get_swap_page_of_type(). I should have been more careful
and move it under CONFIG_HIBERNATION too. I will send a patch to fix this. Many thanks!

> 

