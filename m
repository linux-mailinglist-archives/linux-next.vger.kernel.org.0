Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DE9220150
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 02:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgGOAZF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 20:25:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7851 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726142AbgGOAZF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 20:25:05 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 8C8AA1B6CA9A092FD942;
        Wed, 15 Jul 2020 08:25:02 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.238) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Jul 2020
 08:24:54 +0800
Subject: Re: [PATCH v2] mm/percpu: fix 'defined but not used' warning
To:     Roman Gushchin <guro@fb.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        <john.wanghui@huawei.com>
References: <20200714134101.80534-1-cuibixuan@huawei.com>
 <20200714225311.7aeffffd@canb.auug.org.au>
 <6f1a8c76-d6d7-1a2c-8b0b-26a4a31f1a19@huawei.com>
 <20200714184137.GA491030@carbon.DHCP.thefacebook.com>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <22211a3c-cd34-7dc3-ef4a-6d53fdfbed94@huawei.com>
Date:   Wed, 15 Jul 2020 08:24:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200714184137.GA491030@carbon.DHCP.thefacebook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.238]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020/7/15 2:41, Roman Gushchin wrote:
>> Fixes: 26c99879ef01 ("mm: memcg/percpu: account percpu memory to memory cgroups")
> The "fixes" tag is not valid: the patch is in the mm queue, so it doesn't
> have a stable hash. Usually Andrew squashes such fixes into the original patch
> on merging.
Thanks for your advice,delete it.

