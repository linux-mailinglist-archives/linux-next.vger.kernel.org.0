Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42FC21977C
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 06:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgGIEij (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 00:38:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7278 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgGIEii (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jul 2020 00:38:38 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 0F441E303E9AC6E7E8C1;
        Thu,  9 Jul 2020 12:38:36 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.106) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 9 Jul 2020
 12:38:31 +0800
Subject: Re: linux-next: build warning after merge of the device-mapper tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Bryan Gurney <bgurney@redhat.com>
References: <20200709132609.6de53604@canb.auug.org.au>
From:   yangerkun <yangerkun@huawei.com>
Message-ID: <a6ff1a7c-628d-449e-f177-c4d23efbcd07@huawei.com>
Date:   Thu, 9 Jul 2020 12:38:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200709132609.6de53604@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.106]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

在 2020/7/9 11:26, Stephen Rothwell 写道:
> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> In file included from drivers/md/dm-dust.c:11:
> drivers/md/dm-dust.c: In function 'dust_list_badblocks':
> drivers/md/dm-dust.c:307:10: warning: zero-length gnu_printf format string [-Wformat-zero-length]
>    307 |   DMEMIT("");
Mike and Bryan,

Should we just use "DMEMIT("\n")"? Maybe it's bad since this lead a
blank line...


>        |          ^~
> include/linux/device-mapper.h:555:46: note: in definition of macro 'DMEMIT'
>    555 |      0 : scnprintf(result + sz, maxlen - sz, x))
>        |                                              ^
> 
> Introduced by commit
> 
>    20f93ea74f9c ("dm dust: add interface to list all badblocks")
> 

