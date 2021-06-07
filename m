Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2B239E477
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 18:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhFGQuV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 7 Jun 2021 12:50:21 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3163 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbhFGQuU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2021 12:50:20 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FzJwv2g6Sz6887F;
        Tue,  8 Jun 2021 00:39:11 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 18:48:27 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2176.012;
 Mon, 7 Jun 2021 18:48:27 +0200
From:   Roberto Sassu <roberto.sassu@huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the integrity tree
Thread-Topic: linux-next: build warning after merge of the integrity tree
Thread-Index: AQHXWbq5Ml5972yWWEqYgAkUVJwrLKsIxgUQ
Date:   Mon, 7 Jun 2021 16:48:27 +0000
Message-ID: <d6ebdfe45590466886c76f7475dcc9a8@huawei.com>
References: <20210605132719.3b984ed0@canb.auug.org.au>
In-Reply-To: <20210605132719.3b984ed0@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.98.153]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Saturday, June 5, 2021 5:27 AM
> Hi all,
> 
> After merging the integrity tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/security/IMA-templates.rst:81: WARNING: Inline
> substitution_reference start-string without end-string.
> 
> Introduced by commit
> 
>   8314b6732ae4 ("ima: Define new template fields xattrnames, xattrlengths
> and xattrvalues")

Hi Stephen

I will provide a patch for this issue soon.

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Li Jian, Shi Yanli

> --
> Cheers,
> Stephen Rothwell
