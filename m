Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE252ECEBC
	for <lists+linux-next@lfdr.de>; Thu,  7 Jan 2021 12:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbhAGL3I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Jan 2021 06:29:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10559 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbhAGL3I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2021 06:29:08 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBP8c6Q6BzM7CC;
        Thu,  7 Jan 2021 19:27:12 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 7 Jan 2021
 19:28:20 +0800
Subject: Re: linux-next: build warning after merge of the f2fs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jaegeuk Kim <jaegeuk@kernel.org>
CC:     Chao Yu <chao@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210107141158.312835d8@canb.auug.org.au>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <3f921b3d-e8f2-e010-0f6b-76596e29e997@huawei.com>
Date:   Thu, 7 Jan 2021 19:28:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210107141158.312835d8@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2021/1/7 11:11, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the f2fs tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Inline emphasis start-string without end-string.

IIUC, should I remove "/*" and "*/" for newly added entry in sysfs-fs-f2fs?

+What:		/sys/fs/f2fs/<disk>/stat/sb_status
+Date:		December 2020
+Contact:	"Chao Yu" <yuchao0@huawei.com>
+Description:	Show status of f2fs superblock in real time.
+
+		value           sb status macro                 description
+		0x1             SBI_IS_DIRTY,                   /* dirty flag for checkpoint */
+		0x2             SBI_IS_CLOSE,                   /* specify unmounting */
+		0x4             SBI_NEED_FSCK,                  /* need fsck.f2fs to fix */
...

Thanks,

> 
> Introduced by commit
> 
>    f23307575903 ("f2fs: introduce sb_status sysfs node")
> 
