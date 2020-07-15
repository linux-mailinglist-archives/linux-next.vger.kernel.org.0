Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA5522023E
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 04:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgGOCTH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 22:19:07 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59324 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbgGOCTH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 22:19:07 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 607E6ABA0787A02C4ED1;
        Wed, 15 Jul 2020 10:19:04 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.238) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Jul 2020
 10:18:58 +0800
Subject: Re: [PATCH v3] mm/percpu: fix 'defined but not used' warning
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        <john.wanghui@huawei.com>, Roman Gushchin <guro@fb.com>
References: <20200714134101.80534-1-cuibixuan@huawei.com>
 <20200714225311.7aeffffd@canb.auug.org.au>
 <6f1a8c76-d6d7-1a2c-8b0b-26a4a31f1a19@huawei.com>
 <20200715062229.78591ff9@canb.auug.org.au>
 <6d41b939-a741-b521-a7a2-e7296ec16219@huawei.com>
 <20200715115043.45a505ca@canb.auug.org.au>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <2c0fc001-fcf2-1b2c-3311-c3827aeff73d@huawei.com>
Date:   Wed, 15 Jul 2020 10:18:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200715115043.45a505ca@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.238]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020/7/15 9:50, Stephen Rothwell wrote:
> I have added this patch to linux-next today.
thanks.

