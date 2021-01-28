Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D85306B19
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 03:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhA1C16 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 21:27:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11207 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhA1C14 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 21:27:56 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DR3fg3rLvzlBq1;
        Thu, 28 Jan 2021 10:03:39 +0800 (CST)
Received: from [10.174.179.117] (10.174.179.117) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 28 Jan 2021 10:04:46 +0800
Subject: Re: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
References: <20210127224351.486fd977@canb.auug.org.au>
From:   Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <873d99fe-ef52-0844-5b49-6c66d10ddd30@huawei.com>
Date:   Thu, 28 Jan 2021 10:04:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127224351.486fd977@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.117]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi:
On 2021/1/27 19:43, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   fs/hugetlbfs/inode.c
> 
> between commit:
> 
>   2f221d6f7b88 ("attr: handle idmapped mounts")
> 
> from the pidfd tree and commit:
> 
>   57d3629b7a9a ("hugetlbfs: remove useless BUG_ON(!inode) in hugetlbfs_setattr()")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

This fix is what I want. Many thanks for doing this.
